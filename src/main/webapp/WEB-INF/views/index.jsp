<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>My Links - ShortURL</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<style>
:root{--fa-blue:#528DD7;--fa-navy:#183153;--fa-yellow:#FFD43B;--bg:#F5F7FA;--card:#FFFFFF;--ink:#183153;--muted:#5B6B7B;--border:#E2E8F0;--ok:#067647;--okbg:#ECFDF3;--warn:#B54708;--warnbg:#FFFAEB}
*{box-sizing:border-box}body{margin:0;font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;font-size:16px;line-height:1.5;background:var(--bg);color:var(--ink)}
.nav{background:var(--card);border-bottom:1px solid var(--border);padding:12px 20px;display:flex;align-items:center;gap:10px;flex-wrap:wrap;position:sticky;top:0;box-shadow:0 2px 12px rgba(24,49,83,.10);z-index:10}
.brand{display:flex;align-items:center;gap:9px;font-weight:800;font-size:18px;text-decoration:none;color:var(--ink)}
.brand .mark{width:32px;height:32px;border-radius:8px;background:var(--fa-navy);color:#fff;display:flex;align-items:center;justify-content:center;font-size:16px}
.nav .sp{flex:1}.user{font-size:14px;color:var(--muted);display:flex;align-items:center;gap:6px}
.nav a.btn{text-decoration:none;font-size:14px;font-weight:700;padding:10px 14px;min-height:44px;display:inline-flex;align-items:center;gap:7px;border-radius:9px}
.nav a.ghost{color:var(--ink);border:1px solid var(--border);border-bottom:3px solid #CBD5E1;box-shadow:0 2px 5px rgba(24,49,83,.10)}.nav a.ghost:hover{border-color:var(--fa-blue);border-bottom-color:var(--fa-blue);color:var(--fa-navy)}.nav a.ghost:active{transform:translateY(2px);border-bottom-width:1px;box-shadow:none}
.nav a.out{background:var(--fa-navy);color:#fff;border-bottom:3px solid #0B1A2B;box-shadow:0 4px 10px rgba(24,49,83,.28)}.nav a.out:hover{background:#0F2338}.nav a.out:active{transform:translateY(2px);border-bottom-width:1px;box-shadow:0 1px 4px rgba(24,49,83,.25)}
a:focus-visible,button:focus-visible,input:focus-visible{outline:3px solid var(--fa-blue);outline-offset:2px}
.wrap{max-width:880px;margin:0 auto;padding:28px 16px 40px}
.hero{background:linear-gradient(180deg,#1E3A5F 0%,var(--fa-navy) 100%);color:#fff;border:1px solid #0B1A2B;border-radius:16px;padding:32px 28px;margin-bottom:18px;box-shadow:0 14px 34px rgba(15,35,56,.35),inset 0 1px 0 rgba(255,255,255,.14)}
.hero h1{margin:0 0 6px;font-size:28px}.hero h1 .fa-solid{color:var(--fa-yellow)}
.hero p{margin:0 0 18px;color:#CBD5E1;font-size:15px}
.search{display:flex;gap:8px;background:#fff;border-radius:12px;padding:6px;box-shadow:0 4px 12px rgba(11,26,43,.35),inset 0 2px 5px rgba(24,49,83,.10)}
.search .box{flex:1;position:relative}.search .box i{position:absolute;left:12px;top:50%;transform:translateY(-50%);color:#98A2B3}
.search input{width:100%;border:0;border-radius:8px;padding:13px 12px 13px 38px;font-size:16px;min-height:48px;color:var(--ink)}
.search input:focus{outline:none}
.search button{border:0;border-bottom:3px solid #2C5F8F;border-radius:9px;background:var(--fa-blue);color:#fff;font-weight:800;font-size:15px;padding:0 22px;min-height:48px;min-width:48px;cursor:pointer;box-shadow:0 4px 10px rgba(82,141,215,.45);transition:transform .08s ease,box-shadow .08s ease,background-color .15s ease}
.search button:hover{background:#3D7AC4;transform:translateY(-1px)}
.search button:active{transform:translateY(2px);border-bottom-width:1px;box-shadow:0 1px 4px rgba(82,141,215,.4)}
.panel{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px;box-shadow:0 1px 0 rgba(24,49,83,.05),0 10px 26px rgba(24,49,83,.12)}
.panel h2{margin:0 0 4px;font-size:18px}.panel p.count{margin:0 0 14px;font-size:13px;color:var(--muted)}
table{width:100%;border-collapse:collapse;font-size:14px}th,td{padding:11px 10px;border-bottom:1px solid var(--border);text-align:left;vertical-align:middle}
th{color:var(--muted);font-size:12px;text-transform:uppercase;letter-spacing:.04em}
tr:last-child td{border-bottom:0}tbody tr:hover td{background:#F8FAFC}
.short{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-weight:700;color:var(--fa-navy);text-decoration:none}
.short:hover{color:var(--fa-blue);text-decoration:underline}
.badge{display:inline-flex;align-items:center;gap:5px;background:#EEF4FF;color:var(--fa-navy);border-radius:999px;padding:3px 11px;font-size:13px;font-weight:700;white-space:nowrap;box-shadow:inset 0 -2px 0 rgba(24,49,83,.08),0 1px 2px rgba(24,49,83,.10)}
.copy{border:1px solid var(--border);border-bottom:3px solid #CBD5E1;background:#fff;border-radius:8px;min-width:44px;min-height:44px;cursor:pointer;color:var(--muted);box-shadow:0 2px 4px rgba(24,49,83,.10);transition:transform .08s ease,box-shadow .08s ease,border-color .15s ease,color .15s ease}
.copy:hover{border-color:var(--fa-blue);color:var(--fa-navy)}
.copy:active{transform:translateY(2px);border-bottom-width:1px;box-shadow:none}
.long{max-width:320px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;vertical-align:bottom;color:var(--muted)}
.empty{text-align:center;color:var(--muted);padding:28px 0}.empty .fa-solid{font-size:32px;color:#CBD5E1;display:block;margin-bottom:10px}
.banner{padding:11px 12px;border-radius:10px;font-size:14px;margin-bottom:14px;display:flex;gap:8px;align-items:flex-start}
.banner.ok{background:var(--okbg);color:var(--ok);border:1px solid #ABEFC6;border-left:5px solid var(--ok);box-shadow:0 2px 6px rgba(6,118,71,.12)}
.banner.warn{background:var(--warnbg);color:var(--warn);border:1px solid #FEDF89;border-left:5px solid var(--warn);box-shadow:0 2px 6px rgba(181,71,8,.12)}
@media(max-width:640px){.hero{padding:24px 18px}.hero h1{font-size:23px}.search{flex-direction:column}.search button{padding:13px}.long{max-width:150px}}
@media (prefers-reduced-motion:reduce){*{transition:none}}
</style>
</head>
<body>
<%-- Unit-III: session implicit object + expression --%>
<header class="nav">
<a class="brand" href="${pageContext.request.contextPath}/"><span class="mark" aria-hidden="true"><i class="fa-solid fa-flag"></i></span>ShortURL</a>
<span class="sp"></span>
<span class="user"><i class="fa-solid fa-circle-user" aria-hidden="true"></i><%= session.getAttribute("user") %></span>
<a class="btn ghost" href="${pageContext.request.contextPath}/dashboard"><i class="fa-solid fa-chart-column" aria-hidden="true"></i>Dashboard</a>
<a class="btn out" href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket" aria-hidden="true"></i>Log out</a>
</header>
<main class="wrap">
<% if (request.getParameter("welcome") != null) { %>
  <div class="banner ok"><i class="fa-solid fa-circle-check" aria-hidden="true"></i><span>Account created - you are logged in. Welcome aboard!</span></div>
<% } %>
<% if (request.getParameter("missing") != null) { %>
  <div class="banner warn"><i class="fa-solid fa-triangle-exclamation" aria-hidden="true"></i><span>That short code does not exist. Check the URL.</span></div>
<% } %>
<section class="hero">
<h1><i class="fa-solid fa-link" aria-hidden="true"></i> Shorten. Share. Track.</h1>
<p>Paste a long link below - get a tiny URL with click stats.</p>
<form action="${pageContext.request.contextPath}/shorten" method="post" role="search" aria-label="Shorten a link">
<div class="search">
<div class="box"><i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i><input name="longUrl" required type="url" placeholder="https://your-very-long-link..." aria-label="Long URL to shorten"/></div>
<button type="submit"><i class="fa-solid fa-scissors" aria-hidden="true"></i> Shorten</button>
</div>
</form>
</section>
<section class="panel" aria-label="Your short links">
<h2><i class="fa-solid fa-list" aria-hidden="true"></i> Your links</h2>
<p class="count">${fn:length(urls)} total</p>
<c:choose>
<c:when test="${empty urls}">
<div class="empty"><i class="fa-solid fa-link-slash" aria-hidden="true"></i>No links yet - shorten your first one above.</div>
</c:when>
<c:otherwise>
<div style="overflow-x:auto">
<table>
<thead><tr><th scope="col">Short URL</th><th scope="col">Original</th><th scope="col">Clicks</th><th scope="col"><span style="position:absolute;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0)">Copy</span></th></tr></thead>
<tbody>
<c:forEach var="u" items="${urls}">
<tr>
<td><a class="short" href="${pageContext.request.contextPath}/s/${u.code}">/s/${u.code}</a></td>
<td><span class="long">${u.longUrl}</span></td>
<td><span class="badge"><i class="fa-solid fa-arrow-pointer" aria-hidden="true"></i>${u.clicks}</span></td>
<td><button type="button" class="copy" data-link="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/s/${u.code}" aria-label="Copy short link /s/${u.code}" title="Copy"><i class="fa-solid fa-copy" aria-hidden="true"></i></button></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</c:otherwise>
</c:choose>
</section>
</main>
<script>
function copyLink(btn){var t=btn.getAttribute('data-link');function done(){var i=btn.querySelector('i');i.className='fa-solid fa-check';setTimeout(function(){i.className='fa-solid fa-copy'},1200)}
if(navigator.clipboard&&navigator.clipboard.writeText){navigator.clipboard.writeText(t).then(done,function(){legacy()})}else{legacy()}
function legacy(){var ta=document.createElement('textarea');ta.value=t;document.body.appendChild(ta);ta.select();try{document.execCommand('copy');done()}catch(e){}document.body.removeChild(ta)}}
for(var k=0;k<document.querySelectorAll('.copy').length;k++){document.querySelectorAll('.copy')[k].addEventListener('click',function(){copyLink(this)})}
</script>
</body>
</html>
