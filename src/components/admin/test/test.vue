<template>
  <div class="kt-portlet kt-portlet--mobile">
   <div class="kt-portlet__head kt-portlet__head--lg">
       <div class="kt-portlet__head-label">
          <span class="kt-portlet__head-icon">
          <i class="kt-font-brand flaticon2-line-chart"></i>
          </span>
          <h3 class="kt-portlet__head-title">
             Task List
          </h3>
       </div>
       <div class="kt-portlet__head-toolbar">
          <div class="kt-portlet__head-wrapper">
             <div class="kt-portlet__head-actions">
                <div class="dropdown dropdown-inline">
                   <button type="button" class="btn btn-default btn-icon-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <i class="la la-download"></i> Export    
                   </button>
                   <div class="dropdown-menu dropdown-menu-right">
                      <ul class="kt-nav">
                         <li class="kt-nav__section kt-nav__section--first">
                            <span class="kt-nav__section-text">Choose an option</span>
                         </li>
                         <li class="kt-nav__item">
                            <a href="#" class="kt-nav__link">
                            <i class="kt-nav__link-icon la la-print"></i>
                            <span class="kt-nav__link-text">Print</span>
                            </a>
                         </li>
                         <li class="kt-nav__item">
                            <a href="#" class="kt-nav__link">
                            <i class="kt-nav__link-icon la la-copy"></i>
                            <span class="kt-nav__link-text">Copy</span>
                            </a>
                         </li>
                         <li class="kt-nav__item">
                            <a href="#" class="kt-nav__link">
                            <i class="kt-nav__link-icon la la-file-excel-o"></i>
                            <span class="kt-nav__link-text">Excel</span>
                            </a>
                         </li>
                         <li class="kt-nav__item">
                            <a href="#" class="kt-nav__link">
                            <i class="kt-nav__link-icon la la-file-text-o"></i>
                            <span class="kt-nav__link-text">CSV</span>
                            </a>
                         </li>
                         <li class="kt-nav__item">
                            <a href="#" class="kt-nav__link">
                            <i class="kt-nav__link-icon la la-file-pdf-o"></i>
                            <span class="kt-nav__link-text">PDF</span>
                            </a>
                         </li>
                      </ul>
                   </div>
                </div>
                &nbsp;
                <router-link to="/admin/newtask" class="btn btn-brand btn-elevate btn-icon-sm">
                 
                <i class="la la-plus"></i>
                New Record
                </router-link>
             </div>
          </div>
       </div>
   </div>
   <div class="row">
   <div class="col-md-12">
  <v-app id="dayspan" v-cloak>
    <ds-calendar-app :calendar="calendar"></ds-calendar-app>
  </v-app>
</div>
</div>
</div>
</template>
 


<script type="text/javascript">
    import Vue from 'vue' ;
    import Vuetify from 'vuetify';
    import DaySpanVuetify from 'dayspan-vuetify';
    import User from '@/services/User';
    import Tasks from '@/services/Tasks.js';
    import notification from '@/components/notification/notification'
    import error from '@/services/error'
	  import { Calendar } from 'dayspan';
  

  /**/
Vue.config.productionTip = false

Vue.use(Vuetify);

Vue.use(DaySpanVuetify, {
  methods: {
    getDefaultEventColor: () => '#1976d2'
  }
});
/**/
	export default {
		name: 'Test',
    components: {
      'app-notify': notification
    },
		data: () => ({
    calendar: Calendar.months()
     }),
		methods : {
			
		},
		mounted () {
			//this.getList();
      
      console.log(this.$refs.notification)

		}
	}
</script> <style> [v-cloak] { display: none; } </style>