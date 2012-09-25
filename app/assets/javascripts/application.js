// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

window.createComment = createComment;
window.echo = echo;
function echo() {
	return console.log.apply(console, arguments);
}

function createComment(event, form, post_id) {
	var authorNode = form.children[0],
		contentNode = form.children[1];
	if (!(authorNode.value && contentNode.value)) {
		return false;
	}
	jQuery.ajax({
		url: 'comments.json',
		dataType: 'json',
		type: 'POST',
		data: {
			comment: {
				post_id: post_id,
				author: authorNode.value,
				content: contentNode.value
			}
		},
		success: function(comment) {
			var comments = form.parentNode.parentNode,
				tmp = document.createElement('div');

			tmp.innerHTML = '<div class="comment"> <span class="comment-author"> ' + comment.author + ' </span> <span class="comment-content"> ' + comment.content + ' </span> <div class="comment-time"> Posted at ' + comment.created_at + ' </div> </div>';

			comments.insertBefore(tmp.childNodes[0], form.parentNode);
			contentNode.value = '';
		},
		error: function() {
		}
	});
	return false;
}
