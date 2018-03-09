import themidibus.*;

MidiBus midi;

boolean bgSwitch;
boolean rectSwitch;

void setup() {
	size(1280, 720);

	MidiBus.list();

	midi = new MidiBus(this, "Arturia BeatStep", -1);
}

void draw() {
	if (bgSwitch) {
		background(0);
	} else {
		background(255);
	}

	if (rectSwitch) {
		fill(0);
	} else {
		fill(255);
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
