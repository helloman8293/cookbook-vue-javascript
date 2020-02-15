<template>
  <div class="search bg-f">
    <div class="search-top">
      <div class="search-bar">
        <div class="search-box">
          <router-link to="/" slot="left" class="back">
            <img src="" alt="">
          </router-link>
          <input type="text" placeholder="菜谱名、食材名" name="search" v-model="searchWord">
          <input type="submit" value="搜索" @click="search">
        </div>
      </div>
    </div>
    <div class="hot-search padding">
      <div class="hot-search-value">最近热搜</div>
      <div class="hot-search-box" >
        <router-link to="" class="hot-search-item" :style="item.backgroundDiv" v-for="(item,index) of hotSearch" :key="index">
          <div class="search-txt"># {{item.name}}</div>
        </router-link>
      </div>
    </div>
    <div class="search-history padding">
      <div class="search-history-top">
        <div class="hot-search-value">搜索历史</div>
        <div class="del" @click="clearSearch">删除</div>
      </div>
      <div class="recent-value-box">
        <div class="search-recent-value" v-for="(item,index) of HistoryList" :key="index" @click="goSearch(item)">{{item}}</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      searchWord: '',
      searchData: '',
      HistoryList: [],
      hotSearch:[
        {
          backgroundDiv: 'backgroundImage:url(' + require('../assets/img/index/pic_14.jpg') + ')',
          name: "糖醋排骨"
        },
        {
          backgroundDiv: 'backgroundImage:url(' + require('../assets/img/index/pic_13.jpg') + ')',
          name: "茄子"
        },
        {
          backgroundDiv: 'backgroundImage:url(' + require('../assets/img/index/pic_01.jpg') + ')',
          name: "冰淇淋"
        },
        {
          backgroundDiv: 'backgroundImage:url(' + require('../assets/img/index/pic_12.jpg') + ')',
          name: "小龙虾"
        },
        {
          backgroundDiv: 'backgroundImage:url(' + require('../assets/img/index/pic_10.jpg') + ')',
          name: "红烧肉"
        },
        {
          backgroundDiv: 'backgroundImage:url(' + require('../assets/img/index/pic_17.jpg') + ')',
          name: "下饭菜"
        },
      ],
      num: 10,
    }
  }, 
  created:function(){
    var list = JSON.parse(localStorage.getItem('HistoryList'));
      this.HistoryList=list
  },
  methods:{
    search () {
      var searchWord = this.searchWord;
      var num = this.num
      if(searchWord==''){
        this.$messagebox({
          title:"提示",
          message:"请输入菜谱名、食材名"
        })
        return;
      }else{
       this.$router.push({path:"/list", query:{keyword:searchWord, num:this.num}});
       if (this.HistoryList==null) { // 没有数据 添加
        this.HistoryList=[]
        this.HistoryList.unshift(searchWord)
      } else { // 有数据的话 判断
        if (this.HistoryList.indexOf(searchWord) !== -1) { // 有相同的，先删除 再添加 
          this.HistoryList.splice(this.HistoryList.indexOf(searchWord), 1)
          this.HistoryList.unshift(searchWord)
        } else { // 没有相同的 添加
          this.HistoryList.unshift(searchWord)
        }
      }
      if (this.HistoryList.length > 6) { // 保留六个值
        this.HistoryList.pop()
      }
      localStorage.setItem('HistoryList',JSON.stringify(this.HistoryList))
      }
    },
    clearSearch(){
      if(this.HistoryList!=null){
        this.$messagebox({
          title:"提示",
          message:"您确定要清除全部记录",
          showConfirmButton:true,
          showCancelButton:true
        }).then(result=>{
          if("cancel"==result){
            return;
          }else{
            this.HistoryList="";
            localStorage.clear();
            this.HistoryList='';
          }
        })
      }
    },
    goSearch(e){
      this.$router.push({path: "/list", query:{keyword: e,num:this.num}})
    }
  },
}
</script>
<style scoped>
  .bg-f{
    background: #fff;
  }
  .padding{
    padding: 0 15px;
  }
  .search-top{
    height: 44px;
    width: 100%;
  }
  .search-bar{
    height: 44px;
    width: 100%;
    position: fixed;
    left: 0px;
    top: 0px;
    z-index: 400;
  }
  .search-box{
    display: flex;
    height: 44px;
    padding: 6px 75px 6px 60px;
    box-sizing: border-box;
    width: 100%;
    border-bottom: 1px solid #eee;
  }
  .search-box .back{
    height: 44px;
    width: 60px;
    background: url(../assets/img/icons.png) -160px 0px no-repeat;
    background-size: 400px 400px;
    position: absolute;
    left: 0px;
    top: 0px;
    z-index: 100;
  }
  .search-box input[type="text"]{
    height: 32px;
    background: #eee;
    border-radius: 2px;
    color: #333;
    font-size: 14px;
    width: 100%;
    box-sizing: border-box;
    display: block;
    padding: 4px 8px;
    line-height: 24px;
  }
  .search-bar input[type="submit"]{
    height: 32px;
    background: #ff4c39;
    border-radius: 2px;
    color: #fff;
    font-size: 14px;
    width: 100%;
    box-sizing: border-box;
    display: block;
    line-height: 32px;
    text-align: center;
    position: absolute;
    right: 15px;
    top: 6px;
    width: 55px;
  }
  .hot-search-value{
    padding: 20px 0;
  }
  .hot-search-box{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #eee;
  }
  .hot-search-item{
    width: 31%;
    height: 75px;
    line-height: 75px;
    text-align: center;
    background: no-repeat center;
    background-size: cover;
    margin-bottom: 10px;
    overflow: hidden;
    border: 1px solid #eee;
  }
  .hot-search-item .search-txt{
    font-size: 16px;
    color: #fff;
    line-height: 75px;
    text-align: center;
  }
  .search-history-top{
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .search-history-top .del{
    font-size: 12px;
    color: #999;
    padding-top: 5px;
  }
  .recent-value-box{
    display: flex;
    flex-wrap: wrap;
  }
  .search-recent-value{
    width: 28%;
    height: 30px;
    text-align: center;
    line-height: 30px;
    border: 1px solid #eee;
    padding: 5px;
    border-radius: 5px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    margin: 0 8px 10px 0;
  }
  .search-recent-value:nth-child(3n){
    margin-right: 0;
  }
</style>