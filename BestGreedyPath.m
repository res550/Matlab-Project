function [pathRow,pathCol,pathElev] = BestGreedyPath(Elevation)
%BestGreedyPath runs the greedypick algorithm from every point in a N x M
%array to find the best greedypath in a N x M array
%The inputs for BestGreedyPath is a single N x M 2d array
%The outputs for BestGreedyPath is :pathrows a 1d array of the row indicies
%
%                                  :pathcols a 1d array of the column
%                                  indicies
%
%                                  :pathElevs a 1d array of the elevations
%                                  related to pathrows and pathcols
%Author Reshad Contractor

%Setting inital pathcost to infinity
pathcost=inf;

%Doing 2 for loops to get every starting position
for rows=1:(size(Elevation,1))
    for cols=1:length(Elevation)
        start=[rows,cols];
        Rows=[];%Clearing out the row array/setting it to an empty array
        Cols=[];%Clearing out the cols array/setting it to an empty array
        %Taking the two possible directions of -1,1
        for direction= -1:2:1
            %Using greedy walk function to work out the rows and cols for
            %the direction from the current starting position
            [pathRows,pathCols] = GreedyWalk(start,direction,Elevation);
            
            if direction==-1
                pathRows=Reverse(pathRows);
                pathCols=Reverse(pathCols);
            elseif direction==1
                pathRows(1)=[];
                pathCols(1)=[];
            end
            %Adding the two paths to make the total rows and cols
            Rows=[Rows,pathRows];
            Cols=[Cols,pathCols];
        end
        %Using FindPathElevationsAndCost to work out the cost and
        %elevations
        [elev,cost]=FindPathElevationsAndCost(Rows,Cols,Elevation);
        %If the cost of current path is smaller than the pathcost update
        %path information to the current path
        if cost<pathcost
            pathcost = cost;
            pathElev = elev;
            pathRow = Rows;
            pathCol = Cols;
        end
    end
end
end
