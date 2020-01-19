<template>
 <div class="kt-grid kt-grid--ver kt-grid--root kt-page">
   <div class="kt-grid kt-grid--hor kt-grid--root  kt-login kt-login--v6 kt-login--signin" id="kt_login">
      <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--desktop kt-grid--ver-desktop kt-grid--hor-tablet-and-mobile">
         <div class="kt-grid__item  kt-grid__item--order-tablet-and-mobile-2  kt-grid kt-grid--hor kt-login__aside">
            <div class="kt-login__wrapper">
               <div class="kt-login__container">
                  <div class="kt-login__body">
                     <div class="kt-login__logo">
                        <a href="#">
                        <img src="../../assets/img/logo-9.png">
                        </a>
                     </div>
                     <div class="kt-login__signin">
                        <div class="kt-login__head">
                           <h3 class="kt-login__title">Sign In To Admin</h3>
                        </div>
                        <div class="kt-login__form">
                         
                           <form class="kt-form" action="">
                              <div class="form-group">
                                 <input class="form-control" type="text" v-model="username" placeholder="Email" name="email" autocomplete="off">
                              </div>
                              <div class="form-group">
                                 <input class="form-control form-control-last" type="password"  v-model="password" placeholder="Password" name="password">
                              </div>
                              <div class="kt-login__extra">
                                 <!-- <label class="kt-checkbox">
                                 <input type="checkbox" name="remember"> Remember me
                                 <span></span>
                                 </label> -->
                                 <a href="javascript:;" id="kt_login_forgot">Forget Password ?</a>
                              </div>
                              <div class="kt-login__actions">
                                 <button id="kt_login_signin_submit" @click.prevent="login" class="btn btn-brand btn-pill btn-elevate">Sign In</button>
                              </div>
                           </form>
                        </div>
                     </div>
                     <div class="kt-login__signup">
                        <div class="kt-login__head">
                           <h3 class="kt-login__title">Sign Up</h3>
                           <div class="kt-login__desc">Enter your details to create your account:</div>
                        </div>
                        <div class="kt-login__form">
                           <form class="kt-form" action="">
                              <div class="form-group">
                                 <input class="form-control" type="text" placeholder="Fullname" name="fullname">
                              </div>
                              <div class="form-group">
                                 <input class="form-control" type="text" placeholder="Email" name="email" autocomplete="off">
                              </div>
                              <div class="form-group">
                                 <input class="form-control" type="password" placeholder="Password" name="password">
                              </div>
                              <div class="form-group">
                                 <input class="form-control form-control-last" type="password" placeholder="Confirm Password" name="rpassword">
                              </div>
                              <div class="kt-login__extra">
                                 <label class="kt-checkbox">
                                 <input type="checkbox" name="agree"> I Agree the <a href="#">terms and conditions</a>.
                                 <span></span>
                                 </label>
                              </div>
                              <div class="kt-login__actions">
                                 <button id="kt_login_signup_submit" class="btn btn-brand btn-pill btn-elevate">Sign Up</button>
                                 <button id="kt_login_signup_cancel" class="btn btn-outline-brand btn-pill">Cancel</button>
                              </div>
                           </form>
                        </div>
                     </div>
                     <div class="kt-login__forgot">
                        <div class="kt-login__head">
                           <h3 class="kt-login__title">Forgotten Password ?</h3>
                           <div class="kt-login__desc">Enter your email to reset your password:</div>
                        </div>
                        <div class="kt-login__form">
                           <form class="kt-form" action="">
                              <div class="form-group">
                                 <input class="form-control" type="text" placeholder="Email" name="email" id="kt_email" autocomplete="off">
                              </div>
                              <div class="kt-login__actions">
                                 <button id="kt_login_forgot_submit" class="btn btn-brand btn-pill btn-elevate">Request</button>
                                 <button id="kt_login_forgot_cancel" class="btn btn-outline-brand btn-pill">Cancel</button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="kt-login__account">
                  <span class="kt-login__account-msg">
                  Don't have an account yet ?
                  </span>&nbsp;&nbsp;
                  <a href="javascript:;" id="kt_login_signup" class="kt-login__account-link">Sign Up!</a>
               </div>
            </div>
         </div>
         <div class="kt-grid__item kt-grid__item--fluid kt-grid__item--center kt-grid kt-grid--ver kt-login__content" v-bind:style="{ 'background-image': 'url(https://keenthemes.com/metronic/themes/metronic/theme/default/demo9/dist/assets/media/bg/bg-4.jpg)' }">
            <div class="kt-login__section">
               <div class="kt-login__block">
                  <h3 class="kt-login__title">Join Our Community</h3>
                  <div class="kt-login__desc">
                     Lorem ipsum dolor sit amet, coectetuer adipiscing
                     <br>elit sed diam nonummy et nibh euismod
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</template>
 <style >
 @import '../../assets/css/login.css';

 
 </style>
<script type="text/javascript">
    import Authentication from '@/services/auth/AuthenticateServer'
    import router from '../../router'
	export default {
		name:'Login',
		components:{

		},
		data () {
           return { username:'',
                    password:'',
                    errors:[],
                }
		},
		methods : {
			login () {               
              if(this.username!='' && this.password!=''){
                 Authentication.login({
                 	email:this.username,
                 	password:this.password
                 }).then(response=>{
                 	response = response.data;
                 	console.log(response);
                 	localStorage.setItem('token',response.token);
                 	router.push( "admin" );
                 },
                 error=>{
                 	console.log(response);
                 });
              }else{
              	this.errors.push('Please fill all thew fields');
              }
			}
		}

	}
</script>