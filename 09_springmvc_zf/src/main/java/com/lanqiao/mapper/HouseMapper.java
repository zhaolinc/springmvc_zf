package com.lanqiao.mapper;

import com.github.pagehelper.Page;
import com.lanqiao.domain.House;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @Entity com.lanqiao.domain.House
*/
@Mapper
public interface HouseMapper{

    public Page<House> selectForPage(@Param("pageNum") int pageNum,
                                     @Param("pageSize") int PageSize);

    public House findById(Integer id);

    /**
     * 查询我的出租信息
     * @param id
     * @return
     */
    public List<House> selectMyHouse(Integer id);
}
