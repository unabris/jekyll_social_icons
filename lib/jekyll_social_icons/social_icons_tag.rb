module Jekyll
  class SocialIcons < Liquid::Tag
    DEFAULT_WIDTH     = '50px'
    DEFAULT_HEIGHT    = '50px'
    DEFAULT_MARGIN    = '10px'
    DEFAULT_RADIUS    = '0'
    DEFAULT_FONT_SIZE = '30px'

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

      data = "<div class='social-container #{attr_class}' id='#{attr_id}' style='#{align}'>"
      socials.each do |social, url|
        data += "<div class='social #{social}' style='#{icons_size}#{margin}#{radius}'>
                 <a href='#{url}' target='_blank'>
                 <i class='fa fa-fw fa-#{icons_json[social]}' style='#{font_size}'></i>
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

    def align
      case @args[:attributes][:align]
      when 'left'
        'justify-content: flex-start;'
      when 'center'
        'justify-content: center;'
      when 'right'
        'justify-content: flex-end;'
      else
        'justify-content: center;'
      end
    end

    def icons_size
      width  = @args[:attributes][:width] || DEFAULT_WIDTH
      height = @args[:attributes][:height] || DEFAULT_HEIGHT
      "width:#{width};height:#{height};"
    end

    def margin
      margin = @args[:attributes][:margin] || DEFAULT_MARGIN
      "margin-right:#{margin};"
    end

    def radius
      radius = @args[:attributes][:radius] || DEFAULT_RADIUS
      "border-radius:#{radius};"
    end

    def size
      size = @args[:attributes][:size] || DEFAULT_FONT_SIZE
      "font-size:#{size};"
    end
  end
end

Liquid::Template.register_tag('social_icons', Jekyll::SocialIcons)
