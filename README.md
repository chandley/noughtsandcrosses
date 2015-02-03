# noughtsandcrosses

[![Test Coverage](https://codeclimate.com/github/chandley/noughtsandcrosses/badges/coverage.svg)](https://codeclimate.com/github/chandley/noughtsandcrosses)
[![Code Climate](https://codeclimate.com/github/chandley/noughtsandcrosses/badges/gpa.svg)](https://codeclimate.com/github/chandley/noughtsandcrosses)

## Summary

Simple noughts and crosses exercise, done as a precourse exercise

### Problem

Classic noughts and crosses game - two players alternate at keyboard

### Languages/Platforms/Tools

| Languages | Technologies  | Testing Frameworks| Misc
| :-------------------------------------------- |:--------------|:-----------|:----|
| Ruby      |               | none              |               |
|           |               |                   |               |
|           |               |                   |  
|           |               |

### Solution

* Classes Square, Board, Player and Game. 
* Board handles display, winner check. 
* Player updates square directly. 
* Game handles turns.


### To run it

in command line

```
ruby noughtcross.rb
```
rows and columns are entered as numbers 0-2

### Tests

No tests 

### Images

```
Player mike please enter row
2
Player mike please enter column
2
-------
|-|-|-|
-------
|-|-|B|
-------
|-|-|M|
-------
```

### To do

* The methods are too long - could be usefully refactored

* Board has a lot of responsibility. Consider introducing line class to simplify winner check.

* Player interacts directly with square, but this should be responsibility of board

### Learning points

* I learned a lot about Ruby class structures and control flow


