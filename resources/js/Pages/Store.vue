<template lang="">
    <div class="card">
  <h5 class="card-header">ລາຍການ ສະຕ໋ອກສີນຄ້າ</h5>
  <div class="card-body">

    <div v-if="ShowForm">
        <div class="d-flex justify-content-end">
            <button type="button" class="btn btn-success me-2" :disabled="CheckForm" @click="SaveStore">ບັນທືກ</button>
            <button type="button" class="btn btn-danger me-2" @click="CancelStore()">ຍົກເລີກ</button>
        </div>
        <div class="row">
            <div class="col-md-4 text-center" style=" position:relative" >
                <button type="button" class="btn rounded-pill btn-icon btn-danger" @click="RemoveImg" v-if="FormStore.image" style="position: absolute;right: 20px; top: 10px;">
                    <i class='bx bx-x fs-4' ></i>
                </button>
                <img :src="ImagePreview" @click="$refs.img_store.click()" class=" cursor-pointer" style="width:80%">
                <input type="file" ref="img_store" style="display:none" @change="onSelect" >
            </div>
            
            <div class="col-md-8">
                <lable for="product-name" class="form-label fs-6">ຊື່ສີນຄ້າ:</lable>
                <input type="text" class="form-control mb-2" v-model="FormStore.name" id="product-name" placeholder="...">

                <lable for="product-qty" class="form-label fs-6">ຈຳນວນ:</lable>
                <cleave :options="options" class="form-control mb-2" v-model="FormStore.qty" id="product-qty" placeholder="..." />

                <div class="row">
                    <div class="col-md-6">
                        <lable for="price-sell" class="form-label fs-6">ລາຄາຊື້:</lable>
                        <div class="input-group">
                            <cleave :options="options" class="form-control" v-model="FormStore.price_buy" id="price-sell" placeholder="..."/>
                            <span class="input-group-text" >ກີບ</span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <lable for="price-buy" class="form-label fs-6">ລາຄາຂາຍ:</lable>
                        <div class="input-group">
                            <cleave :options="options" class="form-control" v-model="FormStore.price_sell" id="price-buy" placeholder="..."/>
                            <span class="input-group-text" >ກີບ</span>
                        </div>
                    </div>
                </div>
            </div>


         </div>
    </div>
    
    <div class="table-responsive text-nowrap" v-if="!ShowForm">
        <div class ="d-flex justify-content-between mb-2">
            <div class= "d-flex">
                <div class= "d-flex align-items-center me-2 cursor-pointer" @click="ChangeSort">
                    <i class='bx bx-sort-up fs-4' v-if="Sort=='asc'"></i>
                    <i class='bx bx-sort-down fs-4' v-if="Sort=='desc'"></i>
                </div>
                <select class="form-select" v-model="PerPage" @change="GetStore(1)">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="40">40</option>
                </select>
            </div>
            <div class= "d-flex">
                 
                <button type="button" class="btn btn-primary" @click="AddStore">ເພີ່ມຂໍ້ມູນ</button>
                
            </div>
        </div>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>ID</th>
            <th>ຮູບ</th>
            <th>ຊື່ສີນຄ້າ</th>
            <th>ຈຳນວນ</th>
            <th>ລາຄາຊື້</th>
            <!-- <th>ລາຄາຂາຍ</th> -->
            <th>ຈັດການ</th>
          </tr>
        </thead>
        <tbody>
        
          <tr v-for = "item in StoreData.data" :key="item.id">
            <td>{{item.id}}</td>
            <td> 
                <img :src="url + '/assets/img/' + item.image" v-if="item.image" class=" rounded border" style="width:60px">
                <img :src="url + '/assets/img/no-img.png'" v-else class=" rounded border" style="width:60px">
            </td>
            <td>{{item.name}}</td>
            <td>{{formatPrice(item.qty)}}</td>
            <td class="text-end">{{formatPrice(item.price_buy)}} ກີບ</td>
            <!-- <td>{{item.price_sell}}</td> -->
            <td>
              <div class="dropdown">
                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="javascript:void(0);" @click="EditStore(item.id)"><i class="bx bx-edit-alt me-1"></i> ແກ້ໄຂ</a>
                  <a class="dropdown-item" href="javascript:void(0);" @click="DelStore(item.id)"><i class="bx bx-trash me-1"></i> ລືບ</a>
                </div>
              </div>
            </td>

          </tr>
        </tbody>
      </table>

      <Pagination :pagination ="StoreData" :offset="4" @paginate="GetStore($event)" />
      <!-- <button @click="showAlert">Hello world</button> -->

    </div>
  </div>
</div>
</template>
<script>
import axios from 'axios';
import { useStore } from "../Store/auth"
export default {
    setup() {
        const store = useStore();
        return { store }
    },
    data() {
        return {
            url: window.location.origin,
            ImagePreview: window.location.origin + "/assets/img/upload-img.jpg",
            Sort: 'desc',
            PerPage: 5,
            ShowForm: false,
            StoreData: [],
            Search: '',
            FormStore: {
                name: '',
                image: '',
                qty: '',
                price_buy: '',
                price_sell: '',
            },
            // ShowForm:true
            FormType: true,
            EditID: '',
            options: {
                numeral: true,
                numeralPositiveOnly: true,
                noImmediatePrefix: true,
                rawValueTrimPrefix: true,
                numeralIntegerScale: 10,
                numeralDecimalScale: 2,
                numeralDecimalMark: '.',
                delimiter: ','
            }
        }
    },
    computed: {
        CheckForm() {
            if (this.FormStore.name == "" || this.FormStore.qty == "" || this.FormStore.price_buy == "" || this.FormStore.price_sell == "") {
                return true
            } else {
                return false
            }
        }
    },
    methods: {
        formatPrice(value){
            let val=(value/1).toFixed(0).replace(",",".");
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        },
        RemoveImg() {
            this.FormStore.image = null
            this.ImagePreview = this.url + "/assets/img/upload-img.jpg"
        },
        onSelect(event) {
            // console.log(event)
            this.FormStore.image = event.target.files[0]

            let reader = new FileReader()
            reader.readAsDataURL(this.FormStore.image)
            reader.addEventListener("load", function () {
                this.ImagePreview = reader.result
            }.bind(this, false))
        },
        showAlert() {
            // Use sweetalert2
            // this.$swal(
            //     {
            //         icon: "error",
            //         title: "Oops...",
            //         text: "Something went wrong!",
            //         footer: '<a href="#">Why do I have this issue?</a>'
            //     }
            // );

            this.$swal({
                position: 'top',
                toast: true,
                title: res.data.message,
                showConfirmButton: false,
                icon: "success",
                timer: 2500
            })
        },
        ChangeSort() {
            if (this.Sort == 'desc') {
                this.Sort = 'asc'
            } else {
                this.Sort = 'desc'
            }
            this.GetStore(1)
        },
        AddStore() {
            this.ShowForm = true
            this.FormType = true
            this.ImagePreview = window.location.origin + "/assets/img/upload-img.jpg"
            this.FormStore.name = " "
            this.FormStore.image = " "
            this.FormStore.qty = " "
            this.FormStore.price_buy = " "
            this.FormStore.price_sell = " "
        },
        CancelStore() {
            this.ShowForm = false
        },
        EditStore(id) {
            this.EditID = id
            this.FormType = false
            console.log(id)

            axios.get(`api/store/edit/${id}`, { headers: { Authorization: "Bearer " + this.store.get_token } }).then((res) => {

                this.FormStore = res.data
                this.ShowForm = true
                if (res.data.image) {
                    this.ImagePreview = this.url + "/assets/img/" + res.data.image
                } else {
                    this.ImagePreview = this.url + "/assets/img/upload-img.jpg"
                }

            }).catch((error) => {
                if (error.response.status == 401) {
                    this.store.remove_token()
                    this.store.remove_user()

                    localStorage.removeItem("web_token")
                    localStorage.removeItem("web_user")

                    this.$router.push("/login")
                }
            })
        },
        DelStore(id) {
            this.$swal({
                title: "ທ່ານແນ່ໃຈບໍ່?",
                text: "ທີ່ຈະລຶບຂໍ້ມູນນີ້!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#696cff",
                cancelButtonColor: "#d33",
                confirmButtonText: "ຍຶນຍັນ",
                cancelButtonText: "ຍົກເລີກ"
            }).then((result) => {
                if (result.isConfirmed) {
                    axios.delete(`api/store/delete/${id}`, { headers: { Authorization: "Bearer " + this.store.get_token } }).then((res) => {
                        if (res.data.success) {
                            this.GetStore()
                            this.$swal({
                                title: "ການລຶບຂໍ້ມູນ!",
                                text: res.data.message,
                                icon: "success",
                                showConfirmButton: false,
                                timer: 500
                            });
                        }
                    }).catch((error) => {
                        if (error.response.status == 401) {
                            this.store.remove_token()
                            this.store.remove_user()

                            localStorage.removeItem("web_token")
                            localStorage.removeItem("web_user")

                            this.$router.push("/login")
                        }
                    })

                }
            })

        },
        SaveStore() {
            if (this.FormType) {
                //Add New Data
                axios.post("api/store/add", this.FormStore, { headers: { "Content-Type": "multipart/form-data", Authorization: "Bearer " + this.store.get_token } }).then((res) => {
                    if (res.data.success) {
                        this.ShowForm = false
                        this.GetStore()

                        this.$swal({
                            position: 'top',
                            toast: true,
                            title: res.data.message,
                            showConfirmButton: false,
                            icon: "success",
                            timer: 2500
                        })
                    } else {
                        this.$swal({
                            // position: 'top',
                            // toast: true,
                            title: res.data.message,
                            showConfirmButton: false,
                            icon: "error",
                            timer: 2500
                        })
                    }
                }).catch((error) => {
                    // console.log(error)
                    // console.log(error.response.status)
                    if (error.response.status == 401) {
                        this.store.remove_token()
                        this.store.remove_user()

                        localStorage.removeItem("web_token")
                        localStorage.removeItem("web_user")

                        this.$router.push("/login")
                    }
                })
            } else {
                //Update Data
                axios.post(`api/store/update/${this.EditID}`, this.FormStore, { headers: { "Content-Type": "multipart/form-data", Authorization: "Bearer " + this.store.get_token } }).then((res) => {
                    if (res.data.success) {
                        this.ShowForm = false
                        this.GetStore()
                        this.$swal({
                            position: 'top',
                            toast: true,
                            title: res.data.message,
                            showConfirmButton: false,
                            icon: "success",
                            timer: 2500
                        })
                    } else {
                        this.$swal({

                            title: res.data.message,
                            showConfirmButton: false,
                            icon: "error",
                            timer: 2500
                        })
                    }
                }).catch((error) => {
                    if (error.response.status == 401) {
                        this.store.remove_token()
                        this.store.remove_user()

                        localStorage.removeItem("web_token")
                        localStorage.removeItem("web_user")

                        this.$router.push("/login")
                    }
                })
            }
        },
        GetStore(page) {
            axios.get(`api/store?page=${page}&sort=${this.Sort}&perpage=${this.PerPage}&search=${this.Search}`, { headers: { Authorization: "Bearer " + this.store.get_token } }).then((res) => {
                this.StoreData = res.data
            }).catch((error) => {
                console.log(error.response.status)
                if (error.response.status == 401) {
                    this.store.remove_token()
                    this.store.remove_user()

                    localStorage.removeItem("web_token")
                    localStorage.removeItem("web_user")

                    this.$router.push("/login")
                }
            })
        }
    },
    created() {
        this.GetStore()
    },
    watch: {
        Search() {
            if (this.Search == "") {
                this.GetStore(1)
            }
        }
    }
}
</script>
<style lang="">

</style>