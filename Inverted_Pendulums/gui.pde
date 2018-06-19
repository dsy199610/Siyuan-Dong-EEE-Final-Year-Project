/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void custom_slider1_change1(GCustomSlider source, GEvent event) {//Slider M
  switch(event){
   case VALUE_STEADY:
   M = custom_slider1.getValueF();
   dragging = true;//avoid dragging the screen
  }
}

public void custom_slider2_change1(GCustomSlider source, GEvent event) { //slider m
  switch(event){
   case VALUE_STEADY:
   m = custom_slider2.getValueF();
   dragging = true;
  }
} 

public void custom_slider3_change1(GCustomSlider source, GEvent event) { //slider l
  switch(event){
   case VALUE_STEADY:
   l = custom_slider3.getValueF();
   dragging = true;
  }
}

public void custom_slider4_change1(GCustomSlider source, GEvent event) { //slider f
  switch(event){
   case VALUE_STEADY:
   f = custom_slider4.getValueF();
   dragging = true;
  }
} 

public void custom_slider5_change1(GCustomSlider source, GEvent event) { //slider b
  switch(event){
   case VALUE_STEADY:
   b = custom_slider5.getValueF();
   dragging = true;
  }
}

public void textfield1_change1(GTextField source, GEvent event) { //textfield for starting position
  switch(event){
    case CHANGED:
    starting_position = float(textfield1.getText());
    case SELECTION_CHANGED:dragging=true;
  }
} 

public void textfield2_change1(GTextField source, GEvent event) { //textfield for starting angles
  switch(event){
    case CHANGED:
    if(!mode){
    if(experiment==3){starting_angle3 = radians(float(textfield2.getText()));}
    else if(experiment==2){starting_angle2 = radians(float(textfield2.getText()));}
    else{starting_angle1 = radians(float(textfield2.getText()));}
    }
    else{starting_angle4 =  radians(float(textfield2.getText()));}
    case SELECTION_CHANGED:dragging=true;
  }
} 

public void textfield3_change1(GTextField source, GEvent event) { //textfield for stabilizing controller K1
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void button1_click1(GButton source, GEvent event) { //update typed K1
    switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield3.getText()))){
    if(experiment==1){k1 = float(textfield3.getText());}
    if(experiment==2){k1_ = float(textfield3.getText());}
    if(experiment==3){k1__ = float(textfield3.getText());}
  }
}
}

public void button2_click1(GButton source, GEvent event) { //clear typed K1
    switch(event){
    case CLICKED:
    textfield3.setText("");
}
}

public void textfield4_change1(GTextField source, GEvent event) { //textfield for stabilizing controller K2
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void textfield5_change1(GTextField source, GEvent event) { //textfield for stabilizing controller K3
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void textfield6_change1(GTextField source, GEvent event) { //textfield for stabilizing controller K4
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void button3_click1(GButton source, GEvent event) { ////update typed K2
    switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield4.getText()))){
    if(experiment==1){k2 = float(textfield4.getText());}
    if(experiment==2){k2_ = float(textfield4.getText());}
    if(experiment==3){k2__ = float(textfield4.getText());}}
}
}

public void button4_click1(GButton source, GEvent event) { //clear typed K2
    switch(event){
    case CLICKED:
    textfield4.setText("");
}
}

public void button5_click1(GButton source, GEvent event) { ////update typed K3
  switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield5.getText()))){
    if(experiment==1){k3 = float(textfield5.getText());}
    if(experiment==2){k3_ = float(textfield5.getText());}
    if(experiment==3){k3__ = float(textfield5.getText());}}
}
}

public void button6_click1(GButton source, GEvent event) { //clear typed K3
  switch(event){
    case CLICKED:
    textfield5.setText("");
}
}

public void button7_click1(GButton source, GEvent event) { //update typed K4
    switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield6.getText()))){
    if(experiment==1){k4 = float(textfield6.getText());}
    if(experiment==2){k4_ = float(textfield6.getText());}
    if(experiment==3){k4__ = float(textfield6.getText());}}
}
}

public void button8_click1(GButton source, GEvent event) { //clear typed K4
   switch(event){
    case CLICKED:
    textfield6.setText("");
}
}

public void button10_click1(GButton source, GEvent event) { //clear the plots
  points1 = new GPointsArray();
  points2 = new GPointsArray();
  points3 = new GPointsArray();
  i=j=0;
  draw = false;
  time=millis();
}

public void textfield7_change1(GTextField source, GEvent event) { //textfield for swing up controller K1
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void textfield8_change1(GTextField source, GEvent event) { //textfield for swing up controller K2
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
}

public void textfield9_change1(GTextField source, GEvent event) { //textfield for swing up controller K3
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void textfield10_change1(GTextField source, GEvent event) { //textfield for swing up controller K4
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void button11_click1(GButton source, GEvent event) { //update typed swing K1
    switch(event){
      case CLICKED:
      if(!Float.isNaN(float(textfield7.getText()))){
      k1_s = float(textfield7.getText());}
}
}

public void button12_click1(GButton source, GEvent event) { ///clear typed swing K1
    switch(event){
    case CLICKED:
    textfield7.setText("");
}
}

public void button13_click1(GButton source, GEvent event) { //update typed swing K2
    switch(event){
      case CLICKED:
      if(!Float.isNaN(float(textfield8.getText()))){
      k2_s = float(textfield8.getText());}
}
}

public void button14_click1(GButton source, GEvent event) { ///clear typed swing K2
    switch(event){
    case CLICKED:
    textfield8.setText("");
}
}

public void button15_click1(GButton source, GEvent event) { //update typed swing K3
    switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield9.getText()))){
    k3_s = float(textfield9.getText());}
}
} //_CODE_:button15:860116:

public void button16_click1(GButton source, GEvent event) { ///clear typed swing K3
    switch(event){
      case CLICKED:
      textfield9.setText("");
}
}

public void button17_click1(GButton source, GEvent event) { //update typed swing K4
    switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield10.getText()))){
    k4_s = float(textfield10.getText());}
}
}

public void button18_click1(GButton source, GEvent event) { ///clear typed swing K4
    switch(event){
    case CLICKED:
    textfield10.setText("");
}
}

public void textfield11_change1(GTextField source, GEvent event) { //textfield switching angle for Ex1, and reference amplitude for Ex3
    switch(event){
    case SELECTION_CHANGED:dragging=true;}
} 

public void button9_click1(GButton source, GEvent event) { //clear typed starting position
  switch(event){
    case CLICKED:
    textfield1.setText("");
}}

public void button19_click1(GButton source, GEvent event) { //clear typed starting angle
    switch(event){
      case CLICKED:
      textfield2.setText("");
}}

public void button20_click1(GButton source, GEvent event) { //update typed information in textfield11
    switch(event){
      case CLICKED:
      if(!Float.isNaN(float(textfield11.getText()))){
      if(experiment==1){switchat_angle = float(textfield11.getText());}
      else if(experiment==3){amplitude = float(textfield11.getText());}}
}}

public void button21_click1(GButton source, GEvent event) { //clear typed information in textfield11
    switch(event){
      case CLICKED:
      textfield11.setText("");
}
}

public void textfield12_change1(GTextField source, GEvent event) { //textfield switching angle velocity for Ex1, and reference frequency for Ex3
    switch(event){
    case SELECTION_CHANGED:dragging=true;}
}

public void button22_click1(GButton source, GEvent event) { //update typed information in textfield12
  switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield12.getText()))){
    if(experiment==1){switchat_anglev = float(textfield12.getText());}
    else if(experiment==3){frequency = float(textfield12.getText());}
  }
}} 

public void button23_click1(GButton source, GEvent event) { //clear typed information in textfield11
    switch(event){
    case CLICKED:
    textfield12.setText("");
}}

public void button24_click1(GButton source, GEvent event) { //reset the screen position
    switch(event){
      case CLICKED:
      mouse_positionX=0;
      mouse_positionY=0;
}} 

public void button25_click1(GButton source, GEvent event) { //Switch to Ex1
    switch(event){
    case CLICKED:
    x1_=x2_=x4_=0;
    x3_=PI;
    experiment = 1;
    textfield7.setVisible(true);textfield8.setVisible(true);textfield9.setVisible(true);textfield10.setVisible(true);textfield11.setVisible(true);
    textfield12.setVisible(true);
    button11.setVisible(true);button12.setVisible(true);button13.setVisible(true);button14.setVisible(true);button15.setVisible(true);
    button16.setVisible(true);button17.setVisible(true);button18.setVisible(true);button21.setVisible(true);button22.setVisible(true);
    button20.setVisible(true);button23.setVisible(true);label5.setVisible(true);button38.setVisible(false);
    button28.setVisible(false);button29.setVisible(false);
    points1 = new GPointsArray();
    points2 = new GPointsArray();
    points3 = new GPointsArray();
    i=j=0;
    time=millis();
    draw=true;
}
}

public void button26_click1(GButton source, GEvent event) { //Switch to Ex 2
    switch(event){
    case CLICKED:
    x1_=x2_=x4_=0;
    x3_=0.25*PI;
    experiment = 2;
    textfield7.setVisible(false);textfield8.setVisible(false);textfield9.setVisible(false);textfield10.setVisible(false);textfield11.setVisible(false); textfield12.setVisible(false);
    button11.setVisible(false);button12.setVisible(false);button13.setVisible(false);button14.setVisible(false);button15.setVisible(false);
    button16.setVisible(false);button17.setVisible(false);button18.setVisible(false);button21.setVisible(false);button22.setVisible(false);
    button20.setVisible(false);button23.setVisible(false);label5.setVisible(false);button28.setVisible(false);button29.setVisible(false);button38.setVisible(true);
    points1 = new GPointsArray();
    points2 = new GPointsArray();
    points3 = new GPointsArray();
    i=j=0;
    time=millis();
    draw=true;
}}

public void button27_click1(GButton source, GEvent event) { //Switch to Ex 3
    switch(event){
    case CLICKED:
    experiment=3;
    x1_=x2_=x4_=0;
    x3_=0;
    points1 = new GPointsArray();
    points2 = new GPointsArray();
    points3 = new GPointsArray();
    time=millis();
    draw=true;
    i=j=0;
    textfield7.setVisible(false);textfield8.setVisible(false);textfield9.setVisible(false);textfield10.setVisible(false);
    button11.setVisible(false);button12.setVisible(false);button13.setVisible(false);button14.setVisible(false);button15.setVisible(false);
    button16.setVisible(false);button17.setVisible(false);button18.setVisible(false);label5.setVisible(false);
    button21.setVisible(true);button22.setVisible(true);button20.setVisible(true);button23.setVisible(true);label5.setVisible(false);
    textfield11.setVisible(true);textfield12.setVisible(true);button28.setVisible(true);button29.setVisible(true);button38.setVisible(false);
    }
  } 
    
public void button28_click1(GButton source, GEvent event) {//sine reference in Ex3
   switch(event){
     case CLICKED:
     square=false;
 }}
public void button29_click1(GButton source, GEvent event) {//square reference for Ex3
   switch(event){
     case CLICKED:
     square=true;
 }}

public void button30_click1(GButton source, GEvent event) {//reset all parameters, controllers to default values
   switch(event){
    case CLICKED:
    M = 0.5;m = 0.2;m2 = 0.2;g= 9.8;l = 0.5;l2 = 0.5;f= 0.5;f2=0.5;F = 0;b = 0.1;I = 0.006;I2 = 0.006;k1 = -1.2245;k2 = -1.7951;k3 = -16.8198;k4 = -2.7476;
    k1_s = 0;k2_s = 0;k3_s = 0.5;k4_s = 1.5;k1_ = 1.2245 ;k2_ = 1.4702;k3_ = 0.2427;k4_ = 1.1149;k1__ = -1.2245;k2__ = -1.7951;k3__ = -16.8198;k4__ = -2.7476;
    switchat_angle=30;switchat_anglev=2;
 }
 }

public void textfield13_change1(GTextField source, GEvent event) { //textfield for plot window size under updated mode
  switch(event){
    case SELECTION_CHANGED:dragging=true;}
}

public void button31_click1(GButton source, GEvent event) { //update information typed in textfield13
  switch(event){
    case CLICKED:
    if(!Float.isNaN(float(textfield13.getText()))){
      plotwindow = float(textfield13.getText());}
}
}

public void button32_click1(GButton source, GEvent event) { //clear information typed in textfield13
    switch(event){
    case CLICKED:
    textfield13.setText("");
}}

public void button33_click1(GButton source, GEvent event) { //switch to updated plot mode
    switch(event){
    case CLICKED:
    updated=false;
}}
public void button34_click1(GButton source, GEvent event) { //switch to initial plot mode (only plot first several seconds)
    switch(event){
    case CLICKED:
    updated=true;
}}

public void button35_click1(GButton source, GEvent event) { //restart 
    switch(event){
    case CLICKED:
    x1_ =starting_position;
    x2_=x4_=x6_=0;
    if(!mode){
      if(experiment==3){x3_=starting_angle3;}
      else if(experiment==2){x3_=starting_angle2;}
      else{x3_=x5_=starting_angle1;}}
    else{x3_=x5_=starting_angle4;}
    up_=up2=0;
    i=j=0;
    time=millis();
    draw=true;
}}

public void button36_click1(GButton source, GEvent event) { //give a perturbation of 15N
    switch(event){
    case CLICKED:
    F = 15;
    time=millis();
    i=j=0;
    draw=true;
}}
public void button37_click1(GButton source, GEvent event) { //change to different type of IP
    switch(event){
    case CLICKED:
    mode = !mode;
    i=j=0;
    x1_=x2_=x4_=x6_=0;
    x3_=x5_=0;
    up_=up2=0;
    time=millis();
    draw = true;
    points1 = new GPointsArray();
    points2 = new GPointsArray();
    points3 = new GPointsArray();
}}

public void button38_click1(GButton source, GEvent event) { //open loop for Ex2
    switch(event){
    case CLICKED:
    if(experiment==2){k1_=k2_=k3_=k4_=0;}
}}

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  custom_slider1 = new GCustomSlider(this, 0, 512, 100, 40, "grey_blue");
  custom_slider1.setLimits(0.5, 0.1, 2.0);
  custom_slider1.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider1.setOpaque(false);
  custom_slider1.addEventHandler(this, "custom_slider1_change1");
  custom_slider2 = new GCustomSlider(this, 0, 552, 100, 40, "grey_blue");
  custom_slider2.setLimits(0.2, 0.1, 2.0);
  custom_slider2.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider2.setOpaque(false);
  custom_slider2.addEventHandler(this, "custom_slider2_change1");
  custom_slider3 = new GCustomSlider(this, 0, 592, 100, 40, "grey_blue");
  custom_slider3.setLimits(0.5, 0.1, 2.0);
  custom_slider3.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider3.setOpaque(false);
  custom_slider3.addEventHandler(this, "custom_slider3_change1");
  custom_slider4 = new GCustomSlider(this, 0, 633, 100, 40, "grey_blue");
  custom_slider4.setLimits(0.5, 0.1, 2.0);
  custom_slider4.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider4.setOpaque(false);
  custom_slider4.addEventHandler(this, "custom_slider4_change1");
  custom_slider5 = new GCustomSlider(this, 0, 674, 100, 40, "grey_blue");
  custom_slider5.setLimits(0.1, 0.1, 2.0);
  custom_slider5.setNumberFormat(G4P.DECIMAL, 2);
  custom_slider5.setOpaque(false);
  custom_slider5.addEventHandler(this, "custom_slider5_change1");
  label1 = new GLabel(this, 1, 8, 91, 24);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Starting position");
  label1.setOpaque(false);
  label2 = new GLabel(this, 6, 43, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Starting angle");
  label2.setOpaque(false);
  textfield1 = new GTextField(this, 93, 6, 160, 30, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  textfield2 = new GTextField(this, 93, 42, 160, 30, G4P.SCROLLBARS_NONE);
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  textfield3 = new GTextField(this, 184, 561, 67, 30, G4P.SCROLLBARS_NONE);
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  button1 = new GButton(this, 252, 560, 29, 25);
  button1.setText("u");
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 284, 560, 29, 25);
  button2.setText("c");
  button2.addEventHandler(this, "button2_click1");
  textfield4 = new GTextField(this, 184, 601, 67, 30, G4P.SCROLLBARS_NONE);
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  textfield5 = new GTextField(this, 184, 640, 67, 30, G4P.SCROLLBARS_NONE);
  textfield5.setOpaque(true);
  textfield5.addEventHandler(this, "textfield5_change1");
  textfield6 = new GTextField(this, 184, 680, 67, 30, G4P.SCROLLBARS_NONE);
  textfield6.setOpaque(true);
  textfield6.addEventHandler(this, "textfield6_change1");
  button3 = new GButton(this, 252, 600, 29, 25);
  button3.setText("u");
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(this, 284, 600, 29, 25);
  button4.setText("c");
  button4.addEventHandler(this, "button4_click1");
  button5 = new GButton(this, 252, 640, 29, 25);
  button5.setText("u");
  button5.addEventHandler(this, "button5_click1");
  button6 = new GButton(this, 284, 640, 29, 25);
  button6.setText("c");
  button6.addEventHandler(this, "button6_click1");
  button7 = new GButton(this, 252, 680, 29, 25);
  button7.setText("u");
  button7.addEventHandler(this, "button7_click1");
  button8 = new GButton(this, 284, 680, 29, 25);
  button8.setText("c");
  button8.addEventHandler(this, "button8_click1");
  button10 = new GButton(this, 950, 180, 41, 26);
  button10.setText("c");
  button10.addEventHandler(this, "button10_click1");
  textfield7 = new GTextField(this, 413, 560, 67, 30, G4P.SCROLLBARS_NONE);
  textfield7.setOpaque(true);
  textfield7.addEventHandler(this, "textfield7_change1");
  textfield8 = new GTextField(this, 413, 600, 67, 30, G4P.SCROLLBARS_NONE);
  textfield8.setOpaque(true);
  textfield8.addEventHandler(this, "textfield8_change1");
  textfield9 = new GTextField(this, 413, 640, 67, 30, G4P.SCROLLBARS_NONE);
  textfield9.setOpaque(true);
  textfield9.addEventHandler(this, "textfield9_change1");
  textfield10 = new GTextField(this, 413, 680, 67, 30, G4P.SCROLLBARS_NONE);
  textfield10.setOpaque(true);
  textfield10.addEventHandler(this, "textfield10_change1");
  button11 = new GButton(this, 480, 560, 29, 25);
  button11.setText("u");
  button11.addEventHandler(this, "button11_click1");
  button12 = new GButton(this, 512, 560, 29, 25);
  button12.setText("c");
  button12.addEventHandler(this, "button12_click1");
  button13 = new GButton(this, 480, 600, 29, 25);
  button13.setText("u");
  button13.addEventHandler(this, "button13_click1");
  button14 = new GButton(this, 512, 600, 29, 25);
  button14.setText("c");
  button14.addEventHandler(this, "button14_click1");
  button15 = new GButton(this, 480, 640, 29, 25);
  button15.setText("u");
  button15.addEventHandler(this, "button15_click1");
  button16 = new GButton(this, 512, 640, 29, 25);
  button16.setText("c");
  button16.addEventHandler(this, "button16_click1");
  button17 = new GButton(this, 480, 680, 29, 25);
  button17.setText("u");
  button17.addEventHandler(this, "button17_click1");
  button18 = new GButton(this, 512, 680, 29, 25);
  button18.setText("c");
  button18.addEventHandler(this, "button18_click1");
  textfield11 = new GTextField(this, 619, 596, 65, 25, G4P.SCROLLBARS_NONE);
  textfield11.setOpaque(true);
  textfield11.addEventHandler(this, "textfield11_change1");
  button9 = new GButton(this, 254, 6, 35, 30);
  button9.setText("c");
  button9.addEventHandler(this, "button9_click1");
  button19 = new GButton(this, 254, 42, 36, 30);
  button19.setText("c");
  button19.addEventHandler(this, "button19_click1");
  label4 = new GLabel(this, 187, 526, 119, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Stablizing Controller");
  label4.setOpaque(false);
  label5 = new GLabel(this, 409, 525, 126, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Swinging up Controller");
  label5.setOpaque(false);
  button20 = new GButton(this, 686, 596, 29, 25);
  button20.setText("u");
  button20.addEventHandler(this, "button20_click1");
  button21 = new GButton(this, 715, 596, 29, 25);
  button21.setText("c");
  button21.addEventHandler(this, "button21_click1");
  textfield12 = new GTextField(this, 619, 650, 65, 25, G4P.SCROLLBARS_NONE);
  textfield12.setOpaque(true);
  textfield12.addEventHandler(this, "textfield12_change1");
  button22 = new GButton(this, 686, 650, 29, 25);
  button22.setText("u");
  button22.addEventHandler(this, "button22_click1");
  button23 = new GButton(this, 715, 650, 29, 25);
  button23.setText("c");
  button23.addEventHandler(this, "button23_click1");
  button24 = new GButton(this, 8, 222, 80, 30);
  button24.setText("Reset Screen");
  button24.addEventHandler(this, "button24_click1");
  button25 = new GButton(this, 386, 10, 80, 30);
  button25.setText("Experiment 1");
  button25.addEventHandler(this, "button25_click1");
  button26 = new GButton(this, 482, 10, 80, 30);
  button26.setText("Experiment 2");
  button26.addEventHandler(this, "button26_click1");
  button27 = new GButton(this, 579, 10, 80, 30);
  button27.setText("Experiment 3");
  button27.addEventHandler(this, "button27_click1");
  button28 = new GButton(this, 620, 550, 50, 25);
  button28.setText("sin");
  button28.addEventHandler(this, "button28_click1");
  button29 = new GButton(this, 680, 550, 50, 25);
  button29.setText("square");
  button29.addEventHandler(this, "button29_click1");
  button30 = new GButton(this, 8, 450, 80, 30);
  button30.setText("Reset parameters");
  button30.addEventHandler(this, "button30_click1");
  textfield13 = new GTextField(this, 820, 660, 65, 25, G4P.SCROLLBARS_NONE);
  textfield13.setOpaque(true);
  textfield13.addEventHandler(this, "textfield13_change1");
  button31 = new GButton(this, 890, 660, 29, 25);
  button31.setText("u");
  button31.addEventHandler(this, "button31_click1");
  button32 = new GButton(this, 920, 660, 29, 25);
  button32.setText("c");
  button32.addEventHandler(this, "button32_click1");
  button33 = new GButton(this, 820, 560, 80, 25);
  button33.setText("initial plot");
  button33.addEventHandler(this, "button33_click1");
  button34 = new GButton(this, 820, 600, 80, 25);
  button34.setText("updated plot");
  button34.addEventHandler(this, "button34_click1");
  
  button35 = new GButton(this, 85, 90, 80, 30);
  button35.setText("Restart");
  button35.addEventHandler(this, "button35_click1");
  button36 = new GButton(this, 85, 130, 80, 30);
  button36.setText("Perturbation(15N)");
  button36.addEventHandler(this, "button36_click1");
  button37 = new GButton(this, 85, 170, 80, 30);
  button37.setText("Mode");
  button37.addEventHandler(this, "button37_click1");
  button38 = new GButton(this, 400, 550, 80, 30);
  button38.setText("Open loop");
  button38.addEventHandler(this, "button38_click1");
}

// Variable declarations 
// autogenerated do not edit
GCustomSlider custom_slider1; 
GCustomSlider custom_slider2; 
GCustomSlider custom_slider3; 
GCustomSlider custom_slider4; 
GCustomSlider custom_slider5; 
GLabel label1; 
GLabel label2; 
GTextField textfield1; 
GTextField textfield2; 
GTextField textfield3; 
GButton button1; 
GButton button2; 
GTextField textfield4; 
GTextField textfield5; 
GTextField textfield6; 
GButton button3; 
GButton button4; 
GButton button5; 
GButton button6; 
GButton button7; 
GButton button8; 
GButton button10; 
GTextField textfield7; 
GTextField textfield8; 
GTextField textfield9; 
GTextField textfield10; 
GButton button11; 
GButton button12; 
GButton button13; 
GButton button14; 
GButton button15; 
GButton button16; 
GButton button17; 
GButton button18; 
GTextField textfield11; 
GButton button9; 
GButton button19; 
GLabel label4; 
GLabel label5; 
GButton button20; 
GButton button21; 
GTextField textfield12; 
GButton button22; 
GButton button23; 
GButton button24; 
GButton button25; 
GButton button26; 
GButton button27; 
GButton button28;
GButton button29;
GButton button30;
GTextField textfield13; 
GButton button31;
GButton button32;
GButton button33;
GButton button34;
GButton button35;
GButton button36;
GButton button37;
GButton button38;