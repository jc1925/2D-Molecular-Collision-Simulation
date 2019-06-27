% Jinyu (Kathy) Chang, ENGR 105, Spring 2019, Final Project
% Collaborators: None
%
% function updateMolecules(n,handles,radius,positions)
% this function updates the molecules' centers' location by updating the
% graphic handle of each molecule and produce a drawing of all molecules 
% based on the positions.
%
% Inputs: n = number of molecules
%         handles = an array with n elements, each represents a handle for
%         a molecule corresponding to the position
%         radius = a double representing the radius of all molecules
%         positions = a nx2 matrix that represents the position of the
%         centers of the molecules, the 1st column represents x and the 2nd
%         column represents y
% Output: a drawing of all the molecules based on the positions.
%
% Example Usage: updateMolecules(1,handles,0.2,[1,3])

function updateMolecules(n,handles,radius,positions)

theta = linspace(0,2*pi);
for i = 1:n
    x = radius*cos(theta) + positions(i,1);
    y = radius*sin(theta) + positions(i,2);
    handles(i).XData = x;
    handles(i).YData = y;
end
drawnow