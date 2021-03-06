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
    <div class="loading-div" v-if="showLoading">
        <div class="loading-bubbles">
            <img src="static/image/loading-spinning-bubbles.svg" width="64" height="64">
        </div>
    </div>
    <el-row class="panel">
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
                <el-tabs type="border-card" class="el-tab-width"
                         :active-name="activeName" ref="tabFrame" v-show="tabShow"
                         @tab-click="handleClick">
                    <el-tab-pane :name="tab.title" v-for="tab in tabList" :key="tab.title">
                        <span slot="label">
                            <i class="el-icon-date"></i>
                            {{ tab.title }}
                            <i class="el-icon-close" @click.stop="handleRemove(tab.title)" v-show="activeName===tab.title"></i>
                        </span>
                        <iframe class="ui_iframe" name="iframe" :src="'./'+tab.url"
                                frameborder="0"></iframe>
                    </el-tab-pane>
                </el-tabs>
            </section>
        </el-col>
    </el-row>
</div>
</body>
<script src="https://unpkg.com/vue@2.1.8/dist/vue.js"></script>
<script src="static/js/index.js"></script>
<script>
    new Vue({
        el: '#app',
        mounted:function(){
            this.$nextTick(function () {
                this.showLoading = false;
            })
        },
        data: function () {
            return {
                tabList: [],
                tabShow: false,
                activeName: '',
                showLoading: true,
                menuList: [
                    {
                        title: '安全管理',
                        icon: 'el-icon-message',
                        index: '1',
                        childrens: [
                            {
                                title: '用户',
                                url: '/userSerInit',
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
        methods: {
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
            handleRemove: function (tabName) {
                this.activeName = "用户";
                var index = 0;
                for (var i in this.tabList) {
                    if (this.tabList[i].title === tabName) {
                        index = parseInt(i);
                        break;
                    }
                }
                this.tabList.splice(index, 1);

                if (this.tabList.length === 0) {
                    this.tabShow = false;
                } else if (index === this.tabList.length) {
                    this.activeName = this.tabList[index-1].title;
                } else {
                    this.activeName = this.tabList[index].title;
                }
            },
            //退出登录
            logout: function () {
                this.$confirm('确认退出吗?', '提示', {
                    type: 'warning'
                }).then(function () {
                    window.location.href = "./";
                }).catch(function () {
                });
            }
        }
    })
</script>
</html>