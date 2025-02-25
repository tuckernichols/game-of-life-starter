# Game of Life

Conway's "Game of Life" is a classic computer science challenge, solved by many students in many languages throughout the years. The best way to learn about it is to play it here: https://playgameoflife.com/

## Regeneration Rules
For a space that is populated (1):
- Each cell with one or no neighbors dies, as if by solitude.
- Each cell with four or more neighbors dies, as if by overpopulation.
- Each cell with two or three neighbors survives.

For a space that is unpopulated (0):
- Each cell with three neighbors becomes populated.
- Otherwise, the cell remains unpopulated.
