module Enjoy::Search::Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def enjoy_search_fts_index(*opts)
      if Enjoy::Search.mongoid?
        opts = opts.extract_options!
        index(
          {
            name: "text"
          }.merge(opts[:fields]),
          {
            default_language: opts[:default_language] || "russian",
            weights: {
              name: 100
            }.merge(opts[:weights]),
            name: opts[:name]
          }
        )
      end
    end
  end

  included do
    scope :fts, -> (query) {
      ret = where({"$text": { "$search": query.to_s }})
      ret.options[:fields] = {"score": { "$meta": "textScore" }}
      ret.options[:sort] = {"score": { "$meta": "textScore" }}
      ret
    }
  end

end
