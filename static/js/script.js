let class_color_include = 'info';
let class_color_exclude = 'danger';
let class_color_none = 'secondary';

let class_button_include = 'btn btn-small btn-f-option btn-outline-'+class_color_include+' include';
let class_button_exclude = 'btn btn-small btn-f-option btn-outline-'+class_color_exclude+' exclude';
let class_button_none = 'btn btn-small btn-f-option btn-outline-'+class_color_none+' none';

let class_text_include = 'text-'+class_color_include;
let class_text_exclude = 'text-'+class_color_exclude;
let class_text_none = 'text-'+class_color_none;

// inputs
let hdn_g_incl = '#f-genre-include';
let hdn_g_excl = '#f-genre-exclude';

$(document).ready(function () {
	// $('#records-limit').change(function () {
	// 	// $('form').submit();
	// });

	setFiltersReady();
	
	$('div.tree > ul ul').hide();
	$('div.tree > ul ul').toggleClass('collapsed');

	// collapse animation tree
	$('div.tree li span.f-option').on('click',function(){
		var data_id = $(this).attr('data-id');
		var ul = $(this).nextAll('ul');
		var parent_id = ul.attr('parent-id');
		
		if(data_id == parent_id) {
			var span_list_style = $(this);
			if(ul.hasClass('collapsed')){
				span_list_style.removeClass('caret-right');
				span_list_style.addClass('caret-left');
				ul.slideDown();
				ul.toggleClass('collapsed');
			} else {
				span_list_style.removeClass('caret-left');
				span_list_style.addClass('caret-right');
				ul.slideUp();
				ul.toggleClass('collapsed');
			}
		}
	});


	$('.btn-f-option').click(function () {
		var data_id = $(this).attr('data-id');

		var children = getChildren(data_id, []);
		var parents = getParents(data_id, []);
		var siblings = getSiblings(data_id);
		

		// toggle 3 classes
		var classes = [class_button_include,class_button_exclude, class_button_none];
		this.className = classes[($.inArray(this.className, classes)+1)%classes.length];
		var parentsSiblingsSame = getParentsIfSiblingsAreSame(data_id, []);
		if($(this).hasClass('include')) {
			includes([data_id]);
			includes(children);
			includes(parentsSiblingsSame);
		}
		if($(this).hasClass('exclude')) {
			excludes([data_id]);
			excludes(children);
			none(parents);
			excludes(parentsSiblingsSame);
		}
		if($(this).hasClass('none')) {
			none([data_id]);
			none(parents);
		}

		setValExclude();
		setValInclude();
	});

	$('form#filters').submit(function () {
		event.preventDefault();
		var action = $(this).attr('action').toLowerCase();
		var url_final = '';
		var url_question_mark = '';
		var url_filters = '';

		var g_include = ($(hdn_g_incl).val()) ? 'g_include='+$(hdn_g_incl).val() : '';
		var g_exclude = ($(hdn_g_excl).val()) ? 'g_exclude='+$(hdn_g_excl).val() : '';

		var arr_filters = [];
		arr_filters.push(g_include);
		arr_filters.push(g_exclude);

		$.each(arr_filters, function(i,value) {
			if(value) {
				url_question_mark = '?';
				url_filters += value + '&';
			}
		});

		url_final = url_question_mark + url_filters.slice(0,-1);

		if(url_final) {
			window.location.href = action + url_final;
		}		
	});
});

function getChildren(id, children = []) {
	var ul = $('.tree ul[parent-id='+id+']');

	if(!children.length) {
		var children = [];
	} else {
		children = children;
	}
	
	arr = [];
	ul.children().each(function() {
		arr.push($(this).attr('data-id'));
		children.push($(this).attr('data-id'));	
	});
	
	$.each(arr, function(i,value){
		if ($('.tree ul[parent-id='+value+']').length) {
			getChildren(value, children);
		}
	});

	return children;
}

function getParents(id, parents = []) {
	var li = $('.tree li[data-id='+id+']');

	if(!parents.length) {
		var parents = [];
	} else {
		parents = parents;
	}
	
	arr = [];
	li.parent().each(function() {
		if($(this).attr('parent-id')) {
			arr.push($(this).attr('parent-id'));
			parents.push($(this).attr('parent-id'));
		}
			
	});
	
	$.each(arr, function(i,value) {
		if ($('.tree ul[parent-id='+value+']').length) {
			getParents(value, parents);
		}
	});

	return parents;
}

function getParentsIfSiblingsAreSame(id, parents = [], thisType = '') {
	var li = $('.tree li[data-id='+id+']');
	var thisButton = $('.btn-f-option[data-id='+id+']');
	var siblings = getSiblings(id);

	if(!thisType) {
		var thisType = (thisButton.hasClass('include')) ? 'include' : (thisButton.hasClass('exclude') ? 'exclude' : 'none');
	} else {
		thisType = thisType;
	}

	if(!parents.length) {
		var parents = [];
	} else {
		parents = parents;
	}
	
	siblingsClass = [];
	$.each(siblings, function(i,value) {
		var button = $('.btn-f-option[data-id='+value+']');
		var push = (button.hasClass('include')) ? 'include' : (button.hasClass('exclude') ? 'exclude' : 'none');
		siblingsClass.push(push);
	});

	var change = true;
	$.each(siblingsClass, function(i, value) {
		if(thisType != value) {
			change = false;
		}
	});

	if(change) {
		arr = [];
		li.parent().each(function() {
			if($(this).attr('parent-id')) {
				arr.push($(this).attr('parent-id'));
				parents.push($(this).attr('parent-id'));
			}		
		});
		
		$.each(arr, function(i,value) {
			if ($('.tree ul[parent-id='+value+']').length) {
				getParentsIfSiblingsAreSame(value, parents, thisType);
			}
		});
	}

	return parents;
}

function getSiblings(id) {
	var li = $('.tree li[data-id='+id+']');

	arr = [];
	li.siblings('li').each(function() {
		arr.push($(this).attr('data-id'));
	});
	
	return arr;
}

function includes(ids) {
	$.each(ids, function(i, value) {
		var button = $('.btn-f-option[data-id='+value+']');
		button.removeClass();
		button.addClass(class_button_include);
		button.prevAll('span').removeClass(class_text_exclude+' '+class_text_none);
		button.prevAll('span').addClass(class_text_include);
	});
}

function excludes(ids) {
	$.each(ids, function(i, value) {
		var button = $('.btn-f-option[data-id='+value+']');
		button.removeClass();
		button.addClass(class_button_exclude);
		button.prevAll('span').removeClass(class_text_include+' '+class_text_none);
		button.prevAll('span').addClass(class_text_exclude);
	});
}

function none(ids) {
	$.each(ids, function(i, value) {
		var button = $('.btn-f-option[data-id='+value+']');
		button.removeClass();
		button.addClass(class_button_none);
		button.prevAll('span').removeClass(class_text_include+' '+class_text_exclude);
		button.prevAll('span').addClass(class_text_none);
	});
}

function setValExclude() {
	var el = $(hdn_g_excl);
	var buttons = $('.btn-f-option.exclude');
	arr = [];
	$.each(buttons, function() {
		var data_id = $(this).attr('data-id');
		if(jQuery.inArray(data_id, arr) == -1) {
			arr.push(data_id);
		}

	});
	el.val(arr);
}

function setValInclude() {
	var el = $(hdn_g_incl);
	var buttons = $('.btn-f-option.include');
	arr = [];
	$.each(buttons, function() {
		var data_id = $(this).attr('data-id');
		if(jQuery.inArray(data_id, arr) == -1) {
			arr.push(data_id);
		}

	});
	el.val(arr);
}

function setFiltersReady() {
	var v_g_include = $(hdn_g_incl).val();
	var v_g_exclude = $(hdn_g_excl).val();

	if(v_g_include) {
		includes(v_g_include.split(','));
	}

	if(v_g_exclude) {
		excludes(v_g_exclude.split(','));
	}
}

