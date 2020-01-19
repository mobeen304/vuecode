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
            <label for="subject" class="col-sm-2 col-form-label">Subject</label>
            <div class="col-sm-4">
               <input type="text" class="form-control" id="subject" name="role"  v-model="data.subject">
            </div>
            <label for="last_name" class="col-sm-2 col-form-label">Status:</label>
            <div class="col-sm-4">
               <select class="form-control" id="status"  name="status" v-model="data.status">
                  <option label="" value=""></option>
                  <option  value="progress">In Progress</option>
                  <option value="completed">Completed</option>
                  <option value="pending">Pending </option>
                  <option value="deferred">Deferred</option>
               </select>
            </div>
         </div>
         <div class="form-group row">
            <label for="start_date" class="col-sm-2 col-form-label">Start Date:</label>
            <div class="col-sm-4">
               <datepicker v-model="data.start_date" time-title-format="" input-class="form-control" valueType="format" format="MM/DD/YYYY" value-type="YYYY-MM-DD"></datepicker>
            </div>
            <label for="end_date" class="col-sm-2 col-form-label">End Date: </label>
            <div class="col-sm-4">
               <datepicker v-model="data.end_date" time-title-format="" input-class="form-control" valueType="format" format="MM/DD/YYYY" value-type="YYYY-MM-DD"></datepicker>
            </div>
         </div>
         <div class="form-group row">
            <label for="related_to" class="col-sm-2 col-form-label">Related To: </label>
            <div class="col-sm-4">
               <select class="form-control" v-model="data.related_to">
                  <option value="">Select</option>
                  <option v-for="val in tasks" v-bind:value="val.id">{{val.subject}}</option>
               </select>
            </div>
            <label for="contact_id" class="col-sm-2 col-form-label">Contact Name: </label>
            <div class="col-sm-4">
                <select class="form-control" v-model="data.contact_id">
                  <option value="">Select</option>
                  <option v-for="val in contact" v-bind:value="val.id">{{val.name}}</option>
               </select>
            </div>
         </div>
         <div class="form-group row">
            <label for="prioroty" class="col-sm-2 col-form-label">Priority:  </label>
            <div class="col-sm-4">
               <select name="priority" class="form-control" id="prioroty" v-model="data.prioroty">
                  <option label="High" value="high">High</option>
                  <option label="Medium" value="medium">Medium</option>
                  <option label="Low" value="low">Low</option>
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
  import Tasks from '@/services/Tasks.js'
  import notification from '@/components/notification/notification'

export default {
    components: {
        'form-helper': FormHelper,
        'app-notify': notification,

    },
    name: 'NewTask',
    data() {
        return {
            data: {
                subject: '',
                description: '',
                assign_id: '',
                prioroty: 'high',
                related_to: '',
                contact_id: '',
                status: '',
                start_date: '',
                end_date: '',
            },
            loading: false,
            fetching: false,
            error: '',
            id: '',
            assignee: [],
            tasks: [],
            contact: [],
            forrmat:'MM/DD/YYYY',
            heading:'New Task',
        }
    },
    methods: {
        submit() {
            var self = this;
            this.loading = true;
            console.log(this.data);
            if (this.data.subject != '' && this.data.start_date != '' && this.data.end_date!='') {
                
                    this.error = '';
                    Tasks.add(this.data, this.id).then(response => {
                        this.loading = false;
                        self.showmsg('Record Added');
                    }, error => {
                        console.log(error)
                        this.error = error;
                    });
            
            } else {
                this.error = 'Subject,start and end date required';
            }
        },
        getTask(id) {
            this.heading= 'Edit Task';
            this.fetching=true;
            Tasks.get(id).then(response => {
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
        getTasks() {
            Tasks.all().then(response => {
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
        this.getTasks();
        this.getContact();
    }
}

</script>