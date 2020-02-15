import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Article from './views/Article.vue'
import Find from './views/Find.vue'
import Mine from './views/Mine.vue'
// import Register from './components/register.vue'
import Login from './components/login.vue'
import Share from './views/Share.vue'
import Seasonal from './components/Seasonal'
import Recommend from './components/Recommend'
import Personal from './components/personal'
import Menu from './components/Menu'
import Video from './views/Video'
import Detail from './views/Detail'
import Search from './views/Search'
import List from './views/List'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/list',
      name: 'List',
      component: List
    },
    {
      path: '/search',
      name: 'Search',
      component: Search
    },
    {
      path: '/detail',
      name: 'Detail',
      component: Detail
    },
    {
      path: '/video',
      name: 'Video',
      component: Video
    },
    {
      path: '/menu',
      name: 'Menu',
      component: Menu
    },
    {
      path: '/personal',
      name: 'Personal',
      component: Personal,
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/seasonal',
      name: 'Seasonal',
      component: Seasonal
    },
    {
      path: '/recommend',
      name: 'Recommend',
      component: Recommend
    },
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/home',
      redirect: '/'
    },
    {
      path: '/myarticle',
      name: Article,
      component: Article
    },
    {
      path: '/find',
      name: 'Find',
      component: Find
    },
    {
      path: '/mine',
      name: 'Mine',
      component: Mine
    },
    {
      path: '/share',
      name: 'Share',
      component: Share
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})
