import axios from 'axios'

export default () => {
	let token= localStorage.getItem('token');
    return axios.create({
	    baseUrl: 'apiurl',
	    headers: {
	    Authorization: `Bearer ${token}`
	  }
  });
  
}