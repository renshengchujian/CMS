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
            /*box-shadow: 0 0px 8px 0 rgba(0, 0, 0, 0.06), 0 1px 0px 0 rgba(0, 0, 0, 0.02);*/
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-border-radius: 5px;
            background-clip: padding-box;
            margin-bottom: 20px;
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
    <el-form :model="loginForm" :rules="rules2" ref="loginForm" label-position="left"
             label-width="0px" class="demo-ruleForm card-box loginform">
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
            <el-button type="primary" style="width:100%;" v-on:click="handleSubmit">登录</el-button>
        </el-form-item>
    </el-form>
</div>
</body>
<script src="static/js/vue.min.js"></script>
<script src="static/js/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function () {
            return {
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
        methods: {
            handleSubmit: function (ev) {
                var _this = this;
                this.$refs.loginForm.validate(function (valid) {
                    if (valid) {
                        _this.$refs.loginForm.$el.action = "userSer";
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
