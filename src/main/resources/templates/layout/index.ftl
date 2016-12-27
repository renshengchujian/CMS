<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>CMS首页</title>
    <link rel="stylesheet" href="static/css/index.css"/>
    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="static/css/style.css"/>
</head>
<body>
<div id="app">
    <loading-bar :progress="progress" :on-progress-done="progressDone"
                 :on-error-done="errorDone"></loading-bar>
    <transition name="bounce">
        <el-row class="panel" v-if="progress==100">
            <el-col :span="24" class="panel-top">
                <el-col :span="20" style="font-size:26px;">
                    <img src="static/image/logo4.png" class="logo"> <span>C<i
                        style="color:#20a0ff">MS</i></span>
                </el-col>
                <el-col :span="4">
                    <el-tooltip class="item tip-logout" effect="dark" content="退出"
                                placement="bottom"
                                style="padding:0px;">
                        <i class="fa fa-sign-out" aria-hidden="true" @click="logout"></i>
                    </el-tooltip>
                </el-col>
            </el-col>
            <el-col :span="24" class="panel-center">
                <aside style="width:230px;">
                    <el-menu style="border-top: 1px solid #475669;" class="el-menu-vertical-demo"
                             @select="handleSelect" theme="dark" unique-opened>
                        <el-submenu index="1" v-for="menu in menuList">
                            <template slot="title"><i class="el-icon-message"
                                                      :class="menu.icon"></i>{{menu.title}}
                            </template>
                            <el-menu-item :index="menuChild.url"
                                          v-if="menu.childrens&&menu.childrens.length>0"
                                          v-for="menuChild in menu.childrens">
                                {{menuChild.title}}
                            </el-menu-item>
                        </el-submenu>
                    </el-menu>
                </aside>
                <section class="panel-c-c">
                    <el-tabs type="border-card" :closable="true" class="el-tab-width"
                             :active-name="activeName" ref="tabFrame" v-show="tabShow"
                             @tab-click="handleClick" @tab-remove="handleRemove">
                        <el-tab-pane :label="tab.title" :name="tab.title" v-for="tab in tabList">
                            <iframe class="ui_iframe" name="iframe" :src="'./'+tab.url"
                                    frameborder="0"></iframe>
                        </el-tab-pane>
                    </el-tabs>
                </section>
            </el-col>
        </el-row>
    </transition>
</div>
</body>
<script src="static/js/vue.min.js"></script>
<script src="static/js/index.js"></script>
<script src="static/js/vue2-loading-bar.min.js"></script>
<script>
    new Vue({
        el: '#app',
        components: {
            LoadingBar: LoadingBar
        },
        data: function () {
            return {
                progress: 0,
                error: false,
                tabList: [
                    /*{
                        title: '用户管理',
                        url: '/'
                    }*/
                ],
                tabShow: false,
                activeName: '用户管理',
                menuList: [
                    {
                        title: '安全管理',
                        icon: 'el-icon-message',
                        index: '1',
                        childrens: [
                            {
                                title: '用户',
                                url: '/',
                                icon: '',
                                index: '1'
                            },
                            {
                                title: '菜单',
                                url: '/user1',
                                icon: '',
                                index: '1'
                            },
                            {
                                title: '角色',
                                url: '/user2',
                                icon: '',
                                index: '1'
                            }
                        ]
                    }
                ]
            }
        },
        mounted: function () {
            var me = this;
            me.progress = 10;
            for (var i = 0; i < 30; i++) {
                if (i > 20 && i < 29) {
                    setTimeout(function () {
                        me.progress += 5;
                    }, 50 * i);
                } else {
                    setTimeout(function () {
                        me.progress++;
                    }, 10 * i);
                }
            }
            setTimeout(function () {
                me.progress = 100;
            }, 1500);
        },
        methods: {
            // Callback
            errorDone: function () {
                this.error = false;
            },
            progressDone: function () {
                this.progress = 100;
            },
            handleSelect: function (key, keyPath) {
                this.tabShow = true;
                var menuList = this.menuList;
                var title = '';
                for (var i in menuList) {
                    if (menuList[i].childrens && menuList[i].childrens.length > 0) {
                        var childMenuList = menuList[i].childrens;
                        for (var j in childMenuList) {
                            if (childMenuList[j].url === key) {
                                title = childMenuList[j].title;
                                break;
                            }
                        }
                    }
                }
                var tabList = this.tabList;
                var isExistTitle = false;
                for (var i in tabList) {
                    if (tabList[i].title === title) {
                        isExistTitle = true;
                        break;
                    }
                }
                if (!isExistTitle) {
                    this.tabList.push({
                                          title: title,
                                          url: key
                                      });
                }
                this.activeName = title;
            },
            handleClick: function (tab, event) {
                this.activeName = tab.name;
            },
            handleRemove: function (tab, event) {
                var index = 0;
                for (var i in this.tabList) {
                    if (this.tabList[i].title === tab.name) {
                        index = i;
                        break;
                    }
                }
                this.tabList.splice(index, 1);
                if (this.tabList.length === 0) {
                    this.tabShow = false;
                }
            },
            //退出登录
            logout: function () {
                this.$confirm('确认退出吗?', '提示', {
                    type: 'warning'
                }).then(function () {
                    window.location.href="./";
                }).catch(function () {
                });
            }
        }
    })
</script>
</html>