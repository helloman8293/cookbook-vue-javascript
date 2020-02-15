<template>
  <div class="video-page">
    <div class="topBar">
      <mt-header title="菜谱视频大全" fixed>
        <router-link to="/" slot="left">
          <mt-button icon="back" class="back">主页</mt-button>
        </router-link>
        <mt-button slot="right">
          <span class="search-icon"></span>
        </mt-button>
      </mt-header>
    </div>
    <div class="video-container">
      <div class="video-item" v-for="(item,i) of list" :key="i">
        <div class="video-img">
          <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
          <span class="play-icon">
            <i></i>
          </span>
          <span class="play-time">{{item.duration}}</span>
        </div>
        <div class="video-desc">
          <h2>{{item.title}}</h2>
          <p><span>{{item.release_date | dateFormat('YYYY-MM-DD')}} / {{item.clicks}}万次播放</span></p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[]
    }
  },
  mounted(){
    this.onload()
  },
  filters: {
    dateFormat(dateStr,time){
      var date = new Date(dateStr);
      var year = date.getFullYear();
      var month = date.getMonth()+1<10 ? '0'+ (date.getMonth()+1) : date.getMonth()+1;
      var day = date.getDate()<10 ? '0' + date.getDate() : date.getDate();
      var hh = date.getHours()<10 ? '0' + date.getHours() : date.getHours();
      var mm = date.getMinutes()<10 ? '0' + date.getMinutes() : date.getMinutes();
      var ss = date.getSeconds()<10 ? '0' + date.getSeconds() : date.getSeconds();
      
      if(time&&time.toLowerCase() === 'yyyy-mm-dd'){
          return `${year}-${month}-${day}`;
      }else if(time&&time.toLowerCase() === 'hh:mm:ss'){
          return `${hh}:${mm}:${ss}`;
      }else{
          return `${year}-${month}-${day} ${hh}:${mm}:${ss}`;
      }
    }
  },
  methods:{
    onload(){
      var url = "product/video";
      this.axios.get(url).then(result =>{
        this.list = result.data.data;
        // console.log(this.list)
      })
    }
  }
}
</script>
<style scoped>
  .video-page{
    box-sizing: border-box;
    position: absolute;
    width: 100%;
    height: 100%;
  }
  .topBar .mint-header{
    height: 44px;
    background: rgba(255,255,255,0.95);
    color: #000;
    font-size: 16px;
  }
  .topBar >>> .mint-header-title{
    font-weight: bold;
  }
  .topBar .mint-button{
    color: #ff5151;
  }
  .back >>> .mintui{
    font-size: 22px;
    font-weight: bold;
  }
  .topBar .search-icon{
    width: 30px;
    height: 44px;
    display: inline-block;
    background: url(../assets/img/video/search_icon.png)center no-repeat;
    background-size: 44px;
  }
  .video-container{
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 44px 15px 0;
    background: #fff;
    overflow: auto;
  }
  .video-container::-webkit-scrollbar {
    display: none;
  }
  .video-item{
    display: flex;
    align-content: center;
    padding: 14px 0;
    border-top: 1px dashed #ddd;
  }
  .video-item:first-child{
    border: 0;
  }
  .video-img{
    width: 180px;
    height: 100px;
    margin-right: 8px;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
  }
  .video-img img{
    width: 100%;
    height: auto;
  }
  .play-icon{
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 10;
    width: 32px;
    height: 32px;
    margin: -16px 0 0 -16px;
    border-radius: 50%;
    background-color: rgba(0,0,0,.4);
    overflow: hidden;
  }
  .play-icon i{
    position: relative;
    display: block;
    width: 32px;
    height: 32px;
  }
  .play-icon i::after{
    position: absolute;
    top: 9px;
    left: 12px;
    content: " ";
    width: 0;
    height: 0;
    border-top: 7px solid transparent;
    border-bottom: 7px solid transparent;
    border-left: 9px solid #fff;
  }
  .play-time{
    position: absolute;
    bottom: 0;
    right: 0;
    display: inline-block;
    font-size: 13px;
    color: #fff;
    background: #000;
    opacity: 0.6;
    padding: 1px 2px;
    text-align: center;
  }
  .video-desc p{
    font-size: 12px;
    color: #ccc;
    text-align: left;
    overflow: hidden;
    height: 28px;
    line-height: 28px;
  }
</style>