function displayBoard(board)
% NO NEED TO MODIFY this function, just use it!
% Displays  a board as a Minesweeper Board of images
% Call this function whenever you want to display the Player's Board
% INPUTS: board is a 2D array of integers in the range [0-9] & [11-13], where
%         0: empty square
%       1-8: squares with digits 1 to 8
%         9: mine square
%        11: unrevealed square (square that is still flipped over)
%        12: flagged mine square (player thinks there is mine a this square)
%        13: exploded mine square (player picked a mine square)           
% DISPLAYS: a Figure that has a visual of the board with images 

%loading the Images
load mineSweeperImages mineSweeperImages;

%replace the 0s with 10s
%in this function ONLY empty squares are 10
board (board == 0) = 10;

boardSize = length(board);
boardImg = mineSweeperImages{14}; %adds the numbering of the columns
for r = 1:boardSize
    % creating a row
    boardImgRow = [];
    for c = 1:boardSize
        boardImgRow = [boardImgRow, mineSweeperImages{board(r,c)}]; 
    end  
    % add this entire row
    boardImg = [boardImg; boardImgRow];    
end
boardImg = [mineSweeperImages{15}, boardImg]; %adds the numbering of the rows

% displays the board
imshow(boardImg)

end

