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
                <img src="static/image/logo4.png" class="logo"> <span>C<i style="color:#20a0ff">MS</i></span>
            </el-col>
            <el-col :span="4">
                <el-tooltip class="item tip-logout" effect="dark" content="退出" placement="bottom" style="padding:0px;">
                    <i class="fa fa-sign-out" aria-hidden="true" v-on:click="logout"></i>
                </el-tooltip>
            </el-col>
        </el-col>
        <el-col :span="24" class="panel-center">
            <aside style="width:230px;">
                <#--<h5 class="admin"><i class="fa fa-user" aria-hidden="true" style="margin-right:5px;"></i>欢迎系统管理员：测试</h5>-->
                <el-menu style="border-top: 1px solid #475669;" default-active="/table" class="el-menu-vertical-demo" @open="handleopen"
                         @close="handleclose" @select="handleselect" theme="dark" unique-opened router>
                    <el-submenu index="1">
                        <template slot="title"><i class="el-icon-message"></i>导航一</template>
                        <el-menu-item index="/table">Table</el-menu-item>
                        <el-menu-item index="/form">Form</el-menu-item>
                        <el-menu-item index="/page3">页面3</el-menu-item>
                    </el-submenu>
                    <el-submenu index="2">
                        <template slot="title"><i class="fa fa-id-card-o"></i>导航二</template>
                        <el-menu-item index="/page4">选项4</el-menu-item>
                        <el-menu-item index="/page5">选项5</el-menu-item>
                    </el-submenu>
                    <el-menu-item index="/page6"><i class="fa fa-line-chart"></i>导航三</el-menu-item>

                </el-menu>
            </aside>
            <section class="panel-c-c">
                <div class="grid-content bg-purple-light">
                    <el-col :span="24" style="margin-bottom:15px;">
                        <strong style="width:200px;float:left;color: #475669;">{{currentPathName}}</strong>
                        <el-breadcrumb separator="/" style="float:right;">
                            <el-breadcrumb-item :to="{ path: '/table' }">首页</el-breadcrumb-item>
                            <el-breadcrumb-item>{{currentPathNameParent}}</el-breadcrumb-item>
                            <el-breadcrumb-item>{{currentPathName}}</el-breadcrumb-item>
                        </el-breadcrumb>
                    </el-col>
                    <el-col :span="24" style="background-color:#fff;box-sizing: border-box;">
                        <transition name="fade">
                            <router-view></router-view>
                        </transition>
                    </el-col>
                </div>
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
                currentPathName: 'Table',
                currentPathNameParent: '导航一',
                form: {
                    name: '',
                    region: '',
                    date1: '',
                    date2: '',
                    delivery: false,
                    type: [],
                    resource: '',
                    desc: ''
                }
            }
        },
        methods: {
            onSubmit: function () {
                console.log('submit!');
            },
            handleopen: function () {
                //console.log('handleopen');
            },
            handleclose: function () {
                //console.log('handleclose');
            },
            handleselect: function (a, b) {
            },
            //退出登录
            logout: function () {

            }
        }
    })
</script>
</html>