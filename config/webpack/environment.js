const { environment } = require('@rails/webpacker')

// environment.plugins.append(
//   "Provide",
//   new webpack.ProvidePlugin({
//     $: "jquery",
//     jQuery: "jquery",
//     Popper: ["popper.js", "default"] // for Bootstrap 4
//   })
// );
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ["popper.js", "default"] // for Bootstrap 4
    })
)
module.exports = environment

// const { environment } = require('@rails/webpacker')
// const { VueLoaderPlugin } = require('vue-loader')
// const vue = require('./loaders/vue')

// environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
// environment.loaders.prepend('vue', vue)

// // Vue.js フル版（Compiler入り）
// environment.config.resolve.alias = { 'vue$': 'vue/dist/vue.esm.js' }

// // ここから
// // jQueryとBootstapのJSを使えるように
// const webpack = require('webpack')
// environment.plugins.prepend(
//   'Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: 'popper.js'
//   })
// )
// // ここまで

// module.exports = environment