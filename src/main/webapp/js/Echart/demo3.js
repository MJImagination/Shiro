var myChart3;
$(function () {

    // 初始化
    myChart3 = echarts.init(document.getElementById('main3'));
    //onclick事件
    myChart3.on('click', function (params) {
        alert(params.name);
    });
    option = {

        tooltip: {
            trigger: 'axis',

            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },


        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {},
        xAxis: [
            {
                type: 'category',
                data: [],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: {},
        series: []
    };
    myChart3.setOption(option);
});


function getData3(url) {
    console.log('getData');

    // 填入数据
    myChart3.showLoading();

    $.ajax({
        type: "post",
        url: url,
        dataType: "json",
        success: function (data) {
            myChart3.hideLoading();
            var series = [];
            //如果类别名为空，只显示数据
            if (data.data.legend == null) {
                for (var i = 0; i < data.data.data.length; i++) {
                    series.push({
                        type: 'bar',
                        data: data.data.data[i],
                        barWidth : 30,
                    });
                }
            } else {
                for (var i = 0; i < data.data.legend.length; i++) {
                    series.push({
                        name: data.data.legend[i],
                        type: 'bar',
                        data: data.data.data[i]
                    });
                }

            }
            myChart3.setOption({
                title: {
                    text: data.data.title
                },
                xAxis: {
                    data: data.data.xAxis,
                    axisLabel:{
                        interval:0,//横轴信息全部显示
                        rotate:-30,//-30度角倾斜显示
                    }
                },
                legend: {
                    data: data.data.legend
                },
                series: series

            })


        },
        error: function (data) {
            console.log(data);
            myChart3.hideLoading();
            alert("errr." + data);
        }
    });
}
