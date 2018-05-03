PImage myImage;

void setup() {
	size(500, 500);
	myImage = loadImage("input.jpg");
}

void draw() {
	background(0);

	image(myImage, 0, 0);

	// loadPixels();
	//
	// for (int i = 0; i < pixels.length; i++) {
	// 	color currentPixel = pixels[i];
	//
	// 	float brightness = brightness(currentPixel);
	//
	// 	if (brightness > 127) {
	// 		pixels[i] = color(255);
	// 	} else {
	// 		pixels[i] = color(0);
	// 	}
	// }
	//
	// updatePixels();
	//

	// loadPixels();
	//
	// for (int y = 0; y < height; y++) {
	// 	for (int x = 0; x < width; x++) {
	// 		int index = x + y * width;
	//
	// 		float xPercentage = (float) x / width;
	// 		float yPercentage = (float) y / height;
	//
	// 		float myFloat = xPercentage * yPercentage;
	//
	// 		pixels[index] = color(myFloat * 255);
	// 	}
	// }
	//
	// updatePixels();

	loadPixels();

	for (int y = 0; y < height; y++) {
		for (int x = 0; x < width; x++) {
			int index = x + y * width;

			color currentPixel = pixels[index];

			float brightness = brightness(currentPixel);

			if (brightness > map(x + frameCount % width, 0, width, 0, 255)) {
				pixels[index] = color(255);
			} else {
				pixels[index] = color(0);
			}
		}
	}

	updatePixels();
}
