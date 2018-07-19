function madLib(verb,adj,noun) {
    let result = "We shall "+ verb.toUpperCase() + " the " + adj.toUpperCase() + " "+noun.toUpperCase();
    return result;
}

function isSubstring(str,target) {
  let split= str.split(' ')
  for(let i = 0 ; i < split.length;i++) {
    if (split[i]==target) {
      return true;
    }
  }
  return false;
}

function fizzbuzz(arr) {
  result = [];

  for(let i = 0 ; i < arr.length; i++) {
    if (arr[i]%3==0 && arr[i]%5!=0) {
      result.push(arr[i]);
    }
    if (arr[i]%5==0 && arr[i]%3!=0) {
      result.push(arr[i]);
    }
  }
  return result;
}

function isPrime(num) {
  if (num<=1) {
    return false;
  }
  if (num==2) {
    return true;
  }
  for(let i = 2; i < num-1; i++) {
    if(num%i==0) {
      return false;
    }
  }
  return true;
}

function sumOfPrimes(num) {
  let sum = 0 ;
  let counter= 0 ;
  let i = 0 ;
  while(counter < num) {
    if (isPrime(i)) {
      sum = sum + i;
      counter++;
    }
    i++;
  }
  return sum;
}
//Mx. Mary Jingleheimer Schmidt
function titleize(title, func) {
  result = title.map( x => "Mx. " + x.charAt(0).toUpperCase() + x.slice(1) + " Jingleheimer Schmidt" );
  return result;

}

function callBack(arr) {
    arr.forEach(function(el) {
      console.log(el);
    });
}

function Elephant(name,height,arrOfTricks) {
  this.name=name;
  this.height=height;
  this.arrOfTricks=arrOfTricks;
}

Elephant.prototype.trumpet = function() {
  console.log(this.name +  "the elephant goes phrRRRRRRRRRRR!!!!!!!");
};

Elephant.prototype.grow = function() {
  return this.height+=12;
};

Elephant.prototype.addTrick = function(trick) {
   this.arrOfTricks.push(trick);
   return this.arrOfTricks;
};

Elephant.prototype.play = function() {
  return this.arrOfTricks[Math.random()*this.arrOfTricks.length];
};

Elephant.paradeHelper= function(a) {
  console.log(a+ " is trotting by")
}

function dinerBreakFast() {
  let order = 'scrambled eggs and bacon';
  console.log(order);

  return function addToOrder(food) {
    console.log(order + ' '+ food);
    return order + ' ' + food;

  }

}


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

let bfastOrder = dinerBreakFast();
bfastOrder("chocolate chip pancakes");
