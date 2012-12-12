//= require js/storyjs-embed

$(document).ready ->
 createStoryJS {
   type: 'timeline'
   height: '500'
   source: '/events.json'
   lang: '/assets/js/locale/zh-ch.js'
   source: '/data/events.json'
   js: '/assets/js/timeline-min.js'
   css: '/assets/css/timeline.css'
   embed_id: 'time_line'
 }
