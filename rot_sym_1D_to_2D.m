function [img]=rot_sym_1D_to_2D(V)

 % V= any symmetrical vector
n = floor(numel(V)/2); 

r = [n:-1:0, 1:n]; % A vector of distance (measured in pixels) from the center of vector V to each element of V

% Now find the distance of each element of a square 2D matrix from it's centre. @(x,y)(sqrt(x.^2+y.^2)) is just the Euclidean distance function. 
ri = bsxfun(@(x,y)(sqrt(x.^2+y.^2)),r,r');

% Now use those distance matrices to interpole V
img = interp1(r(1:n),V(1:n),ri);

% The corners will contain NaN because they are further than any point we had data for so we get rid of the NaNs
img(isnan(img)) = 0; % or instead of zero, whatever you want your background colour to be
end