% Jinyu (Kathy) Chang, ENGR 105, Spring 2019, Final Project
% Collaborators: None
%
% function velocities = collisionCheck(n,positions,velocities,radius)
% this function checks if any pair of molecules collide, and if so update
% their velocities. It will also output the total number of collisions.
% NOTE: this function does not account for circumstances where more than 2
% molecules collide together at the same time due to its complexity 
%
% Inputs: n = number of molecules
%         positions = a nx2 matrix that represents the position of the
%         centers of the molecules, the 1st column represents x and the 2nd
%         column represents y
%         velocities = a nx2 matrix that represents the molecules'
%         velocities, 1st column is that in x diretion and 2nd column is in
%         y direction
%         radius = a double representing the radius of all molecules
% Output: velocities = update old velocities 
%         nc = number of collisions in total
%
% Example Usage: [nc,velocities] = collisionCheck(2,[1,3;3,4],[.1,.1;.1,.1],.2) 

function [nc, velocities] = collisionCheck(n,positions,velocities,radius)

% initalize 
nc = 0;

% check a pair of balls at once, no repeat 
% checking (m1, m2) is the same as checking (m2,m1)
for i = 1:n-1
    for j = i+1:n
        collideLimit = 2*radius; 
        % use pythagorean theorem to find the closest distance between the
        % center of 2 molecules
        dx=positions(j,1)-positions(i,1);
        dy=positions(j,2)-positions(i,2);
        dxdysq = dx^2 + dy^2;
        distance = sqrt(dxdysq);
        
        % if the edge of the molecules are touching or overlapping
        if distance <= collideLimit 
            % update nc
            nc = nc + 1;
            
            % use elastic collision formula for 2 balls colliding
            % formula based on physics formula on this website
            % http://www.vobarian.com/collisions/2dcollisions2.pdf
            % no trignomoetry for simplication
            
            
            % compute new velocities based on old velocities
            vi1=(velocities(j,1)*dx^2 + velocities(j,2)*dx*dy + velocities(i,1)*dy^2 - velocities(i,2)*dx*dy)/dxdysq;
            vi2=(velocities(i,2)*dx^2 + velocities(j,1)*dx*dy + velocities(j,2)*dy^2 - velocities(i,1)*dx*dy)/dxdysq;
            
            vj1=(velocities(i,1)*dx^2 + velocities(i,2)*dx*dy + velocities(j,1)*dy^2 - velocities(j,2)*dx*dy)/dxdysq;
            vj2=(velocities(j,2)*dx^2 + velocities(i,1)*dx*dy + velocities(i,2)*dy^2 - velocities(j,1)*dx*dy)/dxdysq;
            
            
            % update velocities
            velocities(j,1)=vj1;
            velocities(j,2)=vj2;
            velocities(i,1)=vi1;
            velocities(i,2)=vi2;
            
            
        end
    end
end
        


