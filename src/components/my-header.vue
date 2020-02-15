<template>
  <div class="my-header">
    <mt-header :title="myTitle" fixed class="myHeader">
      <!-- <router-link to="find" slot="left"> -->
        <mt-button icon="back" class="back" slot="left" @click="goback">{{backText}}</mt-button>
      <!-- </router-link> -->
    </mt-header>
  </div>
</template>
<script>
export default {
  props:{
    myTitle:{default:""},
    backText:{default:""},
    goback:{type:Function}
  },
  data(){
    return{}
  }
}
</script>
<style scoped>
  .myHeader{
    width: 100%;
    height: 50px;
    background: #fdfdfd;
    color: #000;
    font-size: 18px;
    padding: 0 15px;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 999;
  } 
  .myHeader .back,
  .myHeader .reg,
  .myHeader .login{
    font-size: 16px;
    color: #ff5151;
  }
  .back >>> .mintui{
    font-size: 22px;
    font-weight: bold;
  }
</style>
