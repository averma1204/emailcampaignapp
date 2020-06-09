$('#file-upload').change(function() {
  var i = $(this).prev('label').clone();
  var file = $('#file-upload')[0].files[0].name;
  $(this).prev('label').text(file);
});$('#file-upload').change(function() {
  var i = $(this).prev('label').clone();
  var file = $('#file-upload')[0].files[0].name;
  $(this).prev('label').text(file);
});$('#file-upload').change(function() {
  var i = $(this).prev('label').clone();
  var file = $('#file-upload')[0].files[0].name;
  $(this).prev('label').text(file);
});$('#file-upload').change(function() {
  var i = $(this).prev('label').clone();
  var file = $('#file-upload')[0].files[0].name;
  $(this).prev('label').text(file);
});$('#file-upload').change(function() {
  var i = $(this).prev('label').clone();
  var file = $('#file-upload')[0].files[0].name;
  $(this).prev('label').text(file);
});$(document).ready(function () {
    //@naresh action dynamic childs
    var next = 0;
    $("#add-more").click(function(e){
        e.preventDefault();
        var addto = "#field" + next;
        var addRemove = "#field" + (next);
        next = next + 1;
        var newIn = ' <div id="field'+ next +'" name="field'+ next +'"><!-- Text input--><div class="form-group"> <label class="col-md-4 control-label" for="action_id">Action Id</label> <div class="col-md-5"> <input id="action_id" name="action_id" type="text" placeholder="" class="form-control input-md"> </div></div><br><br> <!-- Text input--><div class="form-group"> <label class="col-md-4 control-label" for="action_name">Action Name</label> <div class="col-md-5"> <input id="action_name" name="action_name" type="text" placeholder="" class="form-control input-md"> </div></div><br><br><!-- File Button --> <div class="form-group"> <label class="col-md-4 control-label" for="action_json">Action JSON File</label> <div class="col-md-4"> <input id="action_json" name="action_json" class="input-file" type="file"> </div></div></div>';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >Remove</button></div></div><div id="field">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(next);  
        
            $('.remove-me').click(function(e){
                e.preventDefault();
                var fieldNum = this.id.charAt(this.id.length-1);
                var fieldID = "#field" + fieldNum;
                $(this).remove();
                $(fieldID).remove();
            });
    });

});// JavaScript Document
// Hide sidebar on small screen
$(window).on('load resize scroll', function () {
    if ($(this).width() < 992) {
        $('body').addClass('sidebar-mini');
    }
});
$(function () {
	$("#loginForm").validate({
		rules: {
			usrName: {required:true, email:true},
			usrPass: {required:true, minlength:3}
		},
		messages: {
			usrName: {required:"Please enter your Username", email:"Please enter a valid Username"},
			usrPass: {required:"Please enter your Password", minlength:"Password must have at least 3 characters"}
		}
	});
	
	// SIDEBAR TOGGLE ACTION
    $('.js-sidebar-toggler').click(function() {
        $('body').toggleClass('sidebar-mini');
    });
	$('#sidebar-collapse').slimScroll({
		height: '100%',
		width: '60px',
		railOpacity: '0.9'
	});
	
	$(".nav-2-level.collapse").on('hide.bs.collapse', function(){
		$(this).prev().find("i").toggleClass("fa-caret-right fa-caret-down");
	});
	$(".nav-2-level.collapse").on('hide.bs.collapse', function(){
		$(this).prev().find("i").toggleClass("fa-caret-right fa-caret-down");
	});
	
	
	$('.nav-3-level .rightMenu').on('contextmenu', function() {
		//var top = e.pageY - 10;
		//var left = e.pageX - 90;
		$("#context-menu").css({display:"block",top:0, left:72}).addClass("show");
		if($("#context-menu.show")){
			$(".dropdown-menu").parent("li").addClass("active bg-grey");
		}
		return false; //blocks default Webbrowser right click menu
		
	}).on("click", function() {
		$("#context-menu").removeClass("show").hide();
		$(".dropdown-menu").parent("li").removeClass("bg-grey");
		
	});
	$("#context-menu a").on("click", function() {
		$(this).parent().removeClass("show").hide();
		$(".dropdown-menu").parent("li").removeClass("bg-grey");
	});
	

});

