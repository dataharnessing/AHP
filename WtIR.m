function [W, IR] = WtIR(A)
% This function calculates both the weights and the inconsistency
% rate of the attributes for the input matrix A. The output provides
% the normalized weights in the order of the attributes, where the
% first number represents the weight of the first attribute.
% 
% Inputs:
%     A: a pairwise comparison matrix
% Outputs:
%     W: normalized weights
%    IR: inconsistency rate
%    
% Author: Ishmael Rezaei
% version: 1.0
% Date: 05/12/2017
% Created by www.dataharnessing.com

%% Find weights
Lambda_max = max(eig(A));
W = null(A- Lambda_max * eye(size(A)));
W = W./sum(W);  % normalize weights
%% inconsistency rate
RI = [0.00, 0.00, 0.58, 0.90, 1.12, 1.24, 1.32, 1.41, 1.45, 1.49, 1.51, 1.54, 1.56, 1.58, 1.59, 1.61];
II = (Lambda_max-size(A, 1))/(size(A, 1) - 1); 
IR = II/RI(size(A, 1));
if IR < 0.1
    disp('The imported pairwise comparison matrix is consistent')
else
    disp('The imported pairwise comparison matrix is inconsistent, and questions should answer again.')
end
web('https://www.dataharnessing.com/multi-criteria-decision-making/analytic-hierarchy-process/', '-browser');
end