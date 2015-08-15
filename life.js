var grid = [];

var gridIinit = function (grid_size){
  grid_squares = []
  for (i in grid_size[0]) {
    for (j in grid_size[1]) {
      grid_squares.push('X')//[i] = [i, j]
    }
  }
  return grid_squares.push(grid);
}

console.log(gridIinit([1, 1]))
