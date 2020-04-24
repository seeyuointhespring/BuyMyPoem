package com.buymypoem.springmvc.controller;

import com.buymypoem.springmvc.dao.CompositionDAO;
import com.buymypoem.springmvc.dao.GenreDAO;
import com.buymypoem.springmvc.dao.TypeDAO;
import com.buymypoem.springmvc.logic.ProfileBL;
import com.buymypoem.springmvc.model.Composition;
import com.buymypoem.springmvc.logic.compositionBL;
import com.buymypoem.springmvc.model.Genre;
import com.buymypoem.springmvc.model.Type;
import com.buymypoem.springmvc.model.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CompositionController {

    @Resource
    UserSession us;

    @Autowired
    CompositionDAO compositionDAO;

    @Autowired
    compositionBL compositionBL;

    @Autowired
    TypeDAO typeDAO;

    @Autowired
    GenreDAO genreDAO;



    @RequestMapping(value = "/composition", method= RequestMethod.GET)
    public String getStartList(Model m){
        List<Composition> list=compositionDAO.getCompositions(1,"All", 0);
        m.addAttribute("list",list);
        m.addAttribute("page",1);
        int endPage=compositionBL.countPages("countComposition");
        m.addAttribute("end", endPage);
        return "composition";
    }

    @RequestMapping(value = "/composition/{page}", method= RequestMethod.GET)
    public String getList(@PathVariable int page, Model m){
        List<Composition> list=compositionDAO.getCompositions(page,"All", 0);
        m.addAttribute("list",list);
        int endPage=compositionBL.countPages("countComposition");
        m.addAttribute("end", endPage);
        m.addAttribute("page",page);
        return "composition";
    }

    @RequestMapping(value = "/draft", method= RequestMethod.GET)
    public String getDrafts(Model m){
        List<Composition> list=compositionDAO.getCompositions(1,"Drafts", us.getUserSession().getUserID());
        m.addAttribute("list",list);
        m.addAttribute("page",1);
        int endPage=compositionBL.countPages("countDrafts");
        m.addAttribute("end", endPage);
        return "draft";
    }

    @RequestMapping(value = "/draft/{page}", method= RequestMethod.GET)
    public String getDrafts(@PathVariable int page, Model m){
        List<Composition> list=compositionDAO.getCompositions(page,"Drafts", us.getUserSession().getUserID());
        m.addAttribute("list",list);
        int endPage=compositionBL.countPages("countDrafts");
        m.addAttribute("end", endPage);
        m.addAttribute("page",page);
        return "draft";
    }

    @RequestMapping(value = "/index", method= RequestMethod.GET)
    public String getCompositionStart(Model m){
        List<Composition> list=compositionBL.allComposition(1);
        m.addAttribute("list",list);
        m.addAttribute("page",1);
        int endPage=compositionBL.countPages("countPublishComp");
        m.addAttribute("end", endPage);
        return "index";
    }

    @RequestMapping(value = "/all_composition", method= RequestMethod.GET)
    public String getComposition_start(Model m){
        List<Composition> list=compositionBL.allComposition(1);
        m.addAttribute("list",list);
        m.addAttribute("page",1);
        int endPage=compositionBL.countPages("countPublishComp");
        m.addAttribute("end", endPage);
        return "all_composition";
    }

    @RequestMapping(value = "/all_composition/{page}", method= RequestMethod.GET)
    public String getComposition_next(@PathVariable int page, Model m){
        List<Composition> list=compositionBL.allComposition(page);
        m.addAttribute("list",list);
        int endPage=compositionBL.countPages("countPublishComp");
        m.addAttribute("end", endPage);
        m.addAttribute("page",page);
        return "all_composition";
    }

    @RequestMapping(value = "/index/{page}", method= RequestMethod.GET)
    public String getComposition(@PathVariable int page, Model m){
        List<Composition> list=compositionBL.allComposition(page);
        m.addAttribute("list",list);
        int endPage=compositionBL.countPages("countPublishComp");
        m.addAttribute("end", endPage);
        m.addAttribute("page",page);
        return "index";
    }

    @RequestMapping(value ="/add_composition_form", method=RequestMethod.GET)
    public String getForm(Model m){
        List<Genre> genreList = genreDAO.getAllGenres();
        List<Type> typeList = typeDAO.getAllTypes();
        m.addAttribute("genres",genreList);
        m.addAttribute("types",typeList);
        m.addAttribute("comp", new Composition());
        m.addAttribute("user", us.getUserSession());
        return "add_composition_form";
    }

    @RequestMapping(value = "/add_composition", method= RequestMethod.POST)
    public String addComposition(@ModelAttribute("comp") Composition comp){
        comp.getUser().setUserID(us.getUserSession().getUserID());
        compositionDAO.addComposition(comp);
        return "redirect:/successAuthor";
    }

    @RequestMapping(value = "/composition_info/{id}", method= RequestMethod.GET)
    public String addComposition(@PathVariable int id, Model m){
        Composition composition = compositionDAO.getCompositionByI(id);
        m.addAttribute("text",composition);
        return "/composition_info";
    }
}
