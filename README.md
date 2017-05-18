# Jekyll Social Icons

[![Gem](https://img.shields.io/gem/v/jekyll_social_icons.svg)](https://rubygems.org/gems/jekyll_social_icons)

__Jekyll Social Icons__ plugin allows you rendering your social networks on your [Jekyll](https://jekyllrb.com/) project.

## 1. Installation

1. Add the following to your site's `Gemfile`:

```ruby
gem 'jekyll_social_icons'
```

2. Add the following to your site's `_config.yml`:

```yaml
gems:
  - jekyll_social_icons
```

3. Run `bundle install` in your command line:

```bash
$ bundle install
```

## 2. Usage

### 2.1. Configuration

Add your social networks URLs to the `_config.yml` file:

```yaml
socials:
  twitter: https://twitter.com/unabris
  github: https://github.com/unabris
```

Here is a full list of all the __available social networks__: `facebook`, `twitter`, `google-plus`, `instagram`, `linkedin`, `youtube`, `github` and `rss`.

### 2.2. Rendering

Use `{% social_icons %}` Jekyll Tag to render all your configured social networks with the default styling. For example, the configuration above will render this html content:

```html
<div class="social-container" id="" style="">
  <div class="social" style="">
    <a href="https://twitter.com/unabris" target="_blank">
      <i class="fa fa-fw fa-twitter" style=""></i>
    </a>
  </div>
  <div class="social" style="">
    <a href="https://github.com/unabris" target="_blank">
      <i class="fa fa-fw fa-github" style=""></i>
    </a>
  </div>
</div>
```

You can also specify the social networks you want to render adding them to the Jekyll Tag this way:

```html
{% social_icons twitter github %}
```

### 2.3. Styling

There are so many attributes you can use to customize the style of your social networks icons. To use them, just add the attribute and the value you want to the `social_icons` Jekyll Tag this way:

```html
{% social_icons twitter github id="footer-icons" width="30px" height="30px" radius="100%" %}
```

Here is a full list of all the available attributes with their default values:

| Option   | Description                                                                                                                    |  Default |
|:--------:|--------------------------------------------------------------------------------------------------------------------------------|:--------:|
| `id`     | One or more ids separated by a space. This ids are going to be added at the same level than the main `social-container` class. |     -    |
| `class`  | One or more classes separated by a space. This classes are going to be added to the main `social-container` class.             |     -    |
| `width`  | The `width` of the social networks icons.                                                                                      |  `50px`  |
| `height` | The `height` of the social networks icons.                                                                                     |  `50px`  |
| `align`  | One of `left`, `center` or `right`.                                                                                            | `center` |
| `margin` | The margin between the different social icons you want to render.                                                              |  `10px`  |
| `radius` | The border radius of the social icons. Put `100%` if you want circle icons.                                                    |    `0`   |
| `size`   | The size of the social networks brand image.                                                                                   |  `30px`  |

## 3. Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## 4. License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
