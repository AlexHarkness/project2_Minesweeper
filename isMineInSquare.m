function exploded = isMineInSquare(solBoard, row, col)
% Determines if the square selected has a mine in it
% Inputs: solBoard is a 2D array of integers in the range [0-9] & [11-13]
% that represents the state of the player's board, where
%       0: empty square
%       1-8: squares with digits 1 to 8
%       9: mine square
%       11: unrevealed square (square that is still flipped over)
%       12: flagged mine square (player thinks there is mine a this square)
%       13: exploded mine square (player picked a mine square)
%   row: integer for the selected row for a square
%   col: integer for the selected column for a square
% Returns: exploded is either true (logical 1) or false (logical 0)

if solBoard(row,col)== 9
    exploded = true;
else
    exploded = false;
end

end