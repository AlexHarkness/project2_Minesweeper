%% Minesweeper Project -- NCSU CSC113 2/16/2024
% starter code
clear; clc; close all;

%% Setting Up
fprintf('***********************************\n  Welcome to the Minesweeper Game!\n***********************************\n\n')
% the Board size and number of mines (these don't change!)
sizeBoard = 10;
numMines = 2;
% mapping of numbers to the different types of squares on the board
EMPTY = 0;
MINE = 9;
UNREVEALED = 11;
FLAGGED_MINE = 12;
EXPLODED_MINE = 13;

% the following few lines of code is to help you get started

% this is how you generate the Solution Board
% this is to be done at the beginning of EACH new game
solBoard = genSolutionBoard(sizeBoard, numMines);

% This is how to display a board, note that this line of code is actually
% to be MODIFIED as instead of the solution board, you will create and
% display the Player Board

%displayBoard(solBoard);



%% game loop

% game logic loop will run untill a win is discovered
while true
    solBoard = genSolutionBoard(sizeBoard, numMines);
    playerBoard = zeros(sizeBoard,sizeBoard) + 11;
    displayBoard(playerBoard);
    while true
        displayBoard(playerBoard);
        %loop for valid input
        while true
            row = input('   choose row: ');
            col = input('choose column: ');
            if ~validateSquare(row,col,playerBoard)
                fprintf('Wrong coordinates OR square has already been revealed!\n')
                continue
            end
            break
        end
        % now handling action request on confirmed location
        while true
            action = input('Reveal (1), Flag-as-a-Mine (2) or Unflag (3) : ');
            if action > 0 && action < 4
                break
            end
            fprintf('Incorrect Input. Try again.\n')
            continue
        end
        %runs when in range action input is provided
        switch action
            case 1 %revealing a square
                if isMineInSquare(solBoard,row,col)
                    %game over
                    playerBoard = solBoard;
                    playerBoard(row,col) = 13;
                    displayBoard(playerBoard);
                    fprintf('***********************************\n  A mine has exploded! GAME OVER!\n***********************************\n')
                    break

                else
                    playerBoard = revealAdjSquares(playerBoard,solBoard,row,col);
                end
            case 2 % Flag as a mine
                if playerBoard(row,col) == 11
                    playerBoard(row,col) = 12;
                else
                    fprintf('This square was already flagged as a mine.\n')
                end
            case 3 % Unflag as a min
                if playerBoard(row,col) == 12
                    playerBoard(row,col) = 11;
                else
                    fprintf('This square was NOT flagged as a mine.\n')
                end
        end
        if isItAWin(playerBoard,numMines)
            fprintf('***********************************\nCongratulations! You won the game!\n***********************************\n')
            break
        end

    end
    % asking user if they want to keep playing
    displayBoard(playerBoard)
    while true
        playAgain = input('Do you want to play again? Yes(1) , No(2) : ');
        switch playAgain
            case {1,2}
                fprintf('\n');
                break
            otherwise
                fprintf('Incorrect Input. Try again.\n')
                continue
        end
    end

    switch playAgain
        case 1
            continue
        case 2
            break
    end

end


