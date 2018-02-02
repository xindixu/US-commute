class Textbox{
  PVector pos;
  String text;
  int w,h;
  int[] info;
  int place;
  
  Textbox(PVector pos, String text){
    this.pos = pos.copy();
    this.text = text;
    this.w = 50;
    this.h = 25;
    info = new int[]{-1,-1,-1,-1,-1};
    place = 0;
  }
  
  void display(){
    stroke(255);
    strokeWeight(3);
    fill(255);
    rect(pos.x,pos.y,80,30);
    textSize(15);
    fill(255);
    text(text,pos.x,pos.y-15);
    fill(0);
      for(int i = 0; i < place; i++){
        text(info[i],pos.x+10*i,pos.y+20);
      }
      
    if(place == 5){
      act();
    }
  }
  
  void read(int i){
    if(newInput){
      if(place == -1 || place == 5){
        place = 0;
      }
      if(i >= 0){
        info[place] = i;
        place ++;
      }
      if(i == -10){
        place --;
      }
    }
  }
  
  void act(){
   String zip = "";
   for(int i : info){
     zip += i;
   }
   meansToWork.lookup(zip);
  }
  
}