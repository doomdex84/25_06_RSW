<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.code } LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- ✅ 스타일 추가 -->
<style>
.menu-item {
	position: relative;
	display: inline-block;
}

.menu-dropdown {
	display: none;
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translateX(-50%);
	background-color: white;
	border: 1px solid #ccc;
	padding: 6px 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	white-space: nowrap;
	z-index: 100;
}

.menu-item:hover .menu-dropdown {
	display: block;
}
</style>

<section class="mt-24 text-xl px-4">
	<div class="mx-auto">
		<div class="mb-4 flex">
			<div>${articlesCount }개</div>
			<div class="flex-grow"></div>

			<form method="get" action="/usr/article/list" class="search-form">
				<input type="text" name="searchKeyword" value="${searchKeyword}"
					placeholder="검색어 입력" /> <input type="hidden" name="boardId"
					value="0" />
				<button type="submit">검색</button>
				<input type="hidden" name="boardId" value="${param.boardId }" />
				<div class="flex">
					<select class="select select-sm select-bordered max-w-xs"
						name="searchKeywordTypeCode"
						data-value="${param.searchKeywordTypeCode }">
						<option value="title">title</option>
						<option value="body">body</option>
						<option value="title,body">title+body</option>
						<option value="nickname">nickname</option>
					</select> <label
						class="ml-3 input input-bordered input-sm flex items-center gap-2">
						<input type="text" placeholder="Search" name="searchKeyword"
						value="${param.searchKeyword }" />
						<button type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
								fill="currentColor" class="h-4 w-4 opacity-70">
								<path fill-rule="evenodd"
									d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
									clip-rule="evenodd" />
							</svg>
						</button>
					</label>
				</div>
			</form>
		</div>

		<table class="table w-full border border-gray-300">
			<thead>
				<tr>
					<th class="text-center">ID</th>
					<th class="text-center">Registration Date</th>
					<th class="text-center">Title</th>
					<th class="text-center">Writer</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articles }">
					<tr class="hover:bg-base-300">
						<td class="text-center">${article.id}</td>
						<td class="text-center">${article.regDate.substring(0,10)}</td>
						<td class="text-center">
							<!-- ✅ 메뉴 기능 포함 -->
							<div class="menu-item">
								<a class="hover:underline" href="detail?id=${article.id }">${article.title }</a>
								<div class="menu-dropdown">
									<a href="modify?id=${article.id}"
										class="text-blue-500 hover:underline">수정</a> | <a
										href="doDelete?id=${article.id}"
										class="text-red-500 hover:underline">삭제</a>
								</div>
							</div>
						</td>
						<td class="text-center">${article.extra__writer }</td>
					</tr>
				</c:forEach>

				<c:if test="${empty articles }">
					<tr>
						<td colspan="4" class="text-center">게시글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>

	<!-- 동적 페이징 -->
	<div class="flex justify-center mt-4">
		<div class="btn-group join">
			<c:set var="paginationLen" value="3" />
			<c:set var="startPage"
				value="${page - paginationLen >= 1 ? page - paginationLen : 1 }" />
			<c:set var="endPage"
				value="${page + paginationLen <= pagesCount ? page + paginationLen : pagesCount}" />

			<c:set var="baseUri" value="?boardId=${boardId }" />
			<c:set var="baseUri"
				value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode }" />
			<c:set var="baseUri"
				value="${baseUri }&searchKeyword=${searchKeyword }" />

			<c:if test="${startPage > 1}">
				<a class="join-item btn btn-sm" href="${baseUri }&page=1">1</a>
			</c:if>
			<c:if test="${startPage > 2}">
				<button class="join-item btn btn-sm btn-disabled">...</button>
			</c:if>

			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a
					class="join-item btn btn-sm ${param.page == i ? 'btn-active' : ''}"
					href="${baseUri }&page=${i }">${i }</a>
			</c:forEach>

			<c:if test="${endPage < pagesCount - 1}">
				<button class="join-item btn-sm btn btn-disabled">...</button>
			</c:if>

			<c:if test="${endPage < pagesCount}">
				<a class="join-item btn btn-sm"
					href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
			</c:if>
		</div>
	</div>
</section>
