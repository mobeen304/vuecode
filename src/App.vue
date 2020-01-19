
<template>
  <div id="app">
    <router-view/>
  </div>
</template>
 <style >
 @import './assets/css/style.bundle.css';

 @import './assets/css/plugins.bundle.css'
 </style>
 <script type="text/javascript">
    import  './assets/js/script.bundle.js'
    import './assets/js/plugins.bundle.js'
 </script>
<script>
import Header from '@/components/common/header.vue'
import Mobileheader from '@/components/common/mobileheader.vue'

export default {
  components:{
    'app-header':Header,
    'app-mobileheader':Mobileheader,
  },
  name: 'App'
}
</script>

<style>
#app {
   
   
}
</style>
