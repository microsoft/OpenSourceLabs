var express = require('express');
var os = require('os');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  var computerName = os.hostname();

  //var randomColor = getRandomGrayScaleColor(); // <-- comment this 
  var randomColor = getRandomColor(); // <-- uncomment this

  var json = JSON.stringify({ 
    computerName: computerName, 
    color: randomColor
  });
  res.writeHead(200, {"Content-Type": "application/json"});
  res.end(json);
});

function getRandomColor() {
  var randomColor = "#000000".replace(/0/g,function(){return (~~(Math.random()*16)).toString(16);});  
  return randomColor;  
}

function getRandomGrayScaleColor() {
  var value = Math.random() * 0xFF | 0;
  var grayscale = (value << 16) | (value << 8) | value;
  var randomColor = '#' + grayscale.toString(16);
  return randomColor;
}

module.exports = router;
