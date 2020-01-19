import Api from '@/services/Api'


export default {
	
  list (params) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'lead/list',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
  all (params) {
    console.log(params);
    const apiurl = process.env.apiurl;
    return Api().post(apiurl+'lead/all',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
  get (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'lead/'+id,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  add (params,id) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'lead/add/'+id, params)

  },
  remove (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'lead/remove/'+id)

  },
  getassignee () {
    console.log();
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'leads/getassignee',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  }
}