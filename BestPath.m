function [pathRow,pathCol,pathElev] = BestPath(elevation)
%Works out the best possible path for a N x M 2d array
%   Will work out the best possible path and then return it as a path
%   heading from west to east or the right side of the array to the left
%   side of the array.
%Inputs:    Elevations is a 2d array containing the elevation data
%Outputs:   pathrow: A 1d array of row indicies for the bestpath
%           pathcol: A 1d array of column indicies for the bestpath
%           pathelev: A 1d array containing the elevations for the bestpath
%Author:    Reshad Contractor

cost=inf(size(elevation));
cost(:,1)=0;
cols=zeros(size(elevation));
rows=zeros(size(elevation));
colcount=size(elevation,2);
rowcount=size(elevation,1);
for i=1:colcount-1
for j=1:rowcount
    if j==1
          k=0:1;
    elseif j==rowcount
        k=-1:0;
    else
        k=-1:1;
    end
    for k=k(1):k(length(k))
                nextrow= j+k;
                nextcol= i+1;
                weightD=abs(elevation(nextrow,nextcol)-elevation(j,i));
                prevweight=cost(j,i);
                if (weightD+prevweight)<(cost(nextrow,nextcol))
                    cost(nextrow,nextcol)=(weightD+prevweight);
                    rows(nextrow,nextcol)=j;
                    cols(nextrow,nextcol)=i;
                end
    end
end
end
[pathCol,pathRow] = pathfinder(rows,cols,cost,elevation);
[pathElev,~] = FindPathElevationsAndCost(pathRow,pathCol,elevation);
end


