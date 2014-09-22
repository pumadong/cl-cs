package com.cl.cs.mapper.worksheet;

import com.cl.cs.model.worksheet.Worksheet;

public interface WorksheetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Worksheet record);

    int insertSelective(Worksheet record);

    Worksheet selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Worksheet record);

    int updateByPrimaryKey(Worksheet record);
}