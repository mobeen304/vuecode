<template>
	
	<table class="kt-datatable__table" id="datatable">
    <thead>
        <tr>
            <th class="kt-datatable__cell kt-datatable__cell--sort" style="text-align: center; cursor: pointer;"><span> Subject </span><span>↕</span></th>
            <!-- <th class="" style="text-align: center; cursor: pointer;"><span> Subject </span><span>↓</span></th> -->
            <th class="" style="text-align: center; cursor: pointer;"><span> StartDate </span><span>↕</span></th>
            <th class="" style="text-align: center; cursor: pointer;"><span> EndDate </span><span>↕</span></th>
            <th class="" style="text-align: center; cursor: pointer;"><span> Status </span><span>↕</span></th>
            <th class="" style="text-align: center; cursor: pointer;"><span> Action </span><span>↕</span></th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="val in rows">
          <td>{{val.subject}}</td>
          <td>{{val.start_date}}</td>
          <td>{{val.end_date}}</td>
          <td>{{val.status}}</td>
             <td>
             <router-link :to="'/admin/task/'+val.id" class="btn btn-sm btn-clean btn-icon btn-icon-md">   <i class="la la-edit"></i>
             </router-link> 
             <a title="Delete" class="btn btn-sm btn-clean btn-icon btn-icon-md" @click="removeTask(val.id)"><i class="la la-trash"></i></a>
            </td>
        </tr>
    </tbody>
    <!---->
</table>
	 
</template>
 


<script type="text/javascript">
    import User from '@/services/User'
    import Tasks from '@/services/Tasks.js'
    import notification from '@/components/notification/notification'
    import error from '@/services/error'
	
	export default {
		name: 'TaskTable',
		props:['rows'],
		methods : {
		removeTask(id){
				   var self = this; 
           this.$dialog.confirm('Do you want to proceed?')
          .then(function () {
             Tasks.remove(id).then(response=>{
                   console.log(this)
                   self.success('Record Removed')
              },error=>{

                   self.$refs.notification.success('Something happen please try again');
              });
          })
          .catch(function () {
             
          });
			}
		}
	}
</script>
