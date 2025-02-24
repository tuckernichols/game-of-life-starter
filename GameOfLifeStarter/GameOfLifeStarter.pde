final int SPACING = 20; // each cell's area //<>//
final float DENSITY = 0.2; // how likely each cell is to be alive at the start
int[][] grid;

void setup() {
  size(800, 600); // make sure it's a multiple of SPACING
  frameRate(7); // controls speed of regeneration
  grid = new int[height / SPACING + 2][width / SPACING + 2];        // 40,30 add to for border outside of veiw
  populateGrid();
}

void draw() {
  showGrid();
  if (!(keyPressed && key == ' ')) {    // pause while holding spacebar (this is by design)
    grid = calcNextGrid();
  }
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
  int neighbors;
  for (int row = 1; row < grid.length - 1; row++) {
    for (int col = 1; col < grid[row].length - 1; col++) {
      neighbors = countNeighbors(row, col);

      if (grid[row][col] > 0) {
        if (aliveOutcome(neighbors) == 1) {
          nextGrid[row][col] += grid[row][col] + 1;
        } else {
          nextGrid[row][col] = 0;
        }
      } else {
        nextGrid[row][col] = deadOutcome(neighbors);
      }
    }
  }

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0;
  if (grid[y - 1][x - 1] > 0) n += 1;
  if (grid[y][x - 1] > 0) n += 1;      // Left
  if (grid[y + 1][x - 1] > 0) n += 1;
  if (grid[y + 1][x] > 0) n += 1;      // Bottom-middle
  if (grid[y - 1][x] > 0) n += 1;      // Top-middle
  if (grid[y - 1][x + 1] > 0) n += 1;
  if (grid[y][x + 1] > 0) n += 1;      // Right
  if (grid[y + 1][x + 1] > 0) n += 1;
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

int greenShade(int input) {
  double y = -125 * log10(input + 5) + 343;
  if ( y > 100) {
    return (int) y;
  }
  return 100;
}

float log10 (int x) {
  return (log(x) / log(10));
}

void showGrid() {
  int g;
  for (int row = 0; row < grid.length; row++) {
    for (int col = 0; col < grid[row].length; col++) {
      if (grid[row][col] > 0) {    // 1 > alive
        g = greenShade(grid[row][col]);
        println("x: " + grid[row][col] + "  y: " + g);
        fill(3, g, 111);
      } else {
        fill(255, 255, 255);
      }
      square(col * SPACING - SPACING, row * SPACING - SPACING, SPACING);
    }
  }
}
