<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户查询</title>
    <link rel="stylesheet" href="static/css/index.css"/>
    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="static/css/style.css"/>
</head>
<body>
<div id="app">
    <el-row class="panel">
        <el-col :span="24" class="panel-top">
            <el-col :span="20" style="font-size:26px;">
                <img src="static/image/logo4.png" class="logo"> <span>C<i
                    style="color:#20a0ff">MS</i></span>
            </el-col>
            <el-col :span="4">
                <el-tooltip class="item tip-logout" effect="dark" content="退出" placement="bottom"
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
                        <template slot="title"><i class="el-icon-message" :class="menu.icon"></i>{{menu.title}}
                        </template>
                        <template v-if="menu.childrens&&menu.childrens.length>0">
                            <el-menu-item :index="menuChild.url"
                                          v-for="menuChild in menu.childrens">
                                {{menuChild.title}}
                            </el-menu-item>
                        </template>
                        <el-menu-item index="/">Table</el-menu-item>
                        <el-menu-item index="/">Form</el-menu-item>
                        <el-menu-item index="/">页面3</el-menu-item>
                    </el-submenu>
                </el-menu>
            </aside>
            <section class="panel-c-c">
                <el-tabs type="border-card" :closable="true" class="el-tab-width"
                         :active-name="activeName" ref="tab" ref="tabFrame" v-show="tabShow"
                         @tab-click="handleClick" @tab-remove="handleRemove">
                    <el-tab-pane :label="tab.title" :name="tab.title" v-for="tab in tabList">
                        <iframe class="ui_iframe" name="iframe" :src="'./'+tab.url"
                                frameborder="0"></iframe>
                    </el-tab-pane>
                </el-tabs>
            </section>
        </el-col>
    </el-row>
</div>
</body>
<script src="static/js/vue.min.js"></script>
<script src="static/js/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function () {
            return {
                tabList: [
                    {
                        title: '用户管理',
                        url: '/'
                    }
                ],
                tabShow: true,
                activeName: '用户管理',
                menuList: [
                    {
                        title: '导航一',
                        icon: 'el-icon-message',
                        index: '1',
                        childrens: [
                            {
                                title: 'table',
                                url: '/',
                                icon: '',
                                index: '1'
                            },
                            {
                                title: 'form',
                                url: '/user1',
                                icon: '',
                                index: '1'
                            },
                            {
                                title: 'tab',
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
                this.tabShow = false;
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
            handleClick: function (tab) {
                this.activeName = tab.name;
            },
            handleRemove: function (tab) {
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
                    //_this.$router.replace('/login');
                }).catch(function () {
                });

            }
        }
    })
</script>
</html>