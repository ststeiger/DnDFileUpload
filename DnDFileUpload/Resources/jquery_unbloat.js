
function hasClass(ele, a)
{
    var b = " " + a + " ", c = 0;
    var rclass = /[\t\r\n]/g;

    if (ele.nodeType === 1 && (" " + ele.className + " ").replace(rclass, " ").indexOf(b) > -1)
        return !0;

    return !1
} // End Function hasClass


function addClass(e, a)
{
    var b, g, h, i;
    var core_rspace = /\s+/;

    if (a && typeof a == "string")
    {
        b = a.split(core_rspace);

        if (e.nodeType === 1)
            if (!e.className && b.length === 1)
                e.className = a;
            else
            {
                g = " " + e.className + " ";
                for (h = 0, i = b.length; h < i; h++)
                    ~g.indexOf(" " + b[h] + " ") || (g += b[h] + " ");

                e.className = g.trim();
            }

    } // End if (a && typeof a == "string") 

    return e;
} // End Function addClass


function removeClass(g, a)
{
    var c, h, i, j;
    var rclass = /[\t\r\n]/g;
    var core_rspace = /\s+/;

    if (a && typeof a == "string" || a === undefined)
    {
        c = (a || "").split(core_rspace);

        if (g.nodeType === 1 && g.className)
            if (a)
            {
                h = (" " + g.className + " ").replace(rclass, " ");
                for (i = 0, j = c.length; i < j; i++)
                    h = h.replace(" " + c[i] + " ", " ");

                g.className = h.trim();
            }
            else
                g.className = "";
    }

    return g;
} // End Function removeClass


function toggleClass(ele, a)
{
    var i = 0, b, j = 0;

    if (typeof a === "string")
    {
        j = a.split(" ");

        for (b = j.length; i < b; ++i)
        {
            if (hasClass(ele, j[i]))
                removeClass(ele, j[i]);
            else
                addClass(ele, j[i]);
        }
    }

} // End Function toggleClass


// http://stackoverflow.com/questions/3955229/remove-all-child-elements-of-a-dom-node-in-javascript
function removeChildren(node)
{
    var last;
    while (last = node.lastChild)
        node.removeChild(last);
}


function escapeHtml(str)
{
    if (str === null || str == "")
        return str;

    var div = document.createElement('div');
    div.appendChild(document.createTextNode(str));

    return div.innerHTML;
}


// UNSAFE with unsafe strings; only use on previously-escaped ones!
function unescapeHtml(escapedStr)
{
    if (escapedStr === null || escapedStr == "")
        return escapedStr;

    var div = document.createElement('div');
    // div.innerHTML = escapedStr;

    removeChildren(div);
    div.insertAdjacentHTML('beforeend', escapedStr);

    var child = div.childNodes[0];
    return child ? child.nodeValue : '';
}


function text(ele, unsafe_str)
{
    if (typeof ele == "string")
        ele = document.getElementById(ele);

    if (ele === null)
        return;

    removeChildren(ele);
    ele.appendChild(document.createTextNode(unsafe_str));
}


function html(ele, unsafe_str)
{
    if (typeof ele == "string")
        ele = document.getElementById(ele);

    if (ele === null)
        return;

    removeChildren(ele);
    ele.insertAdjacentHTML('beforeend', unsafe_str);
}
