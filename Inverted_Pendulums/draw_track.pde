PShape left;
PShape right;
PShape bottom;

PShape draw_track(PShape track){
  track = createShape(GROUP);
  left = drawRect(left, 0.05*width, 0.2*height, 0.3*height);
  right = drawRect(right, 0.05*width, 0.2*height, 0.3*height);
  bottom = drawRect(bottom, 2000+0.1*width, 0.01*height, 0.01*height);
  left.translate(-1000-0.125*width,0,0);
  right.translate(1000+0.125*width,0,0);
  track.addChild(left);
  track.addChild(right);
  track.addChild(bottom);
  return track;
}