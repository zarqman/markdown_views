#### 4.0.0

- (Potentially Breaking) Allow CommonMarker 2.10.1 which removes the `tagfilter` plugin
  This potentially affects sanitization of untrusted user input, but only when Rails didn't already sanitize the input before tagfilter saw it.
  Most normal markdown rendering within Rails views, both `.html.md` and `markdown()` inside `.html.erb`, uses Rails' html_safe mechanism for sanitization--and always has. This remains unchanged by the loss of tagfilter.
  However, **Warning**: If your app does somehow rely on tagfilter's sanitization alone, the loss of tagfilter might expose XSS or other risks. Most likely this would look like using the `raw()` helper, calling `MarkdownViews::Renderer.render` directly, or overriding the default `MarkdownViews.preprocessor` to something besides `:erb`.
  If you need to identify whether currently sanitized output is sanitized by Rails or CommonMarker <= 2.10.0, there are a couple key differences:
    Rails/erb - sanitizes all use of `<` and `>`, eg: `<script>` becomes `&lt;script&gt;` and `<em>` becomes `&lt;em&gt;`.
    tagfilter - sanitizes only `<`, and only `iframe`, `noembed`, `noframes`, `plaintext`, `script`, `style`, `textarea`, `title`, and `xmp` tags, eg: `<script>` becomes `&lt;script>` and `<em>` is left as-is.
- Update defaults for CommonMarker 2.10.1
- (Heads up) Support for Rails 6.x, 7.x; Rouge 4.x; and CommonMarker 1.x are all now deprecated and may be removed in a future 4.x release.  

#### 3.5.1

- Restrict CommonMarker to <= 2.10.0 to preserve `tagfilter` (see 4.0.0)
  Warning: tagfilter has potential quadratic CPU usage.
  See https://github.com/kivikakk/comrak/issues/829.

#### 3.5.0

- Update template handler to support Rails 8.2

#### 3.4.0

- Allow Rouge 5.x
- Add Rouge magritte theme

#### 3.3.0

- Update defaults for CommonMarker 2.8

#### 3.2.2

- Fix encoding errors during markdown rendering

#### 3.2.1

- Allow Ruby 4.x

#### 3.2.0

- Update defaults for CommonMarker 2.3.2
- Relax Rails constraing to just >= 6.1

#### 3.1.0

- Allow CommonMarker v2.x

#### 3.0.0

- (Breaking) Drop support for Ruby 2.x, 3.0.
- (Breaking) Drop support for Rails 5.x, 6.0.
- (Potentially Breaking) Update to CommonMarker v1.x (from v0.x)
  CM v1 reworked its config. markdown_views v3's updated defaults attempt to match the prior version as near as possible. If you've customized rendering defaults, a review of your config is warranted.
  To preserve backards compatibility, MV continues to use Rouge for syntax highlighting and disables CM's own new highlighting.
- Refresh Rouge stylesheets

#### Earlier versions

See git history.
