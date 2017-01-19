<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户查询</title>
    <link rel="stylesheet" href="static/css/index.css"/>
    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="static/css/commonPage.css"/>
</head>
<body>
<div id="servicePage">
    <div class="loading-div" v-if="showLoading">
        <div class="loading-bubbles">
            <img src="static/image/loading-spinning-bubbles.svg" width="64" height="64">
        </div>
    </div>
    <el-col :span="20" class="toolbar">
        <el-button-group>
            <el-button type="success" icon="plus">新增</el-button>
            <el-button type="warning" icon="edit">修改</el-button>
            <el-button type="danger" icon="delete">删除</el-button>
        </el-button-group>
    </el-col>
    <el-col :span="4" class="toolbar">
        <el-button type="primary" :icon="showQuery? 'arrow-up':'arrow-down'"
                   @click="showQuery = !showQuery"></el-button>
    </el-col>



    <transition name="fade">
        <el-form :model="formData" label-width="60px" label-position="left" v-show="showQuery"
                 method="post">
            <el-col span="6">
                <el-form-item label="用户名" class="toolbar">
                    <el-input v-model="formData.userName" placeholder="用户名"></el-input>
                </el-form-item>
            </el-col>
            <el-col span="6" offset="2">
                <el-form-item label="姓名" class="toolbar">
                    <el-input v-model="formData.userRelName" placeholder="姓名"></el-input>
                </el-form-item>
            </el-col>
            <el-col span="2">
                <el-form-item style="padding: 4px 0px">
                    <el-button type="info">查询</el-button>
                </el-form-item>
            </el-col>
        </el-form>
    </transition>

    <el-table :data="tableData" highlight-current-row stripe border v-loading="listLoading"
              style="width: 100%;">
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column prop="userName" label="用户名" align="center" min-width="180">
        </el-table-column>
        <el-table-column prop="userStatus" label="用户状态" align="center" min-width="180"
                         sortable>
            <template scope="scope">
                <el-tag :type="scope.row.userStatus === '0' ? 'success' : 'danger'"
                        close-transition>
                    {{scope.row.userStatus === '0' ? '启用' : '禁用'}}
                </el-tag>
            </template>
        </el-table-column>
        <el-table-column prop="userRelName" label="姓名" align="center" min-width="180">
        </el-table-column>
        <el-table-column prop="mobileNum" label="手机号码" align="center" min-width="180">
        </el-table-column>
        <el-table-column prop="email" label="邮箱" align="center" min-width="180"></el-table-column>
    </el-table>

    <el-pagination class="pagination" @size-change="handleSizeChange"
                   @current-change="handleCurrentChange" :current-page="pageNum"
                   :page-sizes="[10, 20, 50, 100]" :page-size="pageSize"
                   layout="total, sizes, prev, pager, next, jumper" :total="total">
    </el-pagination>
</div>
</body>
<script src="static/js/vue.min.js"></script>
<script src="static/js/index.js"></script>
<script src="static/js/axios.min.js"></script>
<script>
    new Vue({
        el: '#servicePage',
        mounted: function () {
            this.$nextTick(function () {
                this.showLoading = false;
                this.fetchData();
            })
        },
        data: function () {
            return {
                showQuery: true,
                showLoading: true,
                listLoading: true,
                tableData: [],
                formData: {
                    userName: '',
                    userRelName: ''
                },
                total: 0,
                pageSize: 10,
                pageNum: 1
            }
        },
        methods: {
            editRow: function () {

            },
            handleSizeChange: function (val) {
                this.pageSize = val;
                this.fetchData();
            },
            handleCurrentChange: function (val) {
                this.pageNum = val;
                this.fetchData();
            },
            fetchData: function () {
                var _this = this;
                _this.listLoading = true;
                axios.get('userSer', {
                    params: {
                        pageSize: _this.pageSize,
                        pageNum: _this.pageNum
                    }
                }).then(function (response) {
                    _this.tableData = response.data.rows;
                    _this.total = response.data.total;
                    _this.listLoading = false;
                }).catch(function (error) {
                    console.log(error);
                });
            }
        }
    });
</script>
</html>