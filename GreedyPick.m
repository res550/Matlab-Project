function [newpos] = GreedyPick(currentpos,direction,elevation)
%Takes a 2d array of elevations and picks the new position based on lowest
%change in elevation
%   This function will take the current position and the direction being
%   headed in along with elevation data to work out the next position
%   Inputs: Currentpos= A 1d array containing the current position in a 2d
%           array
%           Direction: Which direction you want the GreedyPick to occur use
%           1 for picking to the east direction and -1 for the west
%           direction.
%           Elevation: A 2d elevation array
%
%   Outputs:
%           newpos: The next position which follows from the greedy pick
%           algorithim
%Author Reshad Contractor
%Getting row and col data from the current position
oldrow= currentpos(1);
oldcol= currentpos(2);

newCol= oldcol+direction;
%Using conditionals statements depending on the position to generate an
%array of the next set of rows that are possible

if oldrow==1
    newRow=[oldrow,oldrow+1];
elseif oldrow== size(elevation,1)
    newRow=[oldrow-1,oldrow];
else
    newRow=[oldrow-1,oldrow,oldrow+1];
end

currentelv= elevation(oldrow,oldcol);

%Preallocating newelv array and then storing the elevation values on it
newelv= zeros(1,length(newRow));
for i=1:length(newRow)
    newelv(i)= elevation(newRow(i),newCol);
end

smallestPosition= FindSmallestElevationChange(currentelv,newelv);

%Converting the result from smallest position to a pick for the next
%position

if newRow(1)== oldrow
    smallestPosition= min(smallestPosition)-1;
    newpos = [oldrow+smallestPosition,newCol];
else
    smallestPosition= min(smallestPosition)-2;
    newpos = [(oldrow+smallestPosition),newCol];
end