
class ShopifyAppExtensionGenerator < Rails::Generators::Base
  def create_initialize_file
    token = ask("\nwhat is shpopify token?", :echo => false)
    layout_path = ask("\nwhat is layout filepath for inserting js script?", :path => true)
    create_file 'config/initializers/shopify_app_extension.rb', "# ShopifyAppExtension.config.token = \"#{token.presence || 'shopify token'}\""
    insert_into_file layout_path, :before => "</head>" do
    "  <script type=\"text/javascript\">
      !function(t,e){if(t.LLAppWidget)console.error(\"LLAppWidget already included\");else{t.LLAppWidget={},
      t.LLAppWidget._c=[],[\"init\",\"open\"].forEach(function(e){t.LLAppWidget[e]=function(){t.LLAppWidget._c.push([e,arguments])}});
      var i=e.createElement(\"script\");i.type=\"text/javascript\",i.async=!0,i.crossorigin=\"anonymous\",
      i.src=\"/widget-shim.js\";var n=e.getElementsByTagName(\"script\")[0];
      n.parentNode.insertBefore(i,n)}}(window,document);
      LLAppWidget.init(\"<%= ShopifyAppExtension.config.token %>\");
    </script>\n  "
    end
  end
end
