<template>
  <div class="sider">
    <mt-swipe :auto="0">
      <mt-swipe-item>
        <div class="breakfast">
          <div class="breakfast-item" v-for="(item,i) in breakfastList" :key="i">
            <router-link :to="{path:'/detail',query:{lid:item.cid}}" class="img-div">
              <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
            </router-link>
            <div class="text">
              <strong text-title>{{item.title}}</strong>
              <p text-subtitle>{{item.subtitle}}</p>
            </div>
          </div>
          <h3 class="title">早餐</h3>
          <p class="subtitle">元气早餐，开启美好的一周</p>
        </div>
      </mt-swipe-item>
      <mt-swipe-item>
        <div class="lunch">
          <div class="breakfast-item" v-for="(item,i) in lunchList" :key="i">
            <router-link :to="{path:'/detail',query:{lid:item.cid}}" class="img-div">
              <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
            </router-link>
            <div class="text">
              <strong text-title>{{item.title}}</strong>
              <p text-subtitle>{{item.subtitle}}</p>
            </div>
          </div>
          <h3 class="title">午餐</h3>
          <p class="subtitle">午餐，要颜值，也要营养</p>
        </div>
      </mt-swipe-item>
      <mt-swipe-item>
        <div class="high-tea">
          <div class="breakfast-item" v-for="(item,i) in teaList" :key="i">
            <router-link :to="{path:'/detail',query:{lid:item.cid}}" class="img-div">
              <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
            </router-link>
            <div class="text">
              <strong text-title>{{item.title}}</strong>
              <p text-subtitle>{{item.subtitle}}</p>
            </div>
          </div>
          <h3 class="title">下午茶</h3>
          <p class="subtitle">下午茶简单做，成就感爆棚</p>
        </div>
      </mt-swipe-item>
      <mt-swipe-item>
        <div class="dinner">
          <div class="breakfast-item" v-for="(item,i) in dinnerList" :key="i">
            <router-link :to="{path:'/detail',query:{lid:item.cid}}" class="img-div">
              <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
            </router-link>
            <div class="text">
              <strong text-title>{{item.title}}</strong>
              <p text-subtitle>{{item.subtitle}}</p>
            </div>
          </div>
          <h3 class="title">晚餐</h3>
          <p class="subtitle">懒人晚餐拯救上班族</p>
        </div>
      </mt-swipe-item>
      <mt-swipe-item>
        <div class="late-snack">
          <div class="breakfast-item" v-for="(item,i) in lateSnackList" :key="i">
            <router-link :to="{path:'/detail',query:{lid:item.cid}}" class="img-div">
              <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
            </router-link>
            <div class="text">
              <strong text-title>{{item.title}}</strong>
              <p text-subtitle>{{item.subtitle}}</p>
            </div>
          </div>
          <h3 class="title">宵夜</h3>
          <p class="subtitle">何以解馋？唯有宵夜</p>
        </div>
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],
      breakfastList:[],
      lunchList:[],
      teaList:[],
      dinnerList:[],
      lateSnackList:[],
      pno:0,
      count:3
    }
  },
  created(){
    this.loadMore();
  },
  methods:{
    loadMore(){
      var url="product/sider";
      // var obj={pno:this.pno,count:this.count};
      this.axios.get(url).then(result=>{
        // this.list=result.data.data;
        var rows=this.list.concat(result.data.data);
        this.list=rows;
        // console.log(this.list);
        var list=this.list;
        var foodList=[];
        for(var i = 0; i < list.length; i++) {
          if(!foodList[list[i].class_id]) {
            var arr = [];
            arr.push(list[i]);
            foodList[list[i].class_id] = arr;
          }else {
            foodList[list[i].class_id].push(list[i])
          }
        }
        // console.log(foodList);
        this.breakfastList=foodList[1];
        this.lunchList=foodList[2];
        this.teaList=foodList[3];
        this.dinnerList=foodList[4];
        this.lateSnackList=foodList[5];
      })
    }
  }
}
</script>
<style scoped>
  .sider{
    box-sizing: border-box;
    width: 100%;
    padding-bottom: 10px;
  }
  .mint-swipe{
    overflow: hidden;
    position: relative;
    width: 100%;
    height: 515px;
  }
  .mint-swipe-item{
    box-sizing: border-box;
    text-align: center;
    vertical-align: middle;
    padding: 0 10px;
  }
  .sider>>>.mint-swipe-indicator{
    width: 5px;
    height: 5px;
  }
  .sider>>>.mint-swipe-indicator.is-active{
    background:#ff5151;
    opacity: 1;
  }
  .breakfast-item{
    width: 100%;
    height: 140px;
    overflow: hidden;
    border-radius: 8px;
    position: relative;
    margin-bottom: 4px
  }
  .img-div{
    width: 100%;
    height: 140px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    overflow: hidden;
  }
  .img-div img{
    display: block;
    width: 100%;
  }
  .text{
    position: absolute;
    left: 20px;
    bottom: 15px;
    color: #fff;
    text-shadow: 0px 1px 0px rgba(0,0,0,0.7);
    text-align: left;
  }
  .text>>>strong{
    font-size: 20px;
    font-weight: bold;
    line-height: 40px;
  }
  .text>>>p{
    font-size: 12px;
  }
  .title{
    width: 100%;
    line-height: 20px;
    font-size: 16px;
    color: #333;
    text-align: center;
    padding-top: 12px;
  }
  .subtitle{
    width: 100%;
    line-height: 20px;
    font-size: 12px;
    color: #333;
    text-align: center;
  }
</style>