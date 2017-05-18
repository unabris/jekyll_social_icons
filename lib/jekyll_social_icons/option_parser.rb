module Jekyll
  class OptionParser
    icons_json = JSON.parse(IO.readlines(File.expand_path('icons.json', File.dirname(__FILE__))).join)
    available_socials = icons_json.keys

    OPTIONS_SYNTAX     = %r!([^\s]+)\s*=\s*['"]+([^'"]+)['"]+!
    ALLOWED_SOCIALS    = available_socials.freeze
    ALLOWED_ATTRIBUTES = %w(
      id
      class
      width
      height
      align
      margin
      radius
      size
    ).freeze

    class << self
      def parse(raw_options)
        options = {
          attributes: {}
        }
        raw_options.scan(OPTIONS_SYNTAX).each do |key, value|
          if ALLOWED_ATTRIBUTES.include?(key)
            options[:attributes][key.to_sym] = value
          end
          if key.to_sym == :socials
            options[:socials] = value.split(' ').select { |k, v| ALLOWED_SOCIALS.include?(k) }
          end
        end
        options
      end
    end
  end
end
