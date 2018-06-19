PShape joint1;
PShape link1_l;
PShape link1_r;
PShape drawJL1(PShape JL1){
 JL1 = createShape(GROUP);
 joint1 = drawCylinder(joint1, 30, width*0.05, height*0.1);
 link1_l = drawRect(link1_l, width*0.01, height*0.2, width*0.05);
 link1_r = drawRect(link1_r, width*0.01, height*0.2, width*0.05);
 joint1.rotateX(0.5*PI);
 link1_l.translate(-0.025*width, -height*0.15, 0);
 link1_r.translate(0.025*width, -height*0.15, 0);
 JL1.addChild(joint1);
 JL1.addChild(link1_l);
 JL1.addChild(link1_r);
 return JL1;
}