/**
 * Snake constructor
 */
function Snake() {
  this.x = 0;
  this.y = 0;
  this.xspeed = 0;
  this.yspeed = 0;
  this.total = 1;
  this.tail = [];

  	this.dir = function(x, y) {
    	this.xspeed = x;
    	this.yspeed = y;
  	}

    this.eat = function(pos) {
      var d = dist(this.x, this.y, pos.x, pos.y);
      if (d < 1) {
        this.total++;
        return true;
      } else {
        return false;
      }
    } // eat

    this.death = function() {
      for(var i = 0; i < this.tail.length; i++) {
       	var pos = this.tail[i];
        var d = dist(this.x, this.y, pos.x, pos.y);
        if(d < 1 && i != 0) {
          print("final score = " + this.total);
          this.tail = [];
          return true;
        }
      }
      return false;
    }
    
    this.update = function() {
      for(var i = 0; i < this.tail.length-1; i++) {
        this.tail[i] = this.tail[i+1];
      }
      this.tail[this.total-1] = createVector(this.x,this.y);
      
      this.x = this.x + this.xspeed * scl;
      this.y = this.y + this.yspeed * scl;

      this.x = constrain(this.x, 0, width - scl);
      this.y = constrain(this.y, 0, height - scl);
    }

    this.show = function() {
      fill(255);
      for(var i = 0; i < this.tail.length; i++) {
      	rect(this.tail[i].x, this.tail[i].y, scl, scl);
      }
    }

  } // Constructor