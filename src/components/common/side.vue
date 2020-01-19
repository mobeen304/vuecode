<template>
   <vs-sidebar parent="body" default-index="1"  color="primary" class="sidebarx" spacer v-model="active">
          <div class="kt-aside kt-aside--fixed kt-grid__item kt-grid kt-grid--desktop kt-grid--hor-desktop kt-aside--on" id="kt_aside kt-aside--on" >
            
             <div class="kt-aside-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_aside_menu_wrapper">
                <div id="kt_aside_menu" class="kt-aside-menu kt-scroll ps ps--active-y" data-ktmenu-vertical="1" data-ktmenu-scroll="1" style=" overflow: hidden;">
                   <app-userside :menuhandle="this.closeMenu"></app-userside>
                   <app-adminside></app-adminside>
                 
                   <div class="ps__rail-x" style="left: 0px; bottom: -322px;">
                      <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                   </div>
                   <div class="ps__rail-y" style="top: 322px; height: 224px; right: 0px;">
                      <div class="ps__thumb-y" tabindex="0" style="top: 122px; height: 85px;"></div>
                   </div>
                </div>
             </div>
             
          </div>
</vs-sidebar>
</template>
<script>
import menu from '@/components/common/menu.js'
import User from '@/services/User';
import userSide from '@/components/common/userSide.vue';
import adminSide from '@/components/common/adminSide.vue';

export default {
  
  components:{
    'app-userside':userSide,
    'app-adminside':adminSide,
    
  },
  name: 'Side',
  props :{
    activeSide: {
        type: Boolean,
         
      }
    },
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      menus:menu,
      user:[],
      active:false,
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
    togglemenu(){
      console.log(this.active )
         this.active = !this.active;
      console.log(this.active )
         
    },
    closeMenu(){
      console.log(this.active )

        this.active = false;
        //this.activeSide = false;
    },
    logout(){
        localStorage.clear();
        this.$router.push("/login")
    }
  },
  mounted() {
    //this.get();
    
  },
   watch: { 
          
        

  }
}
</script>