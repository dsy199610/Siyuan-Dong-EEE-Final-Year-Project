PShape drawCylinder(PShape joint, int sides, float r, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;
    joint = createShape(GROUP);
    // draw top shape
    pushMatrix();
    PShape top = createShape();
    top.beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        top.vertex( x, y, -halfHeight );    
    }
    top.endShape(CLOSE);
    
    // draw bottom shape
    PShape bottom = createShape();
    bottom.beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        bottom.vertex(x, y, halfHeight );    
    }
    bottom.endShape(CLOSE);
    
    //draw the side
    PShape side = createShape();
    side.beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    side.vertex( x, y, halfHeight);
    side.vertex( x, y, - halfHeight);    
    }
    side.endShape(CLOSE);
    //make up the whole shape
    joint.addChild(top);
    joint.addChild(bottom);
    joint.addChild(side);;
    return joint;

} 