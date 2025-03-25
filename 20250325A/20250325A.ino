const int redLED = 12;   // 紅色 LED 接腳
const int blueLED = 13;  // 藍色 LED 接腳

void setup() {
  pinMode(redLED, OUTPUT);
  pinMode(blueLED, OUTPUT);
  Serial.begin(9600);  // 設定與 Processing 通訊的波特率
}

void loop() {
  digitalWrite(redLED, HIGH);
  digitalWrite(blueLED, LOW);
  Serial.println("RED_ON");  // 通知 Processing RLED 變紅色
  delay(1000);

  digitalWrite(redLED, LOW);
  digitalWrite(blueLED, HIGH);
  Serial.println("BLUE_ON"); // 通知 Processing RLED 變灰色
  delay(1000);
}
