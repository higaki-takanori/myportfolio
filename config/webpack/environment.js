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
