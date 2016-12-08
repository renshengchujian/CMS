package com.jack.common.bean;

import javax.persistence.Transient;

import lombok.Data;

/**
 * @author: Jack
 * @date: 2016/11/23
 */
@Data
public class FwBean {

    /** 页码 * */
    @Transient
    private Integer pageSize;

    /** 每页显示数量 * */
    @Transient
    private Integer pageNum;

}
