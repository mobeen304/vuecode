<template>
      <ul class="kt-menu__nav" v-if="this.user.role=='admin'">
                       <li class="kt-menu__item  kt-menu__item--submenu" aria-haspopup="true" data-ktmenu-submenu-toggle="hover" v-bind:class="{'kt-menu__item--open':menus['account']}" >
                          <a href="javascript:;" class="kt-menu__link kt-menu__toggle" @click="togglemenu('account')"><i class="kt-menu__link-icon fa fa-dolly"></i><span class="kt-menu__link-text" >Accounts</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                          <div class="kt-menu__submenu ">
                             <span class="kt-menu__arrow"></span>
                             <ul class="kt-menu__subnav">
                                <li class="kt-menu__item  kt-menu__item--parent" aria-haspopup="true"><span class="kt-menu__link"><span class="kt-menu__link-text">Accounts</span></span>
                                </li>
                                <li class="kt-menu__item " aria-haspopup="true">
                                   <router-link to="/admin/customers" class="kt-menu__link ">
                                      <i class="kt-menu__link-bullet kt-menu__link-bullet--dot"><span></span></i><span class="kt-menu__link-text">Customer</span>
                                   </router-link>
                                </li>
                                <li class="kt-menu__item " aria-haspopup="true">
                                   <router-link to="/admin/users" class="kt-menu__link "><i class="kt-menu__link-bullet kt-menu__link-bullet--dot"><span></span></i><span class="kt-menu__link-text">User</span>
                                   </router-link>
                                </li>
                             </ul>
                          </div>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true">
                          <router-link to="/admin/tasks" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-tasks"><span></span></i><span class="kt-menu__link-text">Task</span></router-link>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true">
                          <router-link to="/admin/leads" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-tasks"><span></span></i><span class="kt-menu__link-text">Lead</span></router-link>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true">
                          <router-link to="/admin/opportunity" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-address-book"><span></span></i><span class="kt-menu__link-text">Opportunity</span></router-link>
                       </li>
                       <li class="kt-menu__item " aria-haspopup="true"><a href="/metronic/preview/demo9/#.html" class="kt-menu__link "><i class="kt-menu__link-icon fa fa-fill"></i><span class="kt-menu__link-text">Timeline</span></a></li>
                  </ul>
</template>
<script>
import menu from '@/components/common/menu.js'
import User from '@/services/User';

export default {
  

  name: 'adminSide',
  props : ['activeSide'],
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
        this.$router.push("login")
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