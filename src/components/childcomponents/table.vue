
<template>
	<table class="kt-datatable__table" id="datatable">
      <thead>
          <tr>
              <th v-for="val in this.column" class="kt-datatable__cell kt-datatable__cell--sort" style="text-align: center; cursor: pointer;" @click="sortcolumn(val.__n,val.__t)"><span> Name </span><span>↕</span></th>
               
          </tr>
      </thead>
      <tbody>
          <tr v-for="val in this.body">
            <td>{{val.name}}</td>
            <td>{{val.cred_pass}}</td>
            <td>{{val.email}}</td>
            <td>{{val.officephone}}</td>
            <td>{{val.billing_city}} {{val.billing_state}} {{val.billing_country}}</td>
               <td>
               <router-link :to="this.editurl+val.id" class="btn btn-sm btn-clean btn-icon btn-icon-md"><i class="la la-edit"></i>
               </router-link> 
               <a title="Delete" class="btn btn-sm btn-clean btn-icon btn-icon-md" @click="removeUsers(val.id)"><i class="la la-trash"></i></a>
              </td>
          </tr>
      </tbody>
    <!---->
    </table>
</template>



<script type="text/javascript">
    import User from '@/services/User'
    import notification from '@/components/notification/notification'
    import error from '@/services/error'
	
	export default {
		name: 'User',
		props : ['column','body','editurl'],
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