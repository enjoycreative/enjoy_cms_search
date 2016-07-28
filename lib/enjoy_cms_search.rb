require "enjoy/search/version"
require "enjoy/search/configuration"
require "enjoy/search/engine"
require "enjoy/search/routes"

if Enjoy.active_record?
  require 'pg_search'
end

module Enjoy::Search
  class << self
    def orm
      Enjoy.orm
    end
    def mongoid?
      Enjoy::Search.orm == :mongoid
    end
    def active_record?
      Enjoy::Search.orm == :active_record
    end
  end

  module Controllers
    autoload :Search,            'enjoy/search/controllers/search'
  end

end
