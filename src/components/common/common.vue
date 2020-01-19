<template>
   <div>
	   <app-mobileheader></app-mobileheader>
	   <app-header></app-header>
	   
   </div>
</template>


<script type="text/javascript">
import Header from '@/components/common/header.vue'
import Mobileheader from '@/components/common/mobileheader.vue'

export default {
  components:{
    'app-header':Header,
    'app-mobileheader':Mobileheader,
  },
	name:'Common'
	}
</script>