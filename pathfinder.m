function [pathcols,pathrows] = pathfinder(RowA,ColA,CostA,Elev)
%Take the cost array given in dijkstrapath and return the best path row and
%col indicies
%   inputs is a row and column matrix as well as the cost matrix and
%   elevation data
CostA=CostA(:,length(CostA));
pathcost=min(CostA);
%Workout the position of the minimum value
for i=1:size(CostA,1)
    if CostA(i)==pathcost
        finalpos=i;
        break
    end
end
%Initialising the path cols and pathrows and setting the final values
%manualy
pathcols=zeros(1,length(ColA));
pathrows=zeros(1,length(ColA));
pathrows(length(pathrows))=finalpos;
pathcols(length(pathcols))=length(Elev);
%Writing pathrow and col data from ColA and RowA matrices
for j=1:(length(pathcols)-1)
pathcols(length(pathcols)-j)=ColA(pathrows(length(pathrows)-j+1),...
    pathcols(length(pathcols)-j+1));
pathrows(length(pathrows)-j)=RowA(pathrows(length(pathrows)-j+1),...
    pathcols(length(pathcols)-j+1));
end

