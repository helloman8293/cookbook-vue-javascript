<template>
  <div class="seasonal-page" v-show="showFindPage">
    <my-header :myTitle="myTitle" backText="发现" :goback="goback" @click="$parent.$parent.showFindPage = false"></my-header>
    <mt-navbar class="my-navbar" v-model="selected" fixed>
      <mt-tab-item id="vegetable">蔬菜</mt-tab-item>
      <mt-tab-item id="fruit">水果</mt-tab-item>
      <mt-tab-item id="meat">肉类</mt-tab-item>
      <mt-tab-item id="corn">五谷</mt-tab-item>
    </mt-navbar>

    <!-- tab-container -->
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="vegetable">
        <div class="seasonal-list">
          <div class="list-item" v-for="(item,i) of vegetableList.slice(0,p1)" :key="i">
            <div class="item-img">
              <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
            </div>
            <div class="item-info">
              <h2>{{item.fname}}</h2>
              <div class="effect">
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <!-- <span>预防贫血</span>
                <span>强健胃粘膜</span>
                <span>强健胃粘膜</span> -->
              </div>
              <div class="energy" :class="item.energy=='较高热量'?high:item.energy=='中等热量'?mid:low">{{item.energy}}</div>
            </div>
          </div>
          <div class="load-more" v-if="p1<vegetableList.length" @click='showMoreVegetable' >点击加载更多</div>
          <div class="load-more" v-else>没有更多了</div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="fruit">
         <div class="seasonal-list">
          <div class="list-item" v-for="(item,i) of fruitList.slice(0,p2)" :key="i">
            <div class="item-img">
              <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
            </div>
            <div class="item-info">
              <h2>{{item.fname}}</h2>
              <div class="effect">
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <!-- <span>预防贫血</span>
                <span>强健胃粘膜</span>
                <span>强健胃粘膜</span> -->
              </div>
              <div class="energy" :class="item.energy=='较高热量'?high:item.energy=='中等热量'?mid:low">{{item.energy}}</div>
            </div>
          </div>
          <div class="load-more" v-if="p2<fruitList.length" @click='showMoreFruit' >点击加载更多</div>
          <div class="load-more" v-else>没有更多了</div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="meat">
         <div class="seasonal-list">
          <div class="list-item" v-for="(item,i) of meatList.slice(0,p3)" :key="i">
            <div class="item-img">
              <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
            </div>
            <div class="item-info">
              <h2>{{item.fname}}</h2>
              <div class="effect">
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
              </div>
              <div class="energy" :class="item.energy=='较高热量'?high:item.energy=='中等热量'?mid:low">{{item.energy}}</div>
            </div>
          </div>
          <div class="load-more" v-if="p3<meatList.length" @click='showMoreMeat' >点击加载更多</div>
          <div class="load-more" v-else>没有更多了</div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="corn">
         <div class="seasonal-list">
          <div class="list-item" v-for="(item,i) of cornList.slice(0,p4)" :key="i">
            <div class="item-img">
              <img :src="'http://127.0.0.1:3000/'+item.img" alt="">
            </div>
            <div class="item-info">
              <h2>{{item.fname}}</h2>
              <div class="effect">
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
                <span>{{item.effect}}</span>
              </div>
              <div class="energy" :class="item.energy=='较高热量'?high:item.energy=='中等热量'?mid:low">{{item.energy}}</div>
            </div>
          </div>
          <div class="load-more" v-if="p4<cornList.length" @click='showMoreCorn' >点击加载更多</div>
          <div class="load-more" v-else>没有更多了</div>
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import myHeader from './my-header'
export default {
  props:{
    showFindPage:{
      type: Boolean
    }
  },
  name:"seasonal",
  components:{
    myHeader
  },
  data(){
    return{
      myTitle: "当季食材",
      selected: "vegetable",
      low:"low",
      mid:"mid",
      high:"high",
      energy:"较低热量",
      vegetableList:[],
      fruitList:[],
      meatList:[],
      cornList:[],
      p1:6,
      p2:6,
      p3:6,
      p4:6,
      childValue: '我是子组件的数据'
    }
  },
  created(){
    this.loadMore();

  },
  methods:{
    goback(){
      // this.findPage=false,
      // this.seasonalPage=true
      this.$emit('update:showFindPage', false);
    },
    showMoreCorn(){
      this.p4+=10;
    },
    showMoreMeat(){
      this.p3+=10;
    },
    showMoreFruit(){
      this.p2+=10;
    },
    showMoreVegetable(){
      this.p1+=10;
    },
    loadMore(){
      var url="product/seasonal";
      // var obj={ids:str};
      this.axios.get(url).then(result=>{
        this.list=result.data.data;
        // console.log(this.list);
        var list=this.list;
        var foodList=[];
        for(var i = 0; i < list.length; i++) {
          if(!foodList[list[i].family_id]) {
            var arr = [];
            arr.push(list[i]);
            foodList[list[i].family_id] = arr;
          }else {
            foodList[list[i].family_id].push(list[i])
          }
        }
        // console.log(foodList);
        this.vegetableList=foodList[1];
        this.fruitList=foodList[2];
        this.meatList=foodList[3];
        this.cornList=foodList[4];

      })
    }
  }
}
</script>
<style lang="less" scoped>
  .my-navbar{
    margin-top: 50px;
    .mint-tab-item.is-selected{
      border-bottom: 2px solid #ff5151;
      color: #ff5151;
      margin: 0;
    }
  }
  .seasonal-list{
    padding-top: 115px;
    padding-bottom: 50px;
    .list-item{
      display: flex;
      align-items: center;
      padding: 10px 15px;
      box-sizing: border-box;
      border-bottom: 1px solid #e6e6e6;
      .item-img{
        width: 90px;
        height: 90px;
        img{
          width: 100%;
          vertical-align: middle;
        }
      }
      .item-info{
        width: 70%;
        margin-left: 10px;
        h2{
          font-size: 16px;
          line-height: 28px;
          color: #000;
        }
        .effect{
          // width: 100%;
          // font-size: 0;
          margin-top: 4px;
          height: 28px;
          overflow: hidden;
          > span{
            display: block;
            float: left;
            background: #e8e8e8;
            color: #686868;
            padding: 0px 10px;
            font-size: 14px;
            margin: 2px;
            line-height: 28px;
            height: 28px;
          }
        }
        .energy{
          height: 26px;
          line-height: 26px;
          // color: #999;
          font-size: 14px;
          margin-top: 2px;
          padding-left: 22px;
        }
        .low{
          background: url(../assets/img/seasonal/p_con_icon01.png) left center no-repeat;
          color: #46c01b;
          background-size: 18px 18px;
        }
        .mid{
          color: #ffcc00;
          background: url(../assets/img/seasonal/p_con_icon02.png) left center no-repeat;
          background-size: 18px 18px;
        }
        .high{
          color: #ff5151;
          background: url(../assets/img/seasonal/p_con_icon03.png) left center no-repeat;
          background-size: 18px 18px;
        }
      }
    }
    .load-more{
      width: 100%;
      color: #ff5151;
      text-align: center;
      padding: 20px 0;
    }
  }
  
</style>
