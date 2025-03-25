import processing.serial.*;

Serial myPort;
String ledState = "BLUE_ON"; // 初始狀態

void setup() {
  size(500, 500);
  background(128); // 灰色背景

  // 連接 Arduino 的序列埠 (請檢查埠號)
  String portName = Serial.list()[2]; 
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(128); // 重新繪製背景，避免殘影

  // RLED (紅色 LED 狀態)
  if (ledState.equals("RED_ON")) {
    fill(255, 0, 0); // 紅色
  } else {
    fill(128); // 灰色
  }
  ellipse(100, 100, 80, 80);

  // BLED (藍色圓形)
  if (ledState.equals("BLUE_ON")) {
    fill(0, 0, 255); // 紅色
  } else {
    fill(128); // 灰色
  }
  ellipse(200, 100, 80, 80);

  // 3LED (白色正方形)
  fill(255);
  rect(300, 50, 80, 80);

  // VRA (白色圓形 + 指標)
  fill(255);
  ellipse(100, 300, 80, 80);
  stroke(0);
  strokeWeight(3);
  line(100, 300, 100 + 40, 300); // 指向 0 度的指標
  noStroke();

  // CDS (黃色橢圓形)
  fill(255, 255, 0);
  ellipse(250, 300, 120, 60);

  // SWA (左邊的白色長方形)
  fill(255);
  rect(50, 400, 100, 50);

  // SWB (右邊的白色長方形)
  fill(255);
  rect(200, 400, 150, 50);
}

// 讀取 Arduino 傳來的資料
void serialEvent(Serial myPort) {
  String input = myPort.readStringUntil('\n');
  if (input != null) {
    ledState = input.trim();
  }
}
