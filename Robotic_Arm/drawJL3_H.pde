PShape joint3;
PShape palm;
PShape finger1;
PShape finger2;
PShape drawJL3_H(PShape JL3_H){
  JL3_H = createShape(GROUP);
  joint3 = drawRect(joint3, width*0.03, height*0.2, width*0.03);
  palm = drawCylinder(palm, 30, width*0.05, height*0.05);
  finger1 = drawRect(finger1, width*0.02, height*0.1, width*0.02);
  finger2 = drawRect(finger2, width*0.02, height*0.1, width*0.02);
  palm.rotateX(0.5*PI);
  palm.translate(0, -0.1*height,0);
  finger1.translate(-width*0.04, -0.175*height, 0);
  finger2.translate(width*0.04, -0.175*height, 0);
  JL3_H.addChild(joint3);
  JL3_H.addChild(palm);
  JL3_H.addChild(finger1);
  JL3_H.addChild(finger2);
  return JL3_H;
}