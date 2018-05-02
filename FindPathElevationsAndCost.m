function [elev,cost] = FindPathElevationsAndCost(rows,cols,elevs)
%FindPathElevationsAndCost takes a given path and returns elevations and
%cost of this
%   Inputs: rows= the row indices of the given path
%           cols= the corresponding column indices of the given path
%           elevs= the elevation data stored in a 2D m x n matrix
%   Outputs: elev= a 1D array containing the elevations for the....
%            corresponding row and column indices for the path
%            cost=the total cost of traversing the path
%Pre allocating the 2 arrays to be used in the function to save on time
%length of the elevations array will always be equal to the length of the
%rows and cols array. Length of the steps array will always be equal to
%length of the elevations array minus 1.

elev = zeros(1,length(rows));
cost = zeros(1,(length(elev)-1));
elev(1)=elevs(rows(1),cols(1));

%Using a for loop to take retrive elevation data and use this to work out
%cost data for the steps
for i=2:length(elev)
    elev(i)= elevs(rows(i),cols(i));
    cost(i-1)= abs(elev(i)-elev(i-1));
end

cost= sum(cost);

end

