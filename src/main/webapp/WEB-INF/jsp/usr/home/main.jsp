<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN PAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<main class="max-w-5xl mx-auto mt-12 px-4 text-gray-800">
	<h1 class="text-3xl font-bold mb-6">환영합니다 👋</h1>
	<p class="mb-4 text-lg leading-relaxed">이곳은 RSW 프로젝트의 메인 페이지입니다.
		게시판 기능을 포함한 다양한 기능들을 이곳에서 확인할 수 있습니다.</p>

	<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-8">
		<a href="/usr/article/list?boardId=1"
			class="p-6 border rounded shadow hover:shadow-lg transition bg-white">
			<h2 class="text-xl font-semibold mb-2">📢 공지사항</h2>
			<p class="text-sm text-gray-600">중요한 안내 사항을 확인하세요.</p>
		</a> <a href="/usr/article/list?boardId=2"
			class="p-6 border rounded shadow hover:shadow-lg transition bg-white">
			<h2 class="text-xl font-semibold mb-2">💬 자유게시판</h2>
			<p class="text-sm text-gray-600">자유롭게 의견을 나눠보세요.</p>
		</a> <a href="/usr/article/list?boardId=3"
			class="p-6 border rounded shadow hover:shadow-lg transition bg-white">
			<h2 class="text-xl font-semibold mb-2">❓ Q&A</h2>
			<p class="text-sm text-gray-600">질문과 답변을 확인하세요.</p>
		</a>
	</div>
</main>

<!-- ✅ 푸터 -->
<footer class="bg-gray-900 text-white mt-20 py-6">
	<div class="max-w-5xl mx-auto px-4 text-sm text-center">© 2025
		RSW Project. All rights reserved.</div>
</footer>
