<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page import="com.gzunicorn.common.util.SysConfig" %>
<script language="javascript" src="<html:rewrite page="/common/javascript/jquery-1.9.1.min.js"/>"></script>
<script language="javascript" src="<html:rewrite page="/common/javascript/checkinput.js"/>"></script>

<script language="javascript">

//关于ToolBar
function CreateToolBar(){
  SetToolBarHandle(true);
  SetToolBarHeight(20);

  //AddToolBarItemEx("ReturnBtn","../../common/images/toolbar/back.gif","","",'<bean:message key="toolbar.return"/>',"65","0","returnMethod()");
  AddToolBarItemEx("ReturnTkBtn","../../common/images/toolbar/back.gif","","",'<bean:message key="button.returntask"/>',"110","0","returnTaskMethod()");	
  <logic:notPresent name="display">  
  <%-- 是否有可写的权限--%>
  <logic:equal name="<%=SysConfig.TOOLBAR_RIGHT%>" property="nmyTaskOA" value="Y"> 
    AddToolBarItemEx("SaveBtn","../../common/images/toolbar/save.gif","","",'<bean:message key="button.submit"/>',"65","1","saveMethod()");
  </logic:equal>
  </logic:notPresent>
  
  AddToolBarItemEx("ViewFlow","../../common/images/toolbar/viewdetail.gif","","",'<bean:message key="toolbar.viewflow"/>',"110","1","viewFlow()");
  
  window.document.getElementById("toolbar").innerHTML=GenToolBar("TabToolBar_Manage","TextToolBar_Black","Style_Over","Style_Out","Style_Down","Style_Check");
}
//去掉空格
String.prototype.trim = function(){ return this.replace(/(^\s*)|(\s*$)/g,""); }

//返回
/* function returnMethod(){
  window.location = '<html:rewrite page="/maintContractQuoteSearchAction.do"/>?method=toSearchRecord';
} */

//返回代办列表
function returnTaskMethod(){
	window.location ='<html:rewrite page="/myTaskOaSearchAction.do"/>?method=toDoList&jumpto=templetdoorapp';
}

//提交
function saveMethod(){
	
	<logic:match name="taskname" value="督查组长审核">
		var isDelete=document.getElementsByName("isDelete");
		var deleteRem=document.getElementsByName("deleteRem");
		for(var i=0;i<isDelete.length;i++){
			if(isDelete[i].value=="Y"){
				if(deleteRem[i].value==""||deleteRem[i].value==null){
					alert("必须填写删除原因");
					return;
				}
			}
		}
	</logic:match>

	var objval=document.getElementById("approveResult").value;

	if(objval=="驳回到督查员" || objval=="终止流程"){
		var approverem=document.getElementById("approveRem").value;
		if(approverem.trim()==""){
			alert("抱歉,您选择了'驳回到督查员'或'终止流程',请填写审批意见!");
			return;
		}
	}else{
		if(!checkColumnInput(qualityCheckManagementJbpmForm)){
			return;
		}
	}
	
	if(document.getElementById("deductMoney")==null){
		document.getElementById("SaveBtn").disabled=true;
		document.qualityCheckManagementJbpmForm.submit();
	}else{
		if(!isNaN(document.getElementById("deductMoney").value)){
			document.getElementById("SaveBtn").disabled=true;
			document.qualityCheckManagementJbpmForm.submit();
		}else{
			alert("扣款金额只能输入数字！");
		}
		
	}
	

}

//查看流程
function viewFlow(){	
	var hiddenReturnStatus=document.getElementById("status");
	if(hiddenReturnStatus.value=="-1"){
		alert("流程未启动，无法查看审批流程图！");
	}else{
		var avf=document.getElementById("avf");
		var tokenid=document.getElementById("tokenid");
		var flowname=document.getElementById("flowname");
		if(tokenid!=null && tokenid.value!=""){
			if(avf!=null && tokenid!=null && flowname!=null){
				avf.href='<html:rewrite page="/viewProcessAction.do"/>?method=toViewProcess&tokenid='+tokenid.value+'&flowname='+flowname.value;
				avf.click();
			}else{
				alert("请选择一条要查看的记录！");
			}
		}else{
			alert("该记录为历史数据，无法查看审批流程图！");
		}
	}
}

/* //是否显示扣款金额输入框
function isDeductions(object,is){
	var flag="";
	val=document.getElementById("approveResult").value;
	if(val!="" && (val=="同意" || val.indexOf("提交")>-1)){
		flag="1"
	}
	//var tr=object.parentNode.parentNode;
	var td=document.getElementById("td1");
	if(flag=="1" && is=="Y"){
		td.innerHTML="<input type=\'text\' name=\'deductMoney\' id=\'deductMoney\' onkeypress=\'f_check_number3()\'  /><font color=\'red\'>*</font>"
	}else{
		td.innerHTML="";
	}
} */

//检查金额是否为数字,不可以输入负号和可以输入点号
function f_check_number3(){
 	if((event.keyCode>=48 && event.keyCode<=57) || event.keyCode==46 ){
 	}else{
		event.keyCode=0;
  	}
}

function checkthisvalue(obj){  
	var objv=obj.value.substring(0,obj.value.length-1);
	if(isNaN(obj.value)){
		obj.value=0;
	}
}

//下载附件
function downloadFile(name,oldName){
	var uri = '<html:rewrite page="/qualityCheckManagementJbpmAction.do"/>?method=toDownloadFile';
	var name=encodeURI(name);
	name=encodeURI(name);
	oledName=encodeURI(oldName);
	oledName=encodeURI(oldName);
		uri +='&filesname='+ name;
		uri +='&folder=MTSComply.file.upload.folder';
		uri+='&fileOldName='+oldName;
	window.location = uri;
}

//检查项计算 总得分，得分等级
/** 
  	总得分=100-分值的合计；
  	--得分等级=根据总得分进行判断：90分以上优秀，80分-90分合格，80分以下不合格
  	得分等级=80-84分为合格，85-89为良好， 90以上为优秀 【2017-05-19修改】
*/
function partitionGrade(){
	var totalPoints=document.getElementsByName("totalPoints")[0];
	var total=parseFloat(totalPoints.value);
	var leve="";
	if(total>=90){
		leve="优秀";
	}else if(total>=85 && total<90){
		leve="良好";
	}else if(total>=80 && total<85){
		leve="合格";
	}else{
		leve="不合格";
	}
	document.getElementsByName("scoreLevel")[0].value=leve;
}

function isQualified(){
	//var fractions=document.getElementsByName("fraction");
	var fractions=$("#party_a [name='fraction']");
	var total=0.0;
	if(fractions!=null && fractions.length>0){
		for(var i=0;i<fractions.length;i++){
			total+=parseFloat(fractions[i].value);
		}
	}
	document.getElementsByName("totalPoints")[0].value=100.0-total;
}

function deleRow(i){
	var $tr=$("#"+i);
	$("#"+i).remove();
	//$("#party_b").append($tr);
	//$("#"+i+" td:last").show();
    $("#party_b").show();
	var booleam=$("#"+i+" td:eq(1)").css("color")=="red";
    if(booleam){
    	$("#party_b").append($tr);
    }else
    {
    	var my_element=$("#party_b .red").length > 0;
    	if($("#party_b .red").length > 0){
    		$("#party_b .red:first").parent().before($tr);
    	}else{
    		$("#party_b").append($tr);
    	}
    }
    //$("#"+i+" td:last").show();
    $("#"+i+" td").eq($("#"+i+" td").length-4).show();
    $("#"+i+" td").eq($("#"+i+" td").length-3).show();
	
	var td="<input type=\"button\" value=\"删除\" class=\"default_input\" onclick=\"returnDeleRow(\'"+i+"\')\"/>"+
	"<input type=\"hidden\" name=\"isDelete\" value=\"Y\"/>";
	$("#"+i+" td:eq(0)").html(td);
	isQualified();
	partitionGrade();
}

function returnDeleRow(i){
	var $tr=$("#"+i);
	$("#"+i).remove();
	//$("#party_a").append($tr);
	//$("#"+i+" td:last").hide();
	
	var booleam=$("#"+i+" td:eq(1)").css("color")=="red";
    if(booleam){
    	$("#party_a").append($tr);
    }else
    {
    	var my_element=$("#party_a .red").length > 0;
    	if($("#party_a .red").length > 0){
    		$("#party_a .red:first").parent().before($tr);
    	}else{
    		$("#party_a").append($tr);
    	}
    }
    //$("#"+i+" td:last").hide();
    $("#"+i+" td").eq($("#"+i+" td").length-4).hide();
    $("#"+i+" td").eq($("#"+i+" td").length-3).hide();
    
	var td="<input type=\"button\" value=\"删除\" class=\"default_input\" onclick=\"deleRow(\'"+i+"\')\"/>"+
	"<input type=\"hidden\" name=\"isDelete\" value=\"N\"/>";
	$("#"+i+" td:eq(0)").html(td);
	isQualified();
	partitionGrade();
}

//删除行
function deleteFileRow(thisobj){
	var tableObj = getFirstSpecificParentNode("table",thisobj);
	
	var inputs = tableObj.getElementsByTagName("input");
	var checkboxs = new Array(); //table的所有checkbox
	for(var i=0;i<inputs.length;i++){
	    if(inputs[i].type=="checkbox"){
	    	checkboxs.push(inputs[i]);	      	
	    }
	}
	
	checkboxs[0].checked = false;//全选按钮取消选中 
	
	//在table中从下至上删除选中的行
	for(var i=checkboxs.length-1;i>0;i--){	
		if(checkboxs[i].checked == true){
		  tableObj.deleteRow(getFirstSpecificParentNode("tr",checkboxs[i]).rowIndex);
		}				
	}
}
//列表全选反选
function checkTableFileAll(thisobj){
	var tableObj = getFirstSpecificParentNode("table",thisobj);
	var rows = tableObj.rows
	for(var i=1;i<rows.length;i++){
	  var inputs = rows[i].cells[0].getElementsByTagName("input");
	  for(j=0;j<inputs.length;j++){
	    if(inputs[j].type=="checkbox"){
	      inputs[j].checked = thisobj.checked;
	    }
	  }
	}
}

var fileGird=0;
function AddRow(uploadtab_2,value,value2){
	var upload=uploadtab_2.parentNode.parentNode.parentNode;
	var num=upload.rows.length;
	upload.insertRow(num);
	var ince0=upload.rows(num).insertCell(0);
	ince0.align="center";
	ince0.name="fileNo_"+fileGird
	ince0.innerHTML="<input type='checkbox' name='nodes' onclick=\'cancelCheckAll(this)\'>";
	var ince1=upload.rows(num).insertCell(1);
	ince1.innerHTML="<input id=\'file_"+fileGird+"\' name=\'"+fileGird+"\' type=\'file\' class=\'default_input\' />"
	+"<input type=\'hidden\' name=\'isdelete_"+fileGird+"\' value=\'"+value+"\' />"
	+"<input type=\'hidden\' name=\'primary_"+fileGird+"\' value=\'"+value2+"\' />";
	
	fileGird++;
}
//全选checkbox取消选中
function cancelCheckAll(thisobj){ 
  var tableObj = getFirstSpecificParentNode("table",thisobj);
  var inputs = tableObj.getElementsByTagName("input");  
  if(thisobj.checked==false){
    for(var j=0;j<inputs.length;j++){
	  if(inputs[j].type=="checkbox"){
	    inputs[j].checked = false; //table中第一个checkbox取消选中
	    break;
	  }
	}
  }
}

</script>

  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22" class="table_outline3" valign="bottom" width="100%">
            <div id="toolbar" align="center">
            <script language="javascript">
              CreateToolBar();
            </script>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>