<template>
  <div class="cookdetail-page">
    <div class="top-nav">
      <router-link to="/">
        <div class="left">&lt; 美食杰</div>
      </router-link>
      <router-link to="/menu">
        <div class="right">菜谱分类 &gt;</div>
      </router-link>
    </div>
    <div class="detail-container">
      <div class="img-box">
        <div class="img" :style="{background: 'url(' + list.pic + ')no-repeat center'}"></div>
      </div>
      <div class="detail">
        <h1 class="title">{{list.title}}</h1>
        <span>1人收藏　333人浏览</span>
        <div class="effect">
          <span v-for="(item,index) of (list.tag || '').split(',')" :key="index">{{item}}</span>
        </div>
      </div>
      <div class="author-desc">
        <div class="avatarbox">
          <div class="author-info">
            <img class="author-img" src="../assets/img/cook_detail/avatar/avatar_01.jpg" alt="">
            <div class="author-text">
              <strong>承灿妈咪CCM</strong>
              <span>发布13篇菜谱</span>
            </div>
          </div>
          <span class="focus">关注</span>
        </div>
        <p class="desc-text">{{list.content}}</p>
      </div>
      <div class="grade">
        <div class="points" alt="">评分
          <div class="stars">
            <span class="on"></span>
            <span class="on"></span>
            <span class="on"></span>
            <span class="off"></span>
            <span class="off"></span>
          </div>
        </div>
        <ul class="argsul">
          <li class="args1" alt=""><span class="i"></span>{{!list.class?'焖':list.class}}</li>
          <li class="args2" alt=""><span class="i"></span>{{!list.taste?'家常味':list.taste}}</li>
          <li class="args3" alt=""><span class="i"></span>{{list.cookingtime}}</li>
          <li class="args4" alt=""><span class="i"></span>{{!list.energy?'较低热量':list.energy}}</li>
        </ul>
      </div>
      <div class="material">
        <strong>主料 <em>{{list.peoplenum}}</em></strong>
        <p class="red" v-for="(item,index) of (list.material || '').split(',')" :key="'material-'+index">{{item}}</p>
        <strong>辅料</strong>
        <span v-for="(item,index) of step.material" :key="index">
          <em>{{item.mname}}</em>{{item.amount}}
        </span>
      </div>
      <div class="step">
        <div class="step-item" v-for="(item,i) of step.process" :key="i" v-show="i<num">
          <strong class="step-title">{{item.ptitle=="步骤1"?list.title:''}}{{item.ptitle}}</strong>
          <img class="step-img" :src="'http://127.0.0.1:3000/'+item.pic">
          <p class="step-desc">{{item.pcontent}}</p>
        </div>
        <div class="step-item" :class="none==num?'none':''">
          <strong class="step-title">{{list.title}}成品图</strong>
          <div class="done-img">
            <div class="img-big">
              <img :src="src">
            </div>
            <div class="done-img-preview">
              <div class="done-img-inner">
                <div class="img-sm" :class="activeClass==index?'active':''" v-for="(item,index) of list.finishedimg" :key="index" @click='getIndex(item.pic,index)'>
                  <img :src="'http://127.0.0.1:3000/'+item.pic">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="step-item" :class="none==num?'none':''">
          <strong class="step-title-skill">烹饪技巧</strong>
          <p class="step-desc-skill">制作蛋糕卷的蛋白不能打的非常硬，一般我会打至7-8分硬的样子，也就是步骤图中提起打蛋器，有软弯钩形成的状态即可，这样的蛋白有助于保持蛋糕片的柔韧性，方便卷起。假如不小心打的有点过，可以在抹奶油之前，轻轻的用刀在蛋糕坯上划一些划痕，但是千万不要划断哦，这样也能顺利的卷起</p>
        </div>
        <div class="seeallbtn" v-show="none==num" @click="showMore">{{txt}}</div>
        <div class="time-show">原创菜谱创建时间：2019-06-25 10:53:18</div>
      </div>
    </div>
  </div>
</template>
<script>
import imgUrl from '../assets/img/cook_detail/imgUrl.json'
export default {
  data(){
    return{
      baseImg: require('../assets/img/cook_detail/pic_00.jpg'),
      coverImgUrl: '',
      imgs: imgUrl,
      list: [],
      step:[],
      src:require('../assets/img/cook_detail/pic_00.jpg'),
      activeClass: 0,
      isShow: true,
      txt: '点击展开 ↓',
      num: 7,
      none:7,
      id: 5
    }
  },
  mounted(){
    this.onload();
  },
  methods:{
    showMore(){
      this.isShow = !this.isShow;
      this.num = this.isShow? 7: this.step.process.length;
    },
    getIndex(imgUrl,index){
        this.src = imgUrl;
        this.activeClass = index;
    },
    onload(){
      this.id = this.$route.query.lid;
      var id ={id:this.id};
      // console.log(this.id)
      this.step = this.imgs.list[0];
      var url = "product/detail";
      this.axios.get(url,{params:id}).then(result =>{
        this.list = result.data.data[0];
      })
    }
  }
}
</script>
<style lang="less" scoped>
  .cookdetail-page{
    width: 100%;
    .top-nav{
      box-sizing: border-box;
      display: flex;
      justify-content: space-between;
      height: 45px;
      width: 100%;
      position: fixed;
      left: 0px;
      top: 0px;
      z-index: 1000;
      padding: 20px 15px;
      .left,
      .right{
        height: 30px;
        padding: 0px 12px;
        font-size: 14px;
        color: #fff;
        border-radius: 15px;
        line-height: 30px;
        background: rgba(0,0,0,0.5);
      }
    }
    .detail-container{
      box-sizing: border-box;
      background: #fff;
      .img-box{
        width: 100%;
        height: 225px;
        background: #f0f0f0;
        position: relative;
        overflow: hidden;
        .img{
          box-sizing: border-box;
          width: 100%;
          height: 100%;
          background-size: cover !important;
        }
      }
      .detail{
        box-sizing: border-box;
        width: 100%;
        background: #fff4d6;
        padding: 0 15px;
        .title{
          font-size: 24px;
          color: #000;
          font-weight: 900;
          line-height: 32px;
          padding: 20px 0 6px;
        }
        >span{
          font-size: 12px;
          line-height: 20px;
          display: block;
          padding: 2px 0 15px;
          font-weight: 400;
          color: #666;
        }
        .effect{
          width: 100%;
          font-size: 12px;
          line-height: 20px;
          font-weight: 400;
          color: #eaa46e;
          padding: 2px 0 20px;
          span{
            text-decoration: underline;
            margin-right: 6px;
          }
        }
      }
      .author-desc{
        box-sizing: border-box;
        width: 100%;
        padding: 10px 15px;
        .avatarbox{
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 10px 0;
          .author-info{
            display: flex;
            justify-content: space-between;
            align-content: center;
            .author-img{
              display: block;
              height: 40px;
              width: 40px;
              border-radius: 100%;
              overflow: hidden;
              margin-right: 10px;
            }
            strong{
              display: block;
              line-height: 22px;
              font-size: 14px;
              color: #666;
              font-weight: 400;
              overflow: hidden;
              text-overflow: ellipsis;
              white-space: nowrap;
            }
            span{
              display: block;
              line-height: 18px;
              font-size: 12px;
              color: #999;
              font-weight: 400;
              overflow: hidden;
              text-overflow: ellipsis;
              white-space: nowrap;
           }
          }
          .focus{
            height: 26px;
            display: inline-block;
            border: 1px solid #ff4c39;
            line-height: 26px;
            font-size: 14px;
            color: #ff4c39;
            padding: 0px 15px;
            border-radius: 14px;
          }
        }
        .desc-text{
          font-weight: 300;
          color: #666;
          text-align: justify;
          font-size: 17px;
          color: #333;
          line-height: 25px;
          overflow: hidden;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
        }
      }
      .grade{
        padding: 20px 15px;
        border-top: 1px solid #eee;
        .points{
          height: 36px;
          line-height: 36px;
          font-size: 16px;
          color: #333;
          font-weight: 900;
          .stars{
            height: 21px;
            line-height: 21px;
            font-size: 0px;
            margin-top: 6px;
            display: inline-block;
            vertical-align: top;
            margin-left: 15px;
            span{
              display: inline-block;
              vertical-align: top;
              height: 21px;
              width: 21px;
              margin-right: 4px;
              background: url(../assets/img/icons.png) no-repeat;
            }
            .on{
              background-size: 300px 300px;
              background-position: 0px -78px;
            }
            .off{
              background-size: 300px 300px;
              background-position: -21px -78px;
            }
          }
        }
        .argsul{
          padding-top: 2px;
          li{
            width: 40%;
            display: inline-block;
            line-height: 24px;
            vertical-align: top;
            box-sizing: border-box;
          }
          .args1 .i,
          .args2 .i,
          .args3 .i,
          .args4 .i{
            display: inline-block;
            vertical-align: top;
            height: 24px;
            width: 24px;
            background: url(../assets/img/icons.png) no-repeat;
            background-size: 400px 400px;
            background-position: 0 0;
            margin-right: 4px;
          }
          .args2 .i{
            background-position: -24px -0px;
          }
          .args3 .i{
            background-position: -48px -0px;
          }
          .args4 .i{
            background-position: -72px -0px;
          }
        }
      }
      .material{
        padding: 0 15px 20px;
        strong{
          display: block;
          height: 36px;
          line-height: 36px;
          font-size: 16px;
          color: #333;
          font-weight: 900;
        }
        p{
          display: inline-block;
          color: #333;
          font-size: 16px;
          font-weight: 300;
          line-height: 24px;
          padding-bottom: 10px;
          margin-right: 6px;
        }
        .red{
          color: #ff4c39;
        }
        span{
          padding-right: 5px;
          line-height: 20px;
          color: #666;
          em{
            padding-right: 2px;
          }
        }
        span:not(:last-child)::after{
          content: "、";
        }
      }
      .step{
        box-sizing: border-box;
        width: 100%;
        overflow: hidden;
        position: relative;
        .step-item{
          box-sizing: border-box;
          width: 100%;
          .step-title,
          .step-title-skill{
            height: 44px;
            line-height: 44px;
            color: #333;
            font-size: 19px;
            padding: 30px 0px 10px;
            text-align: center;
            display: block;
            font-weight: 500;
          }
          .step-img{
            display: block;
            width: 100%;
          }
          .step-desc,
          .step-desc-skill{
            font-size: 17px;
            line-height: 25px;
            color: #333;
            font-weight: 300;
            text-align: justify;
            padding: 16px 15px;
          }
          .step-title-skill{
            text-align: left;
            padding: 30px 15px 0;
          }
          .step-desc-skill{
            padding: 0 15px 0; 
          }
          .done-img{
            width: 100%;
            .img-big{
              padding-top: 66.666666%;
              position: relative;
              overflow: hidden;
              img{
                width: 100%;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
                -webkit-transform: translate(-50%,-50%);
              }
            }
          }
          .done-img-preview{
            box-sizing: border-box;
            width: 100%;
            padding: 20px 15px;
            overflow: hidden;
            .done-img-inner{
              white-space: nowrap;
              overflow-x: auto;
              overflow-y: hidden;
              width: 100%;
              float: left;
              .img-sm{
                display: inline-block;
                line-height: 76px;
                width: 76px;
                height: 76px;
                margin: 0 5px;
                overflow: hidden;
                img{
                  vertical-align: middle;
                  width: 100%;
                  height: auto;
                  opacity: 0.4;
                }
              }
              .active img {
                opacity: 1;
              }
            }
            .done-img-inner::-webkit-scrollbar{
              display: none;
            }
          }
        }
        .none{
          display: none;
        }
        .time-show{
          font-size: 12px;
          color: #777777;
          padding: 10px 15px;
        }
        .seeallbtn{
          width: 100%;
          position: absolute;
          bottom: 0px;
          left: 0px;
          height: 80px;
          line-height: 100px;
          color: #666;
          text-align: center;
          font-size: 16px;
          background: linear-gradient(to bottom,rgba(245,245,245,0),color-stop(30%,rgba(245,245,245,0.8)),rgba(245,245,245,1));
          background: -webkit-gradient(linear,0 0,0 bottom,from(rgba(245,245,245,0)),color-stop(30%,rgba(245,245,245,0.8)),to(rgba(245,245,245,1)));
        }
      }
    }
  }
</style>
