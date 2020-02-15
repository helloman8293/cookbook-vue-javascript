<template>
  <div class="userinfo-page">
    <my-header :myTitle="myTitle" backText="返回"></my-header>
    <div class="container">
      <div class="userinfo_t">账号信息</div>
      <div class="userinfo_c">
        <div class="userinfo_item">
          <div class="item1">
            <span>邮箱：</span>
            <p>{{email}}</p>
          </div>
        </div>
        <div class="userinfo_item">
          <div class="item1"><span>昵称：</span>
            <input type="text" :value="my" name="user_name">
          </div>
        </div>
        <div class="userinfo_item">
            <div class="item2">
              <span>头像：</span>
              <div class="add_img">
                <div class="show_img">
                  <img src="https://s1.st.meishij.net/user/248/153/s9538498_148695813108383.jpg" id="upload_img_cp">
                </div>
                <input type="file" name="photos" size="1" value="浏览">
              </div>
            </div>
        </div>
      </div>
      <div class="userinfo_t">个人信息</div>
      <div class="userinfo_c">
        <div class="userinfo_item">
          <div class="item1">
            <span>性别：</span>
            <select v-model="gender">
              <option value="2">女</option>
              <option value="1">男</option>
            </select>
          </div>
        </div>
        <div class="userinfo_item">
          <div class="item1"><span>生日：</span>
            <select v-model="brithday_year">
              <option value="0">请选择</option>
              <option value="2019">2019</option>
              <option value="2018">2018</option>
              <option value="2017">2017</option>
              <option value="2016">2016</option>
              <option value="2015">2015</option>
              <option value="2014">2014</option>
              <option value="2013">2013</option>
              <option value="2012">2012</option>
              <option value="2011">2011</option>
              <option value="2010">2010</option>
              <option value="2009">2009</option>
              <option value="2008">2008</option>
              <option value="2007">2007</option>
              <option value="2006">2006</option>
              <option value="2005">2005</option>
              <option value="2004">2004</option>
              <option value="2003">2003</option>
              <option value="2002">2002</option>
              <option value="2001">2001</option>
              <option value="2000">2000</option>
              <option value="1999">1999</option>
              <option value="1998">1998</option>
              <option value="1997">1997</option>
              <option value="1996">1996</option>
              <option value="1995">1995</option>
              <option value="1994">1994</option>
              <option value="1993">1993</option>
              <option value="1992">1992</option>
              <option value="1991">1991</option>
              <option value="1990">1990</option>
              <option value="1989">1989</option>
              <option value="1988">1988</option>
              <option value="1987">1987</option>
              <option value="1986">1986</option>
              <option value="1985">1985</option>
              <option value="1984">1984</option>
              <option value="1983">1983</option>
              <option value="1982">1982</option>
              <option value="1981">1981</option>
              <option value="1980">1980</option>
              <option value="1979">1979</option>
              <option value="1978">1978</option>
              <option value="1977">1977</option>
              <option value="1976">1976</option>
              <option value="1975">1975</option>
              <option value="1974">1974</option>
              <option value="1973">1973</option>
              <option value="1972">1972</option>
              <option value="1971">1971</option>
              <option value="1970">1970</option>
              <option value="1969">1969</option>
              <option value="1968">1968</option>
              <option value="1967">1967</option>
              <option value="1966">1966</option>
              <option value="1965">1965</option>
              <option value="1964">1964</option>
              <option value="1963">1963</option>
              <option value="1962">1962</option>
              <option value="1961">1961</option>
              <option value="1960">1960</option>
              <option value="1959">1959</option>
              <option value="1958">1958</option>
              <option value="1957">1957</option>
              <option value="1956">1956</option>
              <option value="1955">1955</option>
              <option value="1954">1954</option>
              <option value="1953">1953</option>
              <option value="1952">1952</option>
              <option value="1951">1951</option>
              <option value="1950">1950</option>
              <option value="1949">1949</option>
              <option value="1948">1948</option>
              <option value="1947">1947</option>
              <option value="1946">1946</option>
              <option value="1945">1945</option>
              <option value="1944">1944</option>
              <option value="1943">1943</option>
              <option value="1942">1942</option>
              <option value="1941">1941</option>
              <option value="1940">1940</option>
              <option value="1939">1939</option>
              <option value="1938">1938</option>
              <option value="1937">1937</option>
              <option value="1936">1936</option>
              <option value="1935">1935</option>
              <option value="1934">1934</option>
              <option value="1933">1933</option>
              <option value="1932">1932</option>
              <option value="1931">1931</option>
              <option value="1930">1930</option>
              <option value="1929">1929</option>
              <option value="1928">1928</option>
              <option value="1927">1927</option>
              <option value="1926">1926</option>
              <option value="1925">1925</option>
              <option value="1924">1924</option>
              <option value="1923">1923</option>
              <option value="1922">1922</option>
              <option value="1921">1921</option>
              <option value="1920">1920</option>
            </select>
            年
            <select v-model="brithday_month">
              <option value="0">请选择</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
            </select>
            月
            <select v-model="brithday_day">
              <option value="0">请选择</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
              <option value="31">31</option>
            </select>
            日</div>
        </div>
        <div class="userinfo_item">
          <div class="item1"><span>家乡：</span>
            <select v-model="home_province">
              <option value="0" class="selcted">请选择省份</option>
              <option value="10">北京</option>
              <option value="11">上海</option>
              <option value="12">天津</option>
              <option value="13">重庆</option>
              <option value="14">河北</option>
              <option value="15">山西</option>
              <option value="16">内蒙古 </option>
              <option value="17">辽宁</option>
              <option value="18">吉林</option>
              <option value="19">黑龙江</option>
              <option value="20">江苏</option>
              <option value="21">浙江</option>
              <option value="22">安徽</option>
              <option value="23">福建</option>
              <option value="24">江西</option>
              <option value="25">山东</option>
              <option value="26">河南</option>
              <option value="27">湖北</option>
              <option value="28">湖南</option>
              <option value="29">广东</option>
              <option value="30">广西</option>
              <option value="31">海南</option>
              <option value="32">四川</option>
              <option value="33">贵州</option>
              <option value="34">云南</option>
              <option value="35">西藏</option>
              <option value="36">陕西</option>
              <option value="37">甘肃</option>
              <option value="38">青海</option>
              <option value="39">宁夏</option>
              <option value="40">新疆</option>
              <option value="41">香港</option>
              <option value="42">澳门</option>
              <option value="43">台湾</option>
              <option value="45">国外</option>
            </select>
            <select name="home_city" id="home_city" class="ded2">
              <option value="">请选择城市</option>
              <option value="1292">广州</option>
              <option value="1293">深圳</option>
              <option value="1294">珠海</option>
              <option value="1295">汕头</option>
              <option value="1296">韶关 </option>
              <option value="1297">佛山</option>
              <option value="1298">江门</option>
              <option value="1299">湛江</option>
              <option value="1300">茂名</option>
              <option value="1301">肇庆</option>
              <option value="1302">惠州</option>
              <option value="1303">梅州 </option>
              <option value="1304">汕尾</option>
              <option value="1305">河源</option>
              <option value="1306">阳江</option>
              <option value="1307">清远</option>
              <option value="1308">东莞</option>
              <option value="1309">中山</option>
              <option value="1310">潮州 </option>
              <option value="1311">揭阳</option>
              <option value="1312">云浮</option>
            </select>
          </div>
        </div>
        <div class="userinfo_item">
          <div class="item1">
            <span>所在地：</span>
            <select class="ded2" name="local_province" id="local_province">
              <option value="0" class="selcted">请选择省份</option>
              <option value="10">北京</option>
              <option value="11">上海</option>
              <option value="12">天津</option>
              <option value="13">重庆</option>
              <option value="14">河北</option>
              <option value="15">山西</option>
              <option value="16">内蒙古 </option>
              <option value="17">辽宁</option>
              <option value="18">吉林</option>
              <option value="19">黑龙江</option>
              <option value="20">江苏</option>
              <option value="21">浙江</option>
              <option value="22">安徽</option>
              <option value="23">福建</option>
              <option value="24">江西</option>
              <option value="25">山东</option>
              <option value="26">河南</option>
              <option value="27">湖北</option>
              <option value="28">湖南</option>
              <option value="29">广东</option>
              <option value="30">广西</option>
              <option value="31">海南</option>
              <option value="32">四川</option>
              <option value="33">贵州</option>
              <option value="34">云南</option>
              <option value="35">西藏</option>
              <option value="36">陕西</option>
              <option value="37">甘肃</option>
              <option value="38">青海</option>
              <option value="39">宁夏</option>
              <option value="40">新疆</option>
              <option value="41">香港</option>
              <option value="42">澳门</option>
              <option value="43">台湾</option>
              <option value="45">国外</option>
            </select>
            <select class="ded2" name="local_city" id="local_city">
              <option value="0" class="selcted">城市</option>
            </select>
          </div>
        </div>
        <div class="userinfo_item">
          <div class="item1"><span>职业：</span>
            <select name="profession" id="profession">
              <option value="学生">学生</option>
              <option value="政府职员">政府职员</option>
              <option value="教师">教师</option>
              <option value="医生">医生</option>
              <option value="营养师">营养师</option>
              <option value="摄影师">摄影师</option>
              <option value="职业厨师">职业厨师</option>
              <option value="律师">律师</option>
              <option value="会计">会计</option>
              <option value="翻译">翻译</option>
              <option value="编辑">编辑</option>
              <option value="音乐人">音乐人</option>
              <option value="演艺人">演艺人</option>
              <option value="广告人">广告人</option>
              <option value="公司文员">公司文员</option>
              <option value="IT/互联网">IT/互联网</option>
              <option value="个体商人">个体商人</option>
              <option value="全职主妇">全职主妇</option>
              <option value="其他">其他</option>
            </select>
          </div>
        </div>
      </div>
      <mt-button class="submitBtn" @click="submit">提交修改</mt-button>
    </div>
  </div>
</template>
<script>
import myHeader from './my-header'
export default {
  name:"personal",
  components:{
    myHeader
  },
  data(){
    return{
      myTitle: "个人信息",
      my: "东东",
      email:"meishi_16@meishijauto.com",
      gender:'2',
      brithday_year: '0',
      brithday_month: '0',
      brithday_day: '0',
      home_province: '0'
    }
  },
  created(){
    this.loadMore();

  },
  methods:{
    loadMore(){
    }
  }
}
</script>
<style lang="less" scoped>
  .container{
    padding-top: 50px;
    padding-bottom: 45px;
    font-size: 15px;
    .userinfo_t{
      height: 45px;
      line-height: 44px;
      color: #999;
      font-size: 14px;
      padding: 0 15px;
    }
    .userinfo_c{
      background: #fdfdfd;
      padding: 0 15px;
      .userinfo_item:last-child{
        border: 0;
      }
      .userinfo_item{
        border-bottom: 1px solid #eee;
        color: #666;
        .item1{
          box-sizing: border-box;
          display: flex;
          align-items: center;
          height: 45px;
          line-height: 45px;
          span{
            color: #333;
          }
          input{
            width: 85%;
            height: 44px;
            color: #666;
          }
          select{
            height: 44px;
            color: #666;
          }
          #gender{
            width: 85%;
          }
        }
        .item2{
          box-sizing: border-box;
          display: flex;
          padding: 10px 0;
          // align-items: center;
          span{
            color: #333;
          }
          .add_img{
            position: relative;
            border-radius: 5px;
            overflow: hidden;
            .show_img{
              width: 100px;
              height: 100px;
              img{
                width: 100%;
                height: 100%;
              }
            }
            input{
              height: 100%;
              font-size: 100%;
              position: absolute;
              left: 0px;
              top: 0px;
              opacity: 0;
            }
          }
        }
      }
    }
    .submitBtn{
      display: block;
      width: 90%;
      height: 45px;
      margin: 20px auto;
      color: #fff;
      background: #ff5151;
      text-align: center;
      padding: 0px;
    }
  }
</style>

