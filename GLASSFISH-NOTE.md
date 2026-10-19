# GlassFish 3 note (read this for viva)

Server: GlassFish 3.1.2.2 = Java EE 6 = JPA 2.0 (no Table.indexes()).
Hibernate 5.x needs JPA 2.1+, so it CANNOT boot inside this server.

What runs on the server (this WAR):
- Spring MVC Controllers + AuthFilter + HttpSession (Unit-II, Unit-IV)
- JSP views (Unit-III)
- Spring JdbcTemplate DAO = JDBC with PreparedStatement (Unit-I, Unit-IV Spring DAO)

Where Hibernate is shown (Unit-V, ICA-9/10, CO-3/4):
- `src/main/resources/hibernate.cfg.xml` + model/DAO design in report
- Standalone Hibernate CRUD demo runs as plain Java (outside server, no container conflict)
- Report table: JDBC (web runtime) vs Hibernate (ORM proof) - same tables, same queries

Teacher line: "Sir, college GlassFish is JPA 2.0, so web runtime uses Spring-JDBC.
Hibernate mapping for same tables is in report and standalone demo."
