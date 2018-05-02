function [rows,cols] = GreedyWalk(start,direction,elevation)
%This function is designed to run the greedy pick algorithm to get a path
%from a starting location to either the eastern edge or western edge
%Inputs     start= 1d array with 2 numbers representing the starting row
%           and column
%           direction either a 1 for heading towards the east or -1 for
%           heading towards the west
%           Elevation is a 2d array of elevations for the greedywalk
%           function to make a path from
%Outputs    rows a 1d array with the row indicies for the path
%           cols is a 1d array with the column indicies for the chosen path
%Author     Reshad Contractor

if direction==1
    %totcol works out how many columns there are which lets us know the
    %amount of times greedy pick needs to be called
    totcol= length(elevation)-start(2)+1;
    rows=zeros(1,totcol);
    cols=zeros(1,totcol);
    rows(1)=start(1);
    cols(1)=start(2);
    %Running a for loop with the function greedy pick and each time the
    %function is passed using the new picked value as the start value and
    %storing the pick in the rows array which has been pre allocated
    for i=1:(length(cols)-1)
        start=GreedyPick(start,direction,elevation);
        rows(i+1)=start(1);
        cols(i+1)=start(2);
    end
elseif direction==-1
    %totcol works out how many columns there are which lets us know the
    %amount of times greedy pick needs to be called
    totcol= length(elevation)-(length(elevation)-start(2));
    rows=zeros(1,totcol);
    cols=zeros(1,totcol);
    rows(1)=start(1);
    cols(1)=start(2);
    %Running a for loop with the function greedy pick and each time the
    %function is passed using the new picked value as the start value and
    %storing the pick in the rows array which has been pre allocated
    for i=length(cols):-1:2
        start=GreedyPick(start,direction,elevation);
        rows((length(rows))-(i-2))=start(1);
        cols((length(cols))-(i-2))=start(2);
    end
end
