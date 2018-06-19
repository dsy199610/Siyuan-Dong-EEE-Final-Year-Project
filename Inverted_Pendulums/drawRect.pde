PShape drawRect(PShape rect, float big_x, float big_y, float big_z){
  rect = createShape(GROUP);
  
  PShape top = createShape();
  top.beginShape();
  top.vertex(big_x/2, -big_y/2, big_z/2);
  top.vertex(-big_x/2, -big_y/2, big_z/2);
  top.vertex(-big_x/2, -big_y/2, -big_z/2);
  top.vertex(big_x/2, -big_y/2, -big_z/2);
  top.endShape(CLOSE);
  
  PShape right = createShape();
  right.beginShape();
  right.vertex(big_x/2, -big_y/2, big_z/2);
  right.vertex(big_x/2, big_y/2, big_z/2);
  right.vertex(big_x/2, big_y/2, -big_z/2);
  right.vertex(big_x/2, -big_y/2, -big_z/2);
  right.endShape(CLOSE);
  
  PShape front = createShape();
  front.beginShape();
  front.vertex(big_x/2, -big_y/2, big_z/2);
  front.vertex(-big_x/2, -big_y/2, big_z/2);
  front.vertex(-big_x/2, big_y/2, big_z/2);
  front.vertex(big_x/2, big_y/2, big_z/2);
  front.endShape(CLOSE);
  
  PShape left = createShape();
  left.beginShape();
  left.vertex(-big_x/2, -big_y/2, -big_z/2);
  left.vertex(-big_x/2, -big_y/2, big_z/2);
  left.vertex(-big_x/2, big_y/2, big_z/2);
  left.vertex(-big_x/2, big_y/2, -big_z/2);
  left.endShape(CLOSE);
  
  PShape back = createShape();
  back.beginShape();
  back.vertex(big_x/2, -big_y/2, -big_z/2);
  back.vertex(-big_x/2, -big_y/2, -big_z/2);
  back.vertex(-big_x/2, big_y/2, -big_z/2);
  back.vertex(big_x/2, big_y/2, -big_z/2);
  back.endShape(CLOSE);
  
  PShape bottom = createShape();
  bottom.beginShape();
  bottom.vertex(big_x/2, big_y/2, big_z/2);
  bottom.vertex(-big_x/2, big_y/2, big_z/2);
  bottom.vertex(-big_x/2, big_y/2, -big_z/2);
  bottom.vertex(big_x/2, big_y/2, -big_z/2);
  bottom.endShape(CLOSE);
  
  rect.addChild(top);
  rect.addChild(bottom);
  rect.addChild(left);
  rect.addChild(right);
  rect.addChild(front);
  rect.addChild(back);

  return rect;
}