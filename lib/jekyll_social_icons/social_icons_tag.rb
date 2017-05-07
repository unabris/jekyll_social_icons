module Jekyll
  class SocialIcons < Liquid::Tag
    def initialize(_, args, _)
      super
      @args = OptionParser.parse(args)
    end

    def render(context)
      site = context.registers[:site]
      config_socials = site.config['socials']

      if @args[:socials].nil?
        socials = config_socials
      else
        socials = config_socials.select { |k, v| @args[:socials].include?(k) }
      end

      icons_json = JSON.parse(IO.readlines(File.expand_path('icons.json', File.dirname(__FILE__))).join)

      data = "<div class='social-container #{attr_class}' id='#{attr_id}'>"
      socials.each do |social, url|
        data += "<div class='social #{social}'>
                 <a href='#{url}' target='_blank'>
                 <i class='fa fa-fw fa-#{icons_json[social]}'></i>
                 </a></div>"
      end
      data += '</div>'

      data
    end

    private

    def attr_id
      @args[:attributes][:id]
    end

    def attr_class
      @args[:attributes][:class]
    end
  end
end

Liquid::Template.register_tag('social_icons', Jekyll::SocialIcons)
