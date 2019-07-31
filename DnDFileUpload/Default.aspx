<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DnDFileUpload.Default" %>

<!DOCTYPE html>
<html lang="en-US">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta charset="utf-8" />

    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />

    <title>Drag n' Drop File Upload</title>

    <style type="text/css" media="all">
        html, body 
        {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>


    <!--
	<meta name="viewport" content="width=device-width" />
	-->
    <meta name="viewport" content="width=device-width, initial-scale=1.00, minimum-scale=0.00, maximum-scale=10.00, user-scalable=yes" />

    <meta name="Keywords" content="HTML,CSS,XML,JavaScript,DOM,jQuery,ASP.NET,PHP,SQL,colors,tutorial,programming,development,training,learning,quiz,primer,lessons,reference,examples,source code,demos,tips,color table,w3c,cascading style sheets,active server pages,Web building,Webmaster" />
    <meta name="Description" content="Free HTML CSS JavaScript DOM jQuery XML AJAX Angular ASP .NET PHP SQL tutorials, references, web building examples" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />

    <link href="Resources/Style.css" rel="Stylesheet" />

    <!---
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
	    <script src="Resources/jquery-1.8.2.min.js"></script>
    -->
    <script src="Resources/jquery_unbloat.js"></script>
    <script src="Scripts/FileUpload/fileUpload.js"></script>

    <!--
    <script type="text/javascript">
        var dropZone;
        var maxRequestLength = <%=maxRequestLength%>;


        // Initializes the dropZone
        // $(document).ready(function () {
        document.addEventListener("DOMContentLoaded", function (event)
        {

            // dropZone = $('#dropZone');
            // dropZone.removeClass('error');

            var dropZone = document.getElementById("dropZone");
            removeClass(dropZone, 'error');

            // Check if window.FileReader exists to make 
            // sure the browser supports file uploads
            if (typeof (window.FileReader) == 'undefined') 
            {
                addClass(dropZone, 'error');
                text("lblInfo", 'Browser Not Supported!');
                return;
            }


            dropZone.ondragstart = function ()
            {

            }

            // Add a nice drag effect
            dropZone.ondragover = function ()
            {
                // dropZone.addClass('hover');
                addClass(dropZone, "hover");

                addClass("dropSymbol", "circleBaseVisible");
                console.log("dropSymbol");

                return false;
            };

            // Remove the drag effect when stopping our drag
            dropZone.ondragend = function ()
            {
                // dropZone.removeClass('hover');
                removeClass(dropZone, "hover");
                removeClass("dropSymbol", "circleBaseVisible");
                return false;
            };

            // The drop event handles the file sending
            dropZone.ondrop = function (event)
            {
                // Stop the browser from opening the file in the window
                event.preventDefault();
                removeClass(dropZone, "hover");
                removeClass("dropSymbol", "circleBaseVisible");
                // removeClass("dropSymbol", "circleBaseVisible");

                for (var i = 0; i < event.dataTransfer.files.length; ++i)
                {
                    // Get the file and the file reader
                    var file = event.dataTransfer.files[i];
                    console.log(file.name);


                    // Validate file size
                    if (file.size > maxRequestLength) 
                    {
                        text("lblInfo", 'File Too Large!');
                        addClass(dropZone, "error");

                        window.setTimeout(function ()
                        {
                            text("lblInfo", 'Drag files here');
                            removeClass(dropZone, "error");
                        }, 3000);

                        return false;
                    } // End if( file.size > maxRequestLength ) 

                    // Send the file
                    var xhr = new XMLHttpRequest();
                    console.log(file);
                    xhr.upload.fileName = encodeURIComponent(file.name);
                    xhr.upload.addEventListener('progress', uploadProgress, false);
                    xhr.onreadystatechange = stateChange;
                    xhr.open('POST', 'FileUpload.ashx', true);

                    xhr.setRequestHeader("Content-Type", "multipart/form-data");
                    xhr.setRequestHeader('X-FILE-NAME', encodeURIComponent(file.name)); // UTF8
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
                    // text("lblInfo", 'Upload Complete!');
                    var lblInfo = document.getElementById("lblInfo");
                    lblInfo.innerText = "Upload Complete!";

                    window.setTimeout(function ()
                    {
                        // text("lblInfo", 'Drag files here');
                        removeChildren(lblInfo);

                        var strng = document.createElement("strong");
                        strng.appendChild(document.createTextNode("Choose a file"));

                        var span = document.createElement("span");
                        span.className = "box__dragndrop";
                        span.appendChild(document.createTextNode(" or drag it here"));

                        // <strong>Choose a file</strong><span class="box__dragndrop"> or drag it here</span>.    

                        var frag = document.createDocumentFragment();
                        frag.appendChild(strng);
                        frag.appendChild(span);
                        lblInfo.appendChild(frag);

                    }, 2000);

                }
                else 
                {
                    var str = "Error: HTTP " + event.target.status + " \n";
                    str += event.target.statusText + " \n\n\n\n";
                    alert(str);

                    html("obj", event.target.responseText);

                    text(dropZone, 'Upload Failed!');
                    addClass(dropZone, 'error');
                }

            } // End if (event.target.readyState == 4) 

        } // End Event stateChange

    </script>
    -->

</head>
<body>

    <iframe name="ifoo" style="width: 100%; height: 1cm;" frameborder="0" allowtransparency="true"></iframe>

    <form id="form1" runat="server">
    </form>



    <form id="formUpload" enctype="multipart/form-data" method="POST" action="FileUpload.ashx" target="ifoo">
        <input type="file" name="files[]" id="file" onchange="this.parentElement.submit();" style="display: block; opacity: 0;" class="box__file" data-multiple-caption="{count} files selected" multiple="multiple">


        <div id="dropZone" style="position: relative;">
            <label for="file" style="display: block; position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
                <span id="lblInfo" class="dropZoneText">
                    <!--
                    <a>Choose a file</a><span class="box__dragndrop"> or drag it here</span>.
                    <a>Choisissez un fichier</a><span class="box__dragndrop"> ou faites-le glisser ici</span>.
                    <a>Scegli un file</a><span class="box__dragndrop"> o trascinalo qui</span>.
                    -->

                    <a style="text-decoration: underline;">Wählen Sie eine Datei</a>
                    <span class="box__dragndrop">oder ziehen Sie sie hierher</span>.   
                </span>

                <!-- Drop File Here to Upload.-->
            </label>
        </div>


        <!--
        <input id="autosubmit" type="submit" value="Upload" />
        -->
    </form>

    <div id="dropSymbol" class="circleBaseInvisible ">

        <div style="display: table-cell; vertical-align: middle;">

            <div style="display: table; margin-right: auto; margin-left: auto;">
                <!-- Start Content -->
                <span style="display: block; color: #FFFFFF; font-size: 5mm;">
                    <!-- Incoming! -->
                    <!-- Entrant! -->
                    <!-- Arrivo! -->
                    Eingehend !
                </span>

                <span style="display: block; padding-top: 2mm; color: #FFFFFF; font-size: 3.5mm;">
                    <!-- Drop your files to instantly upload them to Drive -->
                    <!-- Ziehen Sie Ihre Dateien hier hin, um sie sofort auf Drive hochzuladen -->
                    <!-- Rilascia i tuoi file per caricarli immediatamente su Drive -->
                    <!-- Déposez vos fichiers pour les télécharger instantanément sur Drive -->
                    Ziehen Sie Ihre Dateien hier hin, um sie sofort auf Drive hochzuladen
                </span>

                <!-- End Content -->
            </div>

        </div>
        <!-- table-cell -->

    </div>
    <!-- circle -->


    <object id="obj" type="text/html"></object>
    <!--
        <object type="text/html" data="some.html"></object>
    -->
</body>
</html>
