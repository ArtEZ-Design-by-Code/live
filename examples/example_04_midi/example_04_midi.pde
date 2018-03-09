import themidibus.*;

MidiBus midi;

boolean bgSwitch;
boolean rectSwitch;

float hue;

void setup() {
	size(1280, 720);

	colorMode(HSB, 360, 100, 100);

	MidiBus.list();

	midi = new MidiBus(this, "Arturia BeatStep", -1);
}

void draw() {
	if (bgSwitch) {
		background(0);
	} else {
		background(0, 0, 100);
	}

	if (rectSwitch) {
		fill(0);
	} else {
		fill(hue, 100, 100);
	}

	noStroke();
	translate(width / 2, height / 2);
	rect(-250, -250, 500, 500);
}

void noteOn(int channel, int pitch, int velocity) {
	println(pitch);

	if (pitch == 36) {
		bgSwitch = !bgSwitch;
	} else if (pitch == 37) {
		rectSwitch = !rectSwitch;
	}
}

void controllerChange(int channel, int number, int value) {
	if (number == 10) {
		float normalized = (float) value / 127;
		hue = normalized * 360;
	}
}
