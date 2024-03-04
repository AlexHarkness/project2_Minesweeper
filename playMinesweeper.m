%% Minesweeper Project -- NCSU CSC113 2/16/2024
% starter code
clear; clc; close all;

%% Setting Up
fprintf('***********************************\n  Welcome to the Minesweeper Game!\n***********************************\n\n')
% the Board size and number of mines (these don't change!)
sizeBoard = 10;
numMines = 10;
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

% game logic loop will run untill player chooses to stop
while true %start of playing loop
    %board generation code gets solution board and creates matrix of 11s to
    %match
    solBoard = genSolutionBoard(sizeBoard, numMines);
    playerBoard = zeros(sizeBoard,sizeBoard) + 11;
    %displaying the player board
    displayBoard(playerBoard);
    
    %this loop handles each individual game of minesweeper
    while true %start of in game loop
        %updates player board output
        displayBoard(playerBoard);
        %loop for valid input
        %useing while break and continue to control program flow
        while true
            row = input('   choose row: ');
            col = input('choose column: ');
            if ~validateSquare(row,col,playerBoard)
                fprintf('Wrong coordinates OR square has already been revealed!\n')
                %loops up again if not valid
                continue
            end
            %if the program reaches this point it just breaks
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
                    %setting trhe board = to the sol
                    playerBoard = solBoard;
                    %exploding selected mine
                    playerBoard(row,col) = 13;
                    displayBoard(playerBoard);
                    %printing game over then breaking out of in game loop
                    fprintf('***********************************\n  A mine has exploded! GAME OVER!\n***********************************\n')
                    break

                else
                    %using revealAdjSquareds to update board
                    playerBoard = revealAdjSquares(playerBoard,solBoard,row,col);
                end
            case 2 % Flag as a mine
                %checking if unflagged then flagging
                if playerBoard(row,col) == 11
                    playerBoard(row,col) = 12;
                else
                    %letting user know if the operation could not compleate
                    fprintf('This square was already flagged as a mine.\n')
                end
            case 3 % Unflag as a min
                %checking if flagged then unflagging
                if playerBoard(row,col) == 12
                    playerBoard(row,col) = 11;
                else
                    %letting user know if the operation could not compleate
                    fprintf('This square was NOT flagged as a mine.\n')
                end
        end
        %checking for win condition
        if isItAWin(playerBoard,numMines)
            %printing win statment then breaking out of in game loop
            fprintf('***********************************\nCongratulations! You won the game!\n***********************************\n')
            break
        end  
    end %end of in game loop

    % asking user if they want to keep playing
    displayBoard(playerBoard)
    while true %starting input search loop
        playAgain = input('Do you want to play again? Yes(1) , No(2) : ');
        switch playAgain % this switch verifies if a legit input is provided
            case {1,2}
                fprintf('\n');
                break %breaking input search loop
            otherwise
                fprintf('Incorrect Input. Try again.\n')
                continue
        end 
    end %end of input seach loop

    switch playAgain % this is the switch that chooses break or contenue
        case 1
            continue
        case 2
            break %ending playing loop
    end

end %end of playing loop
%code is now over

