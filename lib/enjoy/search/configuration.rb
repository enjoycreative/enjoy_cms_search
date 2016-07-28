module Enjoy::Search
  def self.configuration
    @configuration ||= Configuration.new
  end
  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :breadcrumbs_on_rails_support

    attr_accessor :pages_support

    def initialize
      @breadcrumbs_on_rails_support = defined?(BreadcrumbsOnRails)
      
      @pages_support = defined?(Enjoy::Pages)
    end
  end
end
