% Jinyu (Kathy) Chang, ENGR 105, Spring 2019, Final Project
% None
%
% start.m
% This is the main file simulating molecule collisions in a tank. 
% Variables you can control include tank size, time steps, number of 
% molecules, molecules' radius, colors, velocities, and starting locations.
% More details of each function can be found on their headers.

close all

% dimension of the tank
width = 5;
height = 6;

% molecule number, radius, position, and velocities
n = 7;
radius = 0.2; % an array of the radius
color = ['r','b','g','y','c','k','m'];
% for both position and velocity:
% first column represents x positions, second one represents y positions
positions = [3,1;
             2,5;
             1,3;
             1,2;
             4,4;
             4,1;
             1,5]; 
         
velocities = [0.1,0.08;
              0.1,0.1;
              0.05,0.1;
              0.1,0.1;
              0.1,0.05;
              0.13,0.08;
              0.1,0.1];

% time steps
t = 500;


% run main program
moleculesMotion(n,t,positions,velocities,radius,width,height,color)

%% moleculesMotion.m
% <include>moleculesMotion.m</include>

%% boundaryCheck.m
% <include>boundaryCheck.m</include>

%% collisionCheck.m
% <include>collisionCheck.m</include>

%% updateMolecules.m
% <include>updateMolecules.m</include>

%% molecules.m
% <include>molecules.m</include>




