var grid = [];

var gridIinit = function (grid_size){
  for (i in grid_size[0]) {
    for (j in grid_size[1]) {
      grid.push([i, j])
    }
  }
}

gridIinit()
