<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8"/>
    <title>CMS 登录</title>
    <link rel="stylesheet" href="static/css/index.css"/>
    <link rel="stylesheet" href="static/css/style.css"/>
    <style type="text/css">
        .card-box {
            padding: 20px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-border-radius: 5px;
            background-clip: padding-box;
            background-color: #F9FAFC;
            margin: 120px auto;
            width: 400px;
            border: 2px solid #8492A6;
        }

        .title {
            margin: 0px auto 40px auto;
            text-align: center;
            color: #505458;
        }

        .loginform {
            width: 350px;
            padding: 35px 35px 15px 35px;
        }
    </style>
</head>

<body>
<div id="app">
    <loading-bar :progress="progress" :on-progress-done="progressDone"
                 :on-error-done="errorDone"></loading-bar>
    <transition name="bounce">
        <el-form :model="loginForm" :rules="rules2" ref="loginForm" label-position="left"
                 label-width="0px" class="demo-ruleForm card-box loginform" v-if="progress==100">
            <h3 class="title">系统登录</h3>
            <el-form-item prop="username">
                <el-input type="text" v-model="loginForm.username" auto-complete="off"
                          placeholder="账号"></el-input>
            </el-form-item>
            <el-form-item prop="password">
                <el-input type="password" v-model="loginForm.password" auto-complete="off"
                          placeholder="密码"></el-input>
            </el-form-item>
            <el-checkbox v-model="checked" checked="checked" style="margin:0px 0px 35px 0px;">记住密码
            </el-checkbox>
            <el-form-item style="width:100%;">
                <el-button type="primary" style="width:100%;" v-on:click="handleSubmit">登录
                </el-button>
            </el-form-item>
        </el-form>
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
                direction: 'right',
                loginForm: {
                    username: '',
                    password: ''
                },
                rules2: {
                    username: [{
                        required: true,
                        message: '请输入用户名',
                        trigger: 'blur'
                    }],
                    password: [{
                        required: true,
                        message: '请输入密码',
                        trigger: 'blur'
                    }]
                },
                checked: true
            };
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
            handleSubmit: function (ev) {
                var _this = this;
                this.$refs.loginForm.validate(function (valid) {
                    if (valid) {
                        _this.$refs.loginForm.$el.action = "doLogin";
                        _this.$refs.loginForm.$el.submit();
                    } else {
                        return false;
                    }
                });
            }
        }
    })
</script>

</html>
