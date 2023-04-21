require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ECommerceProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Add CORS configuration here
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://127.0.0.1:3000'
        resource '*', headers: :any, methods: [:get, :post, :patch, :delete, :options]
      end
    end

    # Other configurations
  end
end
