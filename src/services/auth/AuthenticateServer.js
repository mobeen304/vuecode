import Api from '@/services/auth/authApi'

export default {
  register (credentials) {
  	console.log(credentials);
  	
    return Api().post('reg', credentials)

  },
  login (credentials) {
  	console.log(credentials);
  	const apiurl = process.env.apiurl;
    return Api().post(apiurl+'login', credentials)

  }
}