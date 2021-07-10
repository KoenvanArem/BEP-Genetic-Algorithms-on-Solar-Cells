# Best Version

This folder contains the Best Version of the genetic algorithm as found in Chapter 5.

Make sure that the settings for GenPro4 are in the following way:

wav = 0.300:0.005:1.200\\
nai = 30\\
parll = 0\\
n_rays = 1000\\

This folder has the following files
  1. 'ObjFun.m' contains the objective function. It redirects to 'ObjFun_first.m' and 'ObjFun_second.m'.
  2. 'ObjFun_first.m' contains the objective function that is called when the scatter matrices have to be simulated. This is the case if it is the first function call for each possible value of x_{10}.
  3. 'ObjFun_second.m' contains the objective function that is called when the scatter matrices can be reused. 
  4. 'GA_run.m' contains a file that executes the genetic algorithm
  5. 'gaoutfun.m' contains a function that is called by the genetic algorithm to store every generation and its scores. Stores the generations in a file 'generation.mat' and the scores in a file 'scores.mat' if these exist.
  6. 'generation_empty.mat' is a file in which the generations can be stored. Copy and rename to 'generation.mat' BEFORE every execution of GA_run.
  7. 'scores_empty.mat' is a file in which the scores can be stored. Copy and rename to 'scores.mat' BEFORE every execution of GA_run.
