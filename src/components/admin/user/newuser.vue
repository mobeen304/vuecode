<template>
   <form-helper parent_class="col-md-6 offset-md-3">
      <div slot="heading">
         <h3 class="kt-portlet__head-title">
            New User
         </h3>
      </div>
      <div slot="error">
         <div class="alert alert-danger" role="alert" v-if="error!=''">
            <div class="alert-text">{{error}}</div>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true"><i class="la la-close"></i></span>
            </button>
         </div>
      </div>
      <div slot="form-fields">
         <div class="form-group row">
            <label for="name" class="col-sm-4 col-form-label">First Name</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="name" placeholders="Name" name="role" v-model="data.firstname">
            </div>
         </div>
         <div class="form-group row">
            <label for="name" class="col-sm-4 col-form-label">Last Name</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="name" placeholders="Name" name="role" v-model="data.lastname">
            </div>
         </div>
         <div class="form-group row">
            <label for="name" class="col-sm-4 col-form-label">Email</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="name" placeholders="Name" name="role" v-model="data.email">
            </div>
         </div>
         <div class="form-group row">
            <label for="name" class="col-sm-4 col-form-label">Password</label>
            <div class="col-sm-8">
               <input type="password" class="form-control" id="name" placeholders="Name" name="role" v-model="data.password">
            </div>
         </div>
         <div class="form-group row">
            <label for="name" class="col-sm-4 col-form-label">Confirm Password</label>
            <div class="col-sm-8">
               <input type="password" class="form-control" id="name" placeholders="Name" name="role" v-model="data.confirm_password">
            </div>
         </div>
         
       
      </div>
      <div slot="action-button">
         <div class="text-right">
            <button type="submit" class="btn btn-primary mt-1" @click.prevent="submit">
               Submit
               <div class="spinner-grow" v-if="loading" role="status" style="width: 1rem;height: 1rem;margin-bottom: 3px;">
                  <span class="sr-only">Loading...</span>
               </div>
            </button>
         </div>
         <app-notify ref="notification"></app-notify>
      </div>

   </form-helper>
</template>
<script type="text/javascript">
	import FormHelper from '@/components/form-helper/FormHelper'
	import User from '@/services/User'
  import notification from '@/components/notification/notification'

	export default {
    components: {
        'form-helper': FormHelper,
        'app-notify': notification
    },
    name: 'NewUser',
    data() {
        return {
            data: {
                firstname: '',
                lastname: '',
                email: '',
                password: '',
                confirm_password: '',
                role: 'user',
                

            },
            loading:false,
            error:'',
            id:'',
        }
    },
    methods: {
    	submit() {
    		var self = this; 
    		this.loading = true;
    		console.log(this.data);
    		if(this.data.firstname!='' && this.data.email!='' && this.data.password){
    			if(this.data.password==this.data.confirm_password){
    			this.error = '';
                User.add(this.data,this.id).then(response=>{
                   this.loading = false;
                   console.log(this.$refs);
                   //this.$refs.notification.success(msg);
                   self.showmsg('Record Added');
				},error=>{
					console.log(error)
                   this.error=error;
				});   
    		}else{
    			this.error = 'Password not match';
    		}
    	}else{
    			this.error = 'All field is required';
    		}
    	},
    	getUser(id){
				User.getUser(id).then(response=>{
                   console.log(response);
                   this.data = response.data;
                   this.data.confirm_password = this.data.cred_pass;
                   this.data.password = this.data.cred_pass;
				},error=>{

				});
				},

      showmsg(msg) {
           this.$refs.notification.success(msg);
           this.data=[];
      }			 
    },
    mounted() {
    	console.log(this.$route)
    	 if(this.$route.params.id){
    	 	this.id=this.$route.params.id;
    	 	this.getUser(this.$route.params.id)
    	 }
    }
}
</script>