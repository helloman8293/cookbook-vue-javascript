<template>
  <div>
    <!-- 登录 -->
    <div class="login" v-show="showLogin">
      <div class="topBar">
        <mt-header title="登录美食杰" fixed class="myHeader">
          <!-- <router-link to="home" slot="left"> -->
            <mt-button icon="back" class="back">返回</mt-button>
          <!-- </router-link> -->
          <!-- <router-link to="register" slot="right"> -->
            <mt-button class="reg" slot="right" @click="ToRegister">注册</mt-button>
          <!-- </router-link> -->
        </mt-header>
      </div>
      <div class="container">
        <div class="myInput">
          <input type="text" placeholder="用户名/手机号/邮箱"  v-model="uname" class="login-input">
          <input type="password" placeholder="密码"  v-model="upwd" class="login-input">
          <!-- <mt-field type="text" placeholder="用户名/手机号/邮箱" v-model="uname" class="login-input"></mt-field> -->
        <!-- <mt-field type="password" placeholder="密码" v-model="upwd" class="login-input"></mt-field> -->
        </div>
        <mt-button class="loginBtn" @click="login">登录</mt-button>
        <div class="forget">忘记密码？</div>
      </div>
    </div>

    <!-- 注册 -->
    <div class="register" v-show="showRegister">
      <div class="topBar">
        <mt-header title="注册美食杰" fixed class="myHeader">
          <!-- <router-link to="/" slot="left"> -->
            <mt-button icon="back" class="back">返回</mt-button>
          <!-- </router-link> -->
          <!-- <router-link to="login" > -->
            <mt-button class="login" slot="right" @click="ToLogin">登录</mt-button>
          <!-- </router-link> -->
        </mt-header>
      </div>
      <div class="container">
        <div class="login-uname" v-if="!isUname">
          <div class="changeBox">
            <div class="username active">用户名注册</div>
            <div class="email" @click="ToEmailReg">邮箱注册</div>
          </div>
          <div class="myInput">
            <input type="text" placeholder="用户名"  v-model="username" class="login-input" @blur="unameInput">
            <input type="password" placeholder="密码"  v-model="upwd" class="login-input" @blur="upwdInput">
          </div>
          <mt-button type="danger" class="registerBtn" @click="unameRegister" :disabled="!this.username && !this.upwd">注册</mt-button>
        </div>
        <div class="login-email" v-else>
          <div class="changeBox">
            <div class="username" @click="ToUnameReg">用户名注册</div>
            <div class="email active">邮箱注册</div>
          </div>
          <div class="myInput">
            <!-- <div style="height:16px"></div> -->
            <input type="text" placeholder="邮箱"  v-model="email" class="login-input" @blur="emailInput">
            <input type="password" placeholder="密码"  v-model="upwd" class="login-input" @blur="upwdInput">
          </div>
          <mt-button class="registerBtn" @click="emailRegister" :disabled="!this.email && !this.upwd">注册</mt-button>
        </div>
      </div>
    </div>

    <!-- 第三方登录 -->
    <div class="other-login" v-show="showOtherLogin">
      <div class="qq-login">
        <img src="../assets/img/login/QQ_login.png" alt="">
        <span>QQ登录</span>
      </div>
      <div class="weibo-login">
        <img src="../assets/img/login/weibo_login.png" alt="">
        <span>微博登录</span>
      </div>
    </div> 

    <!-- 用户页 -->
    <div class="user-page" v-show="showUser">
      <div class="my-top">
        <div class="my-container">
          <div class="user-info">
            <div class="user-avatar" @click="ToPersonal">
              <img :src="`http://127.0.0.1:3000/`+userData.avatar" alt="">
            </div>
            <div class="user-text">
              <strong class="user-name">{{userData.nackname}}</strong>
              <span class="user-signature">{{userData.say}}</span>
            </div>
          </div>
          <div class="log">
            <span>美食杰DNA 0条 &gt;</span>
          </div>
        </div>
      </div>
      <div class="my-dynamic">
        <div class="attention">
          <strong>0</strong>
          关注
        </div>
        <div class="fans">
          <strong>0</strong>
          粉丝
        </div>
        <div class="menu">
          <strong>0</strong>
          菜谱
        </div>
      </div>
      <div class="honour">
        <h3 class="honour-title">荣誉勋章</h3>
        <ul class="honour-list">
          <li class="honour-item" v-for="(item,i) of honourList" :key="i">
            <img :src="item.img" alt="">
          </li>
        </ul>
      </div>
      <div class="profile-item">
        <mt-cell title="积分商城" is-link>
          <img slot="icon" src="../assets/img/user/profile_01.png" width="27" height="27" >
        </mt-cell>
      </div>
      <div class="profile-item">
        <mt-cell title="消息通知" is-link>
          <img slot="icon" src="../assets/img/user/profile_02.png" width="27" height="27" >
        </mt-cell>
      </div>
      <div class="profile-item">
        <mt-cell title="我的发布" is-link class="my-item">
          <img slot="icon" src="../assets/img/user/profile_03.png" width="27" height="27" >
        </mt-cell>
        <mt-cell title="我的收藏" is-link class="my-item">
          <img slot="icon" src="../assets/img/user/profile_04.png" width="27" height="27" >
        </mt-cell>
        <mt-cell title="我的订单" is-link class="my-item">
          <img slot="icon" src="../assets/img/user/profile_05.png" width="27" height="27" >
        </mt-cell>
        <mt-cell title="关于我们" is-link class="my-item">
          <img slot="icon" src="../assets/img/user/profile_06.png" width="27" height="27" >
        </mt-cell>
      </div>
      <mt-button class="logoutBtn" @click="logout">退出登录</mt-button>
    </div>

    <!-- 用户资料页 -->
    <div class="userinfo-page" v-show="showUserPersonal">
      <my-header :myTitle="myTitle" backText="返回" :goback="goback"></my-header>
      <div class="container">
        <div class="userinfo_t">账号信息</div>
        <div class="userinfo_c">
          <div class="userinfo_item">
            <div class="item1">
              <span>邮箱：</span>
              <input type="text" v-model="userData.email">
            </div>
          </div>
          <div class="userinfo_item">
            <div class="item1">
              <span>昵称：</span>
              <input type="text" v-model="userData.nackname">
            </div>
          </div>
          <div class="userinfo_item">
              <div class="item2">
                <span>头像：</span>
                <div class="add_img">
                  <div class="show_img">
                    <img :src="`http://127.0.0.1:3000/`+userData.avatar">
                  </div>
                  <input type="file" name="photos" size="1" value="浏览" @change="upDataPic">
                </div>
              </div>
          </div>
          <div class="userinfo_item">
            <div class="item1">
              <span>签名：</span>
              <input type="text" v-model="userData.say">
            </div>
          </div>
        </div>
        <div class="userinfo_t">个人信息</div>
        <div class="userinfo_c">
          <div class="userinfo_item">
            <div class="item1">
              <span>性别：</span>
              <select v-model="gender" id="gender">
                <option value="0">女</option>
                <option value="1">男</option>
              </select>
            </div>
          </div>
          <div class="userinfo_item">
            <div class="item1">
              <span>生日：</span>
              <select v-model="year">
                <option value="0">请选择</option>
                <option value="2019">2019</option>
                <option value="2018">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>
                <option value="2015">2015</option>
                <option value="2014">2014</option>
                <option value="2013">2013</option>
                <option value="2012">2012</option>
                <option value="2011">2011</option>
                <option value="2010">2010</option>
                <option value="2009">2009</option>
                <option value="2008">2008</option>
                <option value="2007">2007</option>
                <option value="2006">2006</option>
                <option value="2005">2005</option>
                <option value="2004">2004</option>
                <option value="2003">2003</option>
                <option value="2002">2002</option>
                <option value="2001">2001</option>
                <option value="2000">2000</option>
                <option value="1999">1999</option>
                <option value="1998">1998</option>
                <option value="1997">1997</option>
                <option value="1996">1996</option>
                <option value="1995">1995</option>
                <option value="1994">1994</option>
                <option value="1993">1993</option>
                <option value="1992">1992</option>
                <option value="1991">1991</option>
                <option value="1990">1990</option>
                <option value="1989">1989</option>
                <option value="1988">1988</option>
                <option value="1987">1987</option>
                <option value="1986">1986</option>
                <option value="1985">1985</option>
                <option value="1984">1984</option>
                <option value="1983">1983</option>
                <option value="1982">1982</option>
                <option value="1981">1981</option>
                <option value="1980">1980</option>
                <option value="1979">1979</option>
                <option value="1978">1978</option>
                <option value="1977">1977</option>
                <option value="1976">1976</option>
                <option value="1975">1975</option>
                <option value="1974">1974</option>
                <option value="1973">1973</option>
                <option value="1972">1972</option>
                <option value="1971">1971</option>
                <option value="1970">1970</option>
                <option value="1969">1969</option>
                <option value="1968">1968</option>
                <option value="1967">1967</option>
                <option value="1966">1966</option>
                <option value="1965">1965</option>
                <option value="1964">1964</option>
                <option value="1963">1963</option>
                <option value="1962">1962</option>
                <option value="1961">1961</option>
                <option value="1960">1960</option>
                <option value="1959">1959</option>
                <option value="1958">1958</option>
                <option value="1957">1957</option>
                <option value="1956">1956</option>
                <option value="1955">1955</option>
                <option value="1954">1954</option>
                <option value="1953">1953</option>
                <option value="1952">1952</option>
                <option value="1951">1951</option>
                <option value="1950">1950</option>
                <option value="1949">1949</option>
                <option value="1948">1948</option>
                <option value="1947">1947</option>
                <option value="1946">1946</option>
                <option value="1945">1945</option>
                <option value="1944">1944</option>
                <option value="1943">1943</option>
                <option value="1942">1942</option>
                <option value="1941">1941</option>
                <option value="1940">1940</option>
                <option value="1939">1939</option>
                <option value="1938">1938</option>
                <option value="1937">1937</option>
                <option value="1936">1936</option>
                <option value="1935">1935</option>
                <option value="1934">1934</option>
                <option value="1933">1933</option>
                <option value="1932">1932</option>
                <option value="1931">1931</option>
                <option value="1930">1930</option>
                <option value="1929">1929</option>
                <option value="1928">1928</option>
                <option value="1927">1927</option>
                <option value="1926">1926</option>
                <option value="1925">1925</option>
                <option value="1924">1924</option>
                <option value="1923">1923</option>
                <option value="1922">1922</option>
                <option value="1921">1921</option>
                <option value="1920">1920</option>
              </select>
              年
              <select v-model="month">
                <option value="0">请选择</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
              月
              <select v-model="date">
                <option value="0">请选择</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
              </select>
              日</div>
          </div>
          <div class="userinfo_item">
            <div class="item1">
              <span>家乡：</span>
              <select v-model="home_province">
                <option :value="i" class="selcted" v-for="(item,i) of datas.provinceList" :key="i">{{item.name}}</option>
              </select>
              <select name="home_city" v-model="home_city" class="ded2">
                <option :value="i" v-for="(item,i) of datas.provinceList.cityList" :key="i">{{item.name}}</option>
                <!-- <option value="">请选择城市</option> -->
              </select>
            </div>
          </div>
          <div class="userinfo_item">
            <div class="item1">
              <span>所在地：</span>
              <select class="ded2" name="local_province" v-model="local_province">
                <option value="0" class="selcted">请选择省份</option>
                <option value="10">北京</option>
                <option value="11">上海</option>
                <option value="12">天津</option>
                <option value="13">重庆</option>
                <option value="14">河北</option>
                <option value="15">山西</option>
                <option value="16">内蒙古 </option>
                <option value="17">辽宁</option>
                <option value="18">吉林</option>
                <option value="19">黑龙江</option>
                <option value="20">江苏</option>
                <option value="21">浙江</option>
                <option value="22">安徽</option>
                <option value="23">福建</option>
                <option value="24">江西</option>
                <option value="25">山东</option>
                <option value="26">河南</option>
                <option value="27">湖北</option>
                <option value="28">湖南</option>
                <option value="29">广东</option>
                <option value="30">广西</option>
                <option value="31">海南</option>
                <option value="32">四川</option>
                <option value="33">贵州</option>
                <option value="34">云南</option>
                <option value="35">西藏</option>
                <option value="36">陕西</option>
                <option value="37">甘肃</option>
                <option value="38">青海</option>
                <option value="39">宁夏</option>
                <option value="40">新疆</option>
                <option value="41">香港</option>
                <option value="42">澳门</option>
                <option value="43">台湾</option>
                <option value="45">国外</option>
              </select>
              <select class="ded2" name="local_city" v-model="local_city">
                <option value="0" class="selcted">城市</option>
              </select>
            </div>
          </div>
          <div class="userinfo_item">
            <div class="item1">
              <span>职业：</span>
              <select name="profession"  v-model="profession">
                <option selected="selected" value="学生">学生</option>
                <option value="政府职员">政府职员</option>
                <option value="教师">教师</option>
                <option value="医生">医生</option>
                <option value="营养师">营养师</option>
                <option value="摄影师">摄影师</option>
                <option value="职业厨师">职业厨师</option>
                <option value="律师">律师</option>
                <option value="会计">会计</option>
                <option value="翻译">翻译</option>
                <option value="编辑">编辑</option>
                <option value="音乐人">音乐人</option>
                <option value="演艺人">演艺人</option>
                <option value="广告人">广告人</option>
                <option value="公司文员">公司文员</option>
                <option value="IT/互联网">IT/互联网</option>
                <option value="个体商人">个体商人</option>
                <option value="全职主妇">全职主妇</option>
                <option value="其他">其他</option>
              </select>
            </div>
          </div>
        </div>
        <mt-button class="submitBtn" @click="submit">提交修改</mt-button>
      </div>
    </div>
  </div>
</template>
<script>
import myHeader from './my-header'
import cityJson from './json/city.json';
export default {
  components:{
    myHeader
  },
  data(){
    return{
      showTabbar:false,
      showLogin:true,
      showRegister:false,
      showOtherLogin:true,
      showUser:false,
      showUserPersonal:false,
      uname: '',
      upwd: '',
      disabled:false,
      username: '',
      email:'',
      isUname:false,
      honourList:[
        {img: require('../assets/img/user/honour_01.png')},
        {img: require('../assets/img/user/honour_02.png')},
        {img: require('../assets/img/user/honour_03.png')},
        {img: require('../assets/img/user/honour_04.png')},
        {img: require('../assets/img/user/honour_05.png')},
        {img: require('../assets/img/user/honour_06.png')},
        {img: require('../assets/img/user/honour_07.png')}
      ],
      userData:[],
      myTitle: '个人信息',
      say: '',
      src:require('../assets/img/user/default.jpg'),
      gender:0,
      birthday: '',
      year: '0',
      month: '0',
      date: '0',
      datas:cityJson,
      i:0,
      home_province: '0',
      home_city:'',
      local_province:'0',
      local_city:'0',
      profession:'学生'
    }
  },
  methods:{
    submit(){
      var email =this.userData.email;
      var uname = this.userData.nackname;
      var img = this.src;
      var s = this.userData.say;
      var gender = this.gender;
      var year = this.year;
      var month = this.month;
      var date = this.date;
      var birthday = year+'-'+month+'-'+date;
      var hp = this.home_province;
      var hc = this.home_city;
      var h = hp+','+hc;
      var lp = this.local_province;
      var lc = this.local_city;
      var l = lp+','+lc;
      var pr = this.profession;
      var url="user/update";
      var params = new URLSearchParams();
      params.append("email",email);
      params.append("nackname",uname);
      // params.append("avatar",img);
      params.append("say",s);
      params.append("gender",gender);
      params.append("birthday",birthday);
      // params.append("hometown",h);
      params.append("addr",l);
      params.append("profession",pr);
      this.axios.post(url,params).then(result=>{
        if(result.data.code==200){
          this.$messagebox({
            title:"提示",
            message:result.data.msg
          })
          this.goback();
        }else{
          this.$messagebox({
            title:"提示",
            message:result.data.msg
          });
        }
      });
    },
    upDataPic(e){
      // let _this = this
      // var files = e.target.files[0]
      // console.log(files);
      // if (!e || !window.FileReader) return  // 看支持不支持FileReader
      // let reader = new FileReader()
      // reader.readAsDataURL(files) // 这里是最关键的一步，转换就在这里
      // reader.onloadend = function () {
      //   _this.src = this.result
      //   return _this.src;
      // }
      let file = e.target.files[0]; 
      var picData=new FormData();
      picData.append('file',file,file.name);
      console.log(picData);
      return picData;
    },
    goback(){
      this.showLogin=false;
      this.showRegister=false;
      this.showOtherLogin=false;
      this.showUser=true;
      this.showUserPersonal=false;
    },
    ToPersonal(){
      // this.$router.push('/personal');
      this.showLogin=false;
      this.showRegister=false;
      this.showOtherLogin=false;
      this.showUser=false;
      this.showUserPersonal=true;
      this.axios.get('user/sessiondata').then(result=>{
      this.userData=result.data.data[0];
      // console.log(this.userData);
      this.birthday=this.userData.birthday;
      // console.log(this.birthday);
      var date = new Date(this.birthday);
      // console.log(date);
      if(this.birthday==null){
        this.year = 0;
        this.month = 0;
        this.date = 0;
      }else{
        this.year = date.getFullYear();
        this.month = date.getMonth()+1;
        this.date = date.getDate();
      }
      // console.log(this.year,this.month,this.date);
      var provinceList = this.datas.provinceList
      // console.log(provinceList);
      // console.log(this.datas.cityList);
    })
    },
    ToRegister(){
      this.showRegister = true;
      this.showLogin = false;
      this.username="";
      this.upwd="";
    },
    ToLogin(){
      this.showRegister = false;
      this.showLogin = true;
      this.uname="";
      this.upwd="";
    },
    login(){
      var n=this.uname;
      var p=this.upwd;
      if(!n||!p){
        this.$toast("请输入用户名或者密码");
        return;
      }else{
        var url="user/login";
        var params = new URLSearchParams();
        params.append("uname",n);
        params.append("upwd",p);
        this.axios.post(url,params).then(result=>{
          // console.log(result);
          if(result.data.code==404){
              this.$messagebox({
              title:"提示",
              message:result.data.msg
            })
          }else if(result.data.code==301){
            this.$messagebox({
              title:"提示",
              message:result.data.msg
            })
          }else{
            setTimeout(function(){
              this.showUser = true;
              this.showLogin = false;
              this.showOtherLogin = false;
              this.axios.get('user/sessiondata')
              .then(result=>{
                // console.log(result)
                this.userData=result.data.data[0];
              })
              // this.$router.push('/user');
            }.bind(this),500)
          }
        })
      }
    },
    logout(){
      this.showUser = false;
      this.showLogin = true;
      this.uname="";
      this.upwd="";
    },
    ToEmailReg(){
      this.isUname=true;
    },
    ToUnameReg(){
      this.isUname=false;
    },
    unameInput(){
      this.isReturn = true;
      var unameReg = /^[\u4e00-\u9fa5a-zA-Z0-9]{3,10}$/;
      if(!this.username){
        this.$toast("用户名不能为空");
        return;
      }else if(!unameReg.test(this.username)){
        this.isReturn = true;
        this.$toast("由汉字/字母/数字组成，3~10位");
        return;
      }
    },
    emailInput(){
      this.isReturn = true;
      var emailReg = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
      if(!this.email){
        this.$toast("邮箱不能为空");
        return;
      }else if(!emailReg.test(this.email)){
        this.isReturn = true;
        this.$toast("输入正确的邮箱格式");
        return;
      }
    },
    upwdInput(){
      this.isReturn = true;
      var pwdReg = /^[a-zA-Z0-9]{6,12}$/;
      if(!this.upwd){
        this.$toast("密码不能为空");
        return;
      }else if(!pwdReg.test(this.upwd)){
        this.isReturn = true;
        this.$toast("由字母/数字组成，6~12位");
        return;
      }
    },
    unameRegister(){
      this.isReturn = false;
      if (!this.username||!this.upwd){
        this.isReturn = true;
        this.$toast("用户名或密码不能为空");
        return;
      }else{
        var Num=""; 
        for(var i=0;i<6;i++) 
        { 
        Num+=Math.floor(Math.random()*10); 
        } 
        this.isReturn = true;
        var n = this.username;
        var name =`杰米` + Num;
        var p = this.upwd;
        var e = this.username+Num+'@meishijie.com';
        var img = 'img/user/default.jpg';
        var s = '正在通往美食达人的路上...';
        var url="user/nReg";
        var params = new URLSearchParams();
        params.append("uname",n);
        params.append("upwd",p);
        params.append("email",e);
        params.append("avatar",img);
        params.append("nackname",name);
        params.append("say",s);
        this.axios.post(url,params).then(result=>{
          if(result.data.code==200){
            this.$messagebox({
              title:"提示",
              message:result.data.msg
            })
            this.email="";
            this.upwd="";
            this.showRegister = false;
            this.showLogin = true;
            this.showOtherLogin = false;
          }else{
            this.$messagebox({
              title:"提示",
              message:result.data.msg
            });
            this.username="";
            this.upwd="";
          }
        });
      }
    },
    emailRegister(){
      this.isReturn = false;
      if (!this.email||!this.upwd){
        this.$toast("邮箱或密码不能为空");
        this.isReturn = true;
      }else{
        var Num=""; 
        for(var i=0;i<6;i++) 
        { 
        Num+=Math.floor(Math.random()*10); 
        } 
        var e = this.email;
        var p = this.upwd;
        var n = `杰米` + Num;
        var name =`杰米` + Num;
        var img = 'img/user/default.jpg';
        var s = '正在通往美食达人的路上...';
        var url="user/eReg";
        // var obj={email:e,upwd:p};
        var params = new URLSearchParams();
        params.append("email",e);
        params.append("upwd",p);
        params.append("uname",n);
        params.append("avatar",img);
        params.append("say",s);
        params.append("nackname",name);
        this.axios.post(url,params).then(result=>{
          if(result.data.code==200){
            this.$messagebox({
              title:"提示",
              message:result.data.msg
            })
            this.email="";
            this.upwd="";
            this.showRegister = false;
            this.showLogin = true;
            this.showOtherLogin = false;
          }else{
            this.$messagebox({
              title:"提示",
              message:result.data.msg
            });
            this.email="";
            this.upwd="";
          }
        });
      }
    }
  }
}
</script>
<style scoped>
  /* login */
  .myHeader{
    width: 100%;
    height: 50px;
    background: #fdfdfd;
    color: #000;
    font-size: 18px;
    padding: 0 15px;
  } 
  .myHeader .back,
  .myHeader .reg,
  .myHeader .login{
    font-size: 16px;
    color: #ff5151;
  }
  .back >>> .mintui{
    font-size: 22px;
    font-weight: bold;
  }
  .container{
    padding: 50px 0;
  }
  .myInput{
    margin-top: 16px;
    margin-bottom: 20px;
  }
  .mint-cell{
    min-height: 44px;
  }
  .login-input{
    box-sizing: border-box;
    display: block;
    height: 44px;
    line-height: 44px;
    width: 100%;
    margin: 0 auto;
    padding: 0 15px;
    border-bottom: 1px solid #f5f5f5; 
  }
  .loginBtn,
  .registerBtn{
    display: block;
    width: 90%;
    height: 44px;
    margin: 0 auto;
    color: #fff;
    background: #ff5151;
    text-align: center;
    padding: 0;
  }
  .forget{
    width: 100%;
    height: 44px;
    color: #999;
    font-size: 14px;
    line-height: 44px;
    text-align: center;
  }
  .other-login{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 25px;
  }
  .qq-login,
  .weibo-login{
    width: 62px;
    font-size: 14px;
    line-height: 25px;
    margin: 0 15px;
  }
  .qq-login img,
  .weibo-login img{
    width: 100%;
  }

  /* register*/
  .changeBox{
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 90%;
    height: 28px;
    margin: 16px auto;
    border: 1px solid #ff5151;
    border-radius: 2px;
    overflow: hidden;
  }
  .username,
  .email{
    width: 50%;
    font-size: 14px;
    color: #ff5151;
    line-height: 28px;
    text-align: center;
  }
  .active{
    background: #ff5151;
    color: #fff;
  }
  .profile-item >>> .mint-cell{
    min-height: 45px;
  }
  .profile-item >>> .mint-cell-wrapper{
    background: #fff;
  }
</style>

<style lang="less" scoped>
  .user-page{
    width: 100%;
    padding-bottom: 50px;
    .my-top{
      width: 100%;
      padding-top: 40%;
      background: url(../assets/img/user/user_bg.png) center no-repeat;
      background-size: 100% 100%;
      .my-container{
        display: block;
        height: 100%;
        width: 100%;
        color: #fff;
        font-size: 12px;
        position: absolute;
        left: 0px;
        top: 0px;
        .user-info{
          width: 80%;
          display: flex;
          margin: 5% auto 0px;
          .user-avatar{
            height: 66px;
            width: 66px;
            border: 3px solid rgba(255,255,255,0.5);
            border-radius: 100%;
            overflow: hidden;
            img{
              width: 100%;
              height: 100%;
            }
          }
          .user-text{
            margin-left: 8px;
            .user-name{
              font-size: 16px;
              line-height: 24px;
              display: block;
              text-overflow: ellipsis;
              overflow: hidden;
              white-space: nowrap;
              padding-top: 12px;
            }
            .user-signature{
              line-height: 24px;
              display: block;
              text-overflow: ellipsis;
              overflow: hidden;
              white-space: nowrap;
            }
          }
        }
        .log{
          width: 80%;
          margin: 0px auto 0px;
          display: block;
          position: relative;
          padding-left: 80px;
          box-sizing: border-box;
          span{
            height: 24px;
            line-height: 22px;
            border-radius: 16px;
            color: #fff;
            border: 1px solid rgba(255,255,255,0.5);
            background: rgba(255,255,255,0.2);
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
            padding: 0px 12px;
          }
        }
      }
    }
    .my-dynamic{
      height: 44px;
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #fefefe;
      margin-bottom: 10px;
      div{
        vertical-align: top;
        width: 33.333333333%;
        border-right: 1px solid #eee;
        height: 24px;
        line-height: 24px;
        margin: 10px 0px;
        text-align: center;
        font-size: 14px;
        color: #999;
        box-sizing: border-box;
        strong{
          color: #ff4c35;
        }
      }
    }
    }
    .honour{
      box-sizing: border-box;
      width: 100%;
      background: #fefefe;
      margin-bottom: 10px;
      padding: 0 15px;
      h3{
        color: #333;
        line-height: 32px;
        padding-top: 6px;
      }
      .honour-list{
        display: flex;
        justify-content: space-between;
        width: 100%;
        padding-bottom: 14px;
        box-sizing: border-box;
        .honour-item{
          height: 32px;
          width: 38px;
          vertical-align: top;
          img{
            width: 100%;
            height: 100%;
          }
        }
      }
    }
    .profile-item{
      margin-bottom: 10px;
      .my-item{
        border-bottom: 1px solid #f5f5f5;
      }
    }
    .logoutBtn{
      display: block;
      width: 90%;
      height: 44px;
      margin: 50px auto;
      color: #fff;
      background: #ff5151;
      text-align: center;
      padding: 0;
  }
  .userinfo-page{
    .container{
      padding-top: 50px;
      padding-bottom: 45px;
      font-size: 15px;
      .userinfo_t{
        height: 45px;
        line-height: 44px;
        color: #999;
        font-size: 14px;
        padding: 0 15px;
      }
      .userinfo_c{
        background: #fdfdfd;
        padding: 0 15px;
        .userinfo_item:last-child{
          border: 0;
        }
        .userinfo_item{
          border-bottom: 1px solid #eee;
          color: #666;
          .item1{
            box-sizing: border-box;
            display: flex;
            align-items: center;
            height: 45px;
            line-height: 45px;
            span{
              color: #333;
            }
            input{
              width: 85%;
              height: 44px;
              color: #666;
            }
            select{
              height: 44px;
              color: #666;
              background: #fff
            }
            #gender{
              width: 85%;
            }
          }
          .item2{
            box-sizing: border-box;
            display: flex;
            padding: 10px 0;
            // align-items: center;
            span{
              color: #333;
            }
            .add_img{
              position: relative;
              border-radius: 5px;
              overflow: hidden;
              .show_img{
                width: 100px;
                height: 100px;
                img{
                  width: 100%;
                  height: 100%;
                }
              }
              input{
                height: 100%;
                font-size: 100%;
                position: absolute;
                left: 0px;
                top: 0px;
                opacity: 0;
              }
            }
          }
        }
      }
      .submitBtn{
        display: block;
        width: 90%;
        height: 45px;
        margin: 20px auto;
        color: #fff;
        background: #ff5151;
        text-align: center;
        padding: 0px;
      }
    }
  }
</style>