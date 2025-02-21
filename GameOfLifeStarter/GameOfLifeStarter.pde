final int SPACING = 20; // each cell's area //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; 

void setup() {
  size(800, 600); // make sure it's a multiple of SPACING
  //noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING + 2][width / SPACING + 2];        // 40,30 add to for border outside of veiw
  populateGrid();
}

void draw() {
  showGrid();
  grid = calcNextGrid();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
  int neighbors;
  for (int row = 1; row < grid.length - 1; row++) {
    for (int col = 1; col < grid[row].length - 1; col++) {
      neighbors = countNeighbors(row, col);

      if (grid[row][col] == 1) {
        nextGrid[row][col] = aliveOutcome(neighbors);
      } else {
        nextGrid[row][col] = deadOutcome(neighbors);
      }
    }
  }

  return nextGrid;
  //return grid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  n += grid[y - 1][x-1];
  n += grid[y][x-1];
  n += grid[y + 1][x-1];      // left side
  n += grid[y + 1][x];
  n += grid[y - 1][x];     // in line
  n += grid[y - 1][x +1];
  n += grid[y][x +1];
  n += grid[y + 1][x + 1];    // right side
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
      if (Math.random() <= DENSITY ) {        // 10% chance
        grid[row][col] = 1;
      }
    }
  }
}

void showGrid() {
  for (int row = 0; row < grid.length; row++) {
    for (int col = 0; col < grid[row].length; col++) {
      if (grid[row][col] == 1) {    // 1 == black
        fill(0, 0, 0);
      } else {
        fill(255, 255, 255);
      }
      square(col * SPACING - SPACING, row * SPACING - SPACING, SPACING);
    }
  }
}
