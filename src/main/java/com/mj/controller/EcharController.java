package com.mj.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mj.model.EchartHistogram1;
import com.mj.model.EchartHistogram2;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
/**
 * @author MJ
 * @Description:
 * @Date: create 2018/1/14
 */
@Controller
@RequestMapping(value = "/echar",produces = "application/json;charset=utf-8")
public class EcharController {

    private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(EcharController.class);

    @RequestMapping("/getHistogram")
    @ResponseBody
    public String getHistogram(){
        //方法一
        //部门,x轴数据
        JSONArray jsonArray= new JSONArray();
        jsonArray.add("a部门");
        jsonArray.add("b部门");
        jsonArray.add("c部门");
        jsonArray.add("d部门");
        //各个部门人数 y轴数据
        JSONArray jsonArr= new JSONArray();
        jsonArr.add(15);
        jsonArr.add(20);
        jsonArr.add(25);
        jsonArr.add(15);
        JSONObject json= new JSONObject();
        json.put("categories", jsonArray);
        json.put("data", jsonArr);
        System.out.println(json);

        //方法二
        EchartHistogram1 echart1 = new EchartHistogram1();
        ArrayList<String > categoriesList = new ArrayList<String>();
        categoriesList.add("衬衫");
        categoriesList.add("羊毛衫");
        categoriesList.add("雪纺衫");
        categoriesList.add("裤子");
        categoriesList.add("高跟鞋");
        categoriesList.add("袜子");
        echart1.setCategories(categoriesList);
        ArrayList<String> dataList = new ArrayList<String>();
        dataList.add("5");
        dataList.add("20");
        dataList.add("36");
        dataList.add("10");
        dataList.add("10");
        dataList.add("20");
        echart1.setData(dataList);



//        System.out.println(JSONObject.parse(echart.toString()));


        LOGGER.info("获取数据:{}.", "获取");
//        String jsonStr = "{\"name\":\"2323\",\"sex\":\"afasdf\",\"age\":\"6262\"}";
//        String jsonResult = JSONObject.toJSONString(json);
        String jsonResult = JSON.toJSONString(echart1);
        return jsonResult;
    }



    @RequestMapping("/getHistogram2")
    @ResponseBody
    public String getHistogram2(){
        EchartHistogram2 echart2 = new EchartHistogram2();
        //返回x轴分类
        ArrayList<String > categoriesList = new ArrayList<String>();
        categoriesList.add("1月");
        categoriesList.add("2月");
        categoriesList.add("3月");
        categoriesList.add("4月");
        categoriesList.add("5月");
        categoriesList.add("6月");
        categoriesList.add("7月");
        categoriesList.add("8月");
        categoriesList.add("9月");
        categoriesList.add("10月");
        categoriesList.add("11月");
        categoriesList.add("12月");
        echart2.setCategories(categoriesList);
        //返回数据列
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        //data1
        ArrayList<String> data1 = new ArrayList<String>();
        data1.add("2.0");
        data1.add("4.9");
        data1.add("7.0");
        data1.add("23.2");
        data1.add("25.6");
        data1.add("76.7");
        data1.add("135.6");
        data1.add("162.2");
        data1.add("32.6");
        data1.add("20.0");
        data1.add("6.4");
        data1.add("3.3");
        data.add(data1);
        //data2
        ArrayList<String> data2 = new ArrayList<String>();
        data2.add("2.6");
        data2.add("5.9");
        data2.add("9.0");
        data2.add("26.4");
        data2.add("28.7");
        data2.add("70.7");
        data2.add("175.6");
        data2.add("182.2");
        data2.add("48.7");
        data2.add("18.8");
        data2.add("6.0");
        data2.add("2.3");
        data.add(data2);
        //data3
        ArrayList<String> data3 = new ArrayList<String>();
        data3.add("2.0");
        data3.add("2.2");
        data3.add("3.3");
        data3.add("4.5");
        data3.add("6.3");
        data3.add("10.2");
        data3.add("20.3");
        data3.add("23.4");
        data3.add("23.0");
        data3.add("16.5");
        data3.add("12.0");
        data3.add("6.2");
        data.add(data3);
        echart2.setData(data);
        String jsonResult = JSON.toJSONString(echart2);
        return jsonResult;
    }




}
