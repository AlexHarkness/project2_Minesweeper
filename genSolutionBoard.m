function solBoard = genSolutionBoard(sizeBoard, numMines)
% NO NEED TO MODIFY this function, just use it!
% generates the solution board and places the mines

% mapping of numbers to the different types of squares on the board
EMPTY = 0;
MINE = 9;

% Initialize the Solution Board with the mines
solBoard = zeros(sizeBoard);

% generating the random coordinates for the mines
mineCoords = genMineCoordinates(sizeBoard,numMines);

% placing the mines on the solution board
for i = 1:numMines
    solBoard(mineCoords(i,1), mineCoords(i,2)) = MINE; %mines
end

% mark squares with the adjecent mines
solBoard = markSquaresAdjecentToMines(solBoard);

end

% Local function used to generate the random coordinates.

function mineCoords = genMineCoordinates(sizeBoard,numMines)
% generates the coordinates of the mines to place on the the Solution Board
% Inputs:
%   sizeBoard: is an integer for the size of the board
%    numMines: is an integer for the number of mines that will be
%              placed on the board
% Returns:
%  mineCoords: is a numMines by 2 array of integers that contain the
%              RANDOMLY generated coordinates of the mines

% get numMines random numbers between 1 and sizeBoard^2
bombIndx = randperm(sizeBoard^2, numMines);
board = zeros(sizeBoard);
board(bombIndx)= 9;

%% get bombs 2d indeces of the coordinates
mineCoords = zeros(numMines, 2);
for i = 1:numMines
    [mineCoords(i,1), mineCoords(i,2)]  = ind2sub(size(board),bombIndx(i));
end

end

function solBoard = markSquaresAdjecentToMines(solBoard)
% Inputs: solBoard  is a 2D array of integers in the range [0-9] & [11-13]
%                that represents the state of the player's board, where
%                0: empty square
%              1-8: squares with digits 1 to 8
%                9: mine square
%               11: unrevealed square (square that is still flipped over)
%               12: flagged mine square (player thinks there is mine a this square)
%               13: exploded mine square (player picked a mine square)
% Returns: solBoard is MODIFIED so that all adjecent squares to the mine
%                   squares are marked with the correct digits b/n 1-8
% Count all the mines in the 8 adjacent
% cells
%
%             N.W   N   N.E
%               \   |   /
%                \  |  /
%             W----Cell----E
%                  / | \
%                /   |  \
%             S.W    S   S.E
%
% Square -->  Current Square (row, col)
%      N -->  North        (row-1, col)
%      S -->  South        (row+1, col)
%      E -->  East         (row, col+1)
%      W -->  West            (row, col-1)
%     N.E--> North-East   (row-1, col+1)
%     N.W--> North-West   (row-1, col-1)
%     S.E--> South-East   (row+1, col+1)
%     S.W--> South-West   (row+1, col-1)


%mines are marked as 9s
MINE = 9;

sizeBoard = length(solBoard);
[mineRows, mineCols] = find(solBoard == MINE); %coordinates of the mines
numMines = length(mineRows);

%% go through all the mines and mark nearby cells
for i = 1:numMines

    %current mine
    row = mineRows(i);
    col = mineCols(i);
    %north
    northR = row - 1;
    if isValidCell(northR, col, sizeBoard) && ~isMine(solBoard, northR, col)
        solBoard(northR,col) = solBoard(northR,col) + 1 ;
    end

    %south
    southR = row + 1;
    if isValidCell(southR, col, sizeBoard) && ~isMine(solBoard, southR, col)
        solBoard(southR,col) = solBoard(southR,col) + 1 ;
    end

    %east
    eastCol = col + 1;
    if isValidCell(row, eastCol, sizeBoard) && ~isMine(solBoard, row, eastCol)
        solBoard(row,eastCol) = solBoard(row,eastCol) + 1 ;
    end

    %west
    westCol =  col - 1;
    if isValidCell(row, westCol, sizeBoard) && ~isMine(solBoard, row, westCol)
        solBoard(row,westCol) = solBoard(row,westCol) + 1 ;
    end

    %northEast
    northEastR = row - 1;
    northEastC = col + 1;
    if isValidCell(northEastR, northEastC, sizeBoard) && ~isMine(solBoard, northEastR, northEastC)
        solBoard(northEastR,northEastC) = solBoard(northEastR,northEastC) + 1 ;
    end

    %northWest
    northWestR = row - 1;
    northWestC = col - 1;
    if isValidCell(northWestR, northWestC, sizeBoard) && ~isMine(solBoard, northWestR, northWestC)
        solBoard(northWestR,northWestC) = solBoard(northWestR,northWestC) + 1 ;
    end

    %southEast
    southEastR = row + 1;
    southEastC = col + 1;
    if isValidCell(southEastR, southEastC, sizeBoard) && ~isMine(solBoard, southEastR, southEastC)
        solBoard(southEastR,southEastC) = solBoard(southEastR,southEastC) + 1 ;
    end

    %southWest
    southWestR = row + 1;
    southWestC = col - 1;
    if isValidCell(southWestR, southWestC, sizeBoard) && ~isMine(solBoard, southWestR, southWestC)
        solBoard(southWestR,southWestC) = solBoard(southWestR,southWestC) + 1 ;
    end

end

%helper functions
    function valid = isValidCell(row, col, sizeBoard)
        valid =  row >= 1 && col >= 1 && row <=sizeBoard && col <=sizeBoard;
    end

    function mine = isMine(board, row, col)
        mine = board(row, col) == MINE;
    end

end


