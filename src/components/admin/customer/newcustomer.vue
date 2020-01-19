<template>
	<form-helper parent_class="col-md-10 offset-md-1">
		    <div slot="heading">
			   <h3 class="kt-portlet__head-title">
			      New Customer
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
			      <label for="name" class="col-sm-2 col-form-label">Name</label>
			      <div class="col-sm-4">
			         <input type="text" class="form-control" id="name" placeholders="Name" name="role" v-model="data.name">
			      </div>
			      <label for="officephone" class="col-sm-2 col-form-label">Office Phone:</label>
			      <div class="col-sm-4">
			         <input type="text" class="form-control" id="officephone" placeholders="First Name" name="role" v-model="data.officephone">
			      </div>
			   </div>
			   <div class="form-group row">
			      <label for="website" class="col-sm-2 col-form-label">Website: </label>
			      <div class="col-sm-4">
			         <input type="text" class="form-control" id="website" placeholders="Last Name" name="website" v-model="data.website">
			      </div>
			      <label for="website" class="col-sm-2 col-form-label">Fax: </label>
			      <div class="col-sm-4">
			         <input type="text" class="form-control" id="fax" placeholders="Last Name" name="fax" v-model="data.fax">
			      </div>
			   </div>
			   <div class="form-group row">
			      <label for="website" class="col-sm-2 col-form-label">Email: </label>
			      <div class="col-sm-4">
			         <input type="text" class="form-control" id="website" placeholders="Last Name" name="website" v-model="data.email">
			      </div>
			       
			   </div>
			   <div class="form-group row">
			      <div class="col-md-6">
			         <div class="form-group row">
			            <h3 class="kt-portlet__head-title">Billing Address</h3>
			         </div>
			         <div class="form-group row">
			            <label for="billing_address" class="col-sm-4 col-form-label"> Street: </label>
			            <div class="col-sm-8"> 
			            	<input type="text" name="billing_street" v-model="data.billing_street" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="billing_city" class="col-sm-4 col-form-label"> City: </label>
			            <div class="col-sm-8"> <input type="text" name="billing_city" v-model="data.billing_city" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="billing_state" class="col-sm-4 col-form-label"> State: </label>
			            <div class="col-sm-8"> <input type="text" name="billing_state" v-model="data.billing_state" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="billing_postalcode" class="col-sm-4 col-form-label"> Postal Code: </label>
			            <div class="col-sm-8"> <input type="text" name="billing_postalcode" v-model="data.billing_postalcode" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="billing_country" class="col-sm-4 col-form-label"> Country: </label>
			            <div class="col-sm-8"> <input type="text" name="billing_country" v-model="data.billing_country" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			      </div>
			      <div class="col-md-6">
			         <div class="form-group row">
			            <h3 class="kt-portlet__head-title">Shipping Address</h3>
			         </div>
			         <div class="form-group row">
			            <label for="shipping_address" class="col-sm-4 col-form-label"> Street: </label>
			            <div class="col-sm-8"> <input type="text" name="shipping_street" v-model="data.shipping_street" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="shipping_city" class="col-sm-4 col-form-label"> City: </label>
			            <div class="col-sm-8"> <input type="text" name="shipping_city" v-model="data.shipping_city" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="shipping_state" class="col-sm-4 col-form-label"> State: </label>
			            <div class="col-sm-8"> <input type="text" name="shipping_state" v-model="data.shipping_state" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="shipping_postalcode" class="col-sm-4 col-form-label"> Postal Code: </label>
			            <div class="col-sm-8"> <input type="text" name="shipping_postalcode" v-model="data.shipping_postalcode" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			         <div class="form-group row">
			            <label for="shipping_country" class="col-sm-4 col-form-label"> Country: </label>
			            <div class="col-sm-8"> <input type="text" name="shipping_country" v-model="data.shipping_country" class="form-control" placeholders="" ></input type="text"> </div>
			         </div>
			      </div>
			   </div>
			    <div class="form-group row">
			      <label for="name" class="col-sm-2 col-form-label">Description:</label>
			      <div class="col-sm-10">
			         <textarea name="description" v-model="data.description" class="form-control" placeholders="" ></textarea> 
			      </div>
			   </div>
			   <div class="form-group row">
			      <label for="name" class="col-sm-2 col-form-label">Assign To:</label>
			      <div class="col-sm-4">
			      	<select class="form-control" v-model="data.assign_id">
			      		<option>Select</option>
			      		<option v-for="val in assignee" v-bind:value="val.id">{{val.name}}</option>
			      	</select>
			         
			      </div>
			   </div>
			</div>
			<div slot="action-button">
				 <div class="text-right">
                        <button type="submit" class="btn btn-primary mt-1" @click.prevent="submit">
                           Submit
                           <div class="spinner-grow" v-if="loading" role="status" style="width: 1rem;height: 1rem;    margin-bottom: 3px;">
                              <span class="sr-only">Loading...</span>
                           </div>
                        </button>
                     </div>
			</div>
	</form-helper>
</template>

<script type="text/javascript">
	import FormHelper from '@/components/form-helper/FormHelper'
	import Customers from '@/services/Customers'
	import User from '@/services/User'
	export default {
    components: {
        'form-helper': FormHelper
    },
    name: 'NewCustomer',
    data() {
        return {
            data: {
                name: '',
                officephone: '',
                website: '',
                fax: '',
                email: '',
                billing_street: '',
                billing_city: '',
                billing_state: '',
                billing_postalcode: '',
                billing_country: '',
                shipping_street: '',
                shipping_city: '',
                shipping_state: '',
                shipping_postalcode: '',
                shipping_country: '',
                description: '',
                assign_id: '',

            },
            loading:false,
            error:'',
            id:'',
            assignee:[],
        }
    },
    methods: {
    	submit() {
    		this.loading = true;
    		console.log(this.data);
    		if(this.data.name!='' && this.data.email!='' && this.data.billing_city && this.data.billing_state!='' && this.data.billing_country!=''){
    			this.error = '';
                Customers.add(this.data,this.id).then(response=>{
                   this.loading = false;
                   alert('Saved')
				},error=>{
					console.log(error)
                   this.error=error;
				});   
    		}else{
    			this.error = 'Name, Email, City, State, Country is required';
    		}
    	},
    	getCustomer(id){
        
				Customers.get(id).then(response=>{
                   console.log(response);
                   this.data = response.data;
				},error=>{

				});
				} ,
    	getAssignee(){
    			Customers.getassignee().then(response=>{
                   this.assignee = response.data;
                   console.log(this.assignee);
				},error=>{

				});
				} 
    },
    mounted() {
    	console.log(this.$route)
    	 if(this.$route.params.id){
    	 	this.id=this.$route.params.id;
    	 	this.getCustomer(this.$route.params.id)
    	 }
    	 this.getAssignee();
    }
}
</script>