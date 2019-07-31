
interface Window
{
    FileReader: FileReader;
}

interface XMLHttpRequestUpload
{
    fileName: string;
}

interface IAddRemoveClass
{
    (title: HTMLElement, message: string): any;
}

// declare let removeClass: IAddRemoveClass;
declare function removeClass(title: string | HTMLElement, message: string): void;
declare function addClass(title: string | HTMLElement, message: string): void;
declare function text(title: string | HTMLElement, message: string): void;
declare function html(title: string | HTMLElement, message: string): void;
declare function removeChildren(title: HTMLElement): void;





let dropZone: HTMLElement;
// let maxRequestLength = <%=maxRequestLength%>;
let maxRequestLength = 1073741824;


// Initializes the dropZone
// $(document).ready(function () {
document.addEventListener("DOMContentLoaded", function (event)
{
    // dropZone = $('#dropZone');
    // dropZone.removeClass('error');
    
    let dropZone = document.getElementById("dropZone");
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

        for (let i = 0; i < event.dataTransfer.files.length; ++i)
        {
            // Get the file and the file reader
            let file = event.dataTransfer.files[i];
            console.log(file.name);
            
            // Validate file size
            if (file.size > maxRequestLength) 
            {
                text("lblInfo", 'File Too Large!');
                addClass(dropZone, "error");

                window.setTimeout(
                    function ()
                    {
                        text("lblInfo", 'Drag files here');
                        removeClass(dropZone, "error");
                    }
                    , 3000
                );

                return false;
            } // End if( file.size > maxRequestLength ) 

            // Send the file
            let xhr = new XMLHttpRequest();
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
        } // Next i 
    };
}); // End document.ready


// Show the upload progress
function uploadProgress(event:ProgressEvent) 
{
    // console.log(this.fileName);
    // console.log(decodeURIComponent(event.target.fileName));
    let percent = parseInt((event.loaded / event.total * 100).toString());

    text("lblInfo", 'Uploading: ' + percent + '%');
} // End Event uploadProgress


// Show upload complete or upload failed depending on result
function stateChange(event: Event) 
{
    let re: XMLHttpRequest = <XMLHttpRequest> event.target;

    if (re.readyState == 4) 
    {
        if (re.status == 200 || re.status == 304) 
        {
            // text("lblInfo", 'Upload Complete!');
            let lblInfo = document.getElementById("lblInfo");
            lblInfo.innerText = "Upload Complete!";

            window.setTimeout(
                function ()
                {
                    // text("lblInfo", 'Drag files here');
                    removeChildren(lblInfo);
                    
                    let strng = document.createElement("strong");
                    strng.appendChild(document.createTextNode("Choose a file"));
                    
                    let span = document.createElement("span");
                    span.className = "box__dragndrop";
                    span.appendChild(document.createTextNode(" or drag it here"));
                    
                    // <strong>Choose a file</strong><span class="box__dragndrop"> or drag it here</span>.    
                    
                    let frag = document.createDocumentFragment();
                    frag.appendChild(strng);
                    frag.appendChild(span);
                    lblInfo.appendChild(frag);
                }
                , 2000
            );

        }
        else 
        {
            let str = "Error: HTTP " + re.status + " \n";
            str += re.statusText + " \n\n\n\n";
            alert(str);

            html("obj", re.responseText);

            text(dropZone, 'Upload Failed!');
            addClass(dropZone, 'error');
        }

    } // End if (event.target.readyState == 4) 

} // End Event stateChange
