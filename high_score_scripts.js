window.onload = function()
{
    var highScoreTable = document.getElementById("scoreTable");
    highScoreTable.style.visibility = "hidden";

    var snakeButton = document.getElementById("snakeButton");
    var flappyBirdButton = document.getElementById("flappyBirdButton");
    snakeButton.addEventListener("click", this.showSnakeTable);
    flappyBirdButton.addEventListener("click", this.showFlappyBirdTable);
}

//populate table with snake high scores
function showSnakeTable()
{
    //make table visible
    var highScoreTable = document.getElementById("scoreTable");
    highScoreTable.style.visibility = "visible";

    //set title 
    var tableName = document.getElementById("scoreTableName");
    tableName.innerHTML = "Snake High Scores";

    //will eventually get the scores / usernames from the database
    var snakeScorers = ["EL1T3_GAM3R", "Bob", "Anna", "Jacob", "BAD_GAMER"];
    var snakeScores = [420000, 115000, 114000, 113000, 1];

    //adding usernames/scores to the table     
    var usernames = document.getElementsByClassName("usernames");
    var scores = document.getElementsByClassName("scores");
    for(var i = 0; i < usernames.length; i++)
    {
        usernames[i].innerHTML = snakeScorers[i];
        scores[i].innerHTML = snakeScores[i];
    }

    /** 
    attempting to dynamically generate table cells
    work in progress
    for(var i = 0; i < snakeScorers.length; i++)
    {
        var newRow = document.createElement('tr');
        var position = document.createElement('td');
        var user = document.createElement('td');
        var score = document.createElement('td');

        position.innerHTML = i;
        user.innerHTML = snakeScorers[i];
        score.innerHTML = snakeScores[i];

        position.style.padding = "20px";
        position.style.textAlign = "center";

        user.style.padding = "20px";
        user.style.textAlign = "center";

        score.style.padding = "20px";
        score.style.textAlign = "center";
        //position.style.borderBottom = "1px dashed black";
        

         
        padding: 20px;
    text-align: center;
    border-bottom: 1px dashed black;
    border-right: 1px dashed black;

        newRow.append(position);
        newRow.append(user);
        newRow.append(score);

        highScoreTable.appendChild(newRow);
    }*/
}

//populate table with flappy bird high scores
function showFlappyBirdTable()
{
    var highScoreTable = document.getElementById("scoreTable");
    highScoreTable.style.visibility = "visible";

    var tableName = document.getElementById("scoreTableName");
    tableName.innerHTML = "Flappy Bird High Scores";

    //will eventually get the scores / usernames from the database
    //and dynamically generate table cells
    var birdScorers = ["EL1T3_GAM3R", "Anna", "Bob"];
    var birdScores = [42, 15, 14];
    var usernames = document.getElementsByClassName("usernames");
    var scores = document.getElementsByClassName("scores");
    for(var i = 0; i < usernames.length; i++)
    {
        usernames[i].innerHTML = birdScorers[i];
        scores[i].innerHTML = birdScores[i];
    }
}