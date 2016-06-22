


$(document).ready(function(){
	console.log($("#add_button").length)	
	jQuery("#add_button").click(function(){

		var html = ''
		console.log($('.section').length)
		if($('.section').length == 1){
			 html = get_html(0) + get_html(1)
			 url = $("#new_photo").attr("action") + "/multiple"
			 $("#new_photo").attr("action", url)	
			 $("#div_add").html('')
		}else{
			length = $('.section').length
			console.log($('.section').length)
			html = get_html(length)
		}

		$("#div_add").append(html)
		
	})

	var get_html = function(length){
		var html = '<div class="section" style="float:left;"><div class="field"><label for="photo_name">Name</label><br><input name="photos['+length+'][name]" id="photo_name" type="text"></div><div class="field"><label for="photo_description">Description</label><br><input name="photos['+length+'][description]" id="photo_description" type="text"></div><div class="field"><label for="photo_url">Url</label><br><input name="photos['+length+'][url]" id="photo_url" type="text"></div><div class="field"><label for="photo_taken_at">Taken at</label><br><input name="photo['+length+'][taken_at]" id="photo_taken_at" type="date"></div>'

		if(length != 0) {	html = html +'<input type="button" onClick="$(this).parent().remove()" value="cancel">'}
		html = html + '</div>'

		return html
	}

})

