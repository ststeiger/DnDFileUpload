<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DnDFileUpload.Default" %>

<!DOCTYPE html>
<html lang="en-US">
<head runat="server">
	<meta http-equiv = 'X-UA-Compatible' content = 'IE=edge,chrome=1' />
	<meta charset="utf-8" />
	<title>Drag n' Drop File Upload</title>
	
	<!--
	<meta name="viewport" content="width=device-width" />
	-->
	
	<meta name ="viewport" content="width=device-width, initial-scale=0.90, minimum-scale=0.90, maximum-scale=0.90" />
	<meta name="Keywords" content="HTML,CSS,XML,JavaScript,DOM,jQuery,ASP.NET,PHP,SQL,colors,tutorial,programming,development,training,learning,quiz,primer,lessons,reference,examples,source code,demos,tips,color table,w3c,cascading style sheets,active server pages,Web building,Webmaster" />
	<meta name="Description" content="Free HTML CSS JavaScript DOM jQuery XML AJAX Angular ASP .NET PHP SQL tutorials, references, web building examples" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" /> 
	
    <link href="Resources/Style.css" rel="Stylesheet" />
    
	<!---
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
	    <script src="Resources/jquery-1.8.2.min.js"></script>
    -->
    <script src="Resources/jquery_unbloat.js"></script>
    
    <script type="text/javascript">
        var dropZone;
        var maxRequestLength = <%=maxRequestLength%>;

		
        // Initializes the dropZone
        // $(document).ready(function () {
        document.addEventListener("DOMContentLoaded", function(event) { 
        
            // dropZone = $('#dropZone');
            // dropZone.removeClass('error');

            var dropZone = document.getElementById("dropZone");
            removeClass(dropZone, 'error');

            // Check if window.FileReader exists to make 
            // sure the browser supports file uploads
            if (typeof(window.FileReader) == 'undefined') 
            {
                addClass(dropZone, 'error');
                text("lblInfo", 'Browser Not Supported!');
                
                return;
            }

            // Add a nice drag effect
            dropZone.ondragover = function () {
                // dropZone.addClass('hover');
                addClass(dropZone, "hover");
                return false;
            };

            // Remove the drag effect when stopping our drag
            dropZone.ondragend = function () {
                // dropZone.removeClass('hover');
                removeClass(dropZone, "hover");
                return false;
            };

            // The drop event handles the file sending
            dropZone.ondrop = function(event) {
                // Stop the browser from opening the file in the window
                event.preventDefault();
                removeClass(dropZone, "hover");

				
                for(var i = 0; i < event.dataTransfer.files.length; ++i)
                {
	                // Get the file and the file reader
	                var file = event.dataTransfer.files[i];
                    console.log(file.name);
                    

	                // Validate file size
	                if( file.size > maxRequestLength ) 
	                {
	                    text("lblInfo", 'File Too Large!');
	                    addClass(dropZone, "error");

	                    window.setTimeout(function()
	                    {
	                        text("lblInfo", 'Drag files here');
	                        removeClass(dropZone, "error");
	                    }, 3000);

	                    return false;
	                } // End if( file.size > maxRequestLength ) 
	                
	                // Send the file
	                var xhr = new XMLHttpRequest();
	                console.log(file);
	                xhr.upload.fileName = encodeURIComponent(file.name) ;
	                xhr.upload.addEventListener('progress', uploadProgress, false);
	                xhr.onreadystatechange = stateChange;
	                xhr.open('POST', 'FileUpload.ashx', true);
	                
	                xhr.setRequestHeader("Content-Type", "multipart/form-data");
	                xhr.setRequestHeader('X-FILE-NAME', encodeURIComponent(file.name) ); // UTF8
	                xhr.setRequestHeader("X-File-Type", file.type);
	                // xhr.setRequestHeader("X-File-id", md5(file.name + file.size))
	                xhr.send(file);
				} 
            };
        }); // End document.ready
        
        
        // Show the upload progress
        function uploadProgress(event) 
        {
            // console.log(this.fileName);
            // console.log(decodeURIComponent(event.target.fileName));
            var percent = parseInt(event.loaded / event.total * 100);

            text("lblInfo", 'Uploading: ' + percent + '%');
        } // End Event uploadProgress


        // Show upload complete or upload failed depending on result
        function stateChange(event) 
        {
            if (event.target.readyState == 4) 
            {
                if (event.target.status == 200 || event.target.status == 304) 
                {
                    text("lblInfo", 'Upload Complete!');

                    window.setTimeout(function()
                    {
                        text("lblInfo", 'Drag files here');
                    }, 2000);
                    
                }
                else 
                {
                    var str = "Error: HTTP " + event.target.status +" \n";
                    str += event.target.statusText +" \n\n\n\n";
                    alert(str);
                    
                    html("obj", event.target.responseText);
                    
                    text(dropZone, 'Upload Failed!');
                    addClass(dropZone, 'error');
                }

            } // End if (event.target.readyState == 4) 

        } // End Event stateChange

    </script>	
	
</head>
<body>
    <form id="form1" runat="server">
        <div id="dropZone" style="">
            <span id="lblInfo" class="dropZoneText">
                Drag files here
            </span>
            
            <!-- Drop File Here to Upload.-->
        </div>
    </form>

    <object id="obj" type="text/html"></object>
    <!--
        <object type="text/html" data="some.html"></object>
    -->
</body>
</html>
