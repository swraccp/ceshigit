package com.flower.service.impl;

import com.flower.dao.FlowerDao;
import com.flower.dao.impl.FlowerDaoImpl;
import com.flower.entity.Flower;
import com.flower.service.FlowerService;
import com.flower.util.PageBean;

import java.util.List;

public class FlowerServiceImpl implements FlowerService {
        FlowerDao flowerDao=new FlowerDaoImpl();
    @Override
    public List<Flower> getAll(PageBean pageBean,String name) {

        return flowerDao.getAll(pageBean,name);
    }

    @Override
    public int getCount(String name) {
        return flowerDao.getCount(name);
    }
}
