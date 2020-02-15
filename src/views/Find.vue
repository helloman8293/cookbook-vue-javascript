<template>
  <div>
    <div class="find-page" v-show="!showFindPage">
      <div class="topbar">
        <div class="topbar-top">
          <div class="msg-btn"></div>
          <h1 class="find-title">发现最热门</h1>
        </div>
        <div class="find-top">
          <router-link to="" slot="left">
            <div class="material" @click="ToSeasonal">
              <img src="../assets/img/find/find_material.png" alt="">
            </div>
          </router-link>
          <router-link to="" slot="left">
            <div class="menu" @click="ToSeasonal">
              <img src="../assets/img/find/find_menu.png" alt="">
            </div>
          </router-link>
          <router-link to="" slot="left">
            <div class="special" @click="ToSeasonal">
              <img src="../assets/img/find/find_special.png" alt="">
            </div>
          </router-link>
          <router-link to="" slot="left">
            <div class="article" @click="ToSeasonal">
              <img src="../assets/img/find/find_article.png" alt="">
            </div>
          </router-link>
        </div>
      </div>
      <video-list title="热门的视频菜谱" type="视频菜谱" :ImgUrl="require('../assets/img/avatar.jpg')" uname="日食记" time="2017-05-31更新" :Vimg="require('../assets/img/find/video/pic_01.jpg')" infoTitle="看一遍就能学会的泡椒凤爪 骨头都想吞掉" count="467374"></video-list>
      <hot-list title="全国议论最多的菜谱" type="评论最高" step="10步 / &lt;30分钟" taste="甜味 / 拔丝"></hot-list>
      <share-list title="这个帖子就这么红了..."></share-list>
      <share-list title="这个帖子就这么红了..."></share-list>
      <share-list title="这个帖子就这么红了..."></share-list>
      <share-list title="这个帖子就这么红了..."></share-list>
    </div>
    <seasonal class="seasonal-page" v-show="showFindPage" :showFindPage.sync="showFindPage"></seasonal>
  </div>
</template>
<script>
import videoList from '../components/video-list'
import hotList from '../components/hot-list'
import shareList from '../components/share-list'
import seasonal from '../components/Seasonal'
export default {
  components:{
    videoList,
    hotList,
    shareList,
    seasonal
  },
  data(){
    return{
      showFindPage:false
    }
  },
  methods:{
    ToSeasonal(){
      this.showFindPage=true;
    }
  }
}
</script>
<style lang="less" scoped>
  .find-page{
    padding-bottom: 58px;
    .topbar{
      background: #fff;
      .topbar-top{
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 999;
        background: #fff;
        .find-title{
          font-size: 18px;
          color: #000;
          line-height: 44px;
          text-align: center;
        }
        .msg-btn{
          height: 44px;
          width: 52px;
          position: absolute;
          right: 0px;
          top: 0px;
          background: url(../assets/img/find/mail2.png) center no-repeat;
          background-size: 52px 44px;
        }
      }
      .find-top{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 15px;
        border-bottom: 1px solid #ddd;
        padding-top: 44px;
        > a{
          width: 23%;
          padding-bottom: 10px;
          box-sizing: border-box;
          img{
            width: 100%;
          }
        }
      }
    }
  }
</style>