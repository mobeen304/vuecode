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
            <label for="subject" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-4">
               <input type="text" class="form-control" id="subject" name="role"  v-model="data.name">
            </div>
            <label for="subject" class="col-sm-2 col-form-label">Opportunity Amount:*</label>
            <div class="col-sm-4">
               <input type="text" class="form-control" id="subject" name="role"  v-model="data.amount">
            </div>
         </div>
         <div class="form-group row">
            <label for="last_name" class="col-sm-2 col-form-label">Type:</label>
            <div class="col-sm-4">
                  <select name="opportunity_type" id="opportunity_type" class="form-control"  v-model="data.op_type"  title="">
                              <option label="" value=""></option>
                              <option label="Existing Business" value="Existing Business">Existing Business</option>
                              <option label="New Business" value="New Business">New Business</option>
                  </select>
            </div>
            <label for="last_name" class="col-sm-2 col-form-label">Sales Stage:*</label>
            <div class="col-sm-4">
               <select name="sales_stage" id="sales_stage" class="form-control" v-model="data.sale_stage" title="">
                <option label="Prospecting" value="Prospecting">Prospecting</option>
                <option label="Qualification" value="Qualification">Qualification</option>
                <option label="Needs Analysis" value="Needs Analysis">Needs Analysis</option>
                <option label="Value Proposition" value="Value Proposition">Value Proposition</option>
                <option label="Identifying Decision Makers" value="Id. Decision Makers">Identifying Decision Makers</option>
                <option label="Perception Analysis" value="Perception Analysis">Perception Analysis</option>
                <option label="Proposal/Price Quote" value="Proposal/Price Quote">Proposal/Price Quote</option>
                <option label="Negotiation/Review" value="Negotiation/Review">Negotiation/Review</option>
                <option label="Closed Won" value="Closed Won">Closed Won</option>
                <option label="Closed Lost" value="Closed Lost">Closed Lost</option>
                </select>
            </div>
         </div>
         <div class="form-group row">
            <label for="related_to" class="col-sm-2 col-form-label">Lead Source </label>
            <div class="col-sm-4">
               <select class="form-control" v-model="data.lead_source">
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
            <label for="contact_id" class="col-sm-2 col-form-label">Probability (%):</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="subject" name="role"  v-model="data.probability">
            </div>
         </div>
         <div class="form-group row">
              <label for="related_to" class="col-sm-2 col-form-label">Compaign </label>
              <div class="col-sm-4">
                 <select class="form-control" v-model="data.campaign_id">
                    <option value="">Select</option>
                    <option v-for="val in tasks" v-bind:value="val.id">{{val.subject}}</option>
                 </select>
              </div>
         </div>
         <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label">Description:</label>
            <div class="col-sm-10">
               <textarea name="description" v-model="data.description" class="form-control" placeholderk="" ></textarea> 
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
  import Opportunity from '@/services/Opportunity'
  import notification from '@/components/notification/notification'

export default {
    components: {
        'form-helper': FormHelper,
        'app-notify': notification,

    },
    name: 'NewOpportunity',
    data() {
        return {
            data: {
                name: '',
                description: '',
                assign_id: '',
                amount: '',
                sale_stage: '',
                op_type: '',
                probability: '',
                lead_source: '',
                campaign_id: '',
            },
            loading: false,
            fetching: false,
            error: '',
            id: '',
            assignee: [],
            tasks: [],
            contact: [],
            forrmat:'MM/DD/YYYY',
            heading:'New Opportunity',
        }
    },
    methods: {
        submit() {
            var self = this;
            this.loading = true;
            console.log(this.data);
            if (this.data.name != '' && this.data.amount != '' && this.data.sale_stage!='') {
                
                    this.error = '';
                    Opportunity.add(this.data, this.id).then(response => {
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
            this.heading= 'Edit Opportunity';
            this.fetching=true;
            Opportunity.get(id).then(response => {
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
        getContact() {
            Customers.all().then(response => {
                this.contact = response.data;
                console.log(this.assignee);
            }, error => {

            });
        },
        getOpp() {
            Opportunity.all().then(response => {
                this.tasks = response.data;
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
        //this.getOpp();
        //this.getContact();
    }
}
</script>