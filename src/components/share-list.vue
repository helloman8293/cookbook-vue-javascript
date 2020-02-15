<template>
  <div class="share-item">
    <div class="item-title">{{title}}</div>
    <div class="item-style">评论最多</div>
    <div class="item-content">
      <div class="author">
        <div class="author-info">
          <img src="../assets/img/avatar2.jpg" alt="">
          <span>银元宝</span>
        </div>
      </div>
      <p>好几天忘记拍照了😄</p>
      <div class="img-box">
        <div class="img-item">
          <img src="../assets/img/find/pic_01.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_02.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_03.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_04.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_01.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_02.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_03.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_01.jpg" alt="">
        </div>
        <div class="img-item">
          <img src="../assets/img/find/pic_04.jpg" alt="">
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props:{
    title:{default:""},
  },
  data(){
    return{}
  }
}
</script>
<style lang="less" scoped>
  .share-item{
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
      background: #fff;
      padding: 0 15px;
      margin-top: 10px;
      .author{
        height: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 5px;
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
            color: #ff4c39;
            padding-left: 10px;
          }
        }
      }
      p{
        font-size: 16px;
        color: #000;
        line-height: 24px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
      }
      .img-box{
        // max-height: 350px;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        // overflow: hidden;
        .img-item{
          box-sizing: border-box;
          width: 32%;
          padding-bottom: 7px;
          img{
            width: 100%;
            height: 100%;
          }
        }
      }
    }
  }
</style>