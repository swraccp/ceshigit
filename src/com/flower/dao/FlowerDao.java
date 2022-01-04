package com.flower.dao;

import com.flower.entity.Flower;
import com.flower.util.PageBean;

import java.util.List;

public interface FlowerDao {
    public List<Flower>getAll(PageBean pageBean,String name);

    public int getCount(String name);
}
