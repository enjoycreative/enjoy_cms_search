module Enjoy::Search
  class SearchController < ApplicationController
    include Enjoy::Search::Controllers::Search

    include Enjoy::Search::Decorators::Search
  end
end
