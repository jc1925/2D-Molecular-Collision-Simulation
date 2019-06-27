% Jinyu (Kathy) Chang, ENGR 105, Spring 2019, Final Project
% Collaborators: None
%
% function [velocities,positions] = boundaryCheck(positions,velocities,radius,width,height)
% this function checks if any molecules hit the boundary, and if so change
% the positions and velocities accordingly
%
% Inputs: positions = a nx2 matrix that represents the position of the
%         centers of the molecules, the 1st column represents x and the 2nd
%         column represents y
%         velocities = a nx2 matrix that represents the molecules'
%         velocities, 1st column is that in x diretion and 2nd column is in
%         y direction
%         radius = a double representing the radius of all molecules
%         width = width of the tank
%         height = height of the tank
% Output: velocities = update old velocities 
%         positions = update old positions so the molecules won't be
%         outside the tank
%
% Example Usage: [velocities,positions] = boundaryCheck([1,3],[.1,.1],.2,5,5)

function [velocities,positions] = boundaryCheck(positions,velocities,radius,width,height)

% check the lower x and y bond
lowerxybond = positions - radius <= 0; % if touching or passing bond
positions = positions + lowerxybond.*(radius - positions); % update positions
velocities = velocities + 2.*velocities .* -lowerxybond; % update velocities

% check the upper x bond in the same logic
upperxbond = positions(:,1) + radius >= width; 
positions(:,1) = positions(:,1) + upperxbond.*(width - radius - positions(:,1));
velocities(:,1) = velocities(:,1) + 2.*velocities(:,1) .* -upperxbond;

% check the upper y bond in the same logic
upperybond = positions(:,2) + radius >= height;
positions(:,2) = positions(:,2) + upperybond.*(height - radius - positions(:,2));
velocities(:,2) = velocities(:,2) + 2.*velocities(:,2) .* -upperybond;