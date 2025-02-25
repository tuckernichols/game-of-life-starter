# Game of Life

Conway's "Game of Life" is a classic computer science challenge, solved by many students in many languages throughout the years. The best way to learn about it is to play it here: https://playgameoflife.com/

You will use a 2D `int[][]` to represent "cells". Unlike the true game, your version will not be on an infinite plane. You will use a finite Processing canvas to visualize the game.

You are given starter code. You may adjust the canvas and the cell spacing. The `DENSITY` constant should be used to initialize the game grid with roughly that percentage of "living" cells. I.e., if it's set to 0.1 that means that roughly 10% of the cells will be alive at the start. You will randomly populate the cells.

Note that rows are designated by `y` and columns by `x`. If you want to rename these variables you can, but be consistent!

## Regeneration Rules
For a space that is populated (1):
- Each cell with one or no neighbors dies, as if by solitude.
- Each cell with four or more neighbors dies, as if by overpopulation.
- Each cell with two or three neighbors survives.

For a space that is unpopulated (0):
- Each cell with three neighbors becomes populated.
- Otherwise, the cell remains unpopulated.
