module Jekyll
  class SocialIconsStyles
    HEAD_END_TAG = %r!</.*head>!

    class << self
      def add_styles(doc)
        @config = doc.site.config
        if doc.output =~ HEAD_END_TAG
          doc.output.gsub!(HEAD_END_TAG, %(#{header_styles}#{Regexp.last_match}))
        else
          doc.output.prepend(header_styles)
        end
      end

      private

      def header_styles
"""<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<style>
#{style_document}
</style>"""
      end

      def style_document
        style_path = File.join(File.dirname(__FILE__), 'social_icons.css')
        File.open(style_path).read
      end
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  Jekyll::SocialIconsStyles.add_styles(doc)
end
