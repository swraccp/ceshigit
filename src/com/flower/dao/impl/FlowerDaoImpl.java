package com.flower.dao.impl;

import com.flower.dao.BaseDao;
import com.flower.dao.FlowerDao;
import com.flower.entity.Flower;
import com.flower.util.PageBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlowerDaoImpl extends BaseDao implements FlowerDao {
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    @Override
    public List<Flower> getAll(PageBean pageBean,String name) {
        List<Flower>flowerList=new ArrayList<Flower>();
        try {
            conn=getConn();
            String sql="select * from flower where name LIKE ? limit ?,? ";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,"%"+name+"%");
            pstmt.setInt(2,(pageBean.getPageIndex()-1)*pageBean.getPageSize());
            pstmt.setInt(3,pageBean.getPageSize());
            rs=pstmt.executeQuery();
            while (rs.next()){
                Flower flower=new Flower();
                flower.setId(rs.getLong("id"));
                flower.setName(rs.getString("name"));
                flower.setAnothername(rs.getString("anothername"));
                flower.setProperty(rs.getString("property"));
                flower.setPrice(rs.getInt("price"));
                flower.setProduction(rs.getString("production"));
                flowerList.add(flower);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn,pstmt,rs);
        }
        return flowerList;
    }

    @Override
    public int getCount(String name) {
        int count=0;
        try {
            conn=getConn();
            String sql="select count(1) from flower where name LIKE ?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,"%"+name+"%");
            rs=pstmt.executeQuery();
            if(rs.next()){
                count=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
