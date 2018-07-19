window.setTimeout(() => {
  alert('HAMMERTIME');
},5000);

function hammerTime(time) {
  window.setTimeout(() => {
    alert(`${time} is hammertime`);
  });
}



function wantTeaAndBiscuits() {
  let first,second;
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
reader.question('want tea?', (firstAns) => {
  first=firstAns;
  console.log(`${firstAns} tea`);
  reader.question('want biscuits?', (secondAns) => {
    second=secondAns;
    console.log(`${secondAns} biscuits`);
    console.log(`So you ${firstAns} want tea and you ${secondAns} want coffe`);
    reader.close();
  });

});
}


function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();
Noodles.chase(Markov);
Noodles.chase.call(Markov,Noodles);