//Global
// Mobile Detector
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};

var ua = navigator.userAgent;
var androidversion = parseFloat(ua.slice(ua.indexOf("Android")+8));
var flagVer = "";

if(Math.floor(androidversion) == "2"){ // Mobile OS is Android and Ver is 2.X(Or GINGERBREAD),
	flagVer = "1";

}else if(!(isMobile.Android()) || Math.floor(androidversion) > "2"){ // mobile OS isnt Android or Ver is Higher than 2.X
	flagVer = "0";
}

function historyBack(){
    var locSrc = String(window.location);
    locSrc = locSrc.substr(locSrc.lastIndexOf("/")+1);
    locSrc = locSrc.split(".do",1);

    if(locSrc == "scSChncLstL"){
        loadingBox(1);
        location.href="scSChncSerchR.do?osVer="+flagVer+"";
    } else if(locSrc == "ciCustLstL"){
        loadingBox(1);
        location.href="ciCustSerchR.do?osVer="+flagVer+"";
    } else if(locSrc == "ssSChncLstL"){
        loadingBox(1);
        location.href="ssSChncSerchR.do?osVer="+flagVer+"";
    } else if(locSrc == "sfCustLstL"){
        loadingBox(1);
        location.href="sfCustSerchR.do?osVer="+flagVer+"";
    } else if(locSrc == "csCustLstL"){
        loadingBox(1);
        location.href="csCustSerchR.do?osVer="+flagVer+"";
    } else if(locSrc == "rmRlprLstL"){
        loadingBox(1);
        location.href="rmRlprSerchR.do?osVer="+flagVer+"";
    }
}
function searchInput(){
    var idx = $('#contentBoxWrap div[data-role="fieldcontain"] input[type="text"]').index('#contentBoxWrap div[data-role="fieldcontain"] input[type="text"]');
    var realContentSize = $('#contentBoxWrap div[data-role="fieldcontain"]').width();
    realInputSize = realContentSize - ($('#contentBoxWrap div[data-role="fieldcontain"] label, #contentBoxWrap div[data-role="fieldcontain"] legend').width() + 150);
    realInputSize = Math.floor((realInputSize/realContentSize)*100)+"%";
    $('#contentBoxWrap div[data-role="fieldcontain"] input[type="text"]').each(function(idx){
        if ($('#contentBoxWrap div[data-role="fieldcontain"]').eq(idx).has('a.btnCheck')){ 
            $('#contentBoxWrap div[data-role="fieldcontain"] input[type="text"]').eq(idx).css({
                'width':realInputSize,
                'float':'left'
            });
        }else{
            $('#contentBoxWrap div[data-role="fieldcontain"] input[type="text"]').eq(idx).css('width', realInputSize);
        }    
    });
    $('a.btnCheck').click(function(){
        $('#serialNo').val('');
        $('#purchaseQty').val('0');
        return false;
    });
    //alert(realInputSize);
}