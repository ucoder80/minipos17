<template lang="">
    <div class="row d-flex justify-content-center">
        <div class="authentication-wrapper authentication-basic container-p-y col-md-4">
            <div class="authentication-inner">
            <!-- Register -->
            <div class="card">
                <div class="card-body">
                <!-- Logo -->
                <div class="app-brand justify-content-center">
                    <a href="index.html" class="app-brand-link gap-2">
                        <!-- <span class="app-brand-logo demo"> </span> -->
                        <span class="app-brand-text demo text-body fw-bold">Minipos 17</span>
                    </a>
                </div>
                <!-- /Logo -->
                <h4 class="mb-2">ສະບາຍດີ! 👋</h4>
                <p class="mb-4">ກະລຸນາເຂົ້າສູ່ລະບົບ</p>
                
                    <div class="mb-3">
                    <label for="email" class="form-label fs-6">ອີເມວ</label>
                    <input type="text" class="form-control" v-model="UserLogin.email" id="email" name="email-username" placeholder="example@gmail.com " autofocus="">
                    </div>
                    <div class="mb-3 form-password-toggle">
                    <div class="d-flex justify-content-between">
                        <label class="form-label fs-6" for="password">ລະຫັດຜ່ານ</label>
                        <!-- <a href="auth-forgot-password-basic.html">
                        <small>Forgot Password?</small>
                        </a> -->
                    </div>
                    <div class="input-group input-group-merge">
                        <input :type="showpass" id="password" class="form-control" v-model="UserLogin.password" @keyup.enter="Login" name="password" placeholder="············" aria-describedby="password">
                        <!-- ແບບຫຍໍ້ -->
                        <span class="input-group-text cursor-pointer" @click="showpass=='password'?showpass=='text':showpass='text'"> 
                        <!-- ແບບ function-->
                        <!-- <span class="input-group-text cursor-pointer" @click="SHPass"> -->
                            <i class="bx bx-show" v-if="showpass=='text'"></i> 
                            <i class="bx bx-hide" v-if="showpass=='password'"></i> 
                        </span>
                    </div>
                    </div>
                    <!-- <div class="mb-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember-me">
                            <label class="form-check-label" for="remember-me">
                            Remember Me
                            </label>
                        </div>
                    </div> -->
                    <div class="alert alert-warning" v-if="text_error_email || text_error_password || text_error_login"  role="alert">
                        {{text_error_email}} {{text_error_password}} {{text_error_login}}
                    </div>

                    <div class="mb-3">
                    <button class="btn btn-primary d-grid w-100" @click="Login" :disabled="CheckForm">ເຂົ້າສູ່ລະບົບ</button>
                    </div>
                
                <p class="text-center">
                    <span>ບໍ່ມີ ບັນຊີຜູ້ໃຊ້ ?</span>
                    <router-link to="/register" href="auth-register-basic.html">
                    <span> ຄີກເພືອລົງທະບຽນ</span>
        
                    </router-link>
                </p>
                </div>
            </div>
            <!-- /Register -->
            </div>
        </div>
    </div>
</template>
<script>

import axios from 'axios';
export default {
    data(){
        return {
            UserLogin:{
                email:'',
                password:''
            },
            text_error_email:'',
            text_error_password:'',
            text_error_login:'',
            showpass:'password'
        }
    },
    computed:{
        CheckForm(){

            const EmailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if(this.UserLogin.email){
                if(EmailRegex.test(this.UserLogin.email)){
                    this.text_error_email = ""
                } else {
                    this.text_error_email = " ອິເມວບໍ່ຖືກຕ້ອງ"
                }
            } else {
                this.text_error_email = ""
            }

            if(this.UserLogin.password){
                if(this.UserLogin.password.length <= 3){
                    this.text_error_password = "ລະຫັດຜ່ານຕ້ອງຫຼາຍກວ່າ 3 ຕົວອັກສອນ"
                } else {
                    this.text_error_password = ""
                }
            }else{
                this.text_error_password = ""
            }

            //ກວດຊອບຄວາມຜິດຜາດ
            if(!EmailRegex.test(this.UserLogin.email) || this.UserLogin.password.length <= 3 ){
                return true
            } else{
                return false                
            }
        }
    },
    methods:{
        SHPass(){
            if(this.showpass == 'password'){
                this.showpass = 'text'
            } else{
                this.showpass = 'password'
            }
        },
        Login(){
            if(this.UserLogin.email != "" && this.UserLogin.password !=""){
                axios.post("api/login",this.UserLogin).then((res)=>{
                    if(res.data.success){
                        this.UserLogin.email = ""
                        this.UserLogin.password = ""
                        this.text_error_login = ""

                        // save data in localstorage
                        localStorage.setItem("web_token",res.data.token)
                        localStorage.setItem("web_user",JSON.stringify(res.data.user_data))

                        //Go to the First Page
                        this.$router.push('/')

                    } else {
                        this.text_error_login = res.data.message
                    }
                }).catch((error)=>{
                    // console.log(error)

                })
            }
        }
    }
};
    
</script>
<style lang="">
</style>