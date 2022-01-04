package com.flower.service;

import com.flower.entity.Flower;
import com.flower.util.PageBean;

import java.util.List;

public interface FlowerService {
    public List<Flower> getAll(PageBean pageBean,String name);

    public int getCount(String name);
}
