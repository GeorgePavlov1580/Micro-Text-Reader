// Importing Libraries
import processing.serial.*;
import controlP5.*;
import java.util.*;

// GUI Initialization
ControlP5 cp5;

// Serail Port Initializitaion
Serial serialPort;
String portName;
int speed = 9600;

void setup(){
  size(400, 200);
  cp5 = new ControlP5(this);
  
  cp5.addButton("RefreshPorts").linebreak();
  cp5.addButton("OpenPort").linebreak();
  cp5.addButton("ClosePort").linebreak();
  cp5.addButton("LedOn").linebreak();
  cp5.addButton("LedOff").linebreak();
  cp5.addScrollableList("COM_ports").close();

  print(Serial.list());
  
  serialPort = new Serial(this, "COM3", speed);
}

// Serial Buttons Functions
void RefreshPorts(){
  String list[] = Serial.list();
  cp5.get(ScrollableList.class, "COM_ports").addItems(list);
}

void COM_ports(int n){
  String portName = Serial.list()[n];
  serialPort = new Serial(this, Serial.list()[n], speed);
}

void OpenPort(){ serialPort = new Serial(this, portName, speed); }

void ClosePort(){ serialPort.stop(); }

void LedOn(){ serialPort.write('n'); }

void LedOff(){ serialPort.write('o'); }

void draw(){
  background(120);
}
