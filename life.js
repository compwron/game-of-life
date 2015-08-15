var makeBoardTest = function() {
  actual = makeBoard([[false, true],[false, false]])
  expected = "01\n00\n"
  console.log(actual === expected)
  console.log(actual)
  console.log(expected)

  var board = [[false, true],[false, false]]
  var next_board = liveGeneration(board)

  var hopeful_board = [[false, false],[false, false]]
  console.log(next_board == hopeful_board)
  console.log(next_board)
  console.log(hopeful_board)
}

var liveGeneration = function(array_of_arrays) {
  for (i=0; i <array_of_arrays.length; i++) {
    for (j =0; j<array_of_arrays[i].length; j++) {
      if (array_of_arrays[i] === true) {
        return "yay!"
      }
    }
  }
}

var makeBoard = function(seed) {
  return printify(seed)
}

var printify = function(array_of_arrays) {
  pretty = ""
  for (i =0; i<array_of_arrays.length; i++) {
    // console.log(array_of_arrays[i])
    for (j =0; j<array_of_arrays[i].length; j++) {
      // console.log(array_of_arrays[i][j])
      var symbol = '0'
      if (array_of_arrays[i][j] === true) {
        symbol = '1'
      }

      pretty += symbol
    }
    pretty += "\n"
  }
  return pretty
}


makeBoardTest()

