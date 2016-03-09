Vue = require 'vue'
Firebase = require 'firebase'

firebase = new Firebase 'https://your-firebase-app-here.firebaseio.com'

vuestrap_components = require 'vuestrap-base-components/src/components'
require 'vuestrap/bootstrap/bootstrap-flex.scss'

vm = new Vue
  el: '#app'
  data: ->
    todos: {}


# debugger

firebase.child('todos').on 'child_added', (snapshot) ->
  vm.$set "todos['#{snapshot.key()}']", snapshot.val()


window.vm = vm
