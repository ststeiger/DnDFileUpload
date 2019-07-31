var dropZone;
var maxRequestLength = 1073741824;
document.addEventListener("DOMContentLoaded", function (event)
{
    var dropZone = document.getElementById("dropZone");
    removeClass(dropZone, 'error');
    if (typeof (window.FileReader) == 'undefined')
    {
        addClass(dropZone, 'error');
        text("lblInfo", 'Browser Not Supported!');
        return;
    }
    dropZone.ondragstart = function ()
    {
    };
    dropZone.ondragover = function ()
    {
        addClass(dropZone, "hover");
        addClass("dropSymbol", "circleBaseVisible");
        console.log("dropSymbol");
        return false;
    };
    dropZone.ondragend = function ()
    {
        removeClass(dropZone, "hover");
        removeClass("dropSymbol", "circleBaseVisible");
        return false;
    };
    dropZone.ondrop = function (event)
    {
        event.preventDefault();
        removeClass(dropZone, "hover");
        removeClass("dropSymbol", "circleBaseVisible");
        for (var i = 0; i < event.dataTransfer.files.length; ++i)
        {
            var file = event.dataTransfer.files[i];
            console.log(file.name);
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
            }
            var xhr = new XMLHttpRequest();
            console.log(file);
            xhr.upload.fileName = encodeURIComponent(file.name);
            xhr.upload.addEventListener('progress', uploadProgress, false);
            xhr.onreadystatechange = stateChange;
            xhr.open('POST', 'FileUpload.ashx', true);
            xhr.setRequestHeader("Content-Type", "multipart/form-data");
            xhr.setRequestHeader('X-FILE-NAME', encodeURIComponent(file.name));
            xhr.setRequestHeader("X-File-Type", file.type);
            xhr.send(file);
        }
    };
});
function uploadProgress(event)
{
    var percent = parseInt((event.loaded / event.total * 100).toString());
    text("lblInfo", 'Uploading: ' + percent + '%');
}
function stateChange(event)
{
    var re = event.target;
    if (re.readyState == 4)
    {
        if (re.status == 200 || re.status == 304)
        {
            var lblInfo_1 = document.getElementById("lblInfo");
            lblInfo_1.innerText = "Upload Complete!";
            window.setTimeout(function ()
            {
                removeChildren(lblInfo_1);
                var strng = document.createElement("strong");
                strng.appendChild(document.createTextNode("Choose a file"));
                var span = document.createElement("span");
                span.className = "box__dragndrop";
                span.appendChild(document.createTextNode(" or drag it here"));
                var frag = document.createDocumentFragment();
                frag.appendChild(strng);
                frag.appendChild(span);
                lblInfo_1.appendChild(frag);
            }, 2000);
        }
        else
        {
            var str = "Error: HTTP " + re.status + " \n";
            str += re.statusText + " \n\n\n\n";
            alert(str);
            html("obj", re.responseText);
            text(dropZone, 'Upload Failed!');
            addClass(dropZone, 'error');
        }
    }
}
