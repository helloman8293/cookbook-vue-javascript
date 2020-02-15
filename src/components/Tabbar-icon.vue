<template>
  <div>
    <img :src="isActive?selectedImg:normalImg" alt="" class="imgStyle">
  </div>
</template>
<script>
export default {
  props:{
    isActive:{
      type:Boolean,
      default:false
    },
    selectedImg:{
      default:""
    },
    normalImg:{
      default:""
    }
  },
  data(){
    return{
      
    }
  }
}
</script>
<style scoped>
  .imgStyle{
    width: 30px;
    height: 30px;
  }
</style>
