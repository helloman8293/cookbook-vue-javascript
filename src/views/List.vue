<template>
  <div class="list-page bg-f">
    <div class="search-top">
      <div class="search-bar bg-f">
        <div class="search-box">
          <router-link to="/" slot="left" class="back">
            <img src="" alt="">
          </router-link>
          <input type="text" :placeholder="keyword" name="search" v-model="kwords">
          <input type="submit" value="搜索" @click="search">
        </div>
      </div>
    </div>
    <div class="list-container" v-if="listData.length">
      <ul class="list">
        <li class="list-item" v-for="(item,index) of listData" :key="index">
          <!-- <router-link :to="`/detail?lid=${item.id}`" class="list-item-link"> -->
          <router-link :to="{path:'/detail',query:{lid:item.id}}" class="list-item-link">
            <div class="list-item-content">
              <div class="left">
                <img :src="item.pic" alt="">
              </div>
              <div class="right">
                <div class="title">{{item.title}}</div>
                <div class="stars">
                  <span class="star1"></span>
                  <span class="star1"></span>
                  <span class="star1"></span>
                  <span class="star2"></span>
                  <span class="star2"></span>
                </div>
                <p class="des desinline">炖 酸辣味 初级入门 &lt;30分钟</p>
              </div>
            </div>
          </router-link>
        </li>
      </ul>
    </div>
    <div class="list-none" v-else >没有该菜谱名、食材名！</div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      listData:[],
      kwords: '',
      keyword: '',
      num: 0,
    }
  },
  created(){
    this.onload();
  },
  methods:{
    onload(){
      this.keyword = this.$route.query.keyword;
      this.num = this.$route.query.num;
      var obj = {keyword:this.keyword,num:this.num}
      var url = "product/list"
      this.axios.get(url,{params:obj}).then(result=>{
        console.log(result.data.data)
        this.listData = result.data.data
      })
    },
    search () {
      var kwords = this.kwords;
    },
  }
}
</script>
<style scoped>
  .bg-f{
    background: #fff;
  }
  .padding{
    padding: 0 15px;
  }
  .search-top{
    height: 44px;
    width: 100%;
  }
  .search-bar{
    height: 44px;
    width: 100%;
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 400;
  }
  .search-box{
    display: flex;
    height: 44px;
    padding: 6px 75px 6px 60px;
    box-sizing: border-box;
    width: 100%;
    border-bottom: 1px solid #eee;
  }
  .search-box .back{
    height: 44px;
    width: 60px;
    background: url(../assets/img/icons.png) -160px 0px no-repeat;
    background-size: 400px 400px;
    position: absolute;
    left: 0px;
    top: 0px;
    z-index: 100;
  }
  .search-box input[type="text"]{
    height: 32px;
    background: #eee;
    border-radius: 2px;
    color: #333;
    font-size: 14px;
    width: 100%;
    box-sizing: border-box;
    display: block;
    padding: 4px 8px;
    line-height: 24px;
  }
  .search-bar input[type="submit"]{
    height: 32px;
    background: #ff4c39;
    border-radius: 2px;
    color: #fff;
    font-size: 14px;
    width: 100%;
    box-sizing: border-box;
    display: block;
    line-height: 32px;
    text-align: center;
    position: absolute;
    right: 15px;
    top: 6px;
    width: 55px;
  }
  .list-item{
    height: 110px;
    border-bottom: 1px solid #eee;
  }
  .list-item-link{
    display: block;
    height: 110px;
    box-sizing: border-box;
    padding: 15px;
    position: relative;
  }
  .list-item-content{
    display: flex;
    align-items: center;
  }
  .list-item-content .left{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 120px;
    height: 80px;
    margin-right: 15px;
    overflow: hidden;
  }
  .list-item-content .left img{
    width: 100%;
    display: block;
  }
  .list-item-content .right .title{
    font-size: 18px;
    color: #333;
    font-weight: 300;
    line-height: 26px;
    padding: 2px 0px 0px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .list-item-content .right .star{
    height: 24px;
    font-size: 0px;
    margin-top: 2px;
  }
  .list-item-content .right .star1{
    height: 18px;
    width: 20px;
    display: inline-block;
    vertical-align: top;
    margin: 3px 6px 0px 0px;
    background: url(../assets/img/icons.png) 0px -78px no-repeat;
    background-size: 294px 294px;
  }
  .list-item-content .right .star2{
    height: 18px;
    width: 20px;
    display: inline-block;
    vertical-align: top;
    margin: 3px 6px 0px 0px;
    background: url(../assets/img/icons.png) -21px -78px no-repeat;
    background-size: 294px 294px;
  }
  .list-item-content .right .des{
    font-size: 14px;
    max-height: 22px;
    line-height: 22px;
    color: #999;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    padding-top: 4px;
  }
  .list-none{
    color: #999;
    text-align: center;
    padding: 20px;
  }
</style>