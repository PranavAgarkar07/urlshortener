package com.wit.shorturl.controller;

import com.wit.shorturl.dao.UserDao;
import com.wit.shorturl.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

// Unit-IV: Spring MVC Controller. Unit-II: Session Management + GET/POST + redirect.
// Teacher line: "POST /login checks DB, stores name in session. POST /register creates user."
@Controller
public class AuthController {

    @Autowired
    private UserDao users;

    @GetMapping("/login")
    public String loginPage() { return "login"; } // -> login.jsp (forward)

    @PostMapping("/login")
    public String doLogin(@RequestParam String name,
                          @RequestParam String pass,
                          HttpSession session) {
        if (name == null || name.trim().isEmpty()
                || pass == null || pass.isEmpty()) {
            return "redirect:/login?error=empty"; // Unit-II: redirection
        }
        User u = users.login(name.trim(), pass);
        if (u == null) return "redirect:/login?error=wrong";
        session.setAttribute("user", u.getName()); // Unit-II: HttpSession
        session.setAttribute("userId", u.getId()); // owner id for per-user isolation
        return "redirect:/"; // POST-Redirect-GET
    }

    @GetMapping("/register")
    public String regPage() { return "register"; } // -> register.jsp

    @PostMapping("/register")
    public String doRegister(@RequestParam String name,
                             @RequestParam String pass,
                             @RequestParam String pass2,
                             HttpSession session) {
        name = (name == null) ? "" : name.trim();
        if (name.isEmpty() || pass == null || pass.isEmpty()) {
            return "redirect:/register?error=empty";
        }
        if (!pass.equals(pass2)) {
            return "redirect:/register?error=mismatch";
        }
        if (users.existsByName(name)) {
            return "redirect:/register?error=exists";
        }
        users.save(new User(name, pass));
        User u = users.login(name, pass); // reload to get generated id
        session.setAttribute("user", name); // auto-login after register
        if (u != null) session.setAttribute("userId", u.getId());
        return "redirect:/?welcome";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Unit-II: logout
        return "redirect:/login?logout";
    }
}
