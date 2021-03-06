﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DragOut.aspx.cs" Inherits="DnDFileUpload.DragOut" %>

<!DOCTYPE html>
<html lang="en-GB">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta charset="UTF-8">
	<meta name="author" content="The CSS Ninja">
	<meta name="keywords" content="Drag and drop, HTML5, DownloadURL, setData, dataTransfer">
	<meta name="description" content="How to create reverse drag and drop functionality like Gmail in Chrome 5 and upwards">
	<meta name="robots" content="all">
	<meta name="copyright" content="The CSS Ninja">
	
	<link rel="stylesheet" type="text/css" href="_styles.css" media="screen">
	
	<title>Drag a file from a website to your filesystem</title>
</head>
<body>

    <form id="form1" runat="server">

	    <div class="container">
		    <h1>Drag out any of these links to your dekstop</h1>
		
            <a href="ajax/GetFile.ashx?name=Eadui2.ttf" id="dragout" class="dragme" draggable="true" data-downloadurl="application/octet-stream:Eadui2.ttf:<%=ToCanonicalUrl("~/ajax/GetFile.ashx")%>?name=Eadui2.ttf">Font file</a>
		
            <a href="ajax/GetFile.ashx?name=HTML5CheatSheet.pdf" id="dragout2" class="dragme" draggable="true" data-downloadurl="application/pdf:HTML5CheatSheet.pdf:<%=ToCanonicalUrl("~/ajax/GetFile.ashx")%>?name=HTML5CheatSheet.pdf">PDF file</a>
        
            

            <a href="downloads/Eadui2.ttf" id="dragout" class="dragme" draggable="true" data-downloadurl="application/octet-stream:Eadui2.ttf:<%=ToCanonicalUrl("~/ajax/GetFile.ashx")%>?name=Eadui2.ttf">
                Linux dragable Font file
            </a>


            <!-- 
            <a href="downloads/Eadui2.ttf" id="dragout" class="dragme" draggable="true">
                Font file
            </a>
            -->


            <!-- 
                Cool - ACTUALLY WORKS WITHOUT ANYTHING !!! 
                But only on Linux (XFCE & Gnome) 
                (no dragable or downloadurl, or else ==> crap) 
                The magic is actually done by Nautilus an/or Thunar 
                (coincidence ? Probably gvfs)..    
            --> 
            <!--
            <a href="downloads/Eadui2.ttf" id="dragout" class="dragme">
                Font file
            </a>
            -->

	    </div>

	</form>

	<script type="text/javascript">

	    function dndInit()
	    {
	        var files = [document.getElementById("dragout")
                , document.getElementById("dragout2")
                , document.getElementById("dragout3")]
                , fileDetails = []
	        ;

	        // Some forward thinking, utilise the custom data attribute to extend attributes available.http://localhost:49172/Virt_X/ajax/GetFile.ashx?name=Eadui2.ttf
	        if (typeof files[0].dataset === "undefined")
	        {
	            // Grab it the old wayhttp://localhost:49172/Virt_X/ajax/GetFile.ashx?name=Eadui2.ttf
	            fileDetails[0] = files[0].getAttribute("data-downloadurl");
	            fileDetails[1] = files[1].getAttribute("data-downloadurl");
	        } else
	        {
	            fileDetails[0] = files[0].dataset.downloadurl;
	            fileDetails[1] = files[1].dataset.downloadurl;
	        }

	        files[0].addEventListener("dragstart", function (evt)
	        {
	            evt.dataTransfer.setData("DownloadURL", fileDetails[0]);
	        }, false);
	        files[1].addEventListener("dragstart", function (evt)
	        {
	            evt.dataTransfer.setData("DownloadURL", fileDetails[1]);
	        }, false);

	    } // End Function dndInit

	    dndInit();
	</script>
</body>
</html>
