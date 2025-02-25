final int SPACING = 20;       // each cell's area //<>//
final float DENSITY = 0.2;    // how likely each cell is to be alive at the start
int[][] grid;

void setup() {
  size(1000, 800);            // make sure it's a multiple of SPACING
  frameRate(7);             
  grid = new int[height / SPACING + 2][width / SPACING + 2];  // grid with padding for borders
  populateGrid();             // init grid 
}

void draw() {
  showGrid();                 
  if (!(keyPressed && key == ' ')) {  // pause while ** holding ** spacebar
    grid = calcNextGrid();   
  }
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
  for (int row = 1; row < grid.length - 1; row++) {
    for (int col = 1; col < grid[row].length - 1; col++) {
      int neighbors = countNeighbors(row, col);
      
      if (grid[row][col] > 0) {  // cell is alive
        if (aliveOutcome(neighbors) == 1) {
          nextGrid[row][col] = grid[row][col] + 1;  // age the cell
        } else {
          nextGrid[row][col] = 0;  // cell dies
        }
      } else {  // else: cell is not alive
        nextGrid[row][col] = deadOutcome(neighbors);  // new cell?
      }
    }
  }
  return nextGrid;
}

int countNeighbors(int y, int x) {          // I know Style guide says to use {}
  int n = 0;                                // however this is 10x more readable 
  if (grid[y - 1][x - 1] > 0) n++;  
  if (grid[y][x - 1] > 0) n++;      // Left
  if (grid[y + 1][x - 1] > 0) n++;  
  if (grid[y + 1][x] > 0) n++;      // Bottom
  if (grid[y - 1][x] > 0) n++;      // Top
  if (grid[y - 1][x + 1] > 0) n++;  
  if (grid[y][x + 1] > 0) n++;      // Right
  if (grid[y + 1][x + 1] > 0) n++;  
  return n;
}

int aliveOutcome(int n) {
  if (n == 2 || n == 3) {
    return 1;
  } else {
    return 0;
  }
}

int deadOutcome(int n) {
  if (n == 3) {
    return 1;
  }
  return 0;
}

void populateGrid() {
  for (int row = 0; row < grid.length; row++) {
    for (int col = 0; col < grid[row].length; col++) {
      if (Math.random() <= DENSITY) {
        grid[row][col] = 1;  // randomly populate the grid with alive cells
      }
    }
  }
}

int greenShade(int input) {
  double y = -125 * log10(input + 5) + 343;
  return (y > 100) ? (int) y : 100;
}

float log10(int x) {
  return log(x) / log(10); 
}

void showGrid() {
  for (int row = 0; row < grid.length; row++) {
    for (int col = 0; col < grid[row].length; col++) {
      if (grid[row][col] > 0) {
        fill(3, greenShade(grid[row][col]), 111);  // color for alive cells
      } else {
        fill(255, 255, 255);  // white for dead cells
      }
      square(col * SPACING - SPACING, row * SPACING - SPACING, SPACING);
    }
  }
}
