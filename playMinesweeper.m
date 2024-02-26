%% Minesweeper Project -- NCSU CSC113 2/16/2024
% starter code
clear; clc; close all;

%% Setting Up 
fprintf('***********************************\n  Welcome to the Minesweeper Game!\n***********************************')
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
playerBoard = zeros(10,10) + 11;
displayBoard(playerBoard); 
%displayBoard(solBoard); 

% game logic loop will run untill a win is discovered

while isItAWin == false || isMineInSquare == true
    



end


