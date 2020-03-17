package com.buymypoem.springmvc.logic;

import com.buymypoem.springmvc.dao.CompositionDAO;
import com.buymypoem.springmvc.model.UserSession;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

public class compositionBL {

    @Autowired
    CompositionDAO compositionDAO;

    @Resource
    UserSession us;
    public static final int PAGE_SIZE = 5;

    public int countPages(String choice){
        int i = compositionDAO.countCompositions(choice, us.getUserSession().getUserID());
        if (i % PAGE_SIZE == 0) return i / PAGE_SIZE;
        return i / PAGE_SIZE + 1;
    }
}
