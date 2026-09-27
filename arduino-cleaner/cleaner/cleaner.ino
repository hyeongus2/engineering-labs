#include <Ultrasonic.h>
#define SONAR_COEFF 0.1

const int TRIG1 = 13;
const int ECHO1 = 12;
const int TRIG2 = 11;
const int ECHO2 = 10;
const int TRIG3 = 9;
const int ECHO3 = 8;
const int MOT_L1 = 7;
const int MOT_L2 = 6;
const int MOT_R1 = 5;
const int MOT_R2 = 4;

Ultrasonic sonar1(TRIG1, ECHO1);
Ultrasonic sonar2(TRIG2, ECHO2);
Ultrasonic sonar3(TRIG3, ECHO3);

float p1, p2, p3;
const int distance = 20;

void setup() {
  Serial.begin(9600);
  pinMode(MOT_R1, OUTPUT);
  pinMode(MOT_R2, OUTPUT);
  pinMode(MOT_L1, OUTPUT);
  pinMode(MOT_L2, OUTPUT);
  p1 = sonar1.distanceRead();
  p2 = sonar2.distanceRead();
  p3 = sonar3.distanceRead();
}

void loop() {
  float u1 = sonar1.distanceRead();
  float u2 = sonar2.distanceRead();
  float u3 = sonar3.distanceRead();

  Serial.print(u1);
  Serial.print("\t");
  Serial.print(u2);
  Serial.print("\t");
  Serial.println(u3);

  if(u1 > 0)
    p1 = SONAR_COEFF * p1 + (1 - SONAR_COEFF) * u1;
  if(u2 > 0)
    p2 = SONAR_COEFF * p2 + (1 - SONAR_COEFF) * u2;
  if(u3 > 0)
    p3 = SONAR_COEFF * p3 + (1 - SONAR_COEFF) * u3;
  Serial.print("p1:");
  Serial.println(p1);
  Serial.print("p2:");
  Serial.println(p2);
  Serial.print("p3:");
  Serial.println(p3);
  if ((p1 < distance && u1 > 0) || (p2 < distance && u2 > 0) || (p3 < distance && u3 > 0)) {
    digitalWrite(MOT_L1, LOW);
    digitalWrite(MOT_L2, LOW);
    digitalWrite(MOT_R1, LOW);
    digitalWrite(MOT_R2, LOW);
    delay(500);
    digitalWrite(MOT_L1, HIGH);
    digitalWrite(MOT_L2, LOW);
    digitalWrite(MOT_R1, LOW);
    digitalWrite(MOT_R2, HIGH);
    delay(1000);
    digitalWrite(MOT_L1, LOW);
    digitalWrite(MOT_L2, LOW);
    digitalWrite(MOT_R1, LOW);
    digitalWrite(MOT_R2, LOW);
  } else {
    digitalWrite(MOT_L1, HIGH);
    digitalWrite(MOT_L2, LOW);
    digitalWrite(MOT_R1, HIGH);
    digitalWrite(MOT_R2, LOW);
  }
}
