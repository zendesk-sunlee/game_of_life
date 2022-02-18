# README
Try the deployed app.
https://ruby-of-life.herokuapp.com/games/glider/generations/1

# Database

games
name
cell []

cells

## Approaches
- Games and cells tables, one to many
  game
    - id
    - name
    - owner_email


  cell
    - games_id
    - x
    - y

  - Prefer to avoid joins + multiple tables



- Cells as JSON in game
  - Games
  - id
  - name
  - cells
    {game: {"x": x, y: x},..}
    [{"x": x, y: x}, ...]
    [[2,2], [3,3],...]

  - Values are less accessable as a string
  - Extra code for parsing
     - Extra code for validation
     - Coordination problem
  - Extra time to parse
  - JSON in a db feels yucky
  - You could be storing anything in the JSON
    - Error prone
  - Wrong for a relational DB

- One table
  - Cells
    - id
    - Game name
    - email
    - x
    - y

    - Validates uniqueness

    1,blinker,2,2
    2,blinker,2,2



Cells.find_by_game_name("glider") =>
 [Cell.new(game_name: "Glider", x: 3, y: 3),
 ...]