package com.wit.shorturl.model;

// Plain POJO (no JPA annotations) so it deploys on GlassFish 3 (JPA 2.0).
// For report/viva Unit-V: same fields map 1-to-1 to urls table (ORM idea).
// Hibernate version of this class is kept in docs for ICA-10 proof.
public class Url {

    private int id;
    private String code;    // short code like "abc123", unique
    private String longUrl; // original long link
    private int clicks = 0; // click counter

    public Url() {}
    public Url(String code, String longUrl) {
        this.code = code;
        this.longUrl = longUrl;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getLongUrl() { return longUrl; }
    public void setLongUrl(String longUrl) { this.longUrl = longUrl; }
    public int getClicks() { return clicks; }
    public void setClicks(int clicks) { this.clicks = clicks; }
}
