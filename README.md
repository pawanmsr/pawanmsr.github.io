# Jekyll Bhautiki

Physics inspired feature-rich Jekyll theme with math support.

> I will use this theme to eventually upgrade my personal blog. I looked at many themes that are already available, but I reckoned that most of them would require significant overhauls to fit my bill. Moreover, I feel that it would be fun maintaining my own theme for my own blog.

## Development

Status: Under Development.

### Guide

Standard jekyll structure.

- Views in [_layouts](/_layouts/).
- Components in [_includes](/_includes/).
- Images, Packages, Scripts in [assets](/assets/).
- Stylesheet in [_sass](/_sass/).
- Other scripts in [_script](/_script/).

#### Markups

- [SASS](https://sass-lang.com/).
- [Liquid Template Language](https://shopify.github.io/liquid/).

#### Tools and Frameworks

Easy feature integration.

- [Feather](https://feathericons.com/)
- [Foundation](https://get.foundation/)
- [MathJax](https://www.mathjax.org/)
- [ ] Blender/CAD/Animation
- [ ] Diagrams/Flowcharts
- [ ] Tex


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

The **Header** will contain a searchbar. Search is performed on request (for static pages; dynamically on server) on the blog articles. The **Sidebar** will contain an overview section and display picture along with socials. The **Posts** will list articles as cards.

#### Post

The **Header** will contain the title of the post. The **Sidebar** with contain the contents/section names in faded manner.

#### Pages

The **Header** will contain the title like in a post, but the **Sidebar** will contian an overview section just like in the home page.

#### Themes

Space (dark) and Classroom (multicolor).

#### Languages

English (India/UK) is the default.

- Language Support:
    - [ ] Hindi
    - [ ] Marathi
    - [ ] Telugu
    - [ ] . . . 


### Deployment Notes

Install ruby. Use `rbenv` if a multiple versions of ruby need to be present on development system.

```shell

# Install jekyll and blunder.
gem install jekyll bundler

# Install dependencies.
bundle install

# Host on local.
bundle exec jekyll serve

```
