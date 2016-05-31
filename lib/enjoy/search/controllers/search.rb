module Enjoy::Search
  module Controllers
    module Search
      extend ActiveSupport::Concern

      def index
        if search_redirecter
          return redirect_to url_for(params)
        end

        if defined?(BreadcrumbsOnRails)
          add_breadcrumb "search",  [:enjoy_search]
        end

        if params[:q].blank?
          @results = []
        else
          query = params[:q].to_s.gsub(/\P{Word}+/, ' ').gsub(/ +/, ' ').strip
          @results = search_model_class.send(fts_method, query).page(params[:page]).per(10)
        end

        if defined?(BreadcrumbsOnRails)
          add_breadcrumb "results", [:enjoy_search, {q: params[:q]}]
        end
      end

      private
      def search_model_class
        Enjoy::Catalog::Item
      end

      def fts_method
        :fts
      end

      def search_redirecter
        if params[:utf8].present? or params[:submit].present? or params[:commit].present?
          params.delete(:utf8)
          params.delete(:submit)
          params.delete(:commit)
          return true
        end
        false
      end

    end
  end
end
