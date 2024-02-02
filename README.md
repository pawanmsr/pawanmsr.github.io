# Jekyll Bhautiki

Physics inspired feature-rich Jekyll theme with math support.

[![Gem Version](https://badge.fury.io/rb/jekyll-bhautiki.svg)](https://badge.fury.io/rb/jekyll-bhautiki)

[![Demo](https://i.ibb.co/f1Wn19m/jekyll-bhautiki.jpg)](https://ibb.co/TvGbv1z)

> I will use this theme to eventually upgrade my personal blog. I looked at many themes that are already available, but I reckoned that most of them would require significant overhauls to fit my bill. Moreover, I feel that it would be fun maintaining my own theme for my own blog.

## Development

[Docs](/docs/) for more details.

### Guide

Standard jekyll structure.

- Views in [_layouts](/_layouts/).
- Components in [_includes](/_includes/).
- Images, Packages, Scripts in [assets](/assets/).
- Stylesheet in [_sass](/_sass/).
- Other scripts in [_script](/_script/).

The scripts are bundled by `parcel`.

```shell
# Any change made to _scripts need to be bundled
# before they can take effect.
npm install

# Remember: add (new) sources in package.json
# before running parcel build.
npm run build

# Update Changelog.
npm run log
# Remember to change the version number in both:
# - The jekyll-bhautiki.gemspec (for release)
# - package.json (for changelog)

```

Install ruby. Use `rbenv`, if multiple versions of ruby need to be present on development system.

```shell

# Install jekyll and blunder.
gem install jekyll bundler

# Install dependencies.
bundle install

# Host on local.
bundle exec jekyll serve

# User gem build and gem push to
# build and push gems.

```

#### Markups

- [SASS](https://sass-lang.com/).
- [Liquid Template Language](https://shopify.github.io/liquid/).

#### Tools and Frameworks

Easy feature integration.

- [Feather](https://feathericons.com/)
- [Foundation](https://get.foundation/)
- [MathJax](https://www.mathjax.org/)
- [Tocbot](https://tscanlin.github.io/tocbot/)

TODO

- [ ] Blender/CAD/Animation


### Design

<pre>

        |    Header    |
        ----------------
        |              |
 Navbar |     Posts    | Sidebar
        |              |
        ----------------
        |    Footer    |

</pre>

The **Navbar** and Footer is static.

#### Home

The **Header** is supposed to contain a Searchbar. Search is performed on request (for static pages; dynamically on server) on the blog articles. The **Sidebar** is supposed to contain an overview section and display picture along with socials. The **Posts** is supposed to list articles as cards.

#### Post

The **Header** is supposed to contain the title of the post. The **Sidebar** is supposed to contain the contents/section names.

#### Pages

The **Header** is supposed to contain the title, similar to a post, but the **Sidebar** is supposed to keep the overview section from the home page.

#### Modes

Space (dark) and Vintage Notebook (multicolor).

#### Languages

English (India/UK) is the default.

- Language Support:
    - [ ] Hindi
    - [ ] Marathi
    - [ ] Telugu
    - [ ] . . . 

Syntax highlighting is performed by [rouge](https://github.com/rouge-ruby/rouge). Visit [Pygments](https://pygments.org/styles/) for available styles.

```shell
# Install Pygments.
pipenv install

export style=default # monokai (for dark mode)
export pygments_dir=assets/external/pygments/css/
mkdir -p $pygments_dir
pygmentize -f html -S $style -a .highlight > $pygments_dir$style.css

```
