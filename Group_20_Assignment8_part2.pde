
//The dataset is quite large, it's slow!!!
Table zip;
HashMap<String,float[]> zipCodeLookUp;

Info meansToWork;
int a = 0;
int b = -1;
int c =-2;
Textbox tb;
boolean newInput = false;


void setup(){
  //size(1700,1000);
  size(1700,1000);
  
  zip = loadTable("zip_code_database.csv","header");  
  zipCodeLookUp = new HashMap<String,float[]>();
  

  for(TableRow row:zip.rows()){
    String zipCode = str(row.getInt("zip"));
    // y pos (50 ~ 25) top~bottom
    float latitude = row.getFloat("latitude");
    // x pos (-177 ~ -68) left-right
    float longitude = row.getFloat("longitude");
    float[] loc = {latitude,longitude};
    zipCodeLookUp.put(zipCode,loc);
  }
  
  meansToWork = new Info("means to work");
  
  tb = new Textbox(new PVector(20,600),"Enter 5-digit zipcode");
  
}

void draw(){
  background(200);
  meansToWork.display(a);
  display();
  tb.display();
  tb.read(b);
  newInput = false;
}

void display(){
  color from = color(255,0,0);
  color to = color(0,0,255);
  for(float i = 0; i < 1; i += 0.01){
    color inter = lerpColor(from,to,i);
    noStroke();
    fill(inter);      
    ellipse(20+i*150,700,50*i,50*i);
  }

  fill(255);
  textSize(18);
  text("2011-2015 American Community Survey 5-Year Estimates",900,150);
  text("48 states covered",20,560);
  String[] keys = new String[]{"Press the following keys to alter display:","D - dirve alone",
                                "C - carpooled","P - public transportation"};
  for(int i = 0; i < 4; i++){
    text(keys[i],50,800+25*i);
  }
  
  textSize(10);
  text("Source: U.S. Census Bureau, 2011-2015 American Community Survey 5-Year Estimates \nhttps://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_15_5YR_S0801&prodType=table",900,180);
 
}


void keyPressed(){
  switch(key){
    case 'd': a = 0; break;
    case 'c': a = 1; break;
    case 'p': a = 2; break;
    case '0': b = 0; newInput = true; break;
    case '1': b = 1; newInput = true; break;
    case '2': b = 2; newInput = true; break;
    case '3': b = 3; newInput = true; break;
    case '4': b = 4; newInput = true; break;
    case '5': b = 5; newInput = true; break;
    case '6': b = 6; newInput = true; break;
    case '7': b = 7; newInput = true; break;
    case '8': b = 8; newInput = true; break;
    case '9': b = 9; newInput = true; break;
    case BACKSPACE: b = -10; newInput = true; print("JJJJJJJ"); break; 
  }
}