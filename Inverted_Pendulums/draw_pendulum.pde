PShape base;
PShape rod;
PShape joint;
PShape draw_pendulum(PShape pendulum){
  pendulum = createShape(GROUP);
  base = drawRect(base, 0.1*width, 0.05*height, 0.05*height);
  rod = drawCylinder(rod, 30, 0.02*height, 0.2*width);
  joint = drawCylinder(joint, 30, 0.025*height, 0.06*height);
  PShape top = joint.getChild(0);
  top.setFill(color(0));
  PShape bottom = joint.getChild(1);
  bottom.setFill(color(0));
  PShape side = joint.getChild(2);
  side.setFill(color(0));
  rod.rotateX(0.5*PI);
  rod.translate(0, -0.1*width, 0);
  pendulum.addChild(base);
  pendulum.addChild(rod);
  pendulum.addChild(joint);
  return pendulum;
}