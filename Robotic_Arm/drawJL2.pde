PShape joint2;
PShape link2;
PShape drawJL2(PShape JL2){
 JL2 = createShape(GROUP);
 joint2 = drawCylinder(joint2, 30, width*0.05, height*0.1);
 link2 = drawRect(link2, width*0.05, height*0.2, width*0.05);
 link2.translate(0, -height*0.1, 0);
 JL2.addChild(joint2);
 JL2.addChild(link2); 
 return JL2;
}