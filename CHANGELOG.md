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
