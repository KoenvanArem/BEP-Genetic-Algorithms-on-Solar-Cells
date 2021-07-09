# BEP-Genetic-Algorithms-on-Solar-Cells

This repository contains of implementations corresponding to the bachelor thesis 'Optimization of tandem solar cells with genetic algorithms' by Koen W. van Arem.
The implementations are written in Matlab in which the Global Optimization Toolbox and the Parallel Computing Toolbox are used. These need to be installed in order to be able to run the code.

This repository consists of two folders. The first folder called 'New

In principe staat bijna alles uitgelegd in de comments, maar ik zal de grote lijnen hier omschrijven.

GA_run_popsize50.m is het script dat een GA van population size 50 toepast.
ObjFun2 is de doelfunctie. Die stuurt door naar de functies ObjFun2_first (wanneer er nog geen scatter matrices opgeslagen zijn) en ObjFun2_second (wanneer er al wel scatter matrices opgeslagen zijn). 
ObjFun2_first voert de simulatie uit en slaat de scatter matrices op.
ObjFun2_second hergebruikt eerdere scatter matrices om de computation time te verlagen.
gaoutfun is een functie die elke generatie wordt gebruikt om de individuals en de bijbehorende scores/currents op te slaan. Met deze data kan de loop van de GA worden geplot, onderzocht etc.

Voor elke run van de GA is het nodig om:
-	Eventuele oude versies van ‘generation.mat’ en ‘scores.mat’ te veranderen van naam. 
-	‘generation_empty.mat’ en ‘scores_empty.mat’ te kopiëren en de namen veranderen naar ‘generation.mat’ en ‘scores.mat’. Hierin worden de generaties en bijbehorende scores opgeslagen.
-	Eventuele oude versies van 'storage_pyramids.mat' en 'storage_no_pyramids.mat' te veranderen van naam. Hierin worden de scatter matrices opgeslagen. (Dit is eigenlijk optioneel. Als dit niet gebeurt, worden dezelfde scatter matrices gebruikt voor de nieuwe run.)
