var page = require('webpage').create(),
		system = require('system'),
    address, output;

if(system.args.lengt < 2) {
    console.log('Usage: capture.js URL filename');
} else {
	address = system.args[1];
	output = system.args[2];

	page.open(address, function() {
		page.render(output);
		phantom.exit();
	});
}
