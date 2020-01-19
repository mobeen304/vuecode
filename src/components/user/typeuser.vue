<template>
	<div>
	<app-common></app-common>
	  <app-common2>
	  	<div class="kt-container  kt-grid__item kt-grid__item--fluid">
	    <router-view></router-view>
	   </div>
      </app-common2>
    </div>
</template>

<script type="text/javascript">
import Common from '@/components/common/common.vue'
import Common2 from '@/components/admin/common.vue'

export default {
  components:{
    'app-common':Common,
    'app-common2':Common2
    },
	name:'Typeuser',
	mounted(){
		console.log('iii')
	}
	}
</script>