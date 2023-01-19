This folder contains the processed data and matlab scripts to produce the figures of the following publication:

"Short-term effects of visuo-motor discrepancies on multisensory integration, proprioceptive recalibration and motor adaptation"

Published in The Journal of Neuropysiology, 2023. 

By:
Nienke B Debats, Herbert Heuer and Christoph Kayser
Department of Cognitive Neuroscience, Universität Bielefeld, Bielefeld, Germany
Leibniz Research Centre for Working Environment and Human Factors, Dortmund, Germany
Contact: Christoph.kayser@uni-bielefeld.de  


This folder contains matlab scripts producing
- Figure 2, results for integration
- Figure 3, results for recalibration
- Figure 4, results for motor adaptation

The processed data are stored in .xls files, separately for the participant-wise judgement errors and the slopes (i.e. the regression of judgement error against 
the spatial discrepancy).

The manuscript reports data for two experiments, with Exp1 featuring discrepancies of +/- 15 degrees, and Exp2 of +/-30 degrees.
The data files are as follows, with one file per Experiment.

The two experimental conditions, termed 'same' and 'opposite' in the manuscript, are codes as EQ(=same) and NE(=opposite) in the xls files.

** For integration:
- ExpX_ integrationl_xq.xls   holds the participant-wise errors for each discrepancy (e.q. +/-15,+/-5) and for each experimental condition (EQ, NE)
- ExpX_judge_slope.xls        holds the integration slopes in colum 1 for EQ and colum 4 for NE

** For recalibration:
- ExpX_recalibrationt_xq.xls  holds the participant-wise errors for each discrepancy (e.q. +/-15,+/-5) and for each experimental condition (EQ, NE), separately 
for pre- and post-test phases of the experiment. the actual recalibration effect is their difference, in columns indicated by 'diff...'.
- ExpX_judge_slope.xls        holds the recalibration slopes in colum 2 for pre-test EQ, colum 3 for post-test EQ, colum 5 for pre-test NE and colum 6 post-test NE

** For motor adaptation:
- ExpX_ motoradapt_xq.xls     holds the participant-wise errors for each discrepancy (e.q. +/-15,+/-5) and for each experimental condition (EQ, NE), separately  
for pre- and post-test phases of the experiment. the actual effect is their difference, in columns indicated by 'diff...'.
 - ExpX_move_slope.xls        holds for slopes of motor adaptation, in colum 2 for pre-test EQ, colum 3 for post-test EQ, colum 5 for pre-test NE and colum 6 post-test NE
			      In this file, columns 1 and 4 (bimodal data) are not relevant. 

