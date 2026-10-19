# URL Shortener

Small Java web app that shortens long links, redirects visitors, and counts clicks.
Built for the WIT TY B.Tech Advanced Java course.

## Features
- Register and log in with an HTTP session
- Create a 6 character short code for any URL
- Redirect with `/s/<code>` and add one click
- See only your own links and click counts

## Stack
- Java 8 and Maven WAR packaging
- Spring MVC 5.3 with JSP and JSTL
- MySQL 8 through Spring JdbcTemplate
- Hibernate mappings for the ORM unit
- Tomcat 9 (GlassFish notes in `GLASSFISH-NOTE.md`)

## Setup
1. Import as an existing Maven project in Eclipse.
2. Create the database:
   ```bash
   mysql -u root -p < src/main/resources/schema.sql
   ```
3. Set the MySQL password in `src/main/webapp/WEB-INF/spring-servlet.xml` if it is not blank.
4. Run on Tomcat 9 at `http://localhost:8080/urlshortener/`.
5. Log in with `admin` / `admin123`.

## Routes

| Route | Method | Purpose |
| --- | --- | --- |
| `/login` | GET, POST | Sign in |
| `/register` | GET, POST | Create an account |
| `/` | GET, POST | List links and shorten a URL |
| `/dashboard` | GET | Click report |
| `/s/{code}` | GET | Redirect and count a click |
| `/logout` | GET | End the session |

## Layout

```
com/wit/shorturl
  controller/  Spring MVC controllers
  dao/         JdbcTemplate DAOs and raw JDBC demo
  model/       User and Url
  service/     Short code generator
  filter/      Login check
src/main/resources    schema.sql, hibernate.cfg.xml
src/main/webapp       JSP views, Spring XML
```

## Notes
- `JdbcDemo.java` runs as a plain Java app for the JDBC unit.
- The web runtime uses Spring JDBC. Hibernate mappings are kept for the ORM unit because GlassFish 3 ships JPA 2.0.
- Demo logins: `admin/admin123`, and `m1` to `m4` with `m123`.
