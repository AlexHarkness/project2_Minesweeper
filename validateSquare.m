function validInput = validateSquare(row, col, playerBoard)
% Ensures that the player selects a valid square for their next move.
% the player can't chose a square
% -- that has the wrong coordinates (negative or is off the board)


% -- that is previously revealed already
% the player can choose a square 
% --that has NOT been revealed yet
% -- or has been previously flagged as a mine
% row: an integer for the row of the selected square
% col: an integer for the column of the selected square
% playerBoard: is a 2D array of integers for the Player board, v
% 0 - empty square
% 1-8 - shows the digits 1 to 8
% 9 - mine square
% 11 - unrevealed square
% 12 - flagged mine square
% 13 - exploded mine square

% %Returns: validInput is logical 1 (true) if the player selected a val
% otherwise it is logical 0 (false)

%testing if it is on the board
if (row < 1 || row > 10) || (col < 1 || col > 10)
    validInput = false;

%will return true if it is flagged or unchecked
elseif playerBoard(row,col) == 11 || playerBoard(row,col) == 12
    validInput = true;
%returns false in all other cases
else
    validInput = false;
end






