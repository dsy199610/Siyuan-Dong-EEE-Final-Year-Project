PShape JL1;
PShape JL2;
PShape JL3_H;
PShape JL23_H;

PShape draw_arm(PShape arm){
  arm = createShape(GROUP);
  JL23_H = createShape(GROUP);
  JL1 = drawJL1(JL1);//creating joint 1 and link 1
  JL2 = drawJL2(JL2);//creating joint 2 and link 2
  JL3_H = drawJL3_H(JL3_H);//creating joint 3, link 3 and hand
  JL2.translate(0, -0.25*height, 0);
  JL3_H.translate(0, -0.55*height, 0);
  //build up the structure with certain affiliation relationship
  JL23_H.addChild(JL2);
  JL23_H.addChild(JL3_H);
  arm.addChild(JL1);
  arm.addChild(JL23_H);
  return arm;
}