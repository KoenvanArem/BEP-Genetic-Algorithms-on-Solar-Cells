function [state,options,optchanged] = gaoutfun(options,state,flag)
% Function to store all information and display it during the run
optchanged = false;
switch flag
    case 'iter'
        
        % Find best individual and corresponding current
        ibest = state.Best(end);
        ibest = find(state.Score == ibest,1,'last');
        bestx = state.Population(ibest,:);
        bestf = state.Score(ibest);
        
        % Display best individual and corresponding current
        disp(['Best x value is   ', num2str(bestx)])
        disp(['Best value is   ', num2str(bestf)])
        
        % Store generation and scores in variable named fname_gen[N] or
        % fname_score[N] where [N] is the generation number
        eval(sprintf('fname_gen%d = state.Population', state.Generation))
        eval(sprintf('fname_score%d = state.Score', state.Generation))
        
        % Save the variables fname_gen[N] and fname_score[N]
        save('generation.mat',sprintf('fname_gen%d', state.Generation),'-append')
        save('scores.mat',sprintf('fname_score%d', state.Generation),'-append')
        
        disp(flag)
end