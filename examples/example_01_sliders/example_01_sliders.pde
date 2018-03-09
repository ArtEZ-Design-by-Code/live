import controlP5.*;

ControlP5 controls;

Rectangle myRectangle;

float x, y, w, h;

void setup() {
	size(640, 640);

	controls = new ControlP5(this);

	controls.addSlider("x").setPosition(50, 50).setRange(0, width).setSize(200, 30);
	controls.addSlider("y").setPosition(50, 90).setRange(0, height).setSize(200, 30);
	controls.addSlider("w").setPosition(50, 130).setRange(10, width).setSize(200, 30);
	controls.addSlider("h").setPosition(50, 170).setRange(10, height).setSize(200, 30);

	controls.addButton("randomizeRectangle").setPosition(50, 210).setSize(200, 30).setLabel("Randomize");

	myRectangle = new Rectangle();
}

void randomizeRectangle() {
	w = random(10, width);
	h = random(10, height);

	x = random(0, width - w);
	y = random(0, height - h);
}

void draw() {
	background(0);

	myRectangle.x = x;
	myRectangle.y = y;
	myRectangle.w = w;
	myRectangle.h = h;

	myRectangle.display();
}

class Rectangle {
	float x;
	float y;
	float w;
	float h;

	Rectangle() {
	}

	void randomize() {
		this.w = random(10, width);
		this.h = random(10, height);

		this.x = random(0, width - this.w);
		this.y = random(0, height - this.h);
	}

	void display() {
		fill(255);
		noStroke();
		rect(this.x, this.y, this.w, this.h);
	}
}
