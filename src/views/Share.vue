<template>
  <div class="share-page">
    <div class="HeaderBar">
      <div class="add-content" v-show="isShow">
        <span class="up"></span>
        <div class="show">
          <div class="show-icon">
            <img src="../assets/img/index/icon/pic.png" alt="">
          </div>
          <span class="show-text">晒作品</span>
        </div>
        <div class="upload">
          <div class="upload-icon">
            <img src="../assets/img/index/icon/upload.png" alt="">
          </div>
          <span class="show-text">传菜谱</span>
        </div>
      </div>
      <span class="add" @click="show"></span>
      <h2 class="top-title">食话</h2>
      <div class="rigthIcon">
        <span class="search"></span>
        <span class="attn"></span>
      </div>
    </div>
    <div class="container">
      <div class="swiper">
        <mt-swipe :auto="0">
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner01.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner02.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner03.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner04.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner05.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner06.jpg" alt="">
          </mt-swipe-item>
          <mt-swipe-item>
              <img src="../assets/img/share/banner/banner07.jpg" alt="">
          </mt-swipe-item>
        </mt-swipe>
      </div>
      <div class="index-menu-list">
        <div class="list-item">
          <img src="../assets/img/share/table1.png" alt="">
          <p>餐桌食光</p>
        </div>
        <div class="list-item">
          <img src="../assets/img/share/bake1.png" alt="">
          <p>玩转烘焙</p>
        </div>
        <div class="list-item">
          <img src="../assets/img/share/question1.png" alt="">
          <p>美食课堂</p>
        </div>
        <div class="list-item">
          <img src="../assets/img/share/activity1.png" alt="">
          <p>最IN活动</p>
        </div>
      </div>
      <div class="share-content">
        <div class="change-btn">
          <div class="btn"  v-for="(item,index) in items" :key="index" @click="getItme(index) " :class="activeClass==index? 'active':''" >
            {{item.select}}
          </div>
        </div>
        <div class="content-item">
          <div class="author">
            <div class="author-info">
              <img src="../assets/img/avatar2.jpg" alt="">
              <div class="right">
                <span>银元宝</span>
                <span class="date">2019-11-28发布 来自 <em>餐桌食光</em></span>
              </div>
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
          <div class="favour">
            <span class="comment">0</span>
            <span class="collect">343</span>
          </div>
        </div>
        <div class="content-item">
          <div class="author">
            <div class="author-info">
              <img src="../assets/img/avatar2.jpg" alt="">
              <div class="right">
                <span>银元宝</span>
                <span class="date">2019-11-28发布 来自 <em>餐桌食光</em></span>
              </div>
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
          <div class="favour">
            <span class="comment">0</span>
            <span class="collect">343</span>
          </div>
        </div>
        <div class="content-item">
          <div class="author">
            <div class="author-info">
              <img src="../assets/img/avatar2.jpg" alt="">
              <div class="right">
                <span>银元宝</span>
                <span class="date">2019-11-28发布 来自 <em>餐桌食光</em></span>
              </div>
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
          <div class="favour">
            <span class="comment">0</span>
            <span class="collect">343</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      isShow: false,
      activeClass: 0,
      items: [
        {select:"最新"},
        {select:"最热"}
      ]
    }
  },
  methods:{
    show(){
      if(this.isShow==false){
      this.isShow=true;
      }else{
        this.isShow=false
      }
    },
    getItme(index) {
      this.activeClass = index;  // 把当前点击元素的index，赋值给activeClass
    },
  }
}
</script>
<style lang="less" scoped>
  .HeaderBar{
    width: 100%;
    height: 44px;
    position: relative;
    background: #fff;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 999;
    .add-content{
      position: absolute;
      top: 50px;
      left: 10px;
      background: #333;
      display: flex;
      flex-direction: column;
      justify-content: center;
      border-radius: 5px;
      div+div{
        border-top: 1px solid #5a5a5a;
      }
      .up{
        display: block;
        position: absolute;
        top: -7px;
        left: 10px;
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 7px solid #333;
      }
      .show,
      .upload{
        box-sizing: border-box;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #fff;
        width: 104px;
        height: 48px;
        padding-right: 15px;
      }
      .show-icon,
      .upload-icon{
        width: 30px;
        height: 30px;
        margin: 9px 4px 9px 6px;
        img{
          width: 100%;
          height: auto;
        }
      }
    }
    .top-title{
      font-size: 18px;
      line-height: 44px;
      text-align: center;
    }
    .add{
      width: 52px;
      height: 44px;
      position: absolute;
      left: 0px;
      top: 0px;
      background: url(../assets/img/index/icon/add.png)center no-repeat;
      background-size: 52px 44px;
    }
    .search{
      height: 44px;
      width: 56px;
      position: absolute;
      right: 52px;
      top: 0px;
      background: url(../assets/img/share/search_topbar.png)center no-repeat;
      background-size: 56px 44px;
    }
    .attn{
      height: 44px;
      width: 52px;
      position: absolute;
      right: 0px;
      top: 0px;
      background: url(../assets/img/share/attention.png)left no-repeat;
      background-size: 34px 44px;
    }
  }
  .container{
    padding: 44px 0 50px;
    background: #fff;
    .swiper {
      .mint-swipe{
        overflow: hidden;
        position: relative;
        width: 100%;
        height: 188px;
        img{
          width: 100%;
          height: 100%;
        }
      }
    }
    .index-menu-list{
      width: 100%;
      display: flex;
      justify-content: space-around;
      align-items: center;
      background: #FFF;
      padding: 10px 0;
      text-align: center;
      .list-item{
        width: 25%;
        padding: 10px;
        box-sizing: border-box;
        img{
          width: 80%;
          height: 80%;
          margin-bottom: 2px;
        }
        p{
          font-size: 12px;
          line-height: 18px;
        }
      }
    }
    .share-content{
      // text-align: center;
      padding: 0 15px;
      .change-btn{
        width: 160px;
        height: 30px;
        margin: 16px auto;
        border: 1px solid #ff4c35;
        border-radius: 6px;
        overflow: hidden;
        vertical-align: top;
        font-size: 0px;
        .btn{
          display: inline-block;
          text-align: center;
          width: 80px;
          font-size: 12px;
          line-height: 30px;
          color: #ff4c35;
        }
        .active{
          background: #ff4c35;
          color: #fff;
        }
      }
      .content-item{
        padding: 10px 0;
        border-bottom: 1px solid #f5f5f5;
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
              display: block;
              line-height: 14px;
              font-size: 14px;
              color: #ff4c39;
              padding-left: 10px;
              em{
                color: #1995f5;
              }
            }
            .date{
              font-size: 12px;
              color: #999;
            }
          }
        }
        p{
          // text-align: left;
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
        .favour{
          text-align: right;
          height: 18px;
          font-size: 12px;
          color: #999;
          .comment{
            background: url(../assets/img/share/comment.png)2px center no-repeat;
            background-size: 12px;
            padding-left: 15px; 
          }
          .collect{
            background: url(../assets/img/share/heart.png)8px center no-repeat;
            background-size: 12px;
            padding-left: 20px; 
          }
        }
      }
    }
  }
</style>
