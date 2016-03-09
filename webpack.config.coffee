path = require 'path'

module.exports =
  context: path.resolve __dirname, 'src'
  entry:
    app: './app.coffee'
  output:
    path: path.resolve './dist'
    filename: '[name].js'
  module:
    loaders: [
      test: /\.vue$/
      loader: 'vue'
    ,
      test: /\.coffee$/
      loader: 'coffee'
    ,
      test: /\.css$/
      loader: 'style!css'
    ,
      test: /\.scss$/
      include: /node_modules\/vuestrap/
      loader: 'style!css!autoprefixer-loader!sass!vuestrap-theme'
    ,
      test: /\.scss$/
      exclude: /node_modules\/vuestrap/
      loader: 'style!css!sass'
    ,
      test: /\.js$/
      include: /node_modules\/vuestrap/
      loader: 'babel-loader?presets[]=es2015'
    ,
      test: /\.html$/
      include: /node_modules\/vuestrap/
      loader: 'html-loader'
    ]
  resolve:
    root: path.resolve './'
    modulesDirectories: ['src/web', 'node_modules']
    extensions: ['', '.js', '.coffee']
  themeLoader:
    themes: [
      path.resolve __dirname, 'node_modules/vuestrap/theme/_bootstrap.scss'
    ]
