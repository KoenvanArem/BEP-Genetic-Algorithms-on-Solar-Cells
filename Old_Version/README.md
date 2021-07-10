# Old implementation

This folder contains the old implementation of the genetic algorithm as described in the Appendix.

Make sure that the settings for GenPro4 are in the following way:

wav = 0.300:0.020:1.200
nai = 18
parll = 0
n_rays = 100

This folder has the following files
  1. 'ObjFun_Old.m' contains the objective function
  2. 'GA_run.m' contains a file that executes the genetic algorithm
  3. 'gaoutfun.m' contains a function that is called by the genetic algorithm to store every generation and its scores. Stores the generations in a file 'generation.mat' and the scores in a file 'scores.mat' if these exist.
  4. 'generation_empty.mat' is a file in which the generations can be stored. Copy and rename to 'generation.mat' BEFORE every execution of GA_run.
  5. 'scores_empty.mat' is a file in which the scores can be stored. Copy and rename to 'scores.mat' BEFORE every execution of GA_run.
