<template>
    <ul class="kt-menu__nav"  @click="menuhandle">
                      
                       <li class="kt-menu__section ">
                          <h4 class="kt-menu__section-text">User</h4>
                          <i class="kt-menu__section-icon flaticon-more-v2"></i>
                       </li>
                      
                       <li class="kt-menu__item " aria-haspopup="true">
                          <router-link to="/user/tasks" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-tasks"><span></span></i><span class="kt-menu__link-text">Task</span></router-link>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true">
                          <router-link to="/user/leads" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-tasks"><span></span></i><span class="kt-menu__link-text">Lead</span></router-link>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true">
                          <router-link to="/user/opportunity" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-address-book"><span></span></i><span class="kt-menu__link-text">Opportunity</span></router-link>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true"><a href="/metronic/preview/demo9/#.html" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-fill"></i><span class="kt-menu__link-text">Timeline</span></a></li>
                  </ul>
</template>
<script>
import menu from '@/components/common/menu.js'
import User from '@/services/User';

export default {
  

  name: 'userSide',
  props: {
menuhandle: {
type: Function
}
},
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      menus:menu,
      user:[],
      active:this.activeSide,
    }
  },
   methods:{
    showsidebar(){
        this.isshow = true;
        console.log(this.isshow);
    },
    get() {
        User.get().then(response=>{
                   console.log(response);
                   this.user = response.data;
                },error=>{
                  console.log(error)
                });
    },
    togglemenu(type){
        this.menus[type]= !this.menus[type];
        console.log(this.menus);
        console.log(1);
    },
    logout(){
        localStorage.clear();
        this.$router.push("/login")
    }
  },
  mounted() {
   this.get();
    
  },
   watch: { 
        activeSide: function(newVal, oldVal) { 
          this.active = newVal;
          // watch it
          console.log('Prop changed: ', newVal, ' | was: ', oldVal)
        },

  }
}
</script>