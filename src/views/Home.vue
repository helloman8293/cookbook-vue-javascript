<template>
  <div class="home">
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="recommend">
        <my-recommend></my-recommend>
      </mt-tab-container-item>
      <mt-tab-container-item id="article">
        <my-article></my-article>
      </mt-tab-container-item>
      <mt-tab-container-item id="find">
        <my-find></my-find>
      </mt-tab-container-item>
      <mt-tab-container-item id="share">
        <my-share></my-share>
      </mt-tab-container-item>
      <mt-tab-container-item id="mine">
        <my-mine></my-mine>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- <my-tabbar class="my-tabbar"></my-tabbar> -->
    <mt-tabbar v-model="selected" class="my-tabbar" v-show="!showTabbar">
      <mt-tab-item id="recommend" @click.native="changeState(0)">
         <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_01ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_01.png')" :isActive="currentIndex[0].isSelected" ></my-tabbar-icon>
        推荐
      </mt-tab-item>
      <mt-tab-item id="article" @click.native="changeState(1)" v-show="showArticle">
        <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_02ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_02.png')" :isActive="currentIndex[1].isSelected"></my-tabbar-icon>
        文章精选
      </mt-tab-item>
      <mt-tab-item id="find" @click.native="changeState(2)">
        <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_03ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_03.png')" :isActive="currentIndex[2].isSelected"></my-tabbar-icon>
        发现
      </mt-tab-item>
      <mt-tab-item id="share" @click.native="changeState(3)" v-show="showShare">
        <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_02ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_02.png')" :isActive="currentIndex[3].isSelected"></my-tabbar-icon>
        食话
      </mt-tab-item>
      <mt-tab-item id="mine" @click.native="changeState(4)">
        <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_04ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_04.png')" :isActive="currentIndex[4].isSelected"></my-tabbar-icon>
        我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>

<script>
import myTabbar from '../components/Tabbar'
import myRecommend from '../components/Recommend'
import myArticle from './Article'
import myFind from './Find'
import myShare from './Share'
import myMine from './Mine'
import myTabbarIcon from '../components/Tabbar-icon'

export default {
  name: 'Home',
  data() {
    return {
      selected: "recommend",
      currentIndex:[
        {isSelected:true},
        {isSelected:false},
        {isSelected:false},
        {isSelected:false},
        {isSelected:false}
      ],
      showArticle:true,
      showShare:false,
      showTabbar:false
    }
  },
  components: {
    myTabbar,
    myRecommend,
    myArticle,
    myFind,
    myShare,
    myMine,
    myTabbarIcon
  },
  created() {
  },
  methods:{
    changeState(n){
      //函数功能:将当前参数下标
      //对应数组值修改true其它修改false
      //1:创建循环,循环数组中内容
      for(var i=0;i<this.currentIndex.length;i++){
        //2:判断如果循环下标与n相等 20
        if(n==2){
          this.showShare=true;
          this.showArticle=false;
        }
        if(n==0){
          this.showShare=false;
          this.showArticle=true;
        }
        if(n==i){
          this.currentIndex[i].isSelected=true;
        }else{
          this.currentIndex[i].isSelected=false;
        }
      }
    }
  }
}
</script>
<style scoped>
  .home{
    width: 100%;
    height: 100%;
  }
  .my-tabbar{
    box-sizing: border-box;
    width: 100%;
    height: 50px;
    position: fixed;
    bottom: 0;
    left: 0;
    text-align: center;
    line-height: 50px;
    overflow: hidden;
  }
  .home >>> .mint-tabbar{
    background:  #fafafa;
  }
  .home >>> .mint-tabbar .mint-tab-item-label>div{
    height: 30px;
  }
  .mineStyle{
    display: block;
    padding: 0;
    flex: 1;
    text-decoration: none;
    color: #2c3e50;
  }
  .mint-tabbar{
    padding: 3px 0;
  }
  .mint-tabbar > .mint-tab-item{
    padding: 0;
  }
 .mint-tabbar > .mint-tab-item.is-selected{
    color: #ff5151;
    background: #fafafa;
  }
</style>

