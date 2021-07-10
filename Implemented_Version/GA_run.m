% Initiate time measurement
tic;

% set seed -> makes the script repeatable
rng(42); 


% ============= Specification of options =============
% Give the value of some variable options
population_size = 50;       % give population size.
epsilon = 1e-2;             % give value of epsilon of stopping criterion (function tolerance)


% ============= Initiation of variables  =============
% Initiate number of variables
numberOfVariables = 10;

% Initiate lower and upper bounds
LowerBounds = [0.04 0.04 0.04 0.04 0.04 0.04 0 0 0 0];
UpperBounds = [0.50 0.50 0.50 0.50 0.50 0.50 2 1 1 1];

% Define the integer variables
IntCon = [7, 8, 9, 10];


% ============= Calling the function ga  =============
% Define plotting options, function tolerances. etc.
% Give name 'OutputFcn' which is called every generation. Is used to store
% information about the generations in the files 'generation.mat' and
% 'scores.mat'. 
% NOTE: Every new GA start, the files of 'generation_empty.mat' and
% 'scores_empty.mat' should be copied and renamed as 'generation.mat' and
% 'scores.mat'. The old versions can be renamed to something other than 
% 'generation.mat' and 'scores.mat' to store them.
options = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotrange}, 'OutputFcn',@gaoutfun, 'Display', 'iter', 'TolFun' , 1e-2,'PopulationSize' , population_size);
% Function call of 'ga'
[x,fval,exitflag,output,population,scores] = ga(@ObjFun, numberOfVariables,[],[],[],[],LowerBounds,UpperBounds,[],IntCon,options);

% Store runing time
run_time = toc;

% Save results of the genetic algorithm
save('Results_GA_run.mat')