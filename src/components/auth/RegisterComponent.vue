<template>
  <div class="register">
   <h1>Register</h1>
   <form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" v-model="email">
    
  </div>
  <br>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" v-model="password" id="exampleInputPassword1" placeholder="Password">
  </div>
  <br>

  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" @click="register" class="btn btn-primary">Submit</button>
</form>
  </div>
</template>

<script>
import Authentication from '@/services/auth/AuthenticateServer'
export default {
  name: 'RegisterComponent',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      email:'',
      password:''
    }
   
  },
   watch: {
   email (value) {
    console.log('value chnages')
   }
  },
  methods: {
   async register () {
     await Authentication.register({
      email: this.email,
      password: this.password
     })

    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
