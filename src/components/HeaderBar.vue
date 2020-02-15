<template>
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
    <div class="add" @click="show">
      <img src="../assets/img/index/icon/add.png" alt="">
    </div>
    <div class="searchBox" @click="search">
        <img src="../assets/img/index/icon/search_icon.png" alt="">
        <span>搜索你感兴趣的</span>
    </div>
    <div class="email">
      <img src="../assets/img/index/icon/mail1.png" alt="">
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      isShow:false
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
    search(){
      this.$router.push({path: "/search"});
    }
  }
}
</script>
<style scoped>
  .HeaderBar{
    width: 100%;
    height: 44px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    background: #fff;
  }
  .add-content{
    position: absolute;
    top: 50px;
    left: 10px;
    background: #333;
    display: flex;
    flex-direction: column;
    justify-content: center;
    border-radius: 5px;
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
  .add-content div+div{
    border-top: 1px solid #5a5a5a;
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
  }
  .show-icon img,
  .upload-icon img{
    width: 100%;
    height: auto;
  }
  .add,
  .email{
    width: 52px;
    height: 44px;
  }
  .add>img,
  .email>img{
    width: 100%;
    height: 44px;
  }
  .searchBox{
    width: 75%;
    height: 32px;
    border-radius: 2px;
    background: #f5f5f5;
    line-height: 32px;
    color: #aaa;
    font-size: 14px;
    display: block;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .searchBox>img{
    width: 14px;
    height: 14px;
    margin-right: 5px;
  }
</style>

