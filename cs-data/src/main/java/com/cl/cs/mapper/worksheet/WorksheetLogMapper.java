package com.cl.cs.mapper.worksheet;

import com.cl.cs.model.worksheet.WorksheetLog;

public interface WorksheetLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WorksheetLog record);

    int insertSelective(WorksheetLog record);

    WorksheetLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WorksheetLog record);

    int updateByPrimaryKey(WorksheetLog record);
}