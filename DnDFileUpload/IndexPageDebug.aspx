﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexPageDebug.aspx.cs" Inherits="DnDFileUpload.IndexPageDebug" %>


<!DOCTYPE html>
<html>
<head runat="server">
	<title>Directory list</title>
		
<style type="text/css"> 
body { font-family: tahoma, verdana, arial; font-size: 0.7em; color: black; padding-top: 8px; cursor: default; background-color: #fff; }
#idx { border: 3px solid #fff; width: 500px; }
#idx td.center { text-align: center; }
#idx td { border-bottom: 1px solid #f0f0f0; }
#idx img { margin-bottom: -2px; }
#idx table { color: #606060; width: 100%; margin-top:3px; }
#idx span.link { color: #0066DF; cursor: pointer; }
#idx .rounded { padding: 10px 7px 10px 10px; -moz-border-radius:6px; }
#idx .gray { background-color:#fafafa;border-bottom: 1px solid #e5e5e5; }
#idx p { padding: 0px; margin: 0px;line-height:1.4em;}
#idx p.left { float:left;width:60%;padding:3px;color:#606060;}
#idx p.right {float:right;width:35%;text-align:right;color:#707070;padding:3px;}
#idx strong { font-family: "Trebuchet MS", tahoma, arial; font-size: 1.2em; font-weight: bold; color: #202020; padding-bottom: 3px; margin: 0px; }
#idx a:link    { color: #0066CC; }
#idx a:visited { color: #003366; }
#idx a:hover   { text-decoration: none; }
#idx a:active  { color: #9DCC00; }
</style> 
		
<script type="text/javascript" language="javascript">
    var _c1='#fefefe'; 
    var _c2='#fafafa'; 
    var _ppg=15; 
    var _cpg=1; 
    var _files=[]; 
    var _dirs=[]; 
    var _tpg=null; 
    var _tsize=0; 
    var _sort='date'; 
    var _sdir={'type':0,'name':0,'size':0,'date':1}; 
    var idx=null; var tbl=null;
    function _obj(s)
    {
        return document.getElementById(s);
    }

    function _ge(n)
    {
        n=n.substr(n.lastIndexOf('.')+1);
        return n.toLowerCase();
    }

    function _nf(n,p)
    {
        if(p>=0)
        {
            var t=Math.pow(10,p);
            return Math.round(n*t)/t;
        }
    }

    function _s(v,u)
    {
        if(!u)
            u='B';
	
        if(v>1024&&u=='B')
            return _s(v/1024,'KB');
	
        if(v>1024&&u=='KB')
            return _s(v/1024,'MB');

        if(v>1024&&u=='MB')
            return _s(v/1024,'GB');

        return _nf(v,1)+'&nbsp;'+u;
    }

    function _f(name,size,date,url,rdate)
    {
        _files[_files.length]={'dir':0,'name':name,'size':size,'date':date,'type':_ge(name),'url':url,'rdate':rdate,'icon':'IndexPageDebug.aspx?icon='+_ge(name)};_tsize+=size;}

    function _d(name,date,url)
    {
        _dirs[_dirs.length]={'dir':1,'name':name,'date':date,'url':url,'icon':'IndexPageDebug.aspx?icon=dir'};
    }

    function _np()
    {
        _cpg++;
        _tbl();
    }

    function _pp()
    {
        _cpg--;
        _tbl();
    }

    function _sa(l,r)
    {
        return(l['size']==r['size'])?0:(l['size']>r['size']?1:-1);
    }

    function _sb(l,r)
    {
        return(l['type']==r['type'])?0:(l['type']>r['type']?1:-1);
    }

    function _sc(l,r)
    {
        return(l['rdate']==r['rdate'])?0:(l['rdate']>r['rdate']?1:-1);
    }

    function _sd(l,r)
    {
        var a=l['name'].toLowerCase();
        var b=r['name'].toLowerCase();
        return(a==b)?0:(a>b?1:-1);
    }

    function _srt(c)
    {
        switch(c)
        {
            case'type':
                _sort='type';
                _files.sort(_sb);
			
                if(_sdir['type'])
                    _files.reverse();
                break;
            case'name':
                _sort='name';
                _files.sort(_sd);
                if(_sdir['name'])
                    _files.reverse();
                break;
            case'size':
                _sort='size';
                _files.sort(_sa);
                if(_sdir['size'])
                    _files.reverse();
                break;
            case'date':
                _sort='date';
                _files.sort(_sc);
                if(_sdir['date'])
                    _files.reverse();
                break;
        }
        _sdir[c]=!_sdir[c];
        _obj('sort_type').style.fontStyle=(c=='type'?'italic':'normal');
        _obj('sort_name').style.fontStyle=(c=='name'?'italic':'normal');
        _obj('sort_size').style.fontStyle=(c=='size'?'italic':'normal');
        _obj('sort_date').style.fontStyle=(c=='date'?'italic':'normal');
        _tbl();
        return false;
    }
 
    function _head()
    {
        if(!idx) 
            return;
        _tpg=Math.ceil((_files.length+_dirs.length)/_ppg);
	
        var sitename = <%="'Hello World'" %>;
        idx.innerHTML='<div class="rounded gray" style="padding:5px 10px 5px 7px;color:#202020">' + 
            '<p class="left">' +
                '<strong>' + <%="'" + GetDirName() + "'" %> + '</strong>' + <%= "'" + GetBackURL() + "'" %> + '<br />' + (_files.length+_dirs.length) + ' objects in this folder, ' + _s(_tsize) + ' total.' +
		'</p>' +
		'<p class="right">' +
			'Sort: <span class="link" onmousedown="return _srt(\'name\');" id="sort_name">Name</span>, <span class="link" onmousedown="return _srt(\'type\');" id="sort_type">Type</span>, <span class="link" onmousedown="return _srt(\'size\');" id="sort_size">Size</span>, <span class="link" onmousedown="return _srt(\'date\');" id="sort_date">Date</span>' +
		'</p>' +
		'<div style="clear:both;"></div>' +
	'</div><div id="idx_tbl"></div>';
    tbl=_obj('idx_tbl');
}
 
function _tbl()
{
    var _cnt=_dirs.concat(_files);
	
    if(!tbl)
        return;
    if(_cpg>_tpg)
    {
        _cpg=_tpg;
        return;
    }
    else if(_cpg<1)
    {
        _cpg=1;
        return;
    }
    var a=(_cpg-1)*_ppg;
    var b=_cpg*_ppg;
    var j=0;
    var html='';
	
    if(_tpg>1)
        html+='<p style="padding:5px 5px 0px 7px;color:#202020;text-align:right;"><span class="link" onmousedown="_pp();return false;">Previous</span> ('+_cpg+'/'+_tpg+') <span class="link" onmousedown="_np();return false;">Next</span></p>';
    html+='<table cellspacing="0" cellpadding="5" border="0">';
	
    for(var i=a;i<b&&i<(_files.length+_dirs.length);++i)
    {
        var f=_cnt[i];var rc=j++&1?_c1:_c2;
        html+='<tr style="background-color:'+rc+'"><td><img src="'+f['icon']+'" width="16px" height="16px" alt="" /> &nbsp;<a href="'+f['url']+'">'+f['name']+'</a></td><td class="center" style="width:50px;">'+(f['dir']?'':_s(f['size']))+'</td><td class="center" style="width:70px;">'+f['date']+'</td></tr>';
    }
    tbl.innerHTML=html+'</table>';
}

 
window.onload=function()
{
    idx=_obj('idx'); 
    _head(); 
    _srt('name');
};		
    <% ListContent(); %>
</script>
</head>
<body>
	<div id="idx"><!-- do not remove --></div>		
	<form id="form2" runat="server">
	
	</form>
</body>
</html>
