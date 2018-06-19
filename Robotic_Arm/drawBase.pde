PShape base1;
PShape base2;

PShape drawBase(PShape base){
  base = createShape(GROUP);
  base1 = drawRect(base1, width*0.75, height*0.03, width*0.75);
  base2 = drawRect(base2, width*0.2, height*0.03, width*0.2);
  base2.translate(0,-height*0.03, 0);
  base.addChild(base1);
  base.addChild(base2);
  return base;
}