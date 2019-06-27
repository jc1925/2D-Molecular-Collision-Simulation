% Jinyu (Kathy) Chang, ENGR 105, Spring 2019, Final Project
% Collaborators: None
%
% handles = function molecules(n,positions,radius,color)
% this function draws n number of molecules based on the given positions of
% their center, radius, and color. It will produce a handles array whose
% element is a graphic handle for each molecule in the corresponding order.
%
% Inputs: n = number of molecules
%         positions = a nx2 matrix that represents the position of the
%         centers of the molecules, the 1st column represents x and the 2nd
%         column represents y
%         radius = a double representing the radius of all molecules
%         color = an array representing the color of molecules in order
% Output: handles = graphic handles for all the molecules
%         a drawing of all the molecules based on the input
%
% Example Usage: handles = molecules(1,[1,3],0.2,'r')

function handles = molecules(n,positions,radius,color)

% initalize graph setting
cla % clear 
hold on

% draw all the circles by looping
theta = linspace(0,2*pi);
for i = 1:n
    % find x and y for a circle
    x = radius*cos(theta) + positions(i,1);
    y = radius*sin(theta) + positions(i,2);
    % use handles for speed
    handles(i) = fill(x,y,color(i),'LineStyle','none');
end

hold off 

