package com.cl.cs.mapper.base;

import com.cl.cs.model.base.FrequentWord;

public interface FrequentWordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FrequentWord record);

    int insertSelective(FrequentWord record);

    FrequentWord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FrequentWord record);

    int updateByPrimaryKey(FrequentWord record);
}