import Api from '@/services/Api'


export default {
	
  list (params) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'customer/get',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
  get (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'customer/'+id,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  all (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'customers/all',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
  add (params,id) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'customer/add/'+id, params)

  },
  remove (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'customer/remove/'+id)

  },
  getassignee () {
    console.log();
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'customers/getassignee',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  }
}