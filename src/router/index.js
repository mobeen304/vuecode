import Vue from 'vue'
import Router from 'vue-router';
import HelloWorld from '@/components/HelloWorld';

import RegisterComponent from '@/components/auth/RegisterComponent';
import Login from '@/components/auth/LoginComponent';
import Dashboard from '@/components/admin/dashboard/Dashboard';
import Admin from '@/components/admin/Admin';
import Customer from '@/components/admin/customer/Customer';
import NewCustomer from '@/components/admin/customer/NewCustomer';
import User from '@/components/admin/user/User';
import NewUser from '@/components/admin/user/NewUser';
import Task from '@/components/admin/task/Task';
import NewTask from '@/components/admin/task/NewTask';
import Lead from '@/components/admin/lead/Lead';
import NewLead from '@/components/admin/lead/NewLead';
import Campaign from '@/components/admin/campaign/list';
import NewCampaign from '@/components/admin/campaign/new';
import Opportunity from '@/components/admin/opportunity/listopp';
import NewOpportunity from '@/components/admin/opportunity/newopp';
//User
import Typeuser from '@/components/user/typeuser';
import UserTask from '@/components/user/task/usertask';
import Test from '@/components/admin/test/test';

//
import Chat from '@/components/admin/chat/Chat';
import { VuejsDatatableFactory } from 'vuejs-datatable';
import Paginate from 'vuejs-paginate';
import Vuesax from 'vuesax';
import Notifications from 'vue-notification'
import VuejsDialog from 'vuejs-dialog';
import datepicker from 'vue-date-picker';
import DatePicker from 'vue2-datepicker';
import user_route from '@/router/user_route';
import Antd from 'ant-design-vue';
/**/
 
import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import 'dayspan-vuetify/dist/lib/dayspan-vuetify.min.css'

/**/
import { Slide } from 'vue-burger-menu' 
import 'ant-design-vue/dist/antd.css';
import 'vue2-datepicker/index.css';
import 'vuesax/dist/vuesax.css' ;
import 'vuejs-dialog/dist/vuejs-dialog.min.css';
// import RegisterComponent from '@/components/auth/RegisterComponent'
// import RegisterComponent from '@/components/auth/RegisterComponent'
Vue.use( VuejsDatatableFactory);
Vue.use(Vuesax, {
  // options here
});
Vue.use(VuejsDialog);
Vue.use(Notifications)
Vue.component('paginate', Paginate);
Vue.component('datepicker', DatePicker);
Vue.use(Router);
Vue.use(Antd);

const token  = localStorage.getItem('token');
export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/register',
      name: 'HelloWorld',
      component: RegisterComponent
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/admin',component:Admin,
      beforeEnter: (to, from, next) => {
        if (!token) next('/login')
          // if the user is not authenticated, `next` is called twice
          next()
      },
      children:[
          {
          path: '',
          name:'Dashboard',
          component: Dashboard
          },

          /*Customers*/
          {
          path: 'customers',
          name:'Customers',
          component: Customer,
            props:{
                pageTitle: 'Customer',
                subTitle: ''
            },
          },
          {
          path: 'newcustomers',
          name:'NewCustomers',
          component: NewCustomer,
            props:{
                pageTitle: 'Customer',
                subTitle: ''
            },
          },
          {
          path: 'customer/:id',
          name:'NewCustomers',
          component: NewCustomer,
            props:{
                pageTitle: 'Customer',
                subTitle: ''
            },
          },
          /*Customers*/

          /*Users*/
          {
          path: 'users',
          name:'Users',
          component: User,
            props:{
                pageTitle: 'User',
                subTitle: ''
            },
          },
          {
          path: 'newuser',
          name:'Newuser',
          component: NewUser,
            props:{
                pageTitle: 'User',
                subTitle: ''
            },
          },
          {
          path: 'user/:id',
          name:'Newusers',
          component: NewUser,
            props:{
                pageTitle: 'User',
                subTitle: ''
            },
          },
          /*Users*/

          /*Tasks*/
          {
          path: 'tasks',
          name:'Tasks',
          component: Task,
            props:{
                pageTitle: 'User',
                subTitle: ''
            },
          },
          {
          path: 'newtask',
          name:'Newtask',
          component: NewTask,
            props:{
                pageTitle: 'User',
                subTitle: ''
            },
          },
          {
          path: 'task/:id',
          name:'Newtask',
          component: NewTask,
            props:{
                pageTitle: 'User',
                subTitle: ''
            },
          },
          /*Users*/

          /*Lead*/
          {
          path: 'leads',
          name:'leads',
          component: Lead,
            props:{
                pageTitle: 'Lead',
                subTitle: ''
            },
          },
          {
          path: 'newlead',
          name:'Newlead',
          component: NewLead,
            props:{
                pageTitle: 'Lead',
                subTitle: ''
            },
          },
          {
          path: 'lead/:id',
          name:'NewLead',
          component: NewLead,
            props:{
                pageTitle: 'Lead',
                subTitle: ''
            },
          },
          /*Lead*/

          /*Campaign*/
          {
          path: 'campaigns',
          name:'campaigns',
          component: Campaign,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          {
          path: 'newcampaign',
          name:'Newcampaign',
          component: NewCampaign,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          {
          path: 'campaign/:id',
          name:'Newcampaign',
          component: NewCampaign,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          /*Campaign*/

          /*Opportunity*/
          {
          path: 'opportunity',
          name:'opportunity',
          component: Opportunity,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          {
          path: 'newopportunity',
          name:'Newopportunity',
          component: NewOpportunity,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          {
          path: 'opportunity/:id',
          name:'Newopportunity',
          component: NewOpportunity,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          {
          path: 'chat',
          name:'Chat',
          component: Chat,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          {
          path: 'test',
          name:'Chat',
          component: Test,
            props:{
                pageTitle: 'campaign',
                subTitle: ''
            },
          },
          /*Opportunity*/
      ]
    },
    {
      path: '/user',component:Typeuser,
      beforeEnter: (to, from, next) => {
        if (!token) next('/login')
          // if the user is not authenticated, `next` is called twice
          next()
      },
       children:user_route
    },
    
  ]
})
