require 'jekyll_social_icons/version'

module Jekyll
  class SocialIcons < Liquid::Tag
    def initialize(tag_name, key, tokens)
      super
      @key = key.strip
    end

    def render(context)
      key = @key.split(' ').map(&:downcase)
      site = context.registers[:site]
      config_socials = site.config['socials']

      if key.size == 0
        socials = config_socials
      else
        socials = config_socials.select { |k, v| key.include?(k) }
      end

      icons_json = JSON.parse(IO.readlines(File.expand_path('jekyll_social_icons/icons.json', File.dirname(__FILE__))).join)
      available_socials = icons_json.keys

      result = '<div class="social-container">'
      socials.each do |social, url|
        if available_socials.include?(social)
          result += "<div class='social #{social}'>
                     <a href='#{url}' target='_blank'>
                     <i class='fa fa-fw fa-#{icons_json[social]}'></i>
                     </a></div>"
        end
      end
      result += '</div>'

      result
    end
  end
end

Liquid::Template.register_tag('social_icons', Jekyll::SocialIcons)
