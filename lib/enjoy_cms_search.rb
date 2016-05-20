require "enjoy/search/version"

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
    def model_namespace
      "Enjoy::Search::Models::#{Enjoy::Search.orm.to_s.camelize}"
    end
    def orm_specific(name)
      "#{model_namespace}::#{name}".constantize
    end
  end

end