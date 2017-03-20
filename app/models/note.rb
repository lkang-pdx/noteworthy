require 'elasticsearch/model'

class Note < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'content']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            content: {}
          }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :content, analyzer: 'english'
    end
  end
end
Note.__elasticsearch__.client.indices.delete index: Note.index_name rescue nil

Note.__elasticsearch__.client.indices.create \
  index: Note.index_name,
  body: { settings: Note.settings.to_hash, mappings: Note.mappings.to_hash }
Note.import force:true
