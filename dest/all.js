
/*
 * start.coffee
 */
var one, six, three, two;

six = (one = 1) + (two = 2) + (three = 3);

six = (one = 1) + (two = 2) + (three = 3);


/*
 * variables.coffee
 */
var list, math, number, opposite, square;

number = 42;

opposite = true;

if (opposite) {
  number = -42;
}

square = function(x) {
  return x * x;
};

list = [1, 2, 3, 4, 5];

math = {
  root: Math.sqrt,
  square: square,
  cube: function(x) {
    return x * square(x);
  }
};




