<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>"/>
    <script src="<c:url value='/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$('#idx').attr("readonly", true);
      	$('#writerNm').attr("readonly", true);
      	$('#indate').attr("readonly", true);
    });
    function cancel(){
    	location.href = "<c:url value='/list.do'/>";
    }
    function add(){
    	if( $('#title').val() == '' ){
    		alert("제목을 입력하세요");
    		$('#title').focus();
    		return;
    	}
    	if( $('#contents').val() == '' ){
    		alert("내용을 입력하세요");
    		$('#contents').focus();
    		return;
    	}
    	if( !confirm("등록하시겠습니까?") ){
    		return;
    	}
    		
    	document.form1.action = "<c:url value='/mgmt.do'/>?mode=add";
    	document.form1.submit();
    }
    function mod(){
    	if($('#title').val() == ''){
    		alert("제목을 입력하세요.");
	        $('#title').focus();
	        return;
	    }
      	if($('#contents').val() == ''){
	        alert("내용을 입력하세요.");
	        $('#contents').focus();
	        return;
      	}
      	if(!confirm("수정하시겠습니까?")){
        	return;
      	}

      	document.form1.action = "<c:url value='/mgmt.do'/>?mode=mod";
      	document.form1.submit();
    }
    </script>
  </head>
  <body>
    <div class="container">
      <h1>등록/수정화면</h1>
      <div class="panel panel-default">
        <div class="panel-heading">
          <label for="">안녕하세요.</label>
        </div>
        <div class="panel-body">
          <form id="form1" name="form1" class="form-horizontal" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label class="control-label col-sm-2" for="idx">게시물아이디:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="idx" name="idx" placeholder="자동발번" value="${boardVO.idx}">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="title">제목:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." maxlength="100" value="${boardVO.title}">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="writer">등록자/등록일:</label>
              <div class="col-sm-10">
                <input type="hidden" class="form-control" id="writer" name="writer" placeholder="등록자를 입력하세요." maxlength="15" style="float:left; width:30%" value="${boardVO.writer}">
                <input type="text" class="form-control" id="writerNm" name="writerNm" placeholder="등록자를 입력하세요." maxlength="15" style="float:left; width:30%" value="${boardVO.writerNm}">
                <c:set var="indate" value="${boardVO.indate}"/>
                <c:if test="indate != null && fn:length(indate > 8)">
                	<c:set var="indate" value="${fn:substring(indate,0,fn:length(indate)-2)}"/>
                </c:if>
                <input type="text" class="form-control" id="indate" name="indate" placeholder="등록일을 입력하세요." maxlength="10" style="float:left; width:30%" value="<c:out value='${indate}'/>">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="contents">내용:</label>
              <div class="col-sm-10">
                <textarea class="form-control" rows="5" id="contents" name="contents" maxlength="1000">${boardVO.contents}</textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="file">첨부파일:</label>
              <div class="col-sm-10">
              	<c:if test="${not empty boardVO.filename}">
              	  <c:out value="${boardVO.filename}"/>
              	</c:if>
              	<input type="file" class="control-label" id="file" name="file">
              </div>
            </div>
            <input type="hidden" id="seq" name="seq" value="${boardVO.seq}">
            <input type="hidden" id="filename" name="filename" value="${boardVO.filename}">
          </form>
        </div>
        <div class="panel-footer">
        <c:if test="${not empty sessionScope.userId}">
          <c:if test="${empty boardVO.idx}">
            <button type="button" class="btn btn-default" onclick="add();">등록</button>
          </c:if>
          <c:if test="${not empty boardVO.idx}">
            <button type="button" class="btn btn-default" onclick="mod();">수정</button>
          </c:if>
        </c:if>
          <button type="button" class="btn btn-default" onclick="cancel();">취소</button>
        </div>
      </div>
    </div>
  </body>
</html>
