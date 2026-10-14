package com.wit.shorturl.controller;

import com.wit.shorturl.dao.UrlDao;
import com.wit.shorturl.dao.UserDao;
import com.wit.shorturl.model.Url;
import com.wit.shorturl.service.ShortCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

// Unit-IV: Spring MVC. Unit-II: GET shows form, POST creates.
// Teacher lines: "POST makes code and saves with my user_id."
// "Home/Dashboard list WHERE user_id=? so every user sees ONLY own links."
// "GET /s/code stays public - anyone opening a shared link must reach it."
@Controller
public class ShortenController {

    @Autowired
    private UrlDao dao;
    @Autowired
    private UserDao users;
    @Autowired
    private ShortCode code;

    // session -> owner id (DB lookup fallback for sessions made before this change)
    private Integer ownerId(HttpSession s) {
        Object name = s.getAttribute("user");
        if (name == null) return null;
        Integer id = (Integer) s.getAttribute("userId");
        if (id == null) {
            id = users.findIdByName((String) name);
            if (id != null) s.setAttribute("userId", id);
        }
        return id;
    }

    // GET / -> form + ONLY my links (forward to index.jsp)
    @GetMapping("/")
    public String home(Model m, HttpSession s) {
        Integer uid = ownerId(s);
        if (uid == null) return "redirect:/login";
        m.addAttribute("urls", dao.findByUser(uid));
        return "index"; // forward, URL stays "/"
    }

    // GET /dashboard -> my click report (M4 module)
    @GetMapping("/dashboard")
    public String dashboard(Model m, HttpSession s) {
        Integer uid = ownerId(s);
        if (uid == null) return "redirect:/login";
        m.addAttribute("urls", dao.findByUser(uid));
        return "dashboard"; // forward to dashboard.jsp
    }

    // POST /shorten (difference GET vs POST - Unit-II viva point)
    @PostMapping("/shorten")
    public String shorten(@RequestParam("longUrl") String longUrl,
                          HttpSession s) {
        Integer uid = ownerId(s);
        if (uid == null) return "redirect:/login";
        String c;
        do { c = code.next(); } while (dao.findByCode(c) != null);
        dao.save(new Url(c, longUrl), uid);
        return "redirect:/"; // redirect avoids double-submit on refresh
    }
}
