# Rails.application.config.propshaft.loader = Propshaft::Loader.new(
#   paths: Rails.application.config.assets.paths,
#   prefix: Rails.application.config.assets.prefix
# )

# これは propsahft のカスタム設定ファイル

Rails.application.configure do
  config.propshaft.javascript_pipeline = :esbuild
  config.propshaft.webpack.exclude << 'app/javascript/**/*.js'
end