/**
  Pipe Constructor
*/
function Pipe() {
  this.top = random(height-80); 
  this.gap = 80; //gap btw top & bottom pipe
  this.x = width; //starting point
  this.w = 20; //pipe width
  this.speed = 4; //pipe speed
  this.highlight = false; //
  
  this.show = function() {
    fill('#0D9428');
    if(this.highlight) {
       fill(255, 0, 0);
    }
    rect(this.x, 0, this.w, this.top);
    rect(this.x, this.top + this.gap, this.w, 500);
  }
  
  this.update = function() {
    this.x -= this.speed; 
  }
  
  this.offscreen = function() {
     return this.x < -this.w;  
  }
  
  this.hits = function(bird) {
    //within y-gap
    if(bird.y < this.top || bird.y > this.top + this.gap){
      //within x-position
      if(bird.x > this.x && bird.x < this.x + this.w){
        this.highlight = true;
        return true; 
      } 
    } 
    return false;
  }
}