const { environment } = require('@rails/webpacker')

//スライダー用
const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
//ここまで

module.exports = environment
