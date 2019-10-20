var bird;
var pipes = [];
var score;
var startLoop = false;
var spaceStart = false; 

function setup() {
  var canvas = createCanvas(400, 400);
  canvas.position((windowWidth - width) / 2, ((windowHeight - (height*0.5)) / 2)+30);
  bird = new Bird();
  pipes.push(new Pipe());
  score = 0;
}

function draw() {
  //waits for user to press before starting game
  if(startLoop == false) {
    noLoop();
  }
  background('#A3F7FA');
  for(var i=pipes.length-1; i >= 0; i--){
    pipes[i].show();
    pipes[i].update();
    
    bird.show();
    
    //deals with bird to pipe collision
    if(pipes[i].hits(bird)){
      console.log("HIT");
      textSize(62);
      fill(0);
      textAlign(CENTER);
      textStyle(BOLD);
      stroke(0);
      text("Score: " + floor(score),200,200);
      textSize(35);
      text("Press 'r' to start over.", 200, 250);
      score = 0; //resets score
      
      noLoop();
      //trying to restart game 
      startLoop = false; //continues looping on space
      pipes = []; //resets num pipes to 0
      bird.x = 64;
      bird.y = height/2;
    } else if(bird.x > pipes[i].x && bird.x < pipes[i].x + pipes[i].w) {  
      //increments & prints score if bird passes pipe
      //& does not hit
      score += 0.25; //fixes issue of multi-scoring
      if(score % 1 == 0) {
        console.log("Score: " + score);
      }
    }
    
    //deletes used pipes
    if(pipes[i].offscreen()) {
      pipes.splice(i,1); 
    }
  }
  
  bird.update();
  
  if(frameCount % 60 == 0) {
    pipes.push(new Pipe());
  }
}

function keyPressed(){
  if(key == " " && startLoop == false && spaceStart == false){
    startLoop = true;
    spaceStart = true;
    loop();
  } else if (key == 'r' && startLoop == false) {
    startLoop = true;
    loop();
  } else if(key == " "){
    bird.jump(); 
  }
}