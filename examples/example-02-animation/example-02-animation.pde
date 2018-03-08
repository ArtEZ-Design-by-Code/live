Polygon hexagon;

void setup() {
	size(1024, 768);
	hexagon = new Polygon(width / 2, height / 2, 250, 8);
}

void draw() {
	background(0);

	float baseAnimation = (float) millis() % 1000 / 1000;
	float longAnimation = (float) millis() % 5000 / 5000;

	float positionAnimation = sin(PI * (longAnimation + 1.5)) / 2 + .5;
	float radiusAnimation = sin(2 * PI * (baseAnimation - .25)) / 2 + .5;

	hexagon.x = positionAnimation * width;
	hexagon.r = radiusAnimation * 50 + 25;
	hexagon.sides = (int) (radiusAnimation * 10 + 3);

	hexagon.display();
}

class Polygon {
	float x, y, r;
	int sides;

	Polygon(float _x, float _y, float _r, int _sides) { // constructor
		this.x = _x;
		this.y = _y;
		this.r = _r;
		this.sides = _sides;
	}

	void display() {
		pushMatrix();
		translate(this.x, this.y);
		fill(255);
		noStroke();

		beginShape();
		for (int i=0; i<this.sides; i++) {
			// check out http://bit.ly/2HYA5nE

			float angle = TWO_PI / this.sides * i;

			float vertexX = cos(angle) * this.r;
			float vertexY = sin(angle) * this.r;

			vertex(vertexX, vertexY);
		}
		endShape(CLOSE);

		popMatrix();
	}
}
