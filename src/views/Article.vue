<template>
  <div class="article">
    <div class="article_title">为你推荐</div>
    <div class="list">
      <div class="list-item" v-for="(item,i) of list" :key="i">
        <div class="content-text">
          <div class="content-title line-clamp-3">{{item.theme}}</div>
          <div class="viewdata">
            <img src="../assets/img/article/read_icon.png">
            <span>{{item.view_data}}</span>
            <span>{{item.release_date | dateFormat('YYYY-MM-DD')}}</span>
          </div>
        </div>
        <div class="content-img">
          <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name:'myarticle',
  data(){
    return{
      list:[],
      date: new Date()
    }
  },
  created(){
    this.loadMore()
  },
  filters: {
    dateFormat(dateStr,time){
      var date = new Date(dateStr);
      var year = date.getFullYear();
      var month = date.getMonth()+1<10 ? '0'+ (date.getMonth()+1) : date.getMonth()+1;
      var day = date.getDate()<10 ? '0' + date.getDate() : date.getDate();
      var hh = date.getHours()<10 ? '0' + date.getHours() : date.getHours();
      var mm = date.getMinutes()<10 ? '0' + date.getMinutes() : date.getMinutes();
      var ss = date.getSeconds()<10 ? '0' + date.getSeconds() : date.getSeconds();
      
      if(time&&time.toLowerCase() === 'yyyy-mm-dd'){
          return `${year}-${month}-${day}`;
      }else if(time&&time.toLowerCase() === 'hh:mm:ss'){
          return `${hh}:${mm}:${ss}`;
      }else{
          return `${year}-${month}-${day} ${hh}:${mm}:${ss}`;
      }
    }
  },
  methods:{
    loadMore(){
      var url="product/article";
      this.axios.get(url).then(result=>{
      this.list=result.data.data;
        // console.log(this.list);
      });
    }
  }
}
</script>
<style scoped>
  .article{
    background: #fff;
    padding-bottom: 58px;
  }
  .article_title {
    display: block;
    padding: 30px 15px 10px;
    height: 22px;
    color: #333;
    line-height: 22px;
    font-size: 20px;
    border-radius: 11px;
    font-weight: 900;
    text-align: left;
  }
  .list{
    padding: 0 15px;
  }
  .list-item{
    box-sizing: border-box;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 0;
    border-bottom: 1px solid rgba(0,0,0,0.05)
  }
  .content-text{
    width: 65%;
    padding-right: 15px;
  }
  .content-title{
    box-sizing: border-box;
    font-size: 16px;
    font-weight: 400;
    line-height: 20px;
  } 
  .line-clamp-3{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    white-space: normal;
  }
  .viewdata{
    height: 16px;
    line-height: 16px;
    padding-top: 9px;
  }
  .viewdata img{
    display: inline-block;
    vertical-align: top;
    height: 13px;
    width: 13px;
    margin-top: 2px;
  }
  .viewdata span{
    display: inline-block;
    vertical-align: top;
    font-size: 9px;
    color: #666;
    margin: 0 15px 0 3px;
    font-weight: 400;
  }
  .content-img{
    width: 114px;
    height: 85px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    overflow: hidden;
  }
  .content-img img{
    width: 100%;
    height: 100%;
  }
</style>