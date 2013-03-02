$(function(){
	$('article').each(function(i, item) {
		var casePool = $(item).data('case-pool');
		_createOptionsMenu($(item), testCases[casePool]);
	});
});

function _createOptionsMenu(el, options) {
	var menuEl = $('<menu>');
	var liEl = $('<li>');
	var optionsMenu = menuEl.clone().addClass('options');
	var groups = {};

	function _handleClick() {
		var option = $(this);

		option.data('instructions')
			.forEach(function(instruction) {
				var target = $(instruction.selector, el);
				target.toggleClass(instruction.modifier);
			});

		if(option.data('group')) {
			optionsMenu.find('menu.' + option.data('group') + ' li').removeClass('active');
		}
		option.toggleClass('active');
	}

	for(var name in options) {
		var set = options[name];
		var item = liEl.clone()
				.text(name)
				.data('instructions', set.instructions)
				.on('click', _handleClick);


		if(set.group && !groups[set.group]) {
			groups[set.group] = menuEl.clone().addClass(set.group);
		}

		if(set.group) {
			groups[set.group].append(item);
			item.data('group', set.group);
		} else {
			optionsMenu.append(item);
		}
	}

	for(var group in groups) {
		optionsMenu.append(groups[group]);
	}

	el.find('header').append(optionsMenu);
}
