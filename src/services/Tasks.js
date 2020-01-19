import Api from '@/services/Api'


export default {
	
  list (params) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'task/list', params,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  all (params) {
    console.log(params);
    const apiurl = process.env.apiurl;
    return Api().post(apiurl+'task/all', params,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  get (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'task/'+id,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  add (params,id) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'task/add/'+id, params)

  },
  remove (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'task/remove/'+id)

  },
  getassignee () {
    console.log();
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'tasks/getassignee',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  }
}