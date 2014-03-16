var arr_stat = new Object();

arr_stat.pwd=0;
arr_stat.ls=0;
arr_stat.cd=0;
arr_stat.cp=0;
arr_stat.mv=0;
arr_stat.touch=0;
arr_stat.mkdir=0;

for(var key in arr_stat)
{
	document.write( 
	'<div class="row">' 
    + '<div class="col-md-0 col-md-offset-">'
    + '<div id="pwd" class="panel panel-success">'
    + '<div class="panel-heading">'
    + '<h3 class="panel-title">' + key + '</h3>'
    + '</div>'
    + '<div class="panel-body">'
    + arr_stat[key]
    + '</div>'
    + '</div>'
    + '</div>'
    + '</div>'); 
}
