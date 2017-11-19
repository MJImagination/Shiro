<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>/js/jquery-easyui-1.5.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>/js/jquery-easyui-1.5.1/themes/icon.css">

    <script type="text/javascript"
            src="<%=basePath%>/js/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>/js/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>/js/right_menu.js"></script>
</head>

<body class="easyui-layout">
<div data-options="region:'north'" style="height:50px"></div>
<div data-options="region:'south',split:true" style="height:50px;"></div>
<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>
<div data-options="region:'west',split:true" title="West" style="width:180px;">
    <div class="easyui-accordion" data-options="fit:true,border:false">
        <div title="Title1" style="padding:10px;" data-options="selected:true">
            <ul id="tree" class="easyui-tree" data-options="url:'<%=basePath%>/js/jquery-easyui-1.5.1/demo/tree/tree_data1.json',method:'get',animate:true"></ul>
        </div>
        <div title="Title2" data-options="selected:true" style="padding:10px;">
            content2
        </div>
        <div title="Title3" style="padding:10px">
            content3
        </div>
    </div>

</div>
<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
    <div id="tabs" class="easyui-tabs" data-options="tools:'#tab-tools'">
        <div title="主页" data-options="iconCls:'icon-house'" style="padding: 10px; height: 100%;">主页</div>
    </div>

    <div id="tab-tools">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="addPanel()"></a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="removePanel()"></a>
    </div>


    <div class="easyui-tabs" style="width:700px;height:250px">
        <div title="About" style="padding:10px">
            <p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
            <ul>
                <li>easyui is a collection of user-interface plugin based on jQuery.</li>
                <li>easyui provides essential functionality for building modem, interactive, javascript applications.</li>
                <li>using easyui you don't need to write many javascript code, you usually defines user-interface by writing some HTML markup.</li>
                <li>complete framework for HTML5 web page.</li>
                <li>easyui save your time and scales while developing your products.</li>
                <li>easyui is very easy but powerful.</li>
            </ul>
        </div>
        <div title="My Documents" style="padding:10px">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
        </div>
        <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
            This is the help content.
        </div>
    </div>
    <table class="easyui-datagrid"
           data-options="url:'<%=basePath%>/js/jquery-easyui-1.5.1/demo/accordion/datagrid_data1.json',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
        <thead>
        <tr>
            <th data-options="field:'itemid'" width="80">Item ID</th>
            <th data-options="field:'productid'" width="100">Product ID</th>
            <th data-options="field:'listprice',align:'right'" width="80">List Price</th>
            <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
            <th data-options="field:'attr1'" width="150">Attribute</th>
            <th data-options="field:'status',align:'center'" width="60">Status</th>
        </tr>
        </thead>
    </table>
</div>
<div id="adminmm" class="easyui-menu" style="width: 150px;">
    <div id="refresh" data-options="iconCls:'icon-reload'">刷新</div>
    <div class="menu-sep"></div>
    <div id="closeall">全部关闭</div>
</div>

<div id="mm" class="easyui-menu" style="width: 150px;">
    <div id="refresh" data-options="iconCls:'icon-reload'">刷新</div>
    <div class="menu-sep"></div>
    <div id="close">关闭</div>
    <div id="closeall">全部关闭</div>
    <div id="closeother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="closeright">当前页右侧全部关闭</div>
    <div id="closeleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
    <div id="exit">退出</div>
</div>



<script type="text/javascript">
    var index = 0;
    function addPanel() {
        index++;
        $('#tabs').tabs('add', {
            title: 'Tab' + index,
            content: '<div style="padding:10px">Content' + index + '</div>',
            closable: true
        });
        $("#tabs").bind('contextmenu',function(e){
            e.preventDefault();
        });
    }
    function removePanel() {
        var tab = $('#tabs').tabs('getSelected');
        if (tab) {
            var index = $('#tabs').tabs('getTabIndex', tab);
            $('#tabs').tabs('close', index);
        }
    }

    function addTab(title, url){
        if ($('#tabs').tabs('exists', title)){
            $('#tabs').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tabs').tabs('add',{
                title:title,
                content:content,
                closable:true
            });
        }
    }
    //树点击事件
    $("#tree").tree({
        onClick:function(node){
            if($('#tree').tree('isLeaf',node.target)){//判断是否是叶子节点
                //alert(node.target)  ;
                addTab(node.text,node.url);
            }

        }
    });
    //右键菜单click
    $("#mm").menu({
        onClick: function (item) {
            alert(item.name);
            //closeTab(this, item.name);
        }
    });



</script>
</body>
</html>
