<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Login - ShortURL</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<style>
:root{--fa-blue:#528DD7;--fa-navy:#183153;--fa-yellow:#FFD43B;--bg:#F5F7FA;--card:#FFFFFF;--ink:#183153;--muted:#5B6B7B;--border:#E2E8F0;--err:#B42318;--errbg:#FEF3F2;--ok:#067647;--okbg:#ECFDF3}
*{box-sizing:border-box}body{margin:0;font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;font-size:16px;line-height:1.5;background:var(--bg);color:var(--ink);min-height:100vh;display:flex;align-items:center;justify-content:center;padding:16px}
.card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:32px;width:100%;max-width:400px;box-shadow:0 1px 0 rgba(24,49,83,.06),0 16px 40px rgba(24,49,83,.18)}
.brand{display:flex;align-items:center;gap:10px;margin-bottom:20px}.brand .mark{width:40px;height:40px;border-radius:10px;background:var(--fa-navy);color:#fff;display:flex;align-items:center;justify-content:center;font-size:20px}.brand b{font-size:19px}
h1{margin:0 0 4px;font-size:24px}p.sub{margin:0 0 20px;color:var(--muted);font-size:14px}
label{display:block;font-size:14px;font-weight:600;margin:14px 0 6px}
.input{position:relative}.input i{position:absolute;left:12px;top:50%;transform:translateY(-50%);color:#98A2B3}
.input input{width:100%;padding:12px 12px 12px 38px;border:1px solid #CFD8E3;border-radius:10px;font-size:16px;min-height:48px;box-shadow:inset 0 2px 4px rgba(24,49,83,.08)}
.input input:focus{outline:none;border-color:var(--fa-blue);box-shadow:0 0 0 3px rgba(82,141,215,.25)}
button{width:100%;margin-top:20px;padding:13px;min-height:52px;border:0;border-bottom:4px solid #0B1A2B;border-radius:10px;background:var(--fa-navy);color:#fff;font-size:16px;font-weight:800;letter-spacing:.02em;cursor:pointer;box-shadow:0 6px 14px rgba(24,49,83,.28);transition:transform .08s ease,box-shadow .08s ease,background-color .15s ease}
button:hover{background:#0F2338;transform:translateY(-1px);box-shadow:0 9px 18px rgba(24,49,83,.32)}
button:active{transform:translateY(3px);border-bottom-width:1px;box-shadow:0 2px 6px rgba(24,49,83,.25)}button:focus-visible,a:focus-visible,input:focus-visible{outline:3px solid var(--fa-blue);outline-offset:2px}
.msg{padding:11px 12px;border-radius:10px;font-size:14px;margin-bottom:12px;display:flex;gap:8px;align-items:flex-start}
.err{background:var(--errbg);color:var(--err);border:1px solid #FECDCA;border-left:5px solid var(--err);box-shadow:0 2px 6px rgba(180,35,24,.12)}
.ok{background:var(--okbg);color:var(--ok);border:1px solid #ABEFC6;border-left:5px solid var(--ok);box-shadow:0 2px 6px rgba(6,118,71,.12)}
.foot{margin-top:18px;text-align:center;font-size:14px;color:var(--muted)}
.foot a{color:var(--fa-navy);font-weight:700}
.demo{margin-top:12px;font-size:13px;color:var(--muted);text-align:center;background:#F8FAFC;border:1px dashed var(--border);border-radius:8px;padding:8px}
.demo code{font-family:ui-monospace,SFMono-Regular,Menlo,monospace}
@media (prefers-reduced-motion:reduce){*{transition:none}}
</style>
</head>
<body>
<main class="card">
<div class="brand"><span class="mark" aria-hidden="true"><i class="fa-solid fa-flag"></i></span><b>ShortURL</b></div>
<h1>Welcome back</h1>
<p class="sub">Log in to manage your short links.</p>
<%-- Unit-III: implicit objects request/session/out + page directive above --%>
<% String e = request.getParameter("error"); %>
<% if (e != null) { %>
  <div class="msg err" role="alert"><i class="fa-solid fa-triangle-exclamation" aria-hidden="true"></i><span><%= "empty".equals(e) ? "Please fill in username and password." : "Wrong username or password. Try again." %></span></div>
<% } %>
<% if (request.getParameter("logout") != null) { %>
  <div class="msg ok"><i class="fa-solid fa-circle-check" aria-hidden="true"></i><span>Logged out safely. See you soon!</span></div>
<% } %>
<form action="${pageContext.request.contextPath}/login" method="post">
  <label for="name">Username</label>
  <div class="input"><i class="fa-solid fa-user" aria-hidden="true"></i><input id="name" name="name" required autofocus maxlength="50" autocomplete="username" placeholder="e.g. admin"/></div>
  <label for="pass">Password</label>
  <div class="input"><i class="fa-solid fa-lock" aria-hidden="true"></i><input id="pass" type="password" name="pass" required autocomplete="current-password" placeholder="Your password"/></div>
  <button type="submit"><i class="fa-solid fa-right-to-bracket" aria-hidden="true"></i> Log in</button>
</form>
<div class="foot">New here? <a href="${pageContext.request.contextPath}/register">Create an account</a></div>
<div class="demo"><i class="fa-solid fa-circle-info" aria-hidden="true"></i> Demo: <code>admin</code> / <code>admin123</code></div>
</main>
</body>
</html>
