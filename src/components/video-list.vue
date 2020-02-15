<template>
  <div class="video-item">
    <div class="item-title">{{title}}</div>
    <div class="item-style">{{type}}</div>
    <div class="item-content">
      <div class="author">
        <div class="author-info">
          <img :src="ImgUrl" alt="">
          <span>{{uname}}</span>
        </div>
        <span>{{time}}</span>
      </div>
      <div class="img-box">
        <img :src="Vimg" alt="">
        <div class="info">
          <div class="info-content">
            <div class="info-text">
              <strong>{{infoTitle}}</strong>
              <span>{{count}}次播放</span>
            </div>
            <span class="video-icon"></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props:{
    title:{default:""},
    type:{default:""},
    ImgUrl:{default:""},
    uname:{default:""},
    time:{default:""},
    Vimg:{default:""},
    infoTitle:{default:""},
    count:{default:""}

  },
  data(){
    return{
      
    }
  }
}
</script>
<style lang="less" scoped>
  .video-item{
    background: #fff;
    padding: 0 15px;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    margin-top: 10px;
    .item-title{
      height: 38px;
      line-height: 38px;
      font-size: 16px;
    }
    .item-style{
      display: inline-block;
      height: 18px;
      font-size: 12px;
      color: #01a1ea;
      line-height: 18px;
      border: 1px solid #01a1ea;
      border-radius: 2px;
      padding: 0 4px;
    }
    .item-content{
      padding: 10px 0;
      .author{
        height: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
        > span{
          display: inline-block;
          line-height: 30px;
          font-size: 10px;
          color: #999;
        }
        .author-info{
          display: flex;
          justify-content: space-between;
          align-items: center;
          img{
            display: block;
            width: 30px;
            height: 30px;
            border-radius: 15px;
          }
          span{
            display: inline-block;
            line-height: 30px;
            font-size: 14px;
            color: #333;
            padding-left: 10px;
          }
        }
      }
    }
    .img-box{
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      overflow: hidden;
      position: relative;
      img{
        width: 100%;
        height: 100%;
      }
      .info{
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        color: #fff;
        background: url(../assets/img/find/video/video_cover.png) center no-repeat;
        background-size: 100% 100%;
        .info-content{
          box-sizing: border-box;
          width: 100%;
          display: flex;
          justify-content: space-between;
          align-items: center;
          position: absolute;
          bottom: 14px;
          padding: 0 14px;
          .info-text{
            width: 70%;
            line-height: 24px;
            text-align: left;
            strong{
              overflow: hidden;
              text-overflow: ellipsis;
              display: -webkit-box;
              -webkit-line-clamp: 1;
              -webkit-box-orient: vertical;
              white-space: normal;
            }
            span{
              font-size: 10px;
            }
          }
          .video-icon{
            display: block;
            height: 30px;
            width: 40px;
            background: url(../assets/img/find/video/video_list.png) center no-repeat;
            background-size: 100% 100%;
          }
        }
        
      }
    }
  }
</style>