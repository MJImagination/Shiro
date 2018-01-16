package com.mj.model;

import java.util.ArrayList;

/**
 * @author MJ
 * @Description:
 * @Date: create 2018/1/14
 */
public class EchartHistogram2 {
    /**
     * 类别
     */
    private ArrayList<String> categories;
    /**
     * 数据
     */
    private ArrayList<ArrayList<String>> data;

    public ArrayList<String> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<String> categories) {
        this.categories = categories;
    }

    public ArrayList<ArrayList<String>> getData() {
        return data;
    }

    public void setData(ArrayList<ArrayList<String>> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "EchartHistogram2{" +
                "categories=" + categories +
                ", data=" + data +
                '}';
    }
}
