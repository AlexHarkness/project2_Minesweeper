function win = isItAWin(playerBoard, numMines)
% determines if the game has been won by the player
% it ensres that the number of unrevealed squares and the number of squares
% flagged as mines equal to the total number of mines on the board.
% INPUTS: playerBoard is a 2D array of integers that has the current Player

        % board.
        % 0: empty square
        % 1-8: shows the digits 1 to 8
        % 9: mine square
        % 11: unrevealed square (square that is still flipped over)
        % 12: flagged mine square (player thinks there is mine a this square)
        % 13: exploded mine square (player picked a mine square)
        
%      numMines is a an integer for the number of mines on the board.
% RETURNS: win is a logical 1 if the game has been won
%            otherwise false

if (sum(sum(playerBoard(:,:)==11))+sum(sum(playerBoard(:,:)==12))) == numMines
    win = true;
else
    win = false;
end
end