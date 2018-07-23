document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let ctx = canvas.getContext('2d');
  ctx.fillStyle = "red";
  ctx.fillRect(0,0,100,100);
  ctx.beginPath();
  ctx.arc(200,200,100,0, 2*Math.PI);
  ctx.fillStyle="black";
  ctx.fill();
  ctx.beginPath();
    ctx.moveTo(75, 50);
    ctx.lineTo(100, 75);
    ctx.lineTo(100, 25);
    ctx.fill();
});
