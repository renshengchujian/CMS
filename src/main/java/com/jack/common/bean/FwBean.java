package com.jack.common.bean;

import javax.persistence.Transient;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
public class FwBean {

    /**
     * 页码 *
     */
    @Transient
    private Integer pageSize;

    /**
     * 每页显示数量 *
     */
    @Transient
    private Integer pageNum;

    public Integer getPageSize() {

        return pageSize == null ? 10 : pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum == null ? 0 : pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }
}
