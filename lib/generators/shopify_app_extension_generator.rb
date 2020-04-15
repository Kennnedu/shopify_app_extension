
class ShopifyAppExtensionGenerator < Rails::Generators::Base
  def create_initialize_file
    create_file 'config/initializers/shopify_app_extension.rb', '# ShopifyAppExtension.config.token = \'shopify token\''
    insert_into_file 'app/views/layouts/embedded_app.html.erb', :before => "</head>" do
      '<script type="text/javascript">
      !function(t,e){if(t.LLAppWidget)console.error("LLAppWidget already included");else{t.LLAppWidget={},
      t.LLAppWidget._c=[],["init","open"].forEach(function(e){t.LLAppWidget[e]=function(){t.LLAppWidget._c.push([e,arguments])}});
      var i=e.createElement("script");i.type="text/javascript",i.async=!0,i.crossorigin="anonymous",
      i.src="/widget-shim.js";var n=e.getElementsByTagName("script")[0];
      n.parentNode.insertBefore(i,n)}}(window,document);
      LLAppWidget.init("<%= ShopifyAppExtension.config.token %>");
      </script>'
    end
  end
end
