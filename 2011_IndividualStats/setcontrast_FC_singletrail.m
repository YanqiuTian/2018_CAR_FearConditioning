clear;
clc;

basedir = '/brain/iCAN/home/tianyanqiu/SPM12_scripts/IndividualStats/CHSFC/Dependence';
cd(basedir);

contrastNames = cellstr(char('CSp_1','CSp_2','CSp_3','CSp_4','CSp_5','CSp_6','CSp_7','CSp_8','CSp_9','CSp_10','CSp_11','CSp_12','CSp_13','CSp_14','CSp_15','CSm_1','CSm_2','CSm_3','CSm_4','CSm_5','CSm_6','CSm_7','CSm_8','CSm_9','CSm_10','CSm_11','CSm_12','CSm_13','CSm_14','CSm_15'))';
contrastVecs = {
    [ 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...    
    [ 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],...
    [ 0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0, 0,0,0,0,0,0],... 
    [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1, 0,0,0,0,0,0]
    };
numTContrasts = 30;
% taskdesign.m
% names{1} = ['CSp_1']
% names{2} = ['CSp_2']
% names{3} = ['CSp_3']
% names{4} = ['CSp_4']
% names{5} = ['CSp_5']
% names{6} = ['CSp_6']
% names{1} = ['CSp_7']
% names{2} = ['CSp_8']
% names{3} = ['CSp_9']
% names{4} = ['CSp_10']
% names{5} = ['CSp_11']
% names{6} = ['CSp_12']
% names{1} = ['CSp_13']
% names{2} = ['CSp_14']
% names{3} = ['CSp_15']
% names{4} = ['CSm_1']
% names{5} = ['CSm_2']
% names{6} = ['CSm_3']
% names{4} = ['CSm_4']
% names{5} = ['CSm_5']
% names{6} = ['CSm_6']
% names{4} = ['CSm_7']
% names{5} = ['CSm_8']
% names{6} = ['CSm_9']
% names{4} = ['CSm_10']
% names{5} = ['CSm_11']
% names{6} = ['CSm_12']
% names{4} = ['CSm_13']
% names{5} = ['CSm_14']
% names{6} = ['CSm_15']
clear basedir;
save Contrasts_CHSFC_singletrail.mat % taskname