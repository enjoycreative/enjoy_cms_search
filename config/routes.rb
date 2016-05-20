module ActionDispatch::Routing
  class Mapper

    def enjoy_cms_search_routes(config = {})
      routes_config = {
        use_search_path: true
      }
      routes_config.merge!(config)

      scope module: 'enjoy' do
        scope module: 'search' do

          if routes_config[:use_search_path]
            get 'search' => 'search#index', as: :enjoy_search
          end
        end
      end

    end

  end
end
