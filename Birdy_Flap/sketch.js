var bird;
var pipes = [];
var score;
var startLoop = false;

function setup() {
  var canvas = createCanvas(400, 400);
  canvas.position((windowWidth - width) / 2, (windowHeight - (height*0.5)) / 2);
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
    
    //deals with bird to pipe collision
    if(pipes[i].hits(bird)){
      console.log("HIT");
      textSize(62);
      fill(0);
      textAlign(CENTER);
      textStyle(BOLD);
      stroke(0);
      text("Score: " + score,200,200);
      score = 0; //resets score
      noLoop();
    } else if(bird.x > pipes[i].x && bird.x < pipes[i].x + pipes[i].w) {  
      //increments & prints score if bird passes pipe
      //& does not hit
      score += .25; //fixes issue of multi-scoring
      if(score % 1 == 0) {
        console.log("Score: " + score);
      }
    }
    
    //deletes used pipes
    if(pipes[i].offscreen()) {
      pipes.splice(i,1); 
    }
  }
  
  bird.show();
  bird.update();
  
  if(frameCount % 60 == 0) {
    pipes.push(new Pipe());
  }
  
}

function keyPressed(){
  if(key == " " && startLoop == false){
    startLoop = true;
    loop();
  } else if(key == " "){
    bird.jump(); 
  }
}