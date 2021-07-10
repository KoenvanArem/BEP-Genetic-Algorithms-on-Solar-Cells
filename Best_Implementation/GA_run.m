% Initiate time measurement
tic;

% set seed -> makes the script repeatable
rng(42); 


% ============= Specification of options =============
% Give the value of some variable options

% Population size
population_size = 50;       % pick within 50-100 to have a quick result and within 100-150 for a good final solution


% Stopping criterion
% Note: stopping criterion A (fast):        M = 6, epsilon = 1e-4
%       stopping criterion B (accurate):    M = 12, epsilon = 1e-3
M = 12;                     % give the value of M
epsilon = 1e-4;             % give value of epsilon of stopping criterion (function tolerance)

% Parallel computing within 'ga'
% If parallel computing within GenPro4 is desired use false for this choice
% and turn on parallel computing for GenPro4
ParallelComputing = true;   % give logical value whether or not to use parallel computing in the genetic algorithm


% ============= Initiation of variables  =============
% Initiate number of variables
numberOfVariables = 10;

% Initiate lower and upper bounds
LowerBounds = [0.04 0.04 0.04 0.04 0.04 0.04 0 0 0 0];
UpperBounds = [0.50 0.50 0.50 0.50 0.50 0.50 2 1 1 1];

% Define the integer variables
IntCon = [7, 8, 9, 10];

% ============= Initiation of objective function  =============
% Initiate with pyramids
y = [0.1186    0.0761    0.2302    0.3830    0.4815    0.0983    2.0000    1.0000    1.0000    1.0000];
initialise = ObjFun2_first(y);

% store scatter matrices in the structure 'matrices'
load('storage_pyramids.mat')
matrices.pyramids = temp;

% Initiate without pyramids
y2= [0.1186    0.0761    0.2302    0.3830    0.4815    0.0983    2.0000    1.0000    1.0000    0];
initialise2 = ObjFun2_first(y2);

% store scatter matrices in the structure 'matrices'
load('storage_no_pyramids.mat')
matrices.no_pyramids = temp;

% clear the temporary variable temp
clear temp


% ============= Calling the function ga  =============
% Define plotting options, function tolerances. etc.
% Give name 'OutputFcn' which is called every generation. Is used to store
% information about the generations in the files 'generation.mat' and
% 'scores.mat'. 
% NOTE: Every new GA start, the files of 'generation_empty.mat' and
% 'scores_empty.mat' should be copied and renamed as 'generation.mat' and
% 'scores.mat'. The old versions can be renamed to something other than 
% 'generation.mat' and 'scores.mat' to store them.
options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotrange}, 'OutputFcn',@gaoutfun, 'Display', 'iter','MaxStallGenerations', M, 'TolFun' , epsilon,'PopulationSize' , population_size, 'UseParallel' , ParallelComputing) ; 

% Function call of 'ga'
[x,fval,exitflag,output,population,scores] = ga(@ObjFun_Final, numberOfVariables,[],[],[],[],LowerBounds,UpperBounds,[],IntCon,options);

% Store runing time
run_time = toc;

% Save results of the genetic algorithm
save('Results_GA_run.mat')