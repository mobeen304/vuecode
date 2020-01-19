<template>
	<div v-bind:class="{ 'kt-aside--on': isshow }">
        <div id="kt_header" class="kt-header  kt-header--fixed " data-ktheader-minimize="on">
            <div class="kt-container  kt-container--fluid ">
                <!-- begin: Header Menu -->
                <button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
                <div class="kt-header-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_header_menu_wrapper">

                    <button class="kt-aside-toggler kt-aside-toggler--left" @click="togglemenu()"  id="kt_aside_toggler"><span></span>
                    </button>

                    <div id="kt_header_menu" class="kt-header-menu kt-header-menu-mobile ">
                      <ul class="kt-menu__nav ">
    					   <li class="kt-menu__item  kt-menu__item--open kt-menu__item--here kt-menu__item--submenu kt-menu__item--rel kt-menu__item--open kt-menu__item--here" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
    					      <a href="javascript:;" class="kt-menu__link kt-menu__toggle"><span class="kt-menu__link-text">Dashboard</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
    					      <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
    					         <ul class="kt-menu__subnav"></ul>
    					      </div>
    					   </li>
    					   <li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
    					       <router-link to="/admin/campaigns" class="kt-menu__link "><span class="kt-menu__link-text">Campaign</span><i class="kt-menu__ver-arrow la la-angle-right"></i></router-link>
    					      <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
    					         <ul class="kt-menu__subnav"></ul>
    					      </div>
    					   </li>
    					   <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
    					      <a href="javascript:;" class="kt-menu__link kt-menu__toggle"><span class="kt-menu__link-text">Crud</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
    					      <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
    					         <ul class="kt-menu__subnav"></ul>
    					      </div>
    					   </li>
    					   <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
    					      <a href="javascript:;" class="kt-menu__link kt-menu__toggle"><span class="kt-menu__link-text">Apps</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
    					      <div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--left">
    					         <ul class="kt-menu__subnav"></ul>
    					      </div>
    					   </li>
    					   <li class="kt-menu__item  kt-menu__item--submenu kt-menu__item--rel" data-ktmenu-submenu-toggle="click" aria-haspopup="true">
    					      <a href="javascript:;" class="kt-menu__link kt-menu__toggle"><span class="kt-menu__link-text">Pages</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
    					      <div class="kt-menu__submenu  kt-menu__submenu--fixed kt-menu__submenu--center" style="width:1000px">
    					         <div class="kt-menu__subnav">
    					            <ul class="kt-menu__content"></ul>
    					         </div>
    					      </div>
    					   </li>
    					</ul>  
                    </div>
                </div>
                <!-- end: Header Menu -->
                <app-rightHeader></app-rightHeader>
            </div>
        </div>
        <!-- <button class="kt-aside-close " id="kt_aside_close_btn" @click="showsidebar"><i class="la la-close"></i></button> -->
        <app-side ref="sidebr"></app-side>
    
   
    </div>
</template>
<script>
import Side from '@/components/common/side.vue';
import rightHeader from '@/components/common/rightHeader.vue';
import User from '@/services/User';
import menu from '@/components/common/menu.js';
// import datepicker from '../../assets/js/datepicker.js'
// import router from '../../router';
export default {
  name: 'Header',
  components:{
    'app-side':Side,
    'app-rightHeader':rightHeader,
    
  },
  data () {
    return {
      isshow: false,
      user:[],
      menus:menu,
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
         //this.active = !this.active;
         console.log(this.$refs.sidebr)
         console.log(this.$refs.sidebr.togglemenu())
        // this.menus[type]= !this.menus[type];
        // console.log(this.menus);
        // console.log(1);
    },
    logout(){
        localStorage.clear();
        this.$router.push("/login")
    }
  },
  mounted() {
    this.get();
    
  }
}
</script>