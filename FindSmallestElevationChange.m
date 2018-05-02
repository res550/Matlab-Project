function [ smallestposition ] = FindSmallestElevationChange(current,Next)
%Takes the current elevation and an array of the next elevations to return
%which element of that array has the smallest change in elevation
%To do this I will first make a new array which has the change in height
%from the current array and then take the absolute value of this array so
%all of the numbers will be positive. I will take the minimum of this array
%and store it into a new array to be returned
%Inputs: Current= The current value of the positon
%        Next=An array of values that are to be picked from
%Outputs:Smallestposition:The location of the smallestelevation change
%Example current= 2
%        Next=[1,4,5]
%        smallestposition=1
%Author Reshad Contractor
%creating a cost array for moving between points

Elevationchange= (current - Next);
Elevationchange= abs(Elevationchange);
minelev=min(Elevationchange);
j=1;
%Preallocating the array to the maximum possible size
smallestposition=zeros(1,length(Next));

for i= 1:length(Elevationchange)
    if Elevationchange(i)== minelev
        smallestposition(j)=i;
        j=j+1;
    end
end

%Removing any possibly leftover zeros from the preallocated array
smallestposition= smallestposition(1:(j-1));

end
