function playerBoard = revealAdjSquares(playerBoard, solBoard, row,col)
% NO NEED TO MODIFY this function, just use it!
% reveals ALL adjacent squares that are EMPTY or with digits.
% Inputs:  playerBoard is the current board for the player
%          solBoard is the solution, i.e. the board with the mines
%          2D arrays of integers in the range [0-9] & [11-13], where
%            0: empty square
%          1-8: shows the digits 1 to 8
%            9: mine square
%           11: unrevealed square (square that is still flipped over)
%           12: flagged mine square (player thinks there is mine a this square)
%           13: exploded mine square (player picked a mine square)
% Return:  playBoard is the UPDATED board of player
sizeBoard = length(solBoard);

%mapping of numbers to squares
EMPTY = 0;
UNREVEALED = 11;

for r = row-1:row+1
    for c = col-1:col+1
        if isValidCell(r,c, sizeBoard) && isNotRevealed(playerBoard, r, c) && isEmpty(solBoard, r, c) %empty cell
            playerBoard(r,c) = 0; %set to empty cell
            %recursively reveal the cells around it.
            playerBoard = revealAdjSquares(playerBoard, solBoard, r,c);
        elseif isValidCell(r,c, sizeBoard) && isNotRevealed(playerBoard, r, c) && isNum(solBoard, r, c) %num cell
            playerBoard(r,c) = solBoard(r,c); %set cell to a number
        end

    end
end

    function valid = isValidCell(r, c, sizeBoard)
        valid =  r >= 1 && c >= 1 && r <=sizeBoard && c <=sizeBoard;
    end

    function emptyCell = isEmpty(solBoard, r , c)
        emptyCell = solBoard(r,c) == EMPTY; %empty squares
    end

    function numCell = isNum(solBoard, r , c)
        numCell = (solBoard(r,c) >= 1) && (solBoard(r,c) <= 8); %numbered cell
    end

% % not revealed on the Player Board yet.
    function notRevealed = isNotRevealed(playerBoard, r, c)
        notRevealed = (playerBoard(r,c) == UNREVEALED);
    end


end

