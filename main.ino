void setup(){
   Serial.begin(9600);
   pinMode(13, OUTPUT);
}

void loop() {
  if(Serial.available()){
    char ch = Serial.read();

    switch(ch){
      case 'n':
        digitalWrite(13, 1);
        break;
      case 'o':
        digitalWrite(13, 0);
        break;
    }
  }
}
