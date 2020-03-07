package com.buymypoem.springmvc.controller;

import com.buymypoem.springmvc.dao.CompositionDAO;
import com.buymypoem.springmvc.model.Composition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class CompositionController {

    @Autowired
    CompositionDAO compositionDAO;

    @RequestMapping(value = "/start", method= RequestMethod.GET)
    public String getStartList(Model m){
        List<Composition> list=compositionDAO.getAllCompositions(1);
        m.addAttribute("list",list);
        m.addAttribute("page",1);
        return "index";
    }

    @RequestMapping(value = "/start/{page}", method= RequestMethod.GET)
    public String getList(@PathVariable int page, Model m){
        if (page<1)
        {
            List<Composition> list=compositionDAO.getAllCompositions(page+1);
            m.addAttribute("list",list);
            m.addAttribute("msg","Это самая первая страница!");
            m.addAttribute("page",page+1);
            return "index";
        }else{
                List<Composition> list=compositionDAO.getAllCompositions(page);
                if (list.size()==0)
                {
                    list=compositionDAO.getAllCompositions(page-1);
                    m.addAttribute("list",list);
                    m.addAttribute("msg","Это последняя страница!");
                    m.addAttribute("page",page-1);
                    return "index";
                }else {
                    m.addAttribute("list",list);
                    m.addAttribute("page",page);
                    return "index";
                }
        }
    }
}
