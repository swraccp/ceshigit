package com.flower.util;

import com.flower.entity.Flower;

import java.util.List;

public class PageBean {
    //每页显示数据的条数
    private int pageSize=2;
    //代表当前是第几页
    private  int pageIndex=1;
    //代表一共有多少条数据
    private int allRows;
    //代表总页数
    private int totalPage;
    //把每页的数据存到集合中
    private List<Flower>pageList;


    //
    public int getTotalPage() {
        return allRows%pageSize==0?allRows/pageSize:allRows/pageSize+1 ;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getAllRows() {
        return allRows;
    }

    public void setAllRows(int allRows) {
        this.allRows = allRows;
    }



    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<Flower> getPageList() {
        return pageList;
    }

    public void setPageList(List<Flower> pageList) {
        this.pageList = pageList;
    }
}
