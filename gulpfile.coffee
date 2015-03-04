coffee = require 'gulp-coffee'
es = require 'event-stream'
concat = require 'gulp-concat'
gulp = require 'gulp'
console = require 'better-console'

gulp.task 'default', () ->
  watcher = gulp.watch "src/**/*.coffee";
  watcher.on 'change', (event)->
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
    gulp.src ["./src/start.coffee", "./src/main/**/*.coffee", "./src/iframe/**/*.coffee", "./src/components/**/*.coffee"]
    .pipe coffee({bare: true}).on 'error', (err) ->
      console.log err.name
      console.log err.stack
    .pipe concat 'all.js'
    .pipe gulp.dest "dest"
    .on 'end', () ->
      console.log 'all.js is ok'

test = require './tasks/test'

gulp.task 'test', () ->
  test
