function tc = ObjFun(x)
    % Divide in two cases: with or without pyramids since they use
    % different scatter matrices
    
    % If wanted to determine the scatter matrices again, delete or change
    % the name of the files 'storage_pyramids.mat' and 'storage_no_pyramids.mat'
    
    if x(10)==1
        % Check whether a scatter matrix already exists. 
        % If so, call the function ObjFun2_second which reuses this.
        % Otherwise, call ObjFun2_first which estimates it and saves it
        if isfile('storage_pyramids.mat')
            tc = ObjFun_second(x);
        else
            tc = ObjFun_first(x);
        end
    else
        % Check whether a scatter matrix already exists. 
        % If so, call the function ObjFun2_second which reuses this.
        % Otherwise, call ObjFun2_first which determines it and saves it
        if isfile('storage_no_pyramids.mat')
            tc = ObjFun_second(x);
        else
            tc = ObjFun_first(x);
        end
end