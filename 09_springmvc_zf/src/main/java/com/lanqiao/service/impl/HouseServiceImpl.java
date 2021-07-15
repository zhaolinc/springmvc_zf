package com.lanqiao.service.impl;

import com.github.pagehelper.Page;
import com.lanqiao.domain.House;
import com.lanqiao.mapper.HouseMapper;
import com.lanqiao.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 赵林
 * @date 2021/7/14 10:34
 **/
@Service("houseService")
public class HouseServiceImpl implements IHouseService {
    @Autowired
    HouseMapper houseMapper;

    /**
     * 展示首页数据
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public Page<House> selectForPage(int pageNum, int pageSize) {
        return this.houseMapper.selectForPage(pageNum,pageSize);
    }

    /**
     * 查看详情
     * @param id
     * @return
     */
    @Override
    public House findById(Integer id) {
        return this.houseMapper.findById(id);
    }
}
