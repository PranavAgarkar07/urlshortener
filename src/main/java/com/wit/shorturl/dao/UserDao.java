package com.wit.shorturl.dao;

import com.wit.shorturl.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

// Login check via Spring JDBC (Unit-IV DAO + Unit-I JDBC).
@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jt;

    public void save(User u) {
        jt.update("INSERT IGNORE INTO users(name,pass) VALUES(?,?)",
            u.getName(), u.getPass());
    }

    public boolean existsByName(String name) {
        Integer n = jt.queryForObject(
            "SELECT COUNT(*) FROM users WHERE name=?",
            new Object[]{name}, Integer.class);
        return n != null && n > 0;
    }

    public Integer findIdByName(String name) {
        List<Integer> l = jt.query("SELECT id FROM users WHERE name=?",
            new Object[]{name},
            (rs, i) -> rs.getInt(1));
        return l.isEmpty() ? null : l.get(0);
    }

    public User login(String name, String pass) {        List<User> l = jt.query(
            "SELECT id,name,pass FROM users WHERE name=? AND pass=?",
            new Object[]{name, pass},
            (rs, i) -> {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setPass(rs.getString(3));
                return u;
            });
        return l.isEmpty() ? null : l.get(0);
    }
}
