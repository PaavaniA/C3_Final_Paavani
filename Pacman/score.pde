class score
{
 //variable members
 int score;
 
 
 score()//default constuctor
 {
   score = 0;
 }
 
 void Draw()
 {
   stroke(255, 248, 10);
   textSize(20);
   text("SCORE:", 50, height-32); 
   
   noStroke();
   textSize(20);
   fill(255, 248, 10);
   text(score, 125, height-32);
 }
}
