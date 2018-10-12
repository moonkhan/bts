// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
function activate(){
  resize();
}
$(function select(){
  $("#bugs a:first").tab('show');
});
if($('#bugs').length==0)
{
  $(resize());
}
else
{
  $('#bugs a').on('shown.bs.tab', function(){
          resize();
      });
}
function resize(){
  var temp = $(window).height() - $('body').height();
  if(temp < 0)
  {
    temp = 0;
  }
  $('footer').css('margin-top', temp);
}
