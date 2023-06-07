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
let hdn_t_incl = '#f-type-include';
let hdn_t_excl = '#f-type-exclude';
let hdn_w_incl = '#f-warning-include';
let hdn_w_excl = '#f-warning-exclude';
let hdn_d_incl = '#f-detail-include';
let hdn_d_excl = '#f-detail-exclude';

let genresNames = '#hdn-genres-names';

$(document).ready(function () {

	console.log('ready!')
	
	// Initialize tooltips
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	return new bootstrap.Tooltip(tooltipTriggerEl)
	})

	setFiltersReady();

	setBranchs();
	
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


	$('.btn-f-option').on('click',function() {
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
			none(children);
		}

		setValNone();
		setValExclude();
		setValInclude();
	});

	$('button.page-link').on('click',function() {
		var data = [];
		data['type'] = 2;
		data['page'] = $(this).attr('data-page');

		var url = windowLocation(data);
		var action = $('form#filters').attr('action').toLowerCase();
		if(url) {
			window.location.href = action + url;
		}
	});

	$('form#filters').submit(function () {
		event.preventDefault();
		var data = [];
		data['type'] = 1;
		
		var url = windowLocation(data);
		var action = $('form#filters').attr('action').toLowerCase();
		if(url) {
			window.location.href = action + url;
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

function includes(ids, type='data') {
	$.each(ids, function(i, value) {
		var button = $('.btn-f-option['+type+'-id='+value+']');
		button.removeClass();
		button.addClass(class_button_include);
		button.prevAll('span').removeClass(class_text_exclude+' '+class_text_none);
		button.prevAll('span').addClass(class_text_include);
	});
}

function excludes(ids, type='data') {
	$.each(ids, function(i, value) {
		var button = $('.btn-f-option['+type+'-id='+value+']');
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

function setValExclude_() {
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

function setValNone() {
	var hdns = [$(hdn_g_incl), $(hdn_t_incl), $(hdn_w_incl), $(hdn_d_incl), $(hdn_g_excl), $(hdn_t_excl), $(hdn_w_excl), $(hdn_d_excl)];

	$.each(hdns, function() {
		$(this).val('');
	});
}

function setValExclude() {
	var hdns = [];
	hdns['g'] = $(hdn_g_excl);
	hdns['t'] = $(hdn_t_excl);
	hdns['w'] = $(hdn_w_excl);
	hdns['d'] = $(hdn_d_excl);
	var buttons = $('.btn-f-option.exclude');
	var arr = [];
	$.each(buttons, function() {

		var id = ($(this).attr('data-id')) ? {'g':$(this).attr('data-id')} : ($(this).attr('type-id')) ? {'t':$(this).attr('type-id')} : ($(this).attr('warning-id')) ? {'w':$(this).attr('warning-id')} : {'d':$(this).attr('detail-id')};
		
		$.each(id, function(i, value) {
			if(!arr[i]) {
				arr[i] = [];				
			}
			if(jQuery.inArray(value, arr[i]) == -1) {
				arr[i].push(value)
			}
		});
	});

	for (const key in arr) {
		if (Object.hasOwnProperty.call(arr, key)) {
			var value = arr[key];
			hdns[key].val(value);
		}
	}
}

function setValInclude() {
	var hdns = [];
	hdns['g'] = $(hdn_g_incl);
	hdns['t'] = $(hdn_t_incl);
	hdns['w'] = $(hdn_w_incl);
	hdns['d'] = $(hdn_d_incl);
	var buttons = $('.btn-f-option.include');
	var arr = [];
	$.each(buttons, function() {

		var id = ($(this).attr('data-id')) ? {'g':$(this).attr('data-id')} : ($(this).attr('type-id')) ? {'t':$(this).attr('type-id')} : ($(this).attr('warning-id')) ? {'w':$(this).attr('warning-id')} : {'d':$(this).attr('detail-id')}
		
		$.each(id, function(i, value) {
			if(!arr[i]) {
				arr[i] = [];				
			}
			if(jQuery.inArray(value, arr[i]) == -1) {
				arr[i].push(value)
			}
		});
	});

	for (const key in arr) {
		if (Object.hasOwnProperty.call(arr, key)) {
			var value = arr[key];
			hdns[key].val(value);
		}
	}
}

function setFiltersReady() {
	var v_g_include = $(hdn_g_incl).val();
	var v_g_exclude = $(hdn_g_excl).val();
	var v_t_include = $(hdn_t_incl).val();
	var v_t_exclude = $(hdn_t_excl).val();
	var v_w_include = $(hdn_w_incl).val();
	var v_w_exclude = $(hdn_w_excl).val();
	var v_d_include = $(hdn_d_incl).val();
	var v_d_exclude = $(hdn_d_excl).val();

	if(v_g_include) {
		includes(v_g_include.split(','));
	}

	if(v_g_exclude) {
		excludes(v_g_exclude.split(','));
	}

	if(v_t_include) {
		includes(v_t_include.split(','), 'type');
	}

	if(v_t_exclude) {
		excludes(v_t_exclude.split(','), 'type');
	}

	if(v_w_include) {
		includes(v_w_include.split(','), 'warning');
	}

	if(v_w_exclude) {
		excludes(v_w_exclude.split(','), 'warning');
	}

	if(v_d_include) {
		includes(v_d_include.split(','), 'detail');
	}

	if(v_d_exclude) {
		excludes(v_d_exclude.split(','), 'detail');
	}
}

function windowLocation(data) {
	var url_final = '';
	var url_question_mark = '';
	var url_filters = '';
	var arr_filters = [];

	if(data['type'] == 2) {
		var page = 'page='+data['page'];
		arr_filters.push(page);
	}

	var g_include = ($(hdn_g_incl).val()) ? 'g_include='+$(hdn_g_incl).val() : '';
	var g_exclude = ($(hdn_g_excl).val()) ? 'g_exclude='+$(hdn_g_excl).val() : '';
	var t_include = ($(hdn_t_incl).val()) ? 't_include='+$(hdn_t_incl).val() : '';
	var t_exclude = ($(hdn_t_excl).val()) ? 't_exclude='+$(hdn_t_excl).val() : '';
	var w_include = ($(hdn_w_incl).val()) ? 'w_include='+$(hdn_w_incl).val() : '';
	var w_exclude = ($(hdn_w_excl).val()) ? 'w_exclude='+$(hdn_w_excl).val() : '';
	var d_include = ($(hdn_d_incl).val()) ? 'd_include='+$(hdn_d_incl).val() : '';
	var d_exclude = ($(hdn_d_excl).val()) ? 'd_exclude='+$(hdn_d_excl).val() : '';

	arr_filters.push(g_include, g_exclude, t_include, t_exclude, w_include, w_exclude, d_include, d_exclude);

	$.each(arr_filters, function(i,value) {
		if(value) {
			url_question_mark = '?';
			url_filters += value + '&';
		}
	});

	url_final = url_question_mark + url_filters.slice(0,-1);

	return url_final;
}

function getGenreName(id) {
	return $('button[data-id='+id+'] > span').html();
}

function getGenreDirectParent(id) {
	return $('li[data-id='+id+']').parent().attr('parent-id');
}

function setBranchs() {
	var el = $('.hdn-chs');
	
	el.each(function() {
		var parent = $(this).parent();
		var parents = [];
		var hdn_ch = [];
		$.each($(this).val().slice(0,-1).split(','), function(i, val) {
			if($.inArray(val, hdn_ch) == -1) {
				hdn_ch.push(val);
				genresNames = getParents(val).reverse();
				genresNames.push(val);
				parents.push(genresNames);
			}
		});

		$.each(parents, function(i, val) {
			var html = '';
			var branchPath = getBranchPath(val);
			$.each(branchPath, function(i,v) {
				html += '<span class="small">';
				$.each(v, function(i, value) {
					html += getGenreName(value) + '<i class="bi bi-chevron-right"></i>';
				});
				html += '</span>';
				
			});
			parent.append(html);
		});
	});
}

function getBranchPath(ids) {
	var arr = [];
	$.each(ids, function(i, value) {
		var directParent = getGenreDirectParent(value);
		if(!directParent) {
			if($.inArray(value, arr) == -1) {
				arr.push(value);
			} 
		}
	});

	var ruta = [];
	$.each(arr, function(i, value) {
		ruta.push(getDirectChild(value, ids));
	});

	return ruta;
}

function getDirectChild(parent, childs, path=[]) {
	var ul = $('ul[parent-id='+parent+']');

	if(!path.length) {
		var path = [];
		path.push(parent);
	} else {
		path = path;
	}

	ul.children().each(function() {
		var child = $(this).attr('data-id');
		if($.inArray(child, childs) != -1) {
			if($.inArray(child, path) == -1) {
				path.push(child);
				var lastPath = path.slice(-1)[0];
				getDirectChild(lastPath, childs, path);
			}
		}
	});

	return path;
}
