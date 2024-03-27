# Rails.application.config.propshaft.loader = Propshaft::Loader.new(
#   paths: Rails.application.config.assets.paths,
#   prefix: Rails.application.config.assets.prefix
# )

# これは propsahft のカスタム設定ファイル

# Rails.application.configure do
#   config.propshaft.javascript_pipeline = :esbuild
#   config.propshaft.webpack.exclude << 'app/javascript/**/*.js'
# end

Rails.application.config.assets.build_with = {
  Propshaft::Esbuild => { inputs:  [
                            Rails.root.join('app/javascript/**/*.js')
                            Rails.root.join('app/javascript/*.js')
                            ],
                          options: {} },
  Propshaft::Tailwindcss => { inputs: Rails.root.join('app/assets/stylesheets'),
                          options: {}, }
}
# あとで調べる ちゃんとやる