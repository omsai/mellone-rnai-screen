// Public Domain

// Try not to overwrite user settings
saveSettings();
// Enable fast operations
setBatchMode(true);
// Read in the images using Bio-Formats Importer
run("Bio-Formats Importer",
	"open=/home/omsai/Downloads/imagesofrnaiscreen/501B102_C20_S09_W1_Z1_noscale.tif " +
	"color_mode=Default " +
	"group_files " +
	"view=Hyperstack " +
	"stack_order=XYCZT " +
	"use_virtual_stack " +
	"dimensions " +
	"axis_1_number_of_images=3 " +
	"axis_1_axis_first_image=1 " +
	"axis_1_axis_increment=1 " +
	"axis_2_number_of_images=3 " +
	"axis_2_axis_first_image=1 " +
	"axis_2_axis_increment=1 " +
	"contains=[] " +
	"name=/home/omsai/Downloads/imagesofrnaiscreen/501B102_C20_S09_W<1-3>_Z<1-3>_noscale.tif");
// Flatten the Z-stack by Maximum Intensity Projection
run("Z Project...", "projection=[Max Intensity]");
// Correct background illumination across the stack
run("Subtract Background...", "rolling=50 stack");



// Restore user settings
restoreSettings();
// Show result
setBatchMode(false);