PShape double_base;
PShape double_joint0;
PShape first;
PShape first_rod;
PShape first_joint;
PShape second;

PShape draw_double(PShape twolink){
  twolink = createShape(GROUP);
  first = createShape(GROUP);
  double_base = drawRect(double_base, 0.1*width, 0.05*height, 0.05*height);
  double_joint0 = drawCylinder(double_joint0, 30, 0.025*height, 0.06*height);
  PShape top0 = double_joint0.getChild(0);
  top0.setFill(color(0));
  PShape bottom0 = double_joint0.getChild(1);
  bottom0.setFill(color(0));
  first_rod = drawCylinder(first_rod, 30, 0.02*height, 0.2*width);
  first_rod.rotateX(0.5*PI);
  first_rod.translate(0, -0.1*width, 0);
  first_joint = drawCylinder(first_joint, 30, 0.025*height, 0.05*height);
  first_joint.translate(0, -0.2*width,0);
  PShape top1 = first_joint.getChild(0);
  top1.setFill(color(0));
  PShape bottom1 = first_joint.getChild(1);
  bottom1.setFill(color(0));
  second = drawCylinder(second, 30, 0.02*height, 0.2*width);
  second.rotateX(0.5*PI);
  second.translate(0, -0.3*width, 0);
  
  first.addChild(first_rod);
  first.addChild(first_joint);
  first.addChild(second);
  
  twolink.addChild(double_base);
  twolink.addChild(double_joint0);
  twolink.addChild(first);

  return twolink;
}