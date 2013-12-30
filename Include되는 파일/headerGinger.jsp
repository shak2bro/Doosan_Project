<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:url value="/" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Pragma" content="no-cache" />
	<title>Doosan doosim</title>
<!--////////// script import BEGIN //////////-->
	<script src="<c:url value='/cmm/js/jquery/jquery-1.7.1.js' />" type="text/javascript"></script>
	<script src="<c:url value='/cmm/js/global.js' />" type="text/javascript"></script>
	<script src="<c:url value='/cmm/js/jquery/jquery-ui1.9.2.js' />" type="text/javascript"></script>
	<!-- <script src="<c:url value='/cmm/js/jquery/iscroll.js' />" type="text/javascript"></script> -->
	<script src="<c:url value='/cmm/js/jquery/toggles.min.js' />" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/cmm/css/jquery-ui.1.9.2.css' />" />
	<!-- <script src='<c:url value="/cmm/js/jquery/jquery.mobile-1.1.1.js" />' type="text/javascript"></script> -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/cmm/css/new.mobile.Ginger.css' />" />
	<script src='<c:url value="/cmm/js/jquery/jquery.mobile-1.1.1_custom.js" />' type="text/javascript"></script>
	
<%	/*	
	<!-- <link rel="stylesheet" type="text/css" href="<c:url value='/cmm/js/jquery/jquery.mobile.simpledialog.min.css' />"/> 
 	<script src="<c:url value='/cmm/js/jquery/jquery.mobile.simpledialog2.min.js'/>" type="text/javascript"></script> -->
	<!-- crm js -->
	<script src="<c:url value='/cmm/js/crm_common.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/cmm/js/crm_design.js'/>" type="text/javascript"></script>
*/ %>
	<!-- 2. CSS/JS Intro -->
	<script src="<c:url value='/cmm/js/crm_common.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/cmm/js/DSHelper.js'/>" type="text/javascript"></script>
<%	/*
	<script src="<c:url value='/cmm/js/DSHelper_BackspaceBlock.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/cmm/js/DSHelper_edit.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/cmm/js/DSHelper_paging.js'/>" type="text/javascript"></script>
	
*/ %>

<!--////////// script import END //////////-->
	<script>function closeLoading(){$("#resultDiv").html('');$("#loading").fadeOut(50);}</script>
	<c:if test="${!empty title}"><script>parent.document.title=" Doosan doosim ::: ${title}";</script></c:if>
<!-- 
	<script type="text/javascript">
	if(!($.browser.msie)){
		var myScroll;
		function loaded() { myScroll = new iScroll('wrapper', {useTransform: true, onBeforeScrollStart: null});  }
		// function enableFormsInIscroll(){
		//   [].slice.call(document.querySelectorAll('input, select, button, textarea')).forEach(function(el){
		//     el.addEventListener(('ontouchstart' in window)?'touchstart':'mousedown', function(e){
		//       e.stopPropagation();
		//     })
		//   })
		// }
		//document.addEventListener('touchstart', function (e) { e.preventDefault(); }, false);
		document.addEventListener('ontouchmove', function (e) { e.preventDefault(); }, false);
		document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

	}
	</script>
 -->
<!-- origin : master Javascript // SYSTEM Application -->
	<script type="text/javascript">		
		jQuery(document).ready(function() {				
			// $('.logout').click(function(){
			// 	fnLogOut();
			// });
			
			addClasses(); //파일별 클래스 분기 function().
			ieBrowsers(); // Browser Switch
			mobileDetector();

			ginger();
			gingerDetail();
			jqmLoader();
			inputFocus();
			searchInput();

			$('#contentBoxWrap input[type="date"]').attr('data-options', '{"mode": "calbox","headerFormat": "yy-mm-dd"}');// GB solution			
		});
		function inputNumCom(obj, id){
			var keycode = event.keyCode;
			if( !((48 <= keycode && keycode <=57) || keycode == 13 || keycode == 46) ){
				popDim(id);
				$(obj).attr('disabled', true);
				$(id).find('div.content').text('숫자만 입력'); //transition text
				//event.keyCode = 0;  // 이벤트 cancel
			}
			$('input[name="mobileNo"]').focus();
		}
		function inputChange(){
			var idx = $('#contentBoxWrap input[type="date"]').index('#contentBoxWrap input[type="date"]');
			var date = $('#contentBoxWrap input[type="date"]');
			
			$('#contentBoxWrap input[type="date"]').each(function(idx){
				date.eq(idx).attr('readonly', true);
				//date.eq(idx).prop('type', 'text');
			});
			//$('input[name="mobileNo"]').prop('type','text');			
			$('input[name="mobileNo"]').attr('onkeypress', 'inputNumCom(this, notification)'); // mobileNo type Add/Change
			$("textarea").attr('type', 'text'); //Add textarea type		
		} // 중국병음 처리를 위한 input type change.

		function inputFocus(){
			$('input[type="text"], input[type="search"], textarea').focusin(function(){
				$('#footer').css('display', 'none');
			}).focusout(function(){
				$('#footer').css('display', 'block');
			});
		}

		function ginger(){
			//$('#wrapper').css({'overflow':'hidden', 'overflow-y':'auto'});
			$('#header').css('position','fixed');
			$('#footer').css('position','fixed');
			$('div.ui-select span.ui-btn-inner').css('display','none');
			$('span.ui-icon').css('display','none');
			$('select').css('width','150px');
		}
		function gingerDetail(){
			$('div[data-role="fieldcontain"] div[role="heading"]').css({
				'float':'left',
				'width':'100px',
				'font-weight':'bold'
			});
			//alert($('div.modelBox').height());
			$('#wrapper').css('height', $('div.modelBox').height() +30);
			//alert("wrapper"+$('#wrapper').height() +":modelbox"+ $('div.modelBox').height() +":윈도우"+ $(window).height() +":문서"+ $(document).height() +":윈도우 내부"+ $(window).innerHeight());
		}
		function jqmLoader(){
			$('div.ui-loader').css('display','none');
			$('div.ui-loader h1').css('display','none');
		}

		//Global
		// Mobile Detector
		
		// var ua = navigator.userAgent;
		// var androidversion = parseFloat(ua.slice(ua.indexOf("Android")+8));
		// var flagVer = "";

		// if(Math.floor(androidversion) == "2"){ // Mobile OS is Android and Ver is 2.X(Or GINGERBREAD),
		// 	flagVer = "1";
		// }else if(!(isMobile.Android()) || Math.floor(androidversion) > "2"){ // mobile OS isnt Android or Ver is Higher than 2.X
		// 	flagVer = "0";
		// }
		
		/*function DatePick(){					
			$('input[data-role="datebox"]').attr('readonly', 'readonly');
			$('input[data-role="datebox"]').attr('placeholder', '年-月-日');
			
			$( 'input[data-role="datebox"]' ).datepicker({
                dateFormat: "yy-mm-dd",
                showAnim: ""
            });
            $('input[data-role="datebox"]').click(function(e){
            	var indexNum = $('input[data-role="datebox"]').index(this);
            	$('button[data-handler="today"]').click(function(){
					$('input[data-role="datebox"]').eq(indexNum).attr('value','');
				});
            });
	        
	    }*/
		
		
		
		function loadingBox(option){
			var loadingWidth = $(window).width()-$("#dimmedBox.loadingSection div#loading").width();
			var loadingHeight = $(window).height()-$("#dimmedBox.loadingSection div#loading").height();
			var leftLoading = loadingWidth/2;
			var topLoading = loadingHeight/2;
			
			if(option == "1"){ //dimmedBox Show
				if($.browser.msie){
					$('#dimmedBox.loadingSection div.spinner div[class^="bar"]').hide();
					$('#dimmedBox.loadingSection div.spinner div.msien').show();
				} else {
					$('#dimmedBox.loadingSection div.spinner div[class^="bar"]').show();
					$('#dimmedBox.loadingSection div.spinner div.msien').hide();
				}
				$("#dimmedBox.loadingSection div#loading").css({'top':topLoading, 'left':leftLoading});
				$('div#contentBoxWrap select').attr('disabled', true);
				$('#dimmedBox.loadingSection').show();
			}else if(option == "0" || option == undefined || option == null){ //dimmedBox Hide
				$('div#contentBoxWrap select').attr('disabled', false);
				$('#dimmedBox.loadingSection').hide(); //
			}
		}

		function popDim(id, url){			
			var idVal = $(id).attr("id");
			$('div.end').html(""); // initial
			// size
			var spaceWidth = $(window).width()-$(id).width();
			var spaceHeight = "";
			var leftSpace = spaceWidth/2;
			var topSpace = "";			
			
			if(id != undefined){
				$(id).parents("#dimmedBox").css('display','block');
				// 높이값이 고정이 아니므로 여기서 계산
				spaceHeight = $(window).height()-$(id).height();
				topSpace = spaceHeight/2;
				$(id).css({'top':topSpace, 'left':leftSpace});
				
				if(idVal == "confirmed"){
					$('div.end').html('<a href="#" class="popClose">是</a>\n<a href="#" class="popClose">否</a>');
					$('div.end').find('a').css('width', $("div.content").width()+10);
					$('div#contentBoxWrap select').attr('disabled', true);
				}else{
					
					if(url != "undefined" && url != null){
						$('div.end').html('<a href="'+url+'" class="popClose">确认</a>');
					}else{
						$('div.end').html('<a href="javascript:return;" class="popClose">确认</a>');
					}
					$('div.end').find('a').css('width', $("div.content").width()+10);
					$('div#contentBoxWrap select').attr('disabled', true);
				}
				$(".popClose").click(function(){
					if($('input#mobileNo').attr('disabled') == 'disabled'){
						$('input#mobileNo').removeAttr('disabled', 'disabled');
						$('input#mobileNo').focus();
					}
					$(id).parents("#dimmedBox").css('display','none');
					$('div#contentBoxWrap select').attr('disabled', false);
				});				
			}else{
				$("#dimmedBox").css('display','none');
				$('div#contentBoxWrap select').attr('disabled', false);
			}
		}
		function popConfirmDim(id, btn1, btn2, callback){			
			var idVal = $(id).attr("id");
			$('div.end').html(""); // initial
			// size
			var spaceWidth = $(window).width()-$(id).width();
			var spaceHeight = "";
			var leftSpace = spaceWidth/2;
			var topSpace = "";
				
			
			if(id != undefined){
				$(id).parents("#dimmedBox").css('display','block');
				// 높이값이 고정이 아니므로 여기서 계산
				spaceHeight = $(window).height()-$(id).height();
				topSpace = spaceHeight/2;
				$(id).css({'top':topSpace, 'left':leftSpace});
				
				$('div.end').find('a').css('width', $("div.content").width()+10);
				if(idVal == "confirmed"){
					//$('div.end').html('<a onclick="javascript:'+callback+'(1);">'+btn1+'</a>\n<a onclick="javascript:'+callback+'(0);">'+btn2+'</a>');
					
					$('div.end').html('<a href="javascript:'+callback+'(1);" class="popClose">'+btn1+'</a><a href="javascript:'+callback+'(0);" class="popClose">'+btn2+'</a>');
					$('div#contentBoxWrap select').attr('disabled', true);
					
				}
				$(".popClose").click(function(){
					$(id).parents("#dimmedBox").css('display','none');
					$('div#contentBoxWrap select').attr('disabled', false);
				});				
			}else{
				$("#dimmedBox").css('display','none');
				$('div#contentBoxWrap select').attr('disabled', false);
			}
		}
		function fnLoginForm() {			
			//var srcUrl = "<c:url value='/login/form.do'/>";
			// parent.fnLoginForm();
		}
		/** 로그아웃 */
		function fnLogOut() {
			
			var msg = "确定退出系统吗？";
			
			return showConfirm(msg, '是','否', 'logOutConfirm');
			
		}
		
		function logOutConfirm(flag){
			
			if(flag == "1"){
				var isSso = '${sessionScope.loginInfo.sessionIssso}';			
				if(isSso != ""){
					var url = "<c:url value='/login/logout.do'/>";
					var target = "resultLogOut";
					var data = "1=1";
					ajaxPage(url, data, target);			
				}else{
					window.location.href = "http://doosim.doosaninfracore.com/sso/logout?businessSystemId=MOBILE";
				}
				$('div#contentBoxWrap select').attr('disabled', true);
			}else{
				$('div#contentBoxWrap select').attr('disabled', false);
				return;				
			}
		}
		function doFooterLink(idx){		
			switch(idx){
				case "1" :
					location.href="<c:url value='/mbl/cs/csCustSerchR.do?osVer="+flagVer+"'/>";
					//location.href="<c:url value='/mbl/cs/csCustSerchR.do'/>";
					break;
				case "2" :
					location.href="<c:url value='/mbl/sc/scSChncSerchR.do?osVer="+flagVer+"'/>";
					// if(flagVer == "0"){				
					// 	location.href="<c:url value='/mbl/sc/scSChncSerchR.do?osVer=0'/>";
					// }else{
					// 	location.href="<c:url value='/mbl/sc/scSChncSerchR.do?osVer=1'/>";
					// }
					break;
				case "3" :
					fnLogOut();
					break;
				default :
					location.href="<c:url value='/mainpage.do'/>";
			}
		}		
		function doOnlyNumber(){
			if(!((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 97 && event.keyCode <= 105) || event.keyCode == 8)) {
				event.returnValue = false;
			}
		}		
		function doIptCustName(obj){
			value = obj.value;
			var charStr = "";
			for(var i = 0; i < value.length; i++) {
				var chr = value.substr(i,1);
				if(isChar(chr)) {
					charStr += chr;
				}
			}			
			obj.value = charStr;			
		}
		function isDigit(value) {
			var algi = '1234567890';
				for(var i = 0; i < algi.length; i++) {
				var chr = algi.substr(i,1);
					if (chr == value) {
						return true;
					}
				}
			return false;
		}
		function isChar(value) {
			var algi = '1234567890' + "\(\)\[\]\{\}\,\.\ \?\!\'\\\"\~\`\!\@\#\$\%\^\&\*\_\-\+\=\:\;\|\<\>\?\/\！\￥\……\（\）\《\》\——\？\，\。\＠\＃\＄\％\＾\＆\＊\～\＜\＞\＿\　\【\】\［\］\、\＼\＋\＝\－\·\｜\｝\｛";
				for(var i = 0; i < algi.length; i++) {
				var chr = algi.substr(i,1);
					if (chr == value) {
						return false;
					}
				}
			return true;
		}
		function isNumChar(value) {
			var algi = '1234567890'+'abcdefghijklmnopqrstuvwxyz'+'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+',';
				for(var i = 0; i < algi.length; i++) {
				var chr = algi.substr(i,1);
					if (chr == value) {
						return true;
					}
				}
			return false;
		}
		function getOnlyDigitStr(obj) {
			value = obj.value;
			var digitStr = "";
			for(var i = 0; i < value.length; i++) {
				var chr = value.substr(i,1);

				if(isDigit(chr)) {
					digitStr += chr;
				}
			}			
			obj.value = digitStr;
		}
		function getPointDigitStr(obj) {
			var val = obj.value;
			
			var value = "";
			var tail = "";
			var digitStr = "";
			var digitStrTail = "";
			
			if(val.indexOf(".") != -1){
				value = val.split(".")[0];
				tail = val.split(".")[1];
				
				if(tail != null && tail.length > 0){
					for(var i = 0; i < tail.length; i++) {
						var chr = tail.substr(i,1);
			
					   	if(isDigit(chr)) {
					   		digitStrTail += chr;
					   	}
					}
					if(digitStrTail.length > 2){
						
						digitStrTail = digitStrTail.substr(0, 2);
					}
				}
			}else{
				value = val;
				// digitStrTail = "00";
			}
			
			for(var i = 0; i < value.length; i++) {
				var chr = value.substr(i,1);
			   	if(isDigit(chr)) {
			    	digitStr += chr;
			   	}
			}
			if(digitStrTail.length > 0){
				if(digitStr.length < 1){
					digitStr = "0";
				}			
				obj.value = digitStr + "." + digitStrTail;
			
			}else{				
				obj.value = digitStr;
			}
		}
		function doIptSerial(obj){			
			value = obj.value;
			var charStr = "";
			for(var i = 0; i < value.length; i++) {
				var chr = value.substr(i,1);
				if(isNumChar(chr)) {
					charStr += chr;
				}
			}			
			obj.value = charStr;			
		}		
		function showConfirm(msg, btn1, btn2, callback) {
			
			$('div.content').html(msg);
			
			
			return popConfirmDim(confirmed, btn1, btn2, callback);
			
		}

		function doLink(idx){
	
			switch(idx){
				case "1" :
					location.href="<c:url value='/mbl/cm/cmAreaSerchR.do?osVer="+flagVer+"'/>";
					//location.href="<c:url value='/mbl/cm/cmAreaSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "2" :
					location.href="<c:url value='/mbl/sc/scSChncSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "3" :
					location.href="<c:url value='/mbl/ci/ciCustSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "4" :
					location.href="<c:url value='/mbl/ss/ssSChncSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "5" :
					//location.href="<c:url value='/mbl/sf/sfCustSerchR.do'/>";
					location.href="<c:url value='/mbl/sf/sfCustSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "6" :
					//location.href="<c:url value='/mbl/cs/csCustSerchR.do'/>";
					location.href="<c:url value='/mbl/cs/csCustSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "7" :
					//location.href="<c:url value='/mbl/rm/rmRlprSerchR.do'/>";
					location.href="<c:url value='/mbl/rm/rmRlprSerchR.do?osVer="+flagVer+"'/>";
					break;
				case "8" :
					location.href="<c:url value='/mbl/tm/tmTrgtStupU.do'/>";
					break;
				case "9" :
					location.href="<c:url value='/mbl/st/stStatMenuL.do'/>";
					break;
				case "10" :
					location.href="<c:url value='/mbl/sc/scImpntSChncLstL.do'/>";
					break;
				case "11" :
					//location.href="<c:url value='/mbl/pw/pwPwdModfiU.do'/>";
					location.href="<c:url value='/mbl/pw/pwPwdModfiU.do?osVer="+flagVer+"'/>";
					break;
				default :
					location.href="<c:url value='/mainpage.do'/>";
			}	
		}
	</script>
<!-- orgin : tagInc // Content Application -->
	<script type="text/javascript">
		function fnGetRootUrl() {
			return "${root}";
		}
		/*
		SELECT의 OPTION을 조회한다.
			@param id - SELECT객체의 ID
			@param code - 조회시 필요한 parameter
			@param menuId - SQL관련 KEY
			@param defaultValue - 조회 후 기본 선택값
		*/
		function fnAnySelect(id, data, menuId, defaultValue, isAll) {
			url = "<c:url value='/ajaxCodeSelect.do'/>";
			data += "&menuId="+menuId;
			if(isAll==null) {
				isAll = 'select';
			}
			ajaxSelect(url, data, id, defaultValue, isAll);
		}
		/*
		SELECT의 OPTION을 조회한다.
			@param id - SELECT객체의 ID
			@param code - 조회시 필요한 parameter
			@param menuId - SQL관련 KEY
			@param defaultValue - 조회 후 기본 선택값
		*/
		function fnSelect(id, code, menuId, defaultValue, isAll) {
			url = "<c:url value='/ajaxCodeSelect.do'/>";
			data = "ajaxParam1="+code+"&menuId="+menuId+"&flag=0";
			if(isAll==null) {
				isAll = 'select';
			}
			ajaxSelect(url, data, id, defaultValue, isAll);
		}

		function fnSelectExcept(id, code, menuId, defaultValue, exp, isAll) {
			url = "<c:url value='/ajaxCodeSelect.do'/>";
			data = "ajaxParam1="+code+"&menuId="+menuId+"&except="+exp+"&flag=1";
			if(isAll==null) {
				isAll = 'select';
			}
			ajaxSelect(url, data, id, defaultValue, isAll);
		}
		/* model list
		SELECT의 OPTION을 조회한다.
		@param id - SELECT객체의 ID
		@param code - 조회시 필요한 parameter
		@param menuId - SQL관련 KEY
		@param defaultValue - 조회 후 기본 선택값
		*/
		function fnMultiSelect(id, param1, param2, menuId, defaultValue, isAll) {
			url = "<c:url value='/ajaxCodeSelect.do'/>";			
			data = "ajaxParam1="+param1+"&ajaxParam2="+param2+"&menuId="+menuId;
			if(isAll==null) {
				isAll = 'select';
			}
			ajaxSelect(url, data, id, defaultValue, isAll);
		}

		function fnMultiModelSelect(id, param1, param2, param3, menuId, defaultValue, isAll) {
			url = "<c:url value='/ajaxCodeSelect.do'/>";			
			data = "ajaxParam1="+param1+"&ajaxParam2="+param2+"&ajaxParam3="+param3+"&menuId="+menuId;
			if(isAll==null) {
				isAll = 'select';
			}
			ajaxSelect(url, data, id, defaultValue, isAll);
		}

		function fnSelectNone(id, code, menuId, defaultValue) {
			var url = "<c:url value='/ajaxCodeSelect.do'/>";
			var data = "ajaxParam1="+code+"&menuId="+menuId;
			ajaxSelect(url, data, id, defaultValue, 'n');
		}
		function fnCheckbox(id, code, menuId, name, checkYn, preHtml, debug) {
			if(name && name!=null&& name!='') {	} else {name="chkBox";}
			var url = "<c:url value='/ajaxCheckbox.do'/>";
			var data = "name="+name+"&checkYn="+checkYn+"&ajaxParam1="+code+"&menuId="+menuId;
			ajaxPage(url, data, id, preHtml, debug);
		}
		function fnPage(id, code, menuId, preHtml, debug) {
			var url = "<c:url value='/ajaxPage.do'/>";
			var data = "ajaxParam1="+code+"&menuId="+menuId;
			ajaxPage(url, data, id, preHtml, debug);
		}
		function fnImgPage(id, imgKey, debug) {
			var url = "<c:url value='/ajaxImgPage.do'/>";
			var data = "ATTFILE_ID="+imgKey;
			ajaxPage(url, data, id, '', debug);
		}
		function fnImgUpdatePage(id, imgKey, debug, noImg, noDel) {
			var url = "<c:url value='/ajaxImgDeleteabledPage.do'/>";
			var data = "ATTFILE_ID="+imgKey;
			if( noImg == 'Y' ){data = data +"&NOIMG=Y";}
			if( noDel == 'Y' ){data = data +"&NODEL=Y";}
			ajaxPage(url, data, id, '', debug);
		}
		function fnValue(id, code, menuId, preHtml, debug) {
			var url = "<c:url value='/ajaxPage.do'/>";
			var data = "ajaxParam1="+code+"&menuId="+menuId;
			ajaxValue(url, data, id, preHtml, debug);
		}
		//Call stack code
		function showCallStack(){
			var f=showCallStack,result="Call stack:\n";
			while((f=f.caller)!==null){
				var sFunctionName = f.toString().match(/^function (\w+)\(/)
				sFunctionName = (sFunctionName) ? sFunctionName[1] : 'anonymous function';
				result += sFunctionName;
				result += getArguments(f.toString(), f.arguments);
				result += "\n";
			}
			return result;
		}

		function getArguments(sFunction, a) {
			var i = sFunction.indexOf(' ');
			var ii = sFunction.indexOf('(');
			var iii = sFunction.indexOf(')');
			var aArgs = sFunction.substr(ii+1, iii-ii-1).split(',')
			var sArgs = '';
			for(var i=0; i<a.length; i++) {
				var q = ('string' == typeof a[i]) ? '"' : '';
				sArgs+=((i>0) ? ', ' : '')+(typeof a[i])+' '+aArgs[i]+':'+q+a[i]+q+'';
			}
			return '('+sArgs+')';
		}
		function fnLoadPramValue(key, cols, value, noMsg){
			var result = "";			
			try{
				if(key==null || key == "")
				{	// 이 상황에서 다음과 같은 오류가 발생한다.
					// There is no statement named commonCode_gridList in this SqlMap
					// 어느 함수에서 불렸는지 확인하기 위한 코드이다.
					fnLog("ERROR fnLoadDhtmlxJson() data: " + data);
					fnLog("ERROR fnLoadDhtmlxJson() callstack : " + showCallStack());
				}
			} catch(e) {}
			ajaxPramLoad("<c:url value='/jsonPram.do'/>", data, false, noMsg);			
			return result;	
		}
		// 박스 형태의 스타일이 추가되는 파일 분기.
		function addClasses(){
			var locSrc = String(window.location);
			locSrc = locSrc.substr(locSrc.lastIndexOf("/")+1);
			locSrc = locSrc.split(".do",1);

			if(locSrc == "cmAreaSerchR" || locSrc == "ciCustLstL" || locSrc == "ciSilimarLstL" || locSrc == "rmRlprLstL" || locSrc == "scSChncLstL" || locSrc == "sfCustLstL" || locSrc == "ssSChncLstL" || locSrc == "ssSChncWhlLstL" || locSrc == "csCustLstL" || locSrc == "mainpage"){ //뒤에 or연산자로 해당 파일명 추가
				$('#contentBoxWrap').addClass('searchList');
				$('#contentBoxWrap div.listGroup').css('width', '100%');

				if(locSrc == "mainpage") {
					$("#page").addClass("noFoot");
					$("#header span").html("DOOSIM 2.0");
					$("#header div.btns").html("<a href=\"javascript:fnLogOut();\" class=\"green\">退出</a>");		
					
					// alert("3");
				}
				
			}else{
				$('#contentBoxWrap').removeClass('searchList');
			}
		}
		
		function ieBrowsers(){
			var vers = parseInt($.browser.version);
			if($.browser.msie){
				if(vers == "7"){ // Apply only iexploler 7
					$('div.modelBox').css({
						'height':$('#contentBoxWrap').height(),
						'width':'100%'
					});
				}
			}
		}

		function mobileDetector(){
			var realInputSize = ($('#contentBoxWrap').width()-20) - $('#contentBoxWrap label').width();

			if(!(isMobile.Android()) || !(isMobile.iOS())){
				$('div[data-role="fieldcontain"] input').css('width', realInputSize);
				$('div[data-role="fieldcontain"] textarea').css('width', realInputSize);

				// checkbox, radio는 Size auto
				$('div[data-role="fieldcontain"] input[type="date"]').css('width', 'auto');
				$('div[data-role="fieldcontain"] input[type="hidden"]').css('width', '0');
				$('div[data-role="fieldcontain"] input[type="checkbox"]').css('width', 'auto');
				$('div[data-role="fieldcontain"] input[type="radio"]').css('width', 'auto');
			}
		}
		
		function chkInit(){
			
			if($('#initChk').attr('checked') == "checked"){
				$('#initCust').val('1');
			
			}else{
				$('#initCust').val('0');
			}
		}
	</script>
</head>
<body>
<div data-role="page">
	<!-- loadingBar -->
	<div id="dimmedBox" class="loadingSection">
		<div id="dimmed"></div>
		<!-- 부르는 값에 따라 바뀌는 곳 -->
		<div id="loading">
			<div class="spinner bar">
				<div class="bar1"></div>
				<div class="bar2"></div>
				<div class="bar3"></div>
				<div class="bar4"></div>
				<div class="bar5"></div>
				<div class="bar6"></div>
				<div class="bar7"></div>
				<div class="bar8"></div>
				<div class="bar9"></div>
				<div class="bar10"></div>
				<div class="bar11"></div>
				<div class="bar12"></div>
				<div class="msien"></div>
			</div>
			<div class="text">Loading</div>
		</div>
	</div>

	<!-- Notification -->
	<div id="dimmedBox">
		<div id="dimmed"></div>
		<!-- just this Change! -->		
		<div id="notification">
			<div class="cmmBtn"><a href="#" class="popClose">닫기</a></div>
			<div class="Window">
				<div class="start">提示</div>
				<div class="content">
				</div>
				<div class="end"></div>
			</div>
		</div>
		<!-- just this Change! -->
	</div>
	<!-- Notification -->

	<!-- Notification -->
	<div id="dimmedBox">
		<div id="dimmed"></div>
		<!-- just this Change! -->		
		<div id="confirmed">
			<div class="cmmBtn"><a href="#" class="popClose">닫기</a></div>
			<div class="Window">
				<div class="start">提示</div>
				<div class="content">
				</div>
				<div class="end"></div>
			</div>
		</div>
		<!-- just this Change! -->
	</div>
	<!-- Notification -->

	<!-- 풋터가 없는 페이지는 wrapperPAGE아이디에 "noFoot" 클래스 추가, 있는 페이지는 "noFoot" 클래스 삭제 또는 클래스 없음.  -->
	<!-- mainpage -->
	<div id="page">	<!--  class="noFoot" -->
		<!-- Head --> 
		<div id="header">
			<span><!--DOOSIM 2.0--></span>
			<!-- execute Button -->
			<div class="btns toolBar type2 btns_center">
				<!--  
					<a href="javascript:history.go(-1); return false;" name="Back">返回</a>
					<a href="javascript:doValCombo();" class="green" name="Save">提交</a>
				-->
			</div>
		</div>
		<!-- Head -->
	<div data-rold="content">
		<!-- contents -->
		<div id="wrapper">
			<div id="scroller">
				<div class="modelBox">
				<div id="contentBoxWrap">