/**
  Bird Constructor
*/
function Bird() {
  this.x = 64;
  this.y = height/2;
  this.gravity = .7;
  this.lift = -10;
  this.velocity = 0;
  
  this.show = function() {
    fill(255);
    ellipse(this.x, this.y, 32, 32);
  }
  
  this.update = function() {
    this.velocity += this.gravity;
    this.velocity *= 0.9; //adds resistance
    this.y += this.velocity;
    //keeps bird from falling from screen
    if(this.y > height) {
      this.y = height;
      this.velocity = 0;
    }
    //keeps bird from raising above screen
    if(this.y < 0) {
      this.y = 0;
      this.velocity = 0;
    }
  }
  
  /**
    lifts the bird up
  */
  this.jump = function() {
    this.velocity += this.lift;
  }
}