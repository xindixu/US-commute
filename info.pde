class Info{
  Table table;
  String fileName;
  StringDict keyAndMeaning;
  int[] maxs;
  String[] title;
  String[] key;
  TableRow result;
  int c = 0;
  
  Info(String fileName){
    table = loadTable(fileName+".csv","header");
    
    keyAndMeaning = new StringDict();
    keyAndMeaning.set("HC02_EST_VC01","DRIVE ALONE");
    keyAndMeaning.set("HC03_EST_VC01","CARPOOLED");
    keyAndMeaning.set("HC04_EST_VC01","PUBLIC TRANSPORATION - TAXI EXCLUDED");
    
    key = keyAndMeaning.keyArray();
    title = keyAndMeaning.valueArray();
    
    maxs = new int[]{43807,9198,35748};
  }
  

  
  void display(int i){   
    c = i;
    textSize(32);
    color(255);
    fill(255);
    text("COMMUNTING CHARACTERISTIC - "+title[i],350,100);
    textSize(13);
    text(0+"                           "+maxs[i],20,750);
    
    color from = color(255,0,0);
    color to = color(0,0,255);
    for(TableRow row : table.rows()){
      String zip = row.getString("GEO.id2");
      float[] loc = zipCodeLookUp.get(zip);
      float info = row.getInt(key[i]);
      if(loc != null && info != 0){
        float co = map(info,0,maxs[i],0.1,1);
        color inter = lerpColor(from,to,co);
        noStroke();
        fill(inter);      
        ellipse((130+loc[1])*25,(60-loc[0])*25,20*co,20*co);
      }
    }
    
  }
  
  // 5 digit zipcode
  void lookup(String zipcode){
    int i = 0;
    String keyStr = "";
    while(zipcode.substring(i,i+1).equals("0")){
      i++;
    }
    keyStr = zipcode.substring(i);
 
    result = table.findRow(keyStr,"GEO.id2");
    if(result != null){
      int val = result.getInt(key[c]);
      float[] loc = zipCodeLookUp.get(keyStr);
      noStroke();
      fill(255);
      for(float j = 0; j < 1; j += 0.01){    
        ellipse((130+loc[1])*25,(60-loc[0])*25-j*50,50*j,50*j);
      }    
      
      //ellipse((130+loc[1])*25,(60-loc[0])*25,30,30);
      //stroke(0,0,255);
      //ellipse((130+loc[1])*25,(60-loc[0])*25,20,20);
      fill(0);
      text(val,(130+loc[1])*25-20,(60-loc[0])*25-45);
    }
    else{
      fill(0);
      text("Invalid!",20,670);
    }
  }
}