<template>
	<div class="kt-portlet kt-portlet--mobile">
        <div class="kt-portlet__head kt-portlet__head--lg">
   <div class="kt-portlet__head-label">
      <span class="kt-portlet__head-icon">
      <i class="kt-font-brand flaticon2-line-chart"></i>
      </span>
      <h3 class="kt-portlet__head-title">
         User List
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
            <router-link to="/admin/newuser" class="btn btn-brand btn-elevate btn-icon-sm">
             
            <i class="la la-plus"></i>
            New Record
            </router-link>
         </div>
      </div>
   </div>
</div>
    <div class="kt-datatable kt-portlet__body kt-portlet__body--fit">
		<table class="kt-datatable__table" id="datatable">
      <thead>
          <tr>
              <th class="kt-datatable__cell kt-datatable__cell--sort" style="text-align: center; cursor: pointer;"><span> Name </span><span>↕</span></th>
              <th class="" style="text-align: center; cursor: pointer;"><span> Email </span><span>↓</span></th>
              <th class="" style="text-align: center; cursor: pointer;"><span> Password </span><span>↓</span></th>
              <th class="" style="text-align: center; cursor: pointer;"><span> Mobile </span><span>↕</span></th>
              <th class="" style="text-align: center; cursor: pointer;"><span> Address </span><span>↕</span></th>
              <th class="" style="text-align: center; cursor: pointer;"><span> Action </span><span>↕</span></th>
          </tr>
      </thead>
      <tbody>
          <tr v-for="val in rows">
            <td>{{val.name}}</td>
           
            <td>{{val.email}}</td>
            <td>{{val.cred_pass}}</td>
            <td>{{val.officephone}}</td>
            <td>{{val.billing_city}} {{val.billing_state}} {{val.billing_country}}</td>
               <td>
               <router-link :to="'/admin/user/'+val.id" class="btn btn-sm btn-clean btn-icon btn-icon-md">   <i class="la la-edit"></i>
               </router-link> 
               <a title="Delete" class="btn btn-sm btn-clean btn-icon btn-icon-md" @click="removeUser(val.id)"><i class="la la-trash"></i></a>
              </td>
          </tr>
      </tbody>
    <!---->
    </table>
	</div>
  <div class="row">
  <div class="col-md-6"></div>
  <div class="col-md-6">
  <div class="pull-right" style="margin-right:12px;">
   <paginate
    v-model="page"
    :page-count="totalRecord"
    :page-range="10"
    :margin-pages="2"
    :click-handler="clickCallback"
    :prev-text="'Prev'"
    :next-text="'Next'"
    :container-class="'pagination'"
    :page-class="'paginate_button page-item'"
    :page-link-class="'page-link'">

  </paginate>
</div>
</div>
</div>
<app-notify ref="notification"></app-notify>
</div>
</template>
 


<script type="text/javascript">
    import User from '@/services/User'
    import notification from '@/components/notification/notification'
    import error from '@/services/error'
	
	export default {
		name: 'User',
    components: {
      'app-notify': notification
    },
		data () {
			return {

        columns: [
            {label: 'Name', field: 'name', headerClass: 'kt-datatable__cell kt-datatable__cell--sort'},
            {label: 'Email', field: 'email'},
            {label: 'Mobile', field: 'officephone'},
            {label: 'Address',  representedAs: ({billing_city, billing_state, billing_country}) => `${billing_city}<br />${billing_state}, ${billing_country}`, interpolate: true},
            {label: 'Action', representedAs: ({id}) => `<button class="btn" v-on:click="deleteCus(${id})">Del</button>`, interpolate: true}
        ],
        rows:[],
        limit:0,
        totalRecord:0,
        page:1,
			}
		},
		methods : {
			getList () {
				User.list({page:this.limit}).then(response=>{
                   this.managetabledata(response.data)
				},error=>{
            
				});
			},
			managetabledata(data) {
               this.rows = data.data;
               this.totalRecord = data.total/data.per_page;
               this.page = data.current_page;
               //this.$compile('#datatable');
			},
			removeUser(id){
				   var self = this; 
           this.$dialog.confirm('Do you want to proceed?')
          .then(function () {
             User.remove(id).then(response=>{
                   console.log(this)
                   self.success('Record Removed')
              },error=>{

                   self.$refs.notification.success('Something happen please try again');
              });
          })
          .catch(function () {
             
          });
			},
      clickCallback(){

      },
      success(msg) {
           this.$refs.notification.success(msg);
           this.getList();
      }
		},
		mounted () {
			this.getList();
      
      console.log(this.$refs.notification)

		}
	}
</script>