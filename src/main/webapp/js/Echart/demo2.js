var myChart2;
$(function () {
    // 初始化
    myChart2 = echarts.init(document.getElementById('main2'));
    //onclick事件
    myChart2.on('click', function (params) {
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

        title: {
            text: 'MJ异步示例2'
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {
            data:['蒸发量','降水量','平均温度']
        },
        xAxis: [
            {
                type: 'category',
                data: [],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '水量',
                min: 0,
                max: 250,
                interval: 50,
                axisLabel: {
                    formatter: '{value} ml'
                }
            },
            {
                type: 'value',
                name: '温度',
                min: 0,
                max: 25,
                interval: 5,
                axisLabel: {
                    formatter: '{value} °C'
                }
            }
        ],
        series: [
            {
                name:'蒸发量',
                type:'bar',
                data:[]
            },
            {
                name:'降水量',
                type:'bar',
                data:[]
            },
            {
                name:'平均温度',
                type:'line',
                yAxisIndex: 1,
                data:[]
            }
        ]
    };
    myChart2.setOption(option);


});


function getData2(url) {
    console.log('getData');

    // 填入数据
    myChart2.showLoading();

    $.ajax({
        type: "post",
        url: url,
        dataType: "json",
        success: function(data) {
            console.log(data);
            myChart2.hideLoading();
            myChart2.setOption({
                xAxis: {
                    data: data.categories
                },
                series: [
                    {
                    // 根据名字对应到相应的系列
                    name: '蒸发量',
                    data: data.data[0]
                    },
                    {
                        // 根据名字对应到相应的系列
                        name: '降水量',
                        data: data.data[1]
                    },
                    {
                        // 根据名字对应到相应的系列
                        name: '平均温度',
                        data: data.data[2]
                    },
                ]
            })

        },
        error: function(data) {
            console.log(data);
            myChart2.hideLoading();
            alert("errr."+ data);
        }
    });
}