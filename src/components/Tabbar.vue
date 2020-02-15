<template>
  <div class="TabBar">
    <mt-tabbar v-model="selected">
      <mt-tab-item id="recommend" @click.native="changeState(0)">
         <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_01ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_01.png')" :isActive="currentIndex[0].isSelected" ></my-tabbar-icon>
        推荐
      </mt-tab-item>
      <mt-tab-item id="article" @click.native="changeState(1)">
        <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_02ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_02.png')" :isActive="currentIndex[1].isSelected"></my-tabbar-icon>
        文章精选
      </mt-tab-item>
      <mt-tab-item id="find" @click.native="changeState(2)">
        <my-tabbar-icon :selectedImg="require('../assets/img/tabbar/tabbar_03ed.png')" :normalImg="require('../assets/img/tabbar/tabbar_03.png')" :isActive="currentIndex[2].isSelected"></my-tabbar-icon>
        发现
      </mt-tab-item>
      <mt-tab-item id="share" @click.native="changeState(3)">
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
import myTabbarIcon from './Tabbar-icon'

export default {
  data(){
    return{
      selected: "recommend",
      currentIndex:[
        {isSelected:true},
        {isSelected:false},
        {isSelected:false},
        {isSelected:false},
        {isSelected:false}
      ]
    }
  },
  methods:{
    changeState(n){
      //函数功能:将当前参数下标
      //对应数组值修改true其它修改false
      //1:创建循环,循环数组中内容
      for(var i=0;i<this.currentIndex.length;i++){
        //2:判断如果循环下标与n相等 20
        if(n==i){
          this.currentIndex[i].isSelected=true;
        }else{
          this.currentIndex[i].isSelected=false;
        }
      }
    }
  },
  components:{
    myTabbarIcon
  }
}
</script>
<style scoped>
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