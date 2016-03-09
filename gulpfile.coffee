gulp = require 'gulp'

## METALSMITH
ms = require 'metalsmith'

# MS - BUILD SYSTEM
msWebpack = require 'metalsmith-webpack'
msJade    = require 'metalsmith-jade'
msIgnore  = require 'metalsmith-ignore'

webpackConfig = require './webpack.config.coffee'

gulp.task 'watch', ['forge'], (done) ->
  gulp.watch './src/**/*.*', ['forge:metalsmith']

  done()

gulp.task 'forge', ['forge:metalsmith']

gulp.task 'forge:metalsmith', (done) ->
  ms __dirname
    .source './src'
    .destination './dist'
    .use msJade
      pretty: true
    .use msWebpack webpackConfig
    .use msIgnore [
      '**/*.coffee'
    ]
    .build (err, files) ->
      if (err)
        throw err

      console.log \
        Object.keys(files).map((file) -> "[ms] #{file.split(__dirname + '/dist/').slice -1}").join '\n'
