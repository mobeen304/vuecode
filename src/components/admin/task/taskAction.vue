<template>
             <td>
             <router-link :to="'/admin/task/'+val.id" class="btn btn-sm btn-clean btn-icon btn-icon-md">   <i class="la la-edit"></i>
             </router-link> 
             <a title="Delete" class="btn btn-sm btn-clean btn-icon btn-icon-md" @click="removeTask(val.id)"><i class="la la-trash"></i></a>
            </td>	 
</template>
 


<script type="text/javascript">
    import User from '@/services/User'
    import Tasks from '@/services/Tasks.js'
    import notification from '@/components/notification/notification'
    import error from '@/services/error'
	
	export default {
		name: 'Task',
		props:['rows']
	}
</script>
