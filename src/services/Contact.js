import Api from '@/services/Api'


export default {
	
  list (params) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'contact/list',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
  all (params) {
    console.log(params);
    const apiurl = process.env.apiurl;
    return Api().post(apiurl+'contact/all',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
  get (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'contact/'+id,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  add (params,id) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'contact/add/'+id, params)

  },
  remove (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'contact/remove/'+id)

  },
  getassignee () {
    console.log();
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'contacts/getassignee',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  }
}