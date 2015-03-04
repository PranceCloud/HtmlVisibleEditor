coffee = require 'gulp-coffee'
es = require 'event-stream'
concat = require 'gulp-concat'
gulp = require 'gulp'
console = require 'better-console'

gulp.task 'default', () ->
  watcher = gulp.watch('./src/*.coffee');
  watcher.on 'change', (event)->
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
    gulp.src("src/**/*.coffee")
    .pipe coffee({bare: true}).on 'error', (err) ->
      console.log err.name
      console.log err.stack
    .pipe concat 'js/all.js'
    .pipe gulp.dest "dest"
    .on 'end', () ->
      console.log 'all.js is ok'


gulp.task 'scripts', () ->
  es.merge(
    # ... gulp.src(["./src/app.js", "public-dev/scripts/**/*.js"])
    gulp.src("./src/**/*.coffee").pipe coffee()
  )
  .pipe concat './dist/all.js'
  .pipe gulp.dest "build"