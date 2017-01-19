<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户新增</title>
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
                showLoading: true,
                listLoading: true,
                tableData: [],
                total: 0,
                pageSize: 10,
                pageNum: 1
            }
        },
        methods: {
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