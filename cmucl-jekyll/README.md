# CMUCL Jekyll Site

A Jekyll-based static site replicating the structure and style of [cmucl.org](https://cmucl.org).

## Prerequisites

- Ruby 2.7 or later
- Bundler (`gem install bundler`)

## Setup

```bash
# Install dependencies
bundle install

# Serve locally with live reload
bundle exec jekyll serve

# Build for production
bundle exec jekyll build
```

The built site will be in the `_site/` directory.

## Structure

```
cmucl-jekyll/
├── _config.yml          # Site configuration, navigation links
├── _layouts/
│   └── default.html     # Main page layout (header + sidebar + footer)
├── _includes/
│   ├── header.html      # Top navigation bar
│   ├── sidebar.html     # Right sidebar with navigation sections
│   └── footer.html      # Page footer with last-modified date
├── assets/
│   └── css/
│       └── main.css     # All site styles
├── index.md             # Home page content
├── Gemfile
└── README.md
```

## Adding Pages

Create a new `.md` file anywhere in the project with front matter:

```yaml
---
layout: default
title: "My Page Title"
---

Page content here...
```

## Customizing Navigation

Edit `_config.yml` to update the top navigation links:

```yaml
nav_links:
  - title: Home
    url: /
  - title: Downloads
    url: /downloads/
```

Edit `_includes/sidebar.html` to update the sidebar sections.

## Adding News Items

News items on the home page are in `index.md` as a `<dl>` list. To make news
data-driven, you can move them to `_data/news.yml` and loop over them in the template.
