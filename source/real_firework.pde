
float gravity=0.00;
float drag=0.01;
float life=60;
int total=0;

void mousePressed()
{
  fires[i]=new fire(-1,i,mouseX,mouseY,12,0,-8,random(150,255),random(150,255),random(150,255),0);
  i++;
}


fire[] fires=new fire[1000000];
class fire
{
  
  float x,y,r,dx,dy,clr1,clr2,clr3;
  float fire_life=life;
  int exploded,par,me;
  fire(int PAR,int ME,float X,float Y,float R, float DX,float DY,float CLR1,float CLR2,float CLR3,int EXP)
  {
    x=X;y=Y;r=R;dx=DX;dy=DY;clr1=CLR1;clr2=CLR2;clr3=CLR3;par=PAR;me=ME;exploded=EXP;
  }
  
  void move()
  {
    dy+=gravity-drag*dy;
    if(dx>0)
    {
      dx-=drag*dx;
    }
    else
    {
      dx+=drag*-dx;
    }
    x+=dx;
    y+=dy;
    if(fire_life>0)
    {
      fire_life--;
    }
      
  }
  
  void display()
  {
    fill(clr1,clr2,clr3,255*fire_life/life);
    stroke(clr1+0.7*(255-clr1)*fire_life/life,clr2+0.7*(255-clr1)*fire_life/life,clr3+0.7*(255-clr1)*fire_life/life,200*fire_life/life);
    strokeWeight(6);
    line(x,y,x+4*dx,y+4*dy);
    
  } 
  
  void firework()//make new fire 
  {
   
   {
      
        int j,num_fire=20;
        for(j=1;j<=num_fire;j++)
        {
          fires[i+j-1]=new fire(me,i+j-1,x,y,r-2,3*cos((float)j/(num_fire/2)*PI)+random(-1.5,1.5),3*sin((float)j/(num_fire/2)*PI)+random(-1.5,1.5),clr1,clr2,clr3,exploded+1);
        }
        i+=num_fire;
        
        
        fill(clr1,clr2,clr3,200);
        stroke(clr1,clr2,clr3,100);
        ellipse(x,y,130,130);
        
        clr1=0;clr2=0;clr3=0;
        
   }
  }
  
  
  
  
  
}
int i;

/*

*/
int count=0;
int y=500;
void setup()  
{
  fullScreen();
  background(0);
  frameRate(60);
  fires[0]=new fire(-1,0,1000,700,12,0,-8,0,200,200,0);
  fires[1]=new fire(-1,0,700,700,12,0,-8,0,200,200,0);
  fires[2]=new fire(-1,0,1300,700,12,0,-8,0,200,200,0);
  i=3;
}

void draw()
{
  background(0);
  fill(255);
  textSize(30);
  text(total,100,200);
  int j,k;
  for(j=0;j<i;j++)
  {
   if(fires[j].fire_life>0)
   {
      fires[j].move();
      fires[j].display();
      if(fires[j].exploded==0&&fires[j].fire_life==0)
      {
        fires[j].firework();
      }
    }
    if(fires[j].fire_life>0)
    {
      for(k=j+1;k<i;k++)
      {
        if((abs(fires[j].x-fires[k].x)<=3)&&(abs(fires[j].y-fires[k].y)<=3)&&(fires[j].par!=fires[k].par)&&fires[j].exploded<=2&&fires[k].exploded<=2)
        {
          fires[j].fire_life=0;
          fires[k].fire_life=0;
          fires[j].firework();
          total++;
          break;
        }
      }
    }
  }
}
