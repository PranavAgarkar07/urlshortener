package com.wit.shorturl.dao;

import com.wit.shorturl.model.Url;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

// Unit-IV Spring DAO + Unit-I JDBC (PreparedStatement inside JdbcTemplate).
// Same 4 methods as before, so controllers need NO change.
// Runs on any server (GlassFish 3 / Tomcat) - no JPA needed.
@Repository
public class UrlDao {

    @Autowired
    private JdbcTemplate jt;

    // CREATE for one owner only (per-user isolation)
    public void save(Url u, int userId) {
        jt.update("INSERT INTO urls(code, long_url, clicks, user_id) VALUES(?,?,0,?)",
            u.getCode(), u.getLongUrl(), userId);
    }

    // READ by short code
    public Url findByCode(String code) {
        List<Url> l = jt.query("SELECT id,code,long_url,clicks FROM urls WHERE code=?",
            new Object[]{code},
            (rs, i) -> {
                Url u = new Url();
                u.setId(rs.getInt(1));
                u.setCode(rs.getString(2));
                u.setLongUrl(rs.getString(3));
                u.setClicks(rs.getInt(4));
                return u;
            });
        return l.isEmpty() ? null : l.get(0);
    }

    // READ ONLY this user's links, latest first (isolation: WHERE user_id=?)
    // NOTE: findByCode stays global - a shared short link must open for anyone.
    public List<Url> findByUser(int userId) {
        return jt.query("SELECT id,code,long_url,clicks FROM urls WHERE user_id=? ORDER BY id DESC",
            new Object[]{userId},
            (rs, i) -> {
                Url u = new Url();
                u.setId(rs.getInt(1));
                u.setCode(rs.getString(2));
                u.setLongUrl(rs.getString(3));
                u.setClicks(rs.getInt(4));
                return u;
            });
    }

    // UPDATE clicks
    public void addClick(Url u) {
        jt.update("UPDATE urls SET clicks=clicks+1 WHERE code=?", u.getCode());
    }
}
