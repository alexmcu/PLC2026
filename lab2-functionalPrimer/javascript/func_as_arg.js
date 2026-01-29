function arrFunc(a, b) {
  let arr = [];
  for (let i = a; i <= b; i++) {
    arr.push(i);
  }
  return arr;
}

function applicatorFunc(inpFunc, s, a, b) {
  const arr = inpFunc(a, b);
  const sum = arr.reduce((acc, val) => acc + val, 0);

  if (s === 's') {
    return sum;
  } else {
    return sum / (b - a + 1);
  }
}

console.log(applicatorFunc(arrFunc, 's', 1, 10));
