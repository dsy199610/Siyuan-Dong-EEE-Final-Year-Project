import g4p_controls.*;
import grafica.*;
//pendulum parameters
float M = 0.5;
float m = 0.2, m2 = 0.2;
float g= 9.8;
float l = 0.5, l2 = 0.5;
float f= 0.5, f2=0.5;
float F = 0;
float b = 0.1;
float I = 0.006, I2 = 0.006;
//controller inputs
float up, up2 = 0;
float up_ = 0, up2_=0;
//controllers for experiment1
float k1 = -1.2245;//stabilizing controller
float k2 = -1.7951;
float k3 = -16.8198;
float k4 = -2.7476;
float k1_s = 0;//swinging up controller
float k2_s = 0;
float k3_s = 0.5;
float k4_s = 1.5;
float switchat_angle=30;//switching conditions
float switchat_anglev=2;
//controllers for experiment2
float k1_ = 1.2245 ;//stabilizing controller
float k2_ = 1.4702;
float k3_ = 0.2427;
float k4_ = 1.1149;
//controllers and references for experiment3
float k1__ = -1.2245;//stabilzing controller
float k2__ = -1.7951;
float k3__ = -16.8198;
float k4__ = -2.7476;
float reference,amplitude=1,frequency=1;//cart position reference
boolean square=false;//type of reference
//controllers for double IP
float k1d_s = 7.0711;//stabilizing controller
float k2d_s =21.3770;
float k3d_s = 60.0236;
float k4d_s = 10.7925;
float k5d_s = 216.1407;
float k6d_s =13.8715;
//Graphics
PShape pendulum, track, twolink;
float mouse_positionX=0, mouse_positionY=0;
//timing
int time=0;
int elapsedTime=17;
//next states
float x1, x2, x3, x4, x5,x6,xx2,xx4,xx6;
float phi = 0, phi2 = 0;
//current states
float x1_ = 0, x2_ = 0, x4_ = 0, x6_ = 0;
float x3_ = 0.05*PI;
float x5_ = 0.05*PI;
//font size
PFont font;
//Initial conditions
float starting_angle1 = PI;
float starting_angle2 = 0.25*PI;
float starting_angle3=0;
float starting_angle4=0.05*PI;
float starting_position = 0;

boolean dragging=false;
//plot
GPlot plot1, plot2;
GPointsArray points1 = new GPointsArray();
GPointsArray points2= new GPointsArray();
GPointsArray points3= new GPointsArray();
boolean draw = true, updated=false;
float plotwindow=6000;

boolean mode = false;//mode: IP structure
int experiment = 1;//mode: experiment
float rotate;//angle for pendulum rotation
int i=0, j=0;//counters for plots
void setup(){
  size(1280, 720, P3D); //size and render
  noStroke(); 
  createGUI();//create GUI 
  pendulum = draw_pendulum(pendulum);//creating single IP structure
  track = draw_track(track);//creating the track
  twolink = draw_double(twolink);//creating double IP structure
  font = createFont("Arial",14,true);
  //plots
  plot1 = new GPlot(this);
  plot1.setPos(width*7/10+80, 0);
  plot1.setDim(200, 130);
  plot1.setTitleText("pendulum angle");
  plot1.getXAxis().setAxisLabelText("t/s");
  plot1.getYAxis().setAxisLabelText("x3/radians");
  plot1.addLayer("layer 1",points3);//add layer for reference
  plot2 = new GPlot(this);
  plot2.setPos(width*7/10+80, 470);
  plot2.setDim(200, 130);
  plot2.setTitleText("cart position");
  plot2.getXAxis().setAxisLabelText("t/s");
  plot2.getYAxis().setAxisLabelText("x1/m");
  plot2.addLayer("layer 1",points3);//add layer for reference
  //buttons in Ex 2 and 3, set invisible in Ex 1 in the begining
  button38.setVisible(false);
  button28.setVisible(false);
  button29.setVisible(false);
}
void draw(){
  background(100);
  text();//all texts on the screen are in this function
  fill(255);
  //generate plot for x3
  if(draw){
    if(i != 0){ points1.add((millis()-time)*0.001, x3);}
    else{points1.add(Float.NaN,Float.NaN);
         points3.add(Float.NaN,Float.NaN);} //avoid the connection between end point and start point in the plots
    i++;
  }
  plot1.beginDraw();
  if(!updated){plot1.setXLim(0, plotwindow/1000);}//only show first several seconds
  else{plot1.setXLim((millis()-time)/1000-plotwindow/2000, (millis()-time)/1000+plotwindow/2000);}//show updated real time plot
  plot1.drawXAxis();
  plot1.drawYAxis();
  plot1.setPoints(points1);
  plot1.getLayer("layer 1").setPoints(points3);//the layer for cart position reference
  plot1.getLayer("layer 1").setLineColor(color(150, 150, 255));
  plot1.drawTitle();
  plot1.drawLines();
  plot1.endDraw();
  //generate plot for x1
  if(draw){
    if(j != 0){ 
      points2.add((millis()-time)*0.001, x1);
      if(experiment==3){points3.add((millis()-time)*0.001,reference);}//draw cart position reference in Ex 3
    }
    else{
     points2.add(Float.NaN,Float.NaN); 
     points3.add(Float.NaN,Float.NaN); 
    }
  j++;
  }
  plot2.setPoints(points2);
  plot2.getLayer("layer 1").setPoints(points3);//the layer for cart position reference
  plot2.getLayer("layer 1").setLineColor(color(150, 150, 255));
  plot2.beginDraw();
  if(!updated){plot2.setXLim(0, plotwindow/1000);}
  else{plot2.setXLim((millis()-time)/1000-plotwindow/2000, (millis()-time)/1000+plotwindow/2000);}
  plot2.drawXAxis();
  plot2.drawYAxis();
  plot2.drawTitle();
  plot2.drawLines();
  plot2.endDraw(); 
 
  lights();//3D light effect
  translate(width/2, height/2, -width/2);
  stroke(255);
  //viewing from different angles
  if(mousePressed&&!dragging){
  mouse_positionX = mouse_positionX + mouseX - pmouseX;
  mouse_positionY = mouse_positionY + pmouseY - mouseY;}
  rotateX(mouse_positionY/float(width) * PI);
  rotateY(mouse_positionX/float(height) * PI);
  
  dragging=false;//avoid rotating screen when dragging scroll bar
  shape(track);//draw track
  //boundary condition for the cart
  if(x1_>10){F = -50*x2_; x2_ = -0.5*x2; x1_ = 10;}
  else if(x1_<-10){F = -50*x2; x2_ = -0.5*x2_; x1_ = -10;}
  //control signal saturation
  if(up_>50){up_ = 50;}
  else if(up_<-50){up_ =  -50;}
  
  if(!mode){//single IP mode
  
  if(experiment==1){//swing up and stabilize
    //motion equations
    x4 = x4_ + 0.001*elapsedTime*((M+m)*(g*sin(x3_)-f*x4_)-(l*m*x4_*x4_*sin(x3_)+up_-b*x2_)*cos(x3_))/(l*(M+(1-cos(x3_)*cos(x3_))*m));
    x3 = 0.001*elapsedTime*x4_+x3_;
    x2 = x2_ + 0.001*elapsedTime*(-m*g*sin(x3_)*cos(x3_)+m*l*x4_*x4_*sin(x3_)+f*m*x4_*cos(x3_) -b*x2_ + up_)/(M+(1-cos(x3_)*cos(x3_))*m);
    x1 = 0.001*elapsedTime*x2_+x1_;
    //create an angle limited to (PI,-PI), use in controller switching condition
    phi = x3;
    while(phi > PI || phi < -PI){
      if(phi > PI){phi = phi - 2*PI;}
      else{phi = phi + 2*PI;}
    }
    //controllers
    if((abs(phi)<=radians(switchat_angle))&&(abs(x4)<switchat_anglev)){
    up = F-(k1*x1+k2*x2+k3*x3+k4*x4);}//stabilizing controller(upward)
    else{
    up = k1_s*x1+k2_s*x2+k3_s*x3+k4_s*x4+F;}//swing up controller
    rotate=x3;
    }

  if(experiment ==2){//damp oscillation
    //motion equations differ from Ex1 by a angle phase shift of PI
    x4 = x4_ + 0.001*elapsedTime*((M+m)*(-g*sin(x3_)-f*x4_)+(-l*m*x4_*x4_*sin(x3_)+up_-b*x2_)*cos(x3_))/(l*(M+(1-cos(x3_)*cos(x3_))*m));
    x3 = 0.001*elapsedTime*x4_+x3_;
    x2 = x2_ + 0.001*elapsedTime*(-m*g*sin(x3_)*cos(x3_)-m*l*x4_*x4_*sin(x3_)-f*m*x4_*cos(x3_) -b*x2_ + up_)/(M+(1-cos(x3_)*cos(x3_))*m);
    x1 = 0.001*elapsedTime*x2_+x1_;
  
    up = F-(k1_*x1+k2_*x2+k3_*x3+k4_*x4);//stabilizing controller(downward)
    rotate=x3+PI;
  }
  
  if(experiment==3){//follow reference
    //same motion equations to Ex 1
    x4 = x4_ + 0.001*elapsedTime*((M+m)*(g*sin(x3_)-f*x4_)-(l*m*x4_*x4_*sin(x3_)+up_-b*x2_)*cos(x3_))/(l*(M+(1-cos(x3_)*cos(x3_))*m));
    x3 = 0.001*elapsedTime*x4_+x3_;
    x2 = x2_ + 0.001*elapsedTime*(-m*g*sin(x3_)*cos(x3_)+m*l*x4_*x4_*sin(x3_)+f*m*x4_*cos(x3_) -b*x2_ + up_)/(M+(1-cos(x3_)*cos(x3_))*m);
    x1 = 0.001*elapsedTime*x2_+x1_;
  
    if(!square){reference=amplitude*sin(2*PI*frequency*(millis()-time)*0.001);}//sin reference
    else{drawsquare();}//square reference
    up = F-(k1__*(x1-reference)+k2__*x2+k3__*x3+k4__*x4);//controller
    fill(255,0,0);//red colour for reference point
    ellipse(reference*100, -0.2*width, 0.05*height, 0.05*height);//drawing a red point for reference
    fill(255);
    rotate=x3;
  }
  
  //update new pendulum position and angle
  PShape rod = pendulum.getChild(1);
  rod.rotateZ(rotate);
  pendulum.translate(x1*100, 0, 0);
  shape(pendulum);
  pendulum.translate(-x1*100, 0, 0);
  rod.rotateZ(-rotate);
  //numerical approximation to avoid small number disturbance
  if(abs(x2)<0.0001){x2=0;}
  if(abs(x4)<0.0001){x4=0;}
  //update the state and ready for next iteration
  x1_ = x1;
  x2_ = x2;
  x3_ = x3;
  x4_ = x4;
  up_ = up;
  }
  else if(mode){//double IP
  //motion equations for double IP
  xx2= (2*(I2*I*up2 + 2*l*l*l2*l2*m2*m2*up2 + I2*l*l*m*up2 + 4*I2*l*l*m2*up2 + I*l2*l2*m2*up2 - I2*I*b*x2_ + I2*l*l*l*m*m*x4_*x4_*sin(x3_) + 8*I2*l*l*l*m2*m2*x4_*x4_*sin(x3_) + I*l2*l2*l2*m2*m2*x6_*x6_*sin(x5_) - 2*l*l*l2*l2*l2*m2*m2*m2*x6_*x6_*sin(2*x3_ - x5_) - 4*l*l*l*l2*l2*m2*m2*m2*x4_*x4_*sin(3*x3_ - 2*x5_) + 2*l*l*l2*l2*l2*m2*m2*m2*x6_*x6_*sin(2*x3_ - 3*x5_) + l*l*l2*l2*m*m2*up2 + 8*l*l*l*l2*l2*m2*m2*m2*x4_*x4_*sin(x3_) + 4*l*l*l2*l2*l2*m2*m2*m2*x6_*x6_*sin(x5_) - 2*b*l*l*l2*l2*m2*m2*x2_ - 2*l*l*l2*l2*m2*m2*up2*cos(2*x3_ - 2*x5_) - I2*b*l*l*m*x2_ - 4*I2*b*l*l*m2*x2_ - I*b*l2*l2*m2*x2_ + 4*l*l*l*l2*l2*m2*m2*m2*x4_*x4_*sin(x3_ - 2*x5_) - (I2*g*l*l*m*m*sin(2*x3_))/2 - 2*I2*g*l*l*m2*m2*sin(2*x3_) - (I*g*l2*l2*m2*m2*sin(2*x5_))/2 - 2*I2*l*l*l2*m2*m2*x6_*x6_*sin(2*x3_ - x5_) + 2*b*l*l*l2*l2*m2*m2*x2_*cos(2*x3_ - 2*x5_) + 6*I2*l*l*l*m*m2*x4_*x4_*sin(x3_) + f*l*l2*l2*m2*m2*x4_*cos(x3_) + 2*f2*l*l*l2*m2*m2*x4_*cos(x5_) + 2*f2*l*l*l2*m2*m2*x6_*cos(x5_) + l*l*l*l2*l2*m*m2*m2*x4_*x4_*sin(x3_ - 2*x5_) + I2*f*l*m*x4_*cos(x3_) + 2*I2*f*l*m2*x4_*cos(x3_) + I*f2*l2*m2*x4_*cos(x5_) + I*f2*l2*m2*x6_*cos(x5_) - f*l*l2*l2*m2*m2*x4_*cos(x3_ - 2*x5_) + 6*I2*l*l*l2*m2*m2*x6_*x6_*sin(x5_) + 3*I*l*l2*l2*m2*m2*x4_*x4_*sin(x3_) - l*l*l2*l2*l2*m*m2*m2*x6_*x6_*sin(2*x3_ - x5_) - 2*l*l*l*l2*l2*m*m2*m2*x4_*x4_*sin(3*x3_ - 2*x5_) + I2*I*l*m*x4_*x4_*sin(x3_) + 2*I2*I*l*m2*x4_*x4_*sin(x3_) + I2*I*l2*m2*x6_*x6_*sin(x5_) + I*l*l2*l2*m2*m2*x4_*x4_*sin(x3_ - 2*x5_) - b*l*l*l2*l2*m*m2*x2_ - 2*f2*l*l*l2*m2*m2*x4_*cos(2*x3_ - x5_) - 2*f2*l*l*l2*m2*m2*x6_*cos(2*x3_ - x5_) - g*l*l*l2*l2*m*m2*m2*sin(2*x3_) - (g*l*l*l2*l2*m*m*m2*sin(2*x3_))/2 + (g*l*l*l2*l2*m*m2*m2*sin(2*x5_))/2 + 5*l*l*l*l2*l2*m*m2*m2*x4_*x4_*sin(x3_) + l*l*l*l2*l2*m*m*m2*x4_*x4_*sin(x3_) + 2*l*l*l2*l2*l2*m*m2*m2*x6_*x6_*sin(x5_) - 2*I2*g*l*l*m*m2*sin(2*x3_) - I2*l*l*l2*m*m2*x6_*x6_*sin(2*x3_ - x5_) + f*l*l2*l2*m*m2*x4_*cos(x3_) + 2*I2*l*l*l2*m*m2*x6_*x6_*sin(x5_) + I*l*l2*l2*m*m2*x4_*x4_*sin(x3_) - f2*l*l*l2*m*m2*x4_*cos(2*x3_ - x5_) - f2*l*l*l2*m*m2*x6_*cos(2*x3_ - x5_)))/(2*I2*I*M + I2*l*l*m*m + 4*I2*l*l*m2*m2 + I*l2*l2*m2*m2 + 2*I2*I*m + 2*I2*I*m2 + 4*M*l*l*l2*l2*m2*m2 + 2*I2*M*l*l*m + 8*I2*M*l*l*m2 + 2*I*M*l2*l2*m2 + 3*l*l*l2*l2*m*m2*m2 + l*l*l2*l2*m*m*m2 + 6*I2*l*l*m*m2 + 2*I*l2*l2*m*m2 - I2*l*l*m*m*cos(2*x3_) - 4*I2*l*l*m2*m2*cos(2*x3_) - I*l2*l2*m2*m2*cos(2*x5_) + 2*M*l*l*l2*l2*m*m2 - 2*l*l*l2*l2*m*m2*m2*cos(2*x3_) - l*l*l2*l2*m*m*m2*cos(2*x3_) + l*l*l2*l2*m*m2*m2*cos(2*x5_) - 4*M*l*l*l2*l2*m2*m2*cos(2*x3_ - 2*x5_) - 4*I2*l*l*m*m2*cos(2*x3_) - 2*l*l*l2*l2*m*m2*m2*cos(2*x3_ - 2*x5_));
  xx4=-(2*I2*M*f*x4_ + f*l2*l2*m2*m2*x4_ + 2*I2*f*m*x4_ + 2*I2*f*m2*x4_ - f*l2*l2*m2*m2*x4_*cos(2*x5_) - 2*I2*g*l*m*m*sin(x3_) - 4*I2*g*l*m2*m2*sin(x3_) + I2*l*l*m*m*x4_*x4_*sin(2*x3_) + 4*I2*l*l*m2*m2*x4_*x4_*sin(2*x3_) + 2*l*l2*l2*m2*m2*up2*cos(x3_) + 2*M*f*l2*l2*m2*x4_ + 2*I2*l*m*up2*cos(x3_) + 4*I2*l*m2*up2*cos(x3_) + 2*f*l2*l2*m*m2*x4_ - 2*l*l2*l2*m2*m2*up2*cos(x3_ - 2*x5_) - 2*M*g*l*l2*l2*m2*m2*sin(x3_) - 2*b*l*l2*l2*m2*m2*x2_*cos(x3_) - 2*I2*M*g*l*m*sin(x3_) - 4*I2*M*g*l*m2*sin(x3_) - 3*g*l*l2*l2*m*m2*m2*sin(x3_) - 2*g*l*l2*l2*m*m*m2*sin(x3_) - 2*I2*b*l*m*x2_*cos(x3_) - 4*I2*b*l*m2*x2_*cos(x3_) - 2*M*g*l*l2*l2*m2*m2*sin(x3_ - 2*x5_) - 6*I2*g*l*m*m2*sin(x3_) + 2*I2*l*l2*m2*m2*x6_*x6_*sin(x3_ - x5_) + 2*b*l*l2*l2*m2*m2*x2_*cos(x3_ - 2*x5_) + 2*l*l*l2*l2*m*m2*m2*x4_*x4_*sin(2*x3_) + l*l*l2*l2*m*m*m2*x4_*x4_*sin(2*x3_) - g*l*l2*l2*m*m2*m2*sin(x3_ - 2*x5_) + 4*M*l*l*l2*l2*m2*m2*x4_*x4_*sin(2*x3_ - 2*x5_) + l*l2*l2*l2*m*m2*m2*x6_*x6_*sin(x3_ + x5_) + 4*I2*l*l*m*m2*x4_*x4_*sin(2*x3_) + 2*l*l*l2*l2*m*m2*m2*x4_*x4_*sin(2*x3_ - 2*x5_) + 2*f2*l*l2*m2*m2*x4_*cos(x3_ + x5_) + 2*f2*l*l2*m2*m2*x6_*cos(x3_ + x5_) + 4*M*l*l2*l2*l2*m2*m2*x6_*x6_*sin(x3_ - x5_) + 2*l*l2*l2*m*m2*up2*cos(x3_) + 3*l*l2*l2*l2*m*m2*m2*x6_*x6_*sin(x3_ - x5_) + 2*I2*l*l2*m2*m2*x6_*x6_*sin(x3_ + x5_) - 2*f2*l*l2*m2*m2*x4_*cos(x3_ - x5_) - 2*f2*l*l2*m2*m2*x6_*cos(x3_ - x5_) - 3*f2*l*l2*m*m2*x4_*cos(x3_ - x5_) - 3*f2*l*l2*m*m2*x6_*cos(x3_ - x5_) - 2*M*g*l*l2*l2*m*m2*sin(x3_) - 2*b*l*l2*l2*m*m2*x2_*cos(x3_) + 4*I2*M*l*l2*m2*x6_*x6_*sin(x3_ - x5_) + 3*I2*l*l2*m*m2*x6_*x6_*sin(x3_ - x5_) + f2*l*l2*m*m2*x4_*cos(x3_ + x5_) + f2*l*l2*m*m2*x6_*cos(x3_ + x5_) - 4*M*f2*l*l2*m2*x4_*cos(x3_ - x5_) - 4*M*f2*l*l2*m2*x6_*cos(x3_ - x5_) + I2*l*l2*m*m2*x6_*x6_*sin(x3_ + x5_))/(2*I2*I*M + I2*l*l*m*m + 4*I2*l*l*m2*m2 + I*l2*l2*m2*m2 + 2*I2*I*m + 2*I2*I*m2 + 4*M*l*l*l2*l2*m2*m2 + 2*I2*M*l*l*m + 8*I2*M*l*l*m2 + 2*I*M*l2*l2*m2 + 3*l*l*l2*l2*m*m2*m2 + l*l*l2*l2*m*m*m2 + 6*I2*l*l*m*m2 + 2*I*l2*l2*m*m2 - I2*l*l*m*m*cos(2*x3_) - 4*I2*l*l*m2*m2*cos(2*x3_) - I*l2*l2*m2*m2*cos(2*x5_) + 2*M*l*l*l2*l2*m*m2 - 2*l*l*l2*l2*m*m2*m2*cos(2*x3_) - l*l*l2*l2*m*m*m2*cos(2*x3_) + l*l*l2*l2*m*m2*m2*cos(2*x5_) - 4*M*l*l*l2*l2*m2*m2*cos(2*x3_ - 2*x5_) - 4*I2*l*l*m*m2*cos(2*x3_) - 2*l*l*l2*l2*m*m2*m2*cos(2*x3_ - 2*x5_));
  xx6=-(2*I*M*f2*x4_ + 2*I*M*f2*x6_ + f2*l*l*m*m*x4_ + f2*l*l*m*m*x6_ + 4*f2*l*l*m2*m2*x4_ + 4*f2*l*l*m2*m2*x6_ + 2*I*f2*m*x4_ + 2*I*f2*m*x6_ + 2*I*f2*m2*x4_ + 2*I*f2*m2*x6_ - f2*l*l*m*m*x4_*cos(2*x3_) - f2*l*l*m*m*x6_*cos(2*x3_) - 4*f2*l*l*m2*m2*x4_*cos(2*x3_) - 4*f2*l*l*m2*m2*x6_*cos(2*x3_) - 2*I*g*l2*m2*m2*sin(x5_) - 4*l*l*l2*m2*m2*up2*cos(2*x3_ - x5_) + I*l2*l2*m2*m2*x6_*x6_*sin(2*x5_) + 4*l*l*l2*m2*m2*up2*cos(x5_) + 2*M*f2*l*l*m*x4_ + 2*M*f2*l*l*m*x6_ + 8*M*f2*l*l*m2*x4_ + 8*M*f2*l*l*m2*x6_ + 2*I*l2*m2*up2*cos(x5_) + 6*f2*l*l*m*m2*x4_ + 6*f2*l*l*m*m2*x6_ - 4*M*g*l*l*l2*m2*m2*sin(x5_) - 4*b*l*l*l2*m2*m2*x2_*cos(x5_) - 4*f2*l*l*m*m2*x4_*cos(2*x3_) - 4*f2*l*l*m*m2*x6_*cos(2*x3_) - 2*I*M*g*l2*m2*sin(x5_) + g*l*l*l2*m*m*m2*sin(x5_) - 2*I*b*l2*m2*x2_*cos(x5_) - 2*I*g*l2*m*m2*sin(x5_) - 2*I*l*l2*m2*m2*x4_*x4_*sin(x3_ - x5_) - l*l*l2*l2*m*m2*m2*x6_*x6_*sin(2*x5_) - 2*l*l*l2*m*m2*up2*cos(2*x3_ - x5_) - 4*M*l*l*l2*l2*m2*m2*x6_*x6_*sin(2*x3_ - 2*x5_) - 2*l*l*l*l2*m*m2*m2*x4_*x4_*sin(x3_ + x5_) - l*l*l*l2*m*m*m2*x4_*x4_*sin(x3_ + x5_) - 2*l*l*l2*l2*m*m2*m2*x6_*x6_*sin(2*x3_ - 2*x5_) + 2*f*l*l2*m2*m2*x4_*cos(x3_ + x5_) + 4*M*g*l*l*l2*m2*m2*sin(2*x3_ - x5_) - 16*M*l*l*l*l2*m2*m2*x4_*x4_*sin(x3_ - x5_) + 4*b*l*l*l2*m2*m2*x2_*cos(2*x3_ - x5_) + 2*g*l*l*l2*m*m2*m2*sin(2*x3_ - x5_) + g*l*l*l2*m*m*m2*sin(2*x3_ - x5_) - 6*l*l*l*l2*m*m2*m2*x4_*x4_*sin(x3_ - x5_) - l*l*l*l2*m*m*m2*x4_*x4_*sin(x3_ - x5_) + 2*I*l*l2*m2*m2*x4_*x4_*sin(x3_ + x5_) - 2*f*l*l2*m2*m2*x4_*cos(x3_ - x5_) - 3*f*l*l2*m*m2*x4_*cos(x3_ - x5_) - 4*I*M*l*l2*m2*x4_*x4_*sin(x3_ - x5_) - 3*I*l*l2*m*m2*x4_*x4_*sin(x3_ - x5_) + f*l*l2*m*m2*x4_*cos(x3_ + x5_) + 2*M*g*l*l*l2*m*m2*sin(2*x3_ - x5_) - 4*M*l*l*l*l2*m*m2*x4_*x4_*sin(x3_ - x5_) + 2*b*l*l*l2*m*m2*x2_*cos(2*x3_ - x5_) - 4*M*f*l*l2*m2*x4_*cos(x3_ - x5_) + I*l*l2*m*m2*x4_*x4_*sin(x3_ + x5_))/(2*I2*I*M + I2*l*l*m*m + 4*I2*l*l*m2*m2 + I*l2*l2*m2*m2 + 2*I2*I*m + 2*I2*I*m2 + 4*M*l*l*l2*l2*m2*m2 + 2*I2*M*l*l*m + 8*I2*M*l*l*m2 + 2*I*M*l2*l2*m2 + 3*l*l*l2*l2*m*m2*m2 + l*l*l2*l2*m*m*m2 + 6*I2*l*l*m*m2 + 2*I*l2*l2*m*m2 - I2*l*l*m*m*cos(2*x3_) - 4*I2*l*l*m2*m2*cos(2*x3_) - I*l2*l2*m2*m2*cos(2*x5_) + 2*M*l*l*l2*l2*m*m2 - 2*l*l*l2*l2*m*m2*m2*cos(2*x3_) - l*l*l2*l2*m*m*m2*cos(2*x3_) + l*l*l2*l2*m*m2*m2*cos(2*x5_) - 4*M*l*l*l2*l2*m2*m2*cos(2*x3_ - 2*x5_) - 4*I2*l*l*m*m2*cos(2*x3_) - 2*l*l*l2*l2*m*m2*m2*cos(2*x3_ - 2*x5_));
  x1 = 0.001*elapsedTime*x2_+x1_;
  x3 = 0.001*elapsedTime*x4_+x3_;
  x5 = 0.001*elapsedTime*x6_+x5_;
  x2 = x2_ + 0.001*elapsedTime*xx2;
  x4 = x4_ + 0.001*elapsedTime*xx4;
  x6 = x6_ + 0.001*elapsedTime*xx6;
  //future use for switching condition, no use for now
  phi = x3;
  while(phi > PI || phi < -PI){
    if(phi > PI){phi = phi - 2*PI;}
    else{phi = phi + 2*PI;}
  }
    
  phi2 = x5;
  while(phi2 > PI || phi2 < -PI){
    if(phi2 > PI){phi2 = phi2 - 2*PI;}
    else{phi2 = phi2 + 2*PI;}
  }
   
  up2=F-(k1d_s*x1+k2d_s*x2+k3d_s*x3+k4d_s*x4+k5d_s*x5+k6d_s*x6);//stabilizing controller (upward)
   
   //control signal saturation 
   if(up2>50){up2 = 50;}
   else if(up2<-50){up2 =  -50;}
   //update IP with new position and angles
   PShape first = twolink.getChild(2);
   PShape second = first.getChild(2);
   second.translate(0, 0.2*width, 0);
   second.rotateZ(phi2-phi);
   second.translate(0, -0.2*width, 0);
   first.rotateZ(phi);
   twolink.translate(x1*100,0,0);
   shape(twolink); 
   twolink.translate(-x1*100,0,0);
   first.rotateZ(-phi);
   second.translate(0, 0.2*width, 0);
   second.rotateZ(phi-phi2);
   second.translate(0, -0.2*width, 0);
   //small number approximate to zero
   if(abs(x2)<0.0001){x2=0;}
   if(abs(x4)<0.0001){x4=0;}
   if(abs(x6)<0.0001){x6=0;}
   //update to new states and ready for next iteration
   x1_=x1;
   x2_=x2;
   x3_=x3;
   x4_=x4;
   x5_=x5;
   x6_=x6;
  }
  
  F = 0;//set perturbance back to zero by the end of each loop
}

//text creator
void text(){
   text("Experiment "+experiment, 620, 100);
   text("Pendulum radians="+x3,width*8/10,230);
   text("Pendulum velocity="+x4,width*8/10,245);
   text("Cart Position="+x1,width*8/10,470);
   text("Cart velocity="+x2,width*8/10,485);
   text("Control signal="+up,610,height*19/20+10);
   text("M="+M,100,535);
   text("m="+m,100,575);
   text("l="+l,100,615);
   text("f="+f,100,655);
   text("b="+b,100,695);
   text("plot period="+plotwindow+"ms",820,650);
   if(experiment==1){
   text("K1="+k1,315,575);
   text("K2="+k2,315,615);
   text("K3="+k3,315,655);
   text("K4="+k4,315,695);
   text("K1="+k1_s,550,575);
   text("K2="+k2_s,550,615);
   text("K3="+k3_s,550,655);
   text("K4="+k4_s,550,695);
   text("switch at angle "+switchat_angle, 620,590);
   text("switch at angle v "+switchat_anglev, 620,640);
   }
   if(experiment==2){
   text("K1="+k1_,315,575);
   text("K2="+k2_,315,615);
   text("K3="+k3_,315,655);
   text("K4="+k4_,315,695);
   }
   if(experiment==3){
   text("K1="+k1__,315,575);
   text("K2="+k2__,315,615);
   text("K3="+k3__,315,655);
   text("K4="+k4__,315,695);
   if(square){text("square amp "+amplitude+" fre "+frequency, 620,590);}
   else{text("sin amp "+amplitude+" fre "+frequency, 620,590);}
   text("amp",590,610);
   text("fre",590,670);
   }
}
//square reference generator
void drawsquare(){
  if(sin(2*PI*frequency*(millis()-time)*0.001)>=0){
    reference=amplitude;
  }
  else{
  reference=-amplitude;}
}