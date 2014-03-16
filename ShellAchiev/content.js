var tab_com_succ = new Array("");

for (i = 0; i < tab_com_succ.length - 1; i++){ 
   document.write( '<div class="row">' 
    + '<div class="col-md-0 col-md-offset-">'
    + '<div id="pwd" class="panel panel-success">'
    + '<div class="panel-heading">'
    + '<h3 class="panel-title">' + tab_com_succ[i] + '</h3>'
    + '</div>'
    + '<div class="panel-body">'
    + 'Execute one ' + tab_com_succ[i]
    + '</div>'
    + '</div>'
    + '</div>'
    + '</div>'); 
}

var tab_com_def = new Array("mv", "mkdir", "touch", "cp", "cd", "ls", "pwd", "cat", "");

for (i = 0; i < tab_com_def.length - 1; i++){ 
   document.write( '<div class="row">' 
    + '<div class="col-md-0 col-md-offset-">'
    + '<div id="pwd" class="panel panel-default">'
    + '<div class="panel-heading">'
    + '<h3 class="panel-title">' + tab_com_def[i] + '</h3>'
    + '</div>'
    + '<div class="panel-body">'
    + 'Execute one ' + tab_com_def[i]
    + '</div>'
    + '</div>'
    + '</div>'
    + '</div>'); 
} 
