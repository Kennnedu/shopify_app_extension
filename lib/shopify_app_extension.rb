require 'dry-configurable'

class ShopifyAppExtension
  extend Dry::Configurable

  setting :token, 'shopify token'
end
