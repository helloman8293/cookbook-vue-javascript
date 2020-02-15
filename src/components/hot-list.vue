<template>
  <div class="hot-item">
    <div class="item-title">{{title}}</div>
    <div class="item-style">{{type}}</div>
    <div class="item-content">
      <div class="img-box">
        <img src="../assets/img/find/pic_01.jpg" alt="">
      </div>
      <div class="info-content">
        <div class="info-text">
          <strong>拔丝地瓜</strong>
          <div class="star">
            <img src="../assets/img/find/star.png" alt="">
            <img src="../assets/img/find/star.png" alt="">
            <img src="../assets/img/find/star.png" alt="">
            <img src="../assets/img/find/star.png" alt="">
            <img src="../assets/img/find/star.png" alt="">
          </div>
          <span class="step">{{step}}</span>
          <span class="taste">{{taste}}</span>
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
    step:{default:""},
    taste:{default:""}

  },
  data(){
    return{}
  }
}
</script>
<style lang="less" scoped>
  .hot-item{
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
      display: flex;
      align-content: center;
      padding: 10px 0; 
      .img-box{
        width: 30%;
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
      }
      .info-content{
        padding-left: 10px;
        strong{
          font-size: 15px;
          color: #333;
          line-height: 23px;
          display: block;
          height: 23px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }
        .star{
          height: 14px;
          margin: 4px auto;
          img{
            display: inline-block;
            vertical-align: top;
            height: 14px;
            width: 14px;
            margin-right: 3px;
          }
        }
        span{
          display: block;
          height: 20px;
          font-size: 12px;
          line-height: 20px;
          color: #999;
          padding-left: 16px;
        }
        .step{
          background: url(../assets/img/find/con_icon_time.png) 0px 3px no-repeat;
          background-size: 14px 14px;
        }
        .taste{
          background: url(../assets/img/find/con_icon_taste.png) 0px 3px no-repeat;
          background-size: 14px 14px;
        }
      }
    }
  }
</style>