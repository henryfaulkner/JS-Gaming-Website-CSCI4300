window.onload = function()
{
    var cell1 = document.getElementById("cell1");
    var cell2 = document.getElementById("cell2");
    var cell3 = document.getElementById("cell3");

    cell1.addEventListener("click", this.goToSnake);
    cell2.addEventListener("click", this.goToHighScores);
    cell3.addEventListener("click", this.goToAccount);
}

function goToSnake()
{
    window.location.href = "Snake_Game/snake_page.html";
}

function goToHighScores()
{
    window.location.href = "high_scores.html";
}

function goToAccount()
{
    window.location.href = "account_page.html";
}
