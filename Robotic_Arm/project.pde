//joint motion parameters
float angle = 0;
float angle2 = 0;
float angle3 = 0.5*PI;
float extend_length = 0;
float change = 0;
//forward kinematics
float target_angle1 = 0.5*PI;
float target_angle2 = PI;
float target_length;
float [][] transformation1;
float [][] transformation2;
float [][] transformation3;
float [][] transformation12;
float [][] transformation123;
//Graphics
PShape arm;
PShape base;
float mouse_positionX=0, mouse_positionY=0;//screen viewing angle
void setup() {
  size(1280, 720, P3D);
  noStroke();
  arm = draw_arm(arm);
  base = drawBase(base);//base with two cuboids
  //forward kinmematics, not in use now but might be necessaary in the future
  //target_length = 0.2*height;
  //transformation1 = new float [][] { {cos(target_angle1), 0, -sin(target_angle1), 0}, {sin(target_angle1), 0, cos(target_angle1),0}, {0,-1,0,0.25*height},{0,0,0,1}};
  //transformation2 = new float [][] { {sin(target_angle2), 0, cos(target_angle2), 0}, {-cos(target_angle2), 0, sin(target_angle2), 0}, {0,-1,0,0},{0,0,0,1}};
  //transformation3 = new float [][] { {0, 1, 0, 0}, {-1, 0, 0, 0}, {0, 0, 1, 0.2*height+target_length}, {0, 0, 0, 1} }; 
  //transformation12 = new float [][] { {0,0,0,0}, {0,0,0,0},{0,0,0,0}, {0,0,0,0} };
  //transformation123 = new float [][] { {0,0,0,0}, {0,0,0,0},{0,0,0,0}, {0,0,0,0} };
  //matrix_mul(transformation1, transformation2, transformation12);
  //matrix_mul(transformation12, transformation3, transformation123);
}

void draw() {
  background(0);
  lights();//create 3D light effect
  translate(width/2, height/2, -width/2);
  
  //change viewing angle
  if(mousePressed){
  mouse_positionX = mouse_positionX + mouseX - pmouseX;
  mouse_positionY = mouse_positionY + pmouseY - mouseY;}
  rotateX(mouse_positionY/float(width) * PI);
  rotateY(mouse_positionX/float(height) * PI);
  
  //drawing the base
  shape(base, 0, 0.45*height);
  //drawing the arm and creating motion
  JL23_H = arm.getChild(1);
  JL3_H = JL23_H.getChild(1);
  JL3_H.translate(0, extend_length, 0);
  JL23_H.translate(0, 0.25*height, 0);
  JL23_H.rotateZ(angle);
  JL23_H.translate(0, -0.25*height, 0);
  arm.rotateY(angle2);
  shape(arm, 0, 0.355*height);
  arm.rotateY(-angle2);
  JL23_H.translate(0, 0.25*height, 0);
  JL23_H.rotateZ(-angle);
  JL23_H.translate(0, -0.25*height, 0);
  JL3_H.translate(0, -extend_length, 0);
  //drawing coordinate axis
  stroke(255, 0, 0);line(-1000, 0, 0, 1000, 0, 0);stroke(0, 255, 0);line(0, -1000, 0, 0, 1000, 0);stroke(0, 0, 255);line(0, 0, -1000, 0, 0, 1000);
  motion();//motion controller
}

//matrix multiplication, not in use now but might be necessaary in the future
void matrix_mul(float [][] matrix1, float [][] matrix2, float [][]matrix3){
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      for(int k = 0; k < 4; k++){
          matrix3[i][j] = matrix3[i][j] + matrix1[i][k]*matrix2[k][j];
      }
    }
  }
}

//virtual motion controller function
void motion(){
    angle += 0.01*PI;
    angle2 += 0.02*PI;
    if (extend_length > 0.2*height){change = -0.001*height;}
    else if (extend_length <= 0*height){  change = +0.001*height;}
    extend_length = extend_length +change;
}