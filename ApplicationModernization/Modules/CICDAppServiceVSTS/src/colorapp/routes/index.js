var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Colors of the cluster', colorMicroservice: process.env.COLORMICROSERVICE });
});

module.exports = router;
