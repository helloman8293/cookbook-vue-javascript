<template>
  <div class="navigate-page">
    <div class="HeaderBar">
      <router-link to="/" slot="left">
        <div class="back">
          <img src="../assets/img/class/back_icon.png" alt="">
        </div>
      </router-link>
      <div class="searchBox">
        <img src="../assets/img/index/icon/search_icon.png" alt="">
        <span>搜索你感兴趣的</span>
      </div>
    </div>
    <div class="my-navbar">
      <div class="navbar-container">
        <mt-navbar v-model="selected">
          <mt-tab-item :id="item.fid" v-for="(item,index) of menuList" :key="index">
            <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.fname}}
          </mt-tab-item>
        </mt-navbar>
      </div>
      <div class="navbar-item">
        <mt-tab-container v-model="selected">
          <mt-tab-container-item :id="1">
            <div class="navbar-list-item" v-for="(item,i) of practical" :key="i">
              <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.sname}}
            </div>
          </mt-tab-container-item>
          <mt-tab-container-item :id="2">
            <div class="navbar-list-item" v-for="(item,i) of meals" :key="i">
              <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.sname}}
            </div>
          </mt-tab-container-item>
          <mt-tab-container-item :id="3">
            <div class="navbar-list-item" v-for="(item,i) of food" :key="i">
              <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.sname}}
            </div>
          </mt-tab-container-item>
          <mt-tab-container-item :id="4">
            <div class="navbar-list-item" v-for="(item,i) of homely" :key="i">
              <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.sname}}
            </div>
          </mt-tab-container-item>
          <mt-tab-container-item :id="5">
            <div class="navbar-list-item" v-for="(item,i) of cuisine" :key="i">
              <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.sname}}
            </div>
          </mt-tab-container-item>
          <mt-tab-container-item :id="6">
            <div class="navbar-list-item" v-for="(item,i) of snack" :key="i">
              <img slot="icon" :src="'http://127.0.0.1:3000/'+item.img">
            {{item.sname}}
            </div>
          </mt-tab-container-item>
        </mt-tab-container>
      </div>
    </div>
  </div>
</template>
<script>
	export default {
		data() {
			return {
        selected: 1,
        menuList: [],
        menuListItem: [],
        foodList: [],
        practical: [],
        meals: [],
        food: [],
        homely: [],
        cuisine: [],
        snack: []
			}
		},
		created() {
      this.onload()
		},
		methods: {
      onload(){
        this.axios.get("product/menu").then(result => {
          // console.log(result.data.data);
          this.menuList = result.data.data;
        });
        this.axios.get("product/menuItem").then(result => {
          // console.log(result.data.data);
          this.menuListItem = result.data.data;
          var list = this.menuListItem;
          var foodList = [];
          for(var i = 0; i < list.length; i++) {
            if(!foodList[list[i].family_id]) {
              var arr = [];
              arr.push(list[i]);
              foodList[list[i].family_id] = arr;
            }else {
              foodList[list[i].family_id].push(list[i])
            }
          }
          // console.log(foodList);
          this.practical=foodList[1];
          this.meals=foodList[2];
          this.food=foodList[3];
          this.homely=foodList[4];
          this.cuisine=foodList[5];
          this.snack=foodList[6];
        //   console.log(this.practical);
        //   console.log(this.meals);
        //   console.log(this.food);
        //   console.log(this.homely);
        });
      }
    }
	}
</script>
<style scoped>
  .navigate-page{
    box-sizing: border-box;
    position: absolute;
    width: 100%;
    height: 100%;
  }
  .HeaderBar{
    box-sizing: border-box;
    width: 100%;
    height: 44px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    background: #fff;
    padding:  0 15px;
    position: fixed;
    top: 0;
    left: 0;
  }
  .back{
    width: 52px;
    height: 44px;
  }
  .back img{
    height: 100%;
  }
  .searchBox{
    width: 90%;
    height: 32px;
    border-radius: 2px;
    background: #f5f5f5;
    line-height: 32px;
    color: #aaa;
    font-size: 14px;
    display: block;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .searchBox>img{
    width: 14px;
    height: 14px;
    margin-right: 5px;
  }
  .my-navbar{
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    display: flex;
    background: #fff;
    padding-top: 44px;
  }
  .navbar-container{
    box-sizing: border-box;
    width: 100px;
    height: 100%;
  }
  
  .navbar-container .mint-navbar{
    width: 100px;
    height: 100%;
    flex-direction: column;
    overflow: scroll;
  }
  .navbar-container .mint-navbar::-webkit-scrollbar{
    display: none;
  }
  .navbar-container >>> .mint-tab-item{
    box-sizing: border-box;
    width: 100px;
    height: 100px;
  }
  .navbar-container .mint-navbar .mint-tab-item.is-selected{
    border-bottom: 0;
    color: #ff4c35;
    margin-bottom: 0;
    background: #f5f5f5;
  }
  .navbar-container >>> .mint-tab-item-icon{
    width: 30px;
    height: 30px;
    margin: 0 auto 8px;
  }
  .navbar-container >>> .mint-tab-item-label{
    font-size: 14px;
    color: #333;
  }
  .navbar-item{
    box-sizing: border-box;
    width: 100%;
    font-size: 12px;
    line-height: 24px;
    display: block;
    text-align: center;
    color: #000;
    overflow: scroll;
  }
  .navbar-item::-webkit-scrollbar {
    display: none;
  }
  .navbar-item .mint-tab-container-item{
    display: flex;
    flex-wrap: wrap;
  }
  .navbar-list-item{
    box-sizing: border-box;
    width: 33%;
    padding: 10px;
    text-align: center;
  }
  .navbar-list-item img{
    display: block;
    width: 100%;
  }
</style>