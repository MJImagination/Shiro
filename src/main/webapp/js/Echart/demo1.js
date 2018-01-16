var myChart;
$(function () {
// 显示标题，图例和空的坐标轴
    myChart = echarts.init(document.getElementById('main'));
    myChart.on('click', function (params) {
        alert(params.name);
    });
    myChart.setOption({
        title: {
            text: 'MJ异步示例1'
        },
        toolbox: {
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        tooltip: {},
        legend: {
            data: ['销量']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: []
        }]
    });

});


function getData(url) {
    console.log('getData');

    // 填入数据
    myChart.showLoading();

    $.ajax({
        type: "post",
        url: url,
        dataType: "json",
        success: function(data) {
            console.log(data);
            myChart.hideLoading();
            myChart.setOption({
                xAxis: {
                    data: data.categories
                },
                series: [{
                    // 根据名字对应到相应的系列
                    name: '销量',
                    data: data.data
                }]
            })

        },
        error: function(data) {
            console.log(data);
            myChart.hideLoading();
            alert("errr调用失败...."+ data);
        }
    });
}