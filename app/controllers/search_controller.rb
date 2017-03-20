class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @notes = []
    else
      @notes = Note.search params[:q]
    end
  end
end
