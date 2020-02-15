<template>
  <div class="recommend">
    <header-bar class="header"></header-bar>
    <div class="container">
      <my-sider></my-sider>
      <div class="index-menu">
        <div class="index-menu-list">
          <router-link to="/menu">
            <div class="memu-class">
              <img src="../assets/img/index/icon/index_menu.png" alt="">
              <p>菜谱分类</p>
            </div>
          </router-link>
          <router-link to="/video">
            <div class="video-memu">
              <img src="../assets/img/index/icon/index_video.png" alt="">
              <p>视频菜谱</p>
            </div>
          </router-link>
          <router-link to="/menu">
            <div class="video-memu">
              <img src="../assets/img/index/icon/index_breakfast.png" alt="">
              <p>早餐</p>
            </div>
          </router-link>
          <router-link to="/menu">
            <div class="video-memu">
              <img src="../assets/img/index/icon/index_nearby.png" alt="">
              <p>附近</p>
            </div>
          </router-link>
        </div>
        <!-- 今日推荐 -->
        <div class="recommend-today">
          <p>今日推荐</p>
          <div class="recoommend-img">
            <ul>
              <li v-for="(item,i) of list" :key="i">
                <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
              </li>
            </ul>
          </div>
        </div>
        <!-- 猜你喜欢-->
        <div class="love-tilte">
          <div class="love-icon">
            <img src="../assets/img/index/icon/title_love.png" alt="">
          </div>
          <div class="love-text">
            <p>猜你喜欢</p>
            <em>{{upDateTime}}为您更新</em>
          </div>
        </div>
        <ul class="cb-container">
          <li class="cb-item" v-for="(item,i) of cbList.slice(0,p)" :key="i">
            <router-link :to="{path:'/detail',query:{lid:item.id}}" class="cb-img">
              <img :src="item.pic" alt="">
            </router-link>
            <p class="line-clamp-1">{{item.title}}</p>
          </li>
          <div class="load-more" v-if="p<cbList.length"  @click='showMore' >点击加载更多</div>
          <div class="load-more" v-else >没有更多了</div>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import HeaderBar from '../components/HeaderBar'
import MySider from '../components/sider'

export default {
  name: 'recommend',
  data() { 
    return {
      list: [],
      cbList:[],
      p:6,
    }
  },
  components: {
    HeaderBar,
    MySider
  },
  created(){
    this.loadMore()
    this.showTime()
  },
  methods:{
    loadMore(){
      this.axios.get("product/banner").then(result=>{
        this.list=result.data.data;
      });
      this.axios.get("index").then(result=>{
        this.cbList=result.data.data;
      })
    },
    showTime(){
      var date = new Date();
      var upDateTime=date.toLocaleString('chinese', { hour12: false });  
      this.upDateTime = upDateTime.slice(10,15);
    },
    showMore:function(){
      this.p+=10;
    },
  }
}
</script>
<style scoped>
  .recommend{
    width: 100%;
    height: 100%;
  }
  .header{
    position: fixed;
    top: 0;
    left: 0;
    z-index: 999;
  }
  .container{
    background: #fff;
    padding-top: 50px;
    padding-bottom: 58px;
  }
  .index-menu{
    box-sizing: border-box;
    width: 100%;
    background: #fff;
    padding: 0 10px;
  }
  .index-menu-list{
    width: 100%;
    display: flex;
    justify-content: space-around;
    align-items: center;
    background: #FFF;
    padding-top: 24px;
    text-align: center;
  }
  .index-menu-list img{
    width: 65px;
    height: 65px;
    margin-bottom: 2px;
  }
  .index-menu-list p{
    font-size: 12px;
    line-height: 32px;
  }
  .recoommend-img li{
    width: 100%;
    border-radius: 8px;
    margin-bottom: 5px;
    overflow: hidden;
  }
  .recoommend-img img{
    display: block; 
    height: 100%;
    width: 100%;
  }
  .recommend-today >>>p{
    width: 100%;
    color: #333;
    font-size: 18px;
    line-height: 40px;
    padding-top: 14px;
    text-align: center
  }
  .love-tilte{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 30px;
    padding: 24px 0 14px;
  }
  .love-icon img{
    width: 30px;
    height: 30px;
  }
  .love-text{
    display: inline-block;
    vertical-align: top;
    height: 30px;
    padding-left: 4px;
    text-align: left;
  }
  .love-text em{
    font-size: 12px;
    color: #999;
  }
  .cb-container{
    width: 100%;
    display: flex;
    flex-flow: wrap;
    justify-content: space-between;
    padding-bottom: 10px;
  }
  .cb-item{
    box-sizing: border-box;
    width: 49%;
    margin: 5px 0;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    text-align: left;
  }
  .cb-item >>> p{
    font-weight: bold;
    line-height: 18px;
  }
  .cb-img{
    width: 100%;
    border-radius: 8px;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin-bottom: 10px;
  }
  .cb-item img{
    width: 100%;
    height: auto;
  }
  .line-clamp-1{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    white-space: normal;
  } 
  .load-more{
    width: 100%;
    color: #ff5151;
    text-align: center;
    padding: 20px 0;
  }
</style>

