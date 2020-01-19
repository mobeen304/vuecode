<template>
   <form-helper parent_class="col-md-10 offset-md-1">
      <div slot="heading">
         <h3 class="kt-portlet__head-title">
            {{heading}}
         </h3>
      </div>
      <div slot="processing" v-if="fetching">
         <div class="kt-spinner kt-spinner--sm kt-spinner--brand"></div>
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
                        <label for="first_name" class="col-sm-2 col-form-label">First Name</label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="first_name" placeholders="First Name" name="role" v-model="data.first_name">
                        </div>
                        <label for="last_name" class="col-sm-2 col-form-label">Last Name:</label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="last_name" placeholders="First Name" name="last_name" v-model="data.last_name">
                        </div>
                     </div>
                     <div class="form-group row">
                          <label for="officephone" class="col-sm-2 col-form-label">Office Phone:</label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="officephone" name="role" v-model="data.officephone">
                        </div>
                        <label for="mobile" class="col-sm-2 col-form-label">Mobile: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="mobile" placeholders=" " name="fax" v-model="data.mobile">
                        </div>
                     </div>
                     <div class="form-group row">
                       <label for="accountname" class="col-sm-2 col-form-label">Account Name: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="accountname" placeholders="Last Name" name="accountname" v-model="data.accountname">
                        </div>
                        <label for="website" class="col-sm-2 col-form-label">Fax: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="fax" placeholders="Last Name" name="fax" v-model="data.fax">
                        </div>
                     </div>
                     <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">Email  </label>
                        <div class="col-sm-4">
                           <input type="email" class="form-control" id="inputEmail3" placeholders="Email"  name="email"  v-model="data.email" >
                        </div>
                     </div>
                     <div class="form-group row">
                        <div class="col-md-6">
                          
                              <h2 class="text-md text-highlight">Primary Address</h2>
                           
                           <div class="form-group row">
                              <label for="primary_address" class="col-sm-4 col-form-label"> Street: </label>
                              <div class="col-sm-8"> <input type="text" name="primary_street" v-model="data.primary_street" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="primary_city" class="col-sm-4 col-form-label"> City: </label>
                              <div class="col-sm-8"> <input type="text" name="primary_city" v-model="data.primary_city" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="primary_state" class="col-sm-4 col-form-label"> State: </label>
                              <div class="col-sm-8"> <input type="text" name="primary_state" v-model="data.primary_state" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="primary_postalcode" class="col-sm-4 col-form-label"> Postal Code: </label>
                              <div class="col-sm-8"> <input type="text" name="primary_postalcode" v-model="data.primary_postalcode" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="primary_country" class="col-sm-4 col-form-label"> Country: </label>
                              <div class="col-sm-8"> <input type="text" name="primary_country" v-model="data.primary_country" class="form-control" placeholders="" > </div>
                           </div>
                        </div>
                        <div class="col-md-6">
                            
                              <h2 class="text-md text-highlight">Other Address</h2>
                            
                            <div class="form-group row">
                              <label for="other_address" class="col-sm-4 col-form-label"> Street: </label>
                              <div class="col-sm-8"> <input type="text" name="other_street" v-model="data.other_street" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="other_city" class="col-sm-4 col-form-label"> City: </label>
                              <div class="col-sm-8"> <input type="text" name="other_city" v-model="data.other_city" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="other_state" class="col-sm-4 col-form-label"> State: </label>
                              <div class="col-sm-8"> <input type="text" name="other_state" v-model="data.other_state" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="other_postalcode" class="col-sm-4 col-form-label"> Postal Code: </label>
                              <div class="col-sm-8"> <input type="text" name="other_postalcode" v-model="data.other_postalcode" class="form-control" placeholders="" > </div>
                           </div>
                           <div class="form-group row">
                              <label for="other_country" class="col-sm-4 col-form-label"> Country: </label>
                              <div class="col-sm-8"> <input type="text" name="other_country" v-model="data.other_country" class="form-control" placeholders="" > </div>
                           </div>
                        </div>
                     </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label">Description:</label>
                        <div class="col-sm-10">
                           <textarea name="description" v-model="data.description" class="form-control" placeholders="" > </textarea>
                        </div>
                      
                     </div>
                     <div class="form-group">
                              <h2 class="text-md text-highlight">More Info</h2>
                     </div>
                     <div class="form-group row">
                       <label for="status" class="col-sm-2 col-form-label">Status: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="status" placeholders="Last Name" name="status" v-model="data.status">
                        </div>
                        <label for="source" class="col-sm-2 col-form-label">Lead Source: </label>
                        <div class="col-sm-4">
                           <select class="form-control" id="source" placeholders="Last Name" name="source" v-model="data.source">
                                <option label="" value=""></option>
                                <option label="Cold Call" value="Cold Call">Cold Call</option>
                                <option label="Existing Customer" value="Existing Customer">Existing Customer</option>
                                <option label="Self Generated" value="Self Generated">Self Generated</option>
                                <option label="Employee" value="Employee">Employee</option>
                                <option label="Partner" value="Partner">Partner</option>
                                <option label="Public Relations" value="Public Relations">Public Relations</option>
                                <option label="Direct Mail" value="Direct Mail">Direct Mail</option>
                                <option label="Conference" value="Conference">Conference</option>
                                <option label="Trade Show" value="Trade Show">Trade Show</option>
                                <option label="Web Site" value="Web Site">Web Site</option>
                                <option label="Word of mouth" value="Word of mouth">Word of mouth</option>
                                <option label="Email" value="Email">Email</option>
                                <option label="Campaign" value="Campaign">Campaign</option>
                                <option label="Other" value="Other">Other</option>
                                </select>
                        </div>
                     </div>
                     <div class="form-group row">
                       <label for="descr_status" class="col-sm-2 col-form-label">Status Description: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="descr_status" placeholders="Last Name" name="descr_status" v-model="data.descr_status">
                        </div>
                        <label for="source_descr" class="col-sm-2 col-form-label">Lead Source Description: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="source_descr" placeholders="Last Name" name="source_descr" v-model="data.source_descr">
                        </div>
                     </div>

                     <div class="form-group row">
                       <label for="oportunity_amount" class="col-sm-2 col-form-label">Opportunity Amount: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="oportunity_amount" placeholders="Last Name" name="oportunity_amount" v-model="data.oportunity_amount">
                        </div>
                        <label for="reference_by" class="col-sm-2 col-form-label">Referred By: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="reference_by" placeholders="Last Name" name="reference_by" v-model="data.reference_by">
                        </div>
                     </div>
                     <div class="form-group row">
                       <label for="campaign" class="col-sm-2 col-form-label">Campaign: </label>
                        <div class="col-sm-4">
                           <input type="text" class="form-control" id="campaign" placeholders="Last Name" name="campaign" v-model="data.campaign">
                        </div>
                         
                     </div>
                     <div class="form-group row">
                        <label for="assign_id" class="col-sm-2 col-form-label">Assign To:</label>
                        <div class="col-sm-4">
                             <!--data-js-select2=""-->
                             <select class="form-control" v-model="data.assign_id">
                              <option value="">Select</option>
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
         <app-notify ref="notification"></app-notify>
      </div>

   </form-helper>
</template>
<script type="text/javascript">
	import FormHelper from '@/components/form-helper/FormHelper'
	import User from '@/services/User'
  import Customers from '@/services/Customers'
  import Lead from '@/services/Lead'
  import notification from '@/components/notification/notification'

export default {
    components: {
        'form-helper': FormHelper,
        'app-notify': notification,

    },
    name: 'NewLead',
    data() {
        return {
            data: {
                first_name: '',
                last_name: '',
                officephone: '',
                mobile: '',
                accountname: '',
                fax: '',
                primary_street: '',
                primary_city: '',
                primary_country: '',
                primary_postalcode: '',
                primary_state: '',
                other_country: '',
                other_postalcode: '',
                other_state: '',
                other_city: '',
                other_street: '',
                description: '',
                status: '',
                source: '',
                descr_status: '',
                source_descr: '',
                oportunity_amount: '',
                reference_by: '',
                campaign: '',
                 
                assign_id: '',
                
            },
            loading: false,
            fetching: false,
            error: '',
            id: '',
            assignee: [],
            leads: [],
            forrmat:'MM/DD/YYYY',
            heading:'New Lead',
        }
    },
    methods: {
        submit() {
            var self = this;
            this.loading = true;
            console.log(this.data);
            if (this.data.first_name != '' && this.data.last_name != '' && this.data.email!='') {
                
                    this.error = '';
                    Lead.add(this.data, this.id).then(response => {
                        this.loading = false;
                        let res = response.data;
                        this.showmsg(res.msg);
                    }, error => {
                        console.log(error)
                        this.error = error;
                    });
            
            } else {
                this.error = 'Subject,start and end date required';
            }
        },
        getTask(id) {
            this.heading= 'Edit Lead';
            this.fetching=true;
            Lead.get(id).then(response => {
                console.log(response);
                this.data = response.data;
                this.fetching=false;
                 

            }, error => {

            });
        },
        getAssignee() {
            Customers.getassignee().then(response => {
                this.assignee = response.data;
                console.log(this.assignee);
            }, error => {

            });
        },
        getleads() {
            Lead.all().then(response => {
                this.leads = response.data;
                console.log(this.assignee);
            }, error => {

            });
        },
        showmsg(msg) {
            console.log(this)
            console.log(this.refs)
            this.$refs.notification.success(msg);
            //this.data = [];
        }
    },
    mounted() {
        console.log(this.$route)
        if (this.$route.params.id) {
            this.id = this.$route.params.id;
            this.getTask(this.$route.params.id);

        }
        this.getAssignee();
        //this.getleads();
    }
}
</script>