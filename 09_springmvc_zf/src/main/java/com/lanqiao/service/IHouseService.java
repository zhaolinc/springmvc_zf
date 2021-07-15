package com.lanqiao.service;

import com.github.pagehelper.Page;
import com.lanqiao.domain.House;

import java.util.List;

public interface IHouseService {
    public Page<House> selectForPage(int pageNum, int pageSize);

    public House findById(Integer id);
}
