function tc = ObjFun_Final_second(x)

    %=== PREPARATION ===

    % convert numerical representations x(7) of the ETM materials to
    % strings
    ETM = ETM_Conv(x(7));
    
    % convert numerical representations x(8) of the HTM materials to
    % strings
    HTM = HTM_Conv(x(8));
    
    
    % Now, the layers and interfaces are defined
    
    %=== LAYERS ===
    Lay(1).med = 'air';                     Lay(1).thi = inf;
    Lay(2).med = 'c-Si';                    Lay(2).thi = 200;
    Lay(3).med = 'air';                     Lay(3).thi = inf;
    
    %=== INTERFACES ===
    
    
    % INTERFACE 1: between layer 1 and 2 (air/c-Si)
        
    % antireflexive MgF2 coating only present if x(9)==1;
    % otherwise seen as air.
    if x(9)==1
        Int(1).coat(1).med = 'MgF2';
    elseif x(9)==0
        Int(1).coat(1).med = 'air';
    else
        error('Gaat iets fout met x9')
    end
    
    % give the other materials with corresponding thicknesses
    % the variables x1,...,x6 correspond to the thicknesses
    
                                            Int(1).coat(1).thi = x(1);
    Int(1).coat(2).med = 'ITO';             Int(1).coat(2).thi = x(2);     
    Int(1).coat(3).med = ETM;               Int(1).coat(3).thi = x(3);     
    Int(1).coat(4).med = 'perovskite';      Int(1).coat(4).thi = x(4);     
    Int(1).coat(5).med = HTM;               Int(1).coat(5).thi = x(5);     
	Int(1).coat(6).med = 'a-SiOx';          Int(1).coat(6).thi = x(6);     
    Int(1).coat(7).med = 'a-Si(n)';         Int(1).coat(7).thi = 0.005;  
    Int(1).coat(8).med = 'a-Si(i)';         Int(1).coat(8).thi = 0.005;  
    
    if x(10)==1
        
        % load 20x20um height map of pyramid texture(~5um pyramid size)
        load('AFM.mat','pyramids_20um')
        
        % use RAY-optics model, needed to estimate if a pyramid texture is used
        Int(2).model = 'ray';            
        
        % add pyramid texture between the upper and bottum cell
        Int(2).Z = -pyramids_20um;       Int(2).xy = [20,20]; 
        % minus was added to get upside-down height map for rear
        
    end
    
    % INTERFACE 2: between layer 2 and 3 (c-Si/air)
    % these are all fixed
    Int(2).coat(1).med = 'a-Si(i)';         Int(2).coat(1).thi = 0.005;
    Int(2).coat(2).med = 'a-Si(p)';         Int(2).coat(2).thi = 0.005;
    Int(2).coat(3).med = 'Ag';              Int(2).coat(3).thi = 0.300;
    
    % load the scatter matrices stored
    if x(10)==0
        load('storage_no_pyramids.mat','temp')
    else
        load('storage_pyramids.mat','temp')
    end
    
    % put the scatter matrices at the right place in the structure 'Int'
    Int(2).SM = temp.SM;  
    
    % activate option to reuse scatter matrices
    S.SM = 1;                                 
    
    % call GENPRO4 with Int and S as input to reuse scattermatrices
    [Lay,Int] = GENPRO4(Lay,Int,S);           
    
    
    % calculate tandem current [mA/cm2]; 
    % negative to make it a minimization problem
    tc = -min(Lay(2).cur,Int(1).coat(4).cur);
    
end