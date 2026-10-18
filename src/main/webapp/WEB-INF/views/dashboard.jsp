<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Dashboard - ShortURL</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<style>
:root{--fa-blue:#528DD7;--fa-navy:#183153;--fa-yellow:#FFD43B;--bg:#F5F7FA;--card:#FFFFFF;--ink:#183153;--muted:#5B6B7B;--border:#E2E8F0}
*{box-sizing:border-box}body{margin:0;font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;font-size:16px;line-height:1.5;background:var(--bg);color:var(--ink)}
.nav{background:var(--card);border-bottom:1px solid var(--border);padding:12px 20px;display:flex;align-items:center;gap:10px;flex-wrap:wrap;position:sticky;top:0;box-shadow:0 2px 12px rgba(24,49,83,.10);z-index:10}
.brand{display:flex;align-items:center;gap:9px;font-weight:800;font-size:18px;text-decoration:none;color:var(--ink)}
.brand .mark{width:32px;height:32px;border-radius:8px;background:var(--fa-navy);color:#fff;display:flex;align-items:center;justify-content:center;font-size:16px}
.nav .sp{flex:1}.user{font-size:14px;color:var(--muted);display:flex;align-items:center;gap:6px}
.nav a.btn{text-decoration:none;font-size:14px;font-weight:700;padding:10px 14px;min-height:44px;display:inline-flex;align-items:center;gap:7px;border-radius:9px}
.nav a.ghost{color:var(--ink);border:1px solid var(--border);border-bottom:3px solid #CBD5E1;box-shadow:0 2px 5px rgba(24,49,83,.10)}.nav a.ghost:hover{border-color:var(--fa-blue)}.nav a.ghost:active{transform:translateY(2px);border-bottom-width:1px;box-shadow:none}
.nav a.out{background:var(--fa-navy);color:#fff;border-bottom:3px solid #0B1A2B;box-shadow:0 4px 10px rgba(24,49,83,.28)}.nav a.out:hover{background:#0F2338}.nav a.out:active{transform:translateY(2px);border-bottom-width:1px;box-shadow:0 1px 4px rgba(24,49,83,.25)}
a:focus-visible{outline:3px solid var(--fa-blue);outline-offset:2px}
.wrap{max-width:880px;margin:0 auto;padding:28px 16px 40px}
h1{font-size:24px;margin:0 0 4px}p.sub{margin:0 0 18px;color:var(--muted);font-size:14px}
.stats{display:grid;grid-template-columns:repeat(3,1fr);gap:12px;margin-bottom:18px}
.stat{background:var(--card);border:1px solid var(--border);border-radius:14px;padding:16px;box-shadow:0 1px 0 rgba(24,49,83,.05),0 8px 20px rgba(24,49,83,.10);transition:transform .12s ease,box-shadow .12s ease}
.stat:hover{transform:translateY(-2px);box-shadow:0 2px 0 rgba(24,49,83,.05),0 14px 28px rgba(24,49,83,.16)}
.stat .ic{width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:17px;margin-bottom:10px;box-shadow:inset 0 -3px 0 rgba(24,49,83,.10),0 2px 5px rgba(24,49,83,.12)}
.stat b{font-size:26px;display:block}.stat span{font-size:13px;color:var(--muted)}
.s1 .ic{background:#EEF4FF;color:var(--fa-blue)}.s2 .ic{background:#FEF6D8;color:#8A6D00}.s3 .ic{background:#ECFDF3;color:#067647}
.panel{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px;box-shadow:0 1px 0 rgba(24,49,83,.05),0 10px 26px rgba(24,49,83,.12)}
.panel h2{margin:0 0 12px;font-size:18px}
.bar{height:10px;border-radius:999px;background:#EDF1F6;overflow:hidden;min-width:110px;box-shadow:inset 0 2px 4px rgba(24,49,83,.18)}
.bar i{display:block;height:100%;background:linear-gradient(180deg,#6FA3DE 0%,var(--fa-blue) 100%);border-radius:999px;box-shadow:inset 0 1px 0 rgba(255,255,255,.35)}
table{width:100%;border-collapse:collapse;font-size:14px}th,td{padding:11px 10px;border-bottom:1px solid var(--border);text-align:left}
th{color:var(--muted);font-size:12px;text-transform:uppercase;letter-spacing:.04em}
tr:last-child td{border-bottom:0}tbody tr:hover td{background:#F8FAFC}
.mono{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-weight:700;color:var(--fa-navy)}
.badge{display:inline-flex;align-items:center;gap:5px;background:#EEF4FF;color:var(--fa-navy);border-radius:999px;padding:3px 11px;font-size:13px;font-weight:700}
.back{display:inline-flex;align-items:center;gap:7px;margin-top:14px;color:var(--fa-navy);font-weight:700;text-decoration:none;font-size:14px;min-height:44px}
.back:hover{text-decoration:underline}
@media(max-width:640px){.stats{grid-template-columns:1fr 1fr}}
@media (prefers-reduced-motion:reduce){*{transition:none}}
</style>
</head>
<body>
<div class="nav">
<a class="brand" href="${pageContext.request.contextPath}/"><span class="mark" aria-hidden="true"><i class="fa-solid fa-flag"></i></span>ShortURL</a>
<span class="sp"></span>
<span class="user"><i class="fa-solid fa-circle-user" aria-hidden="true"></i><%= session.getAttribute("user") %></span>
<a class="btn ghost" href="${pageContext.request.contextPath}/"><i class="fa-solid fa-list" aria-hidden="true"></i>My Links</a>
<a class="btn out" href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket" aria-hidden="true"></i>Log out</a>
</div>
<main class="wrap">
<h1><i class="fa-solid fa-chart-column" aria-hidden="true"></i> Dashboard</h1>
<p class="sub">How your short links are performing.</p>
<c:set var="total" value="0"/>
<c:forEach var="u" items="${urls}"><c:set var="total" value="${total + u.clicks}"/></c:forEach>
<c:set var="top" value="0"/>
<c:forEach var="u" items="${urls}"><c:if test="${u.clicks > top}"><c:set var="top" value="${u.clicks}"/></c:if></c:forEach>
<div class="stats">
<div class="stat s1"><div class="ic"><i class="fa-solid fa-link" aria-hidden="true"></i></div><b>${fn:length(urls)}</b><span>Total links</span></div>
<div class="stat s2"><div class="ic"><i class="fa-solid fa-arrow-pointer" aria-hidden="true"></i></div><b>${total}</b><span>Total clicks</span></div>
<div class="stat s3"><div class="ic"><i class="fa-solid fa-trophy" aria-hidden="true"></i></div><b>${top}</b><span>Best link clicks</span></div>
</div>
<div class="panel">
<h2>Click report</h2>
<div style="overflow-x:auto">
<table>
<thead><tr><th scope="col">Short code</th><th scope="col">Clicks</th><th scope="col">Share of best</th></tr></thead>
<tbody>
<c:forEach var="u" items="${urls}">
<tr>
<td class="mono">/s/${u.code}</td>
<td><span class="badge"><i class="fa-solid fa-arrow-pointer" aria-hidden="true"></i>${u.clicks}</span></td>
<td><div class="bar" role="img" aria-label="${u.code} has ${u.clicks} clicks"><i style="width:${top == 0 ? 0 : (u.clicks * 100) / top}%"></i></div></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<a class="back" href="${pageContext.request.contextPath}/"><i class="fa-solid fa-arrow-left" aria-hidden="true"></i> Back to My Links</a>
</div>
</main>
</body>
</html>
