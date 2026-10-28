# Keep blog sources intact while allowing the entire section to be omitted.
# A missing setting preserves the theme's original behavior.
Jekyll::Hooks.register :site, :after_init do |site|
  next unless site.config.dig('blog', 'enabled') == false

  site.config['exclude'] = Array(site.config['exclude']) | ['_posts', '_drafts', '_pages/blog.md']
  site.exclude = site.config['exclude']
  site.config['pagination'] = (site.config['pagination'] || {}).merge('enabled' => false)

  # jekyll-feed otherwise creates an empty feed even when there are no posts.
  site.generators.reject! { |generator| generator.class.name == 'JekyllFeed::Generator' }
end
