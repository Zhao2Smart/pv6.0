<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户</title>
    <!-- 引入bootstrap样式 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入bootstrap-table样式 -->
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- bootstrap-table.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <!-- 引入中文语言包 -->
    <script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
</head>

<body>
<div class="container body-content" style="padding-top:10px;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h2>用户列表</h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <button type="button" class="btn btn-success" onclick="window.location.href='../index'">返回首页</button>
        </div>
    </div>
    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table class="table table-hover" id="mytable"></table>
</div>
<!-- 模态框示例（Modal） -->
<form method="post" action="" class="form-horizontal" role="form" id="form_data" onsubmit="return add_form()"
      style="margin: 20px;">
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增用户
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>用户名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="username" value="" id="username"
                                       placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>密码</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="password" value="" id="password"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>

<form method="post" action="" class="form-horizontal" role="form" id="update_data" onsubmit="return update_form()"
      style="margin: 20px;">
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">
                        修改用户
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="id" name="id" value=""
                                       readonly="readonly ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username1" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>用户名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="username" value="" id="username1"
                                       placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="col-sm-3 control-label"><span
                                        style="color: red;">*</span>密码</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="password" value="" id="password1"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9">
                                <input type="hidden" class="form-control" id="status" name="status" value=""
                                       readonly="readonly ">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <#--复选框模态框-->
    <div class="modal fade" id="roleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        分配角色
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="setRole">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="roleForm()">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        //调用函数，初始化表格
        initTable();
        //删除
        $('#btn_delete').on("click", function () {
            console.log("删除")
            var row = $.map($("#mytable").bootstrapTable('getSelections'), function (row) {
                return row;
            });
            var ids = [];
            for (var i = 0; i < row.length; i++) {
                //获取自定义table 的中的checkbox值
                var id = row[i].id;   //这个是你要在列表中取的单个id
                ids.push(id); //然后把单个id循环放到ids的数组中
            }
            var str = JSON.stringify(ids);
            console.log("ids=", str)
            //批量删除：
            $.ajax({
                type: "POST",
                url: "../user/del",
                data: {"str": str},
                success: function (data) {
                    if (data.code == 1) {
                        alert('操作成功');
                        // location.reload();
                        $('#mytable').bootstrapTable('refresh');
                    } else {
                        alert('操作失败');
                    }
                },
                error: function () {
                    alert('请求出错');
                },
            });
        });
        //新增
        $('#btn_add').on("click", function () {
            console.log("新增");
            $('#addModal').modal('show');
        });
        //修改
        $('#btn_edit').on("click", function () {
            console.log("修改");
            var row = $.map($("#mytable").bootstrapTable('getSelections'), function (row) {
                return row;
            });
            if (row.length == 1) {
                for (var i = 0; i < row.length; i++) {
                    console.log(row[i].id);
                    //打开弹出框：
                    $('#updateModal').modal();
                    $("#id").val(row[i].id);
                    $("#username1").val(row[i].username);
                    $("#password1").val(row[i].password);
                    $("#status").val(row[i].status);
                }
            }
        });
    });


    function initTable() {
        $('#mytable').bootstrapTable({
            method: 'get',//请求方式
            contentType: 'application/json;charset=UTF-8',
            url: '../user/userList',//请求路径
            toolbar: '#toolbar',//工具按钮用哪个容器
            height: 500, //自定义表格的高度,
            pageNumber: 1, //初始化加载第一页
            pagination: true,//是否分页
            sidePagination: 'client',//server:服务器端分页|client：前端分页
            pageSize: 5,//单页记录数
            pageList: [5, 10, 20, 30],//可选择单页记录数
            paginationPreText: "上一页",
            paginationNextText: "下一页",
            //是否启用排序
            sortable: true,
            sortName: 'id',
            //排序方式
            sortOrder: "asc",
            responseHandler: function (res) {
                console.log("返回数据=", res)
                return res.data.rows;
                // return res.data;
            },
            columns: [{
                checkbox: true
            }, {
                title: '用户编号',
                field: 'id',
                align: 'center',
                // visible: false
            }, {
                title: '用户名',
                field: 'username',
                align: 'center',
                // visible: false
            }, {
                title: '密码',
                field: 'password',
                align: 'center',
            }, {
                title: '状态',
                field: 'status',
                align: 'center',
                // visible: false
            }, {
                title: '拥有角色',
                field: 'roleList',
                formatter: function (value, row, index) {
                    if (value == null) {
                        return '无角色';
                    } else {
                        var arr = new Array();
                        var objArr = eval(value);
                        if (objArr.length > 0) {
                            for (var i in objArr) {
                                arr.push(objArr[i].role);
                            }
                            return arr.join(',');
                        } else {
                            return '无角色'
                        }
                    }
                }
            }, {
                field: 'operate',
                title: '操作',
                align: 'center',
                events: operateEvents,
                formatter: 'operateFormatter'
            }],
            onLoadSuccess: function (json) {
                console.log("success", json);
                $("#mytable").bootstrapTable('load', json);
            },
            onLoadError: function () {
                alert("load fail")
            }
        })
    };

    function operateFormatter(value, row, index) {
        return [
            '<button type="button" id="btn_set" class="btn btn-info">分配角色</button>  ',
            '<button type="button" id="btn_clean" class="btn btn-danger">清空角色</button>'
        ].join('');
    }

    window.operateEvents = {
        'click #btn_set': function (e, value, row, index) {
            console.log("-----分配角色-----用户id=", row.id);
            localStorage.setItem("userId", row.id);
            findRole();
            $('#roleModal').modal('show');
        },
        'click #btn_clean': function (e, value, row, index) {
            console.log("-----清空角色-----用户id=", row.id);
            cleanRole(row.id);
        }
    };
    function cleanRole(id) {
        $.ajax({
            type: "POST",
            url: "../user/cleanRole",
            data: {"uid": id},
            success: function (data) {
                if (data.code == 1) {
                    alert('操作成功');
                    $('#mytable').bootstrapTable('refresh');
                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
        });
    };
    function findRole() {
        $("#setRole").empty();
        $.ajax({
            url: "../role/roleList",
            type: "get",
            success: function (data) {
                if (data.code == 1) {
                    var data = data.data.rows
                    console.log("role=", data);
                    $.each(data, function (i, item) {
                        $("#setRole").append(
                            "<label>" +
                            "<input name='items' type='checkbox' value='" + item.id + "'>" + item.role +
                            "</label><br /> ");
                    });
                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
        });
    };

    function roleForm() {
        console.log("提交分配角色");
        var userId = localStorage.getItem("userId");
        var arrs = new Array();
        $("input[name='items']:checked").each(function () {
            arrs.push($(this).val());
        });
        if (arrs.length == 0) {
            alert('请选择数据!');
            return;
        }
        var rids = arrs.join(",");
        console.log("用户uid=", userId, "角色rids=", rids);
        $.ajax({
            url: "../user/setRole",
            data: {
                "uid": userId,
                "rids": rids
            },
            type: "post",
            success: function (data) {
                if (data.code == 1) {
                    alert("操作成功");
                    $('#roleModal').modal('hide');
                    $('#mytable').bootstrapTable('refresh');
                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
        });
    };

    // 修改表单
    function update_form() {
        var d = {};
        var t = $('#update_data').serializeArray();
        $.each(t, function () {
            d[this.name] = this.value;
        });
        console.log(JSON.stringify(d));

        // 异步提交数据
        $.ajax({
            url: "../user/update",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(d),
            type: "post",
            success: function (data) {
                if (data.code == 1) {
                    alert("操作成功");
                    // location.reload();
                    $('#updateModal').modal('hide');
                    $('#mytable').bootstrapTable('refresh');
                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
        });

        return false;
    };

    // 增加表单
    function add_form() {
        var d = {};
        var t = $('#form_data').serializeArray();
        $.each(t, function () {
            d[this.name] = this.value;
        });
        console.log(JSON.stringify(d));
        // 异步提交数据
        $.ajax({
            url: "../user/add",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(d),
            type: "post",
            success: function (data) {
                if (data.code == 1) {
                    alert("添加成功");
                    // location.reload();
                    $('#addModal').modal('hide');
                    $('#mytable').bootstrapTable('refresh');

                } else {
                    alert('操作失败');
                }
            },
            error: function () {
                alert('请求出错');
            },
            complete: function () {

            }
        });

        return false;
    };
    $('#addModal').on('hide.bs.modal', function () {
        $('#form_data')[0].reset();
    });
</script>
</html>