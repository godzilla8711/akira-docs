const mainCanvas = document.getElementById('main-canvas');
const context = mainCanvas.getContext('2d');

// Global settings.
const OFFSET_X = -0.5;
const OFFSET_Y = 0.5;
const MAX_X = 1000;
const MAX_Y = 1000;
const SCALE = 1.0;
context.lineWidth = 1;
context.strokeStyle = 'black';
context.scale(SCALE, SCALE);

function transformCoordinate(coord) {
  return {
    x: coord.x + OFFSET_X,
    y: (MAX_Y + OFFSET_Y) - coord.y
  }
}

function drawContinuousLine(coordinates) {
  context.beginPath();

  let coord = transformCoordinate(coordinates[0]);
  context.moveTo(coord.x, coord.y);

  for (i = 1; i < coordinates.length; i++) {
    coord = transformCoordinate(coordinates[i]);
    context.lineTo(coord.x, coord.y);
  }

  context.stroke();
}

function drawRectangle(x, y, width, height, fillColor) {
  let coord = transformCoordinate({x, y});

  if (fillColor) {
    context.fillStyle = fillColor;
    context.fillRect(coord.x, coord.y, width, height);
  } else {
    context.rect(coord.x, coord.y, width, height);
  }
  context.stroke();
}

// Dimensions are done on a square 1000 pixel canvas.
drawContinuousLine([
  {x: 0, y: 0},
  {x: 0, y: 200},
  {x: 20, y: 200},
  {x: 20, y: 0},
  {x: 0, y: 0}
]);
// context.moveTo(-0.5, 1000.5);
// context.lineTo(-0.5, 800.5);
// context.lineTo(19.5, 800.5);
// context.lineTo(19.5, 1000.5);
// context.lineTo(-0.5, 1000.5);

drawContinuousLine([
  { x: 20, y: 0 },
  { x: 20, y: 200 },
  { x: 70, y: 200 },
  { x: 70, y: 0 },
  { x: 20, y: 0 }
]);

drawRectangle(780, 750, 200, 100, 'lightgray');
drawRectangle(380, 350, 200, 100);

// context.beginPath();
// context.moveTo(19.5, 1000.5);
// context.lineTo(19.5, 800.5);
// context.lineTo(69.5, 800.5);
// context.lineTo(69.5, 1000.5);
// context.lineTo(19.5, 1000.5);
// context.stroke();

// Draw a rectangle
// left offset start, top offset start, width, height
// context.fillStyle = 'lightgray';
// context.fillRect(50, 30, 100, 200);

// Draw a circle
// context.lineWidth = "1";
// context.beginPath();
// context.arc(250.5, 200, 50.5, 0, 2 * Math.PI);
// context.stroke();

// Draw text
// context.fillStyle = 'black';
// context.font = "18px Arial";
// context.fillText("Hello Monica", 270, 350);

// Draw a line
// context.moveTo(500, 300);
// context.lineTo(320, 50);
// context.stroke();
