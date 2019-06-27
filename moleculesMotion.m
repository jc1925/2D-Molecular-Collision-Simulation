% Jinyu (Kathy) Chang, ENGR 105, Spring 2019, Final Project
% Collaborators: None
%
% function moleculesMotion(n,t,positions,velocities,radius,width,height,color)
% this function simulates motions of n molecules over t time steps in a tank
% with dimension width x height
%
% Inputs: n = number of molecules
%         t = number of time steps
%         positions = a nx2 matrix that represents the position of the
%         centers of the molecules, the 1st column represents x and the 2nd
%         column represents y
%         velocities = a nx2 matrix that represents the molecules'
%         velocities, 1st column is that in x diretion and 2nd column is in
%         y direction
%         radius = a double representing the radius of all molecules
%         width = width of the tank
%         height = height of the tank
%         color = an array representing the color of molecules in order
% Output: a simulation of molecules based on the given input
%
% Example Usage: moleculesMotion(1,100,[1,3],[.1,.1],.2,5,5,'r')

function moleculesMotion(n,t,positions,velocities,radius,width,height,color)

% initalize axis to bet he width and height
axis equal manual
axis([0,width,0,height])
box on % outer boundary

% draw molecles
handles = molecules(n,positions,radius,color);
drawnow 

% initalize number of collision
nc = 0;
      
% loop for t time steps
for T = 1:t
    % check and update positions and velocities if balls hit the boundary 
    [velocities,positions] = boundaryCheck(positions,velocities,radius,width,height);
    
    % update velocities based on collision
    [newnc, velocities] = collisionCheck(n,positions,velocities,radius);
    
    % update number of collision
    nc = nc + newnc;
    
    % title
    title (['Molecules Collision Simulation in ',num2str(T), ' Time Steps with ',num2str(nc),' collisions']);
   
    % update positions 
    positions = positions + velocities;
    
    
    % draw molecules at new positions
    pause(0.01);
    updateMolecules(n,handles,radius,positions);
end
