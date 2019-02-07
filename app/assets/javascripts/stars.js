// window.onload = function(){
// function starDimension() {
//   return Math.floor((Math.random() * 8) + 3)
// }
//
// function randomWidth() {
//   return Math.floor(Math.random() * document.body.offsetWidth)
// }
//
// function randomHeight() {
//   return Math.floor(Math.random() * document.body.offsetHeight)
// }
//
// function randomTiming() {
//   return Math.floor((Math.random() * 3) + 1)
// }
//
// for (let i = 0; i < 100; i++) {
//   let heightWidth = starDimension();
//   let randomTop = randomHeight();
//   console.log(randomTop)
//   let randomLeft = randomWidth();
//   let randomTime = randomTiming();
//   let attributeStyle = `height: ${heightWidth}px; width: ${heightWidth}px; position: absolute; top: ${randomTop}px; left: ${randomLeft}px; border-radius: 50%; animation: twinkle ${randomTime}s infinite; animation-direction: alternate; box-shadow: 0px 0px 1px 4px rgba(216, 242, 133, .2);`
//   let star = document.createElement("div");
//   star.setAttribute("style", attributeStyle);
//   document.body.appendChild(star);
// }

// let header = document.getElementsByClassName("header")[0]
//
// var d = new Date();
// function getTime () {
//   if(d.getHours() > 12) {
//     return `${d.getHours() -12}:${d.getMinutes()}pm`;
//   } else if(d.getHours() == 0){
//      return `12:${d.getMinutes()}am`;
//   } else {
//     return `${d.getHours() -12}:${d.getMinutes()}am`
//     }
//   }
//
//
// let currentTime = getTime();
//
// header.innerHTML = `Hello, it is ${currentTime}`
// }
