final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  //noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];        // 40,30
  populateGrid();
  // populate initial grid
  // your code here

}

void draw() {
  showGrid();
  grid = calcNextGrid();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  // your code here

  //return nextGrid;
  return grid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  
  // your code here
  // don't check out-of-bounds cells

  return n;
}

void populateGrid(){
  for(int row = 0; row < grid.length; row++){
     for(int col = 0; col < grid[row].length; col++){
        if(Math.random() >= 0.9){        // 10% chance
          grid[row][col] = 1;
        }
     }
  } 
}

void showGrid() {
  for(int row = 0; row < grid.length; row++){
     for(int col = 0; col < grid[row].length; col++){
       if(grid[row][col] == 1){
         fill(0,0,0);
       } else {
         fill(255,255,255);
       }
        square(col * SPACING, row * SPACING, SPACING);
     }
  }
  // use square() to represent each cell
  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)
}
