import Api from '@/services/Api'


export default {
	
  get (params) {
  	console.log(params);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'get',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
   add (params,id) {
    console.log(params);
    const apiurl = process.env.apiurl;
    return Api().post(apiurl+'user/add/'+id, params)

  },
  list (params) {
    console.log(params);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'users/list',{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}}, params)

  },
  getUser (id) {
    console.log(id);
    const apiurl = process.env.apiurl;
    return Api().get(apiurl+'user/'+id,{headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')}})

  },
}