clear;
clc;
basedir='/brain/iCAN/home/tianyanqiu/SPM12_scripts/RSA/CHSFC';
dir='/brain/iCAN/home/tianyanqiu/CHS/Result_IndividualStats/2011_TBT_UCSmean'; %mother file
cd (dir);
i=0;

 cd(basedir);
 load('/brain/iCAN/home/tianyanqiu/SPM12_scripts/RSA/CHSFC/CHS_database.mat');

c1=cell2mat(database(:,1));
c5=cell2mat(database(:,5));
  sub=[c1 c5];
  subid=sub(:,1);
 
  
for a=1:54
%     if sub==33|| sub==37||sub==43||sub==50 ||sub==51 ||sub==52 || sub==11|| sub==18|| sub==30|| sub==45|| sub==49|| sub==57;
%     
%         continue;
%     end
YearID  = ['20',database{a,2}(1:2)];
% subid(sub)
subdir=fullfile(dir,YearID,database{a,2},'fmri/stats_spm12/FC/stats_spm12_swcar');
     %subdir=[dir sprintf(YearID,'/%02d/Result_0s_RSA_meanUCS',sub)]; %sub files
    cd (subdir);
    for m=1:38; % number of beta files,1-4,csp15+csm15+UCS1+headmovement6=38
   % for m=1:44; % number of beta files,5-67

        file_source{m}=[subdir sprintf('/beta_00%02d',m),'.nii']; %beta file
    end 
    sources=char(file_source);
    mask='/brain/iCAN/home/tianyanqiu/SPM12_scripts/RSA/CHSFC/ROI_new/CHS_2x2_RHPC_cluster_32-28-12.nii'; %roi path, single
    R=rex(sources, mask, 'level','voxels','select_clusters',0); 
    %load rAAL_amg.rex.mat;
    data=R';
    
    i=i+1;
  
      
    idx=(isnan(data));
    
    data(idx(:,1),:)=[];
    
    UCS_MEAN=data(:,31); %1st UCS trail,1-4
    % UCS_MEAN=data(:,37); %1st UCS trail,5-67

    j=1;
    
%   ROI(i,1)=sub;

    ROI(i,1)=sub(a,1);
    ROI(i,2)=sub(a,2);
    
        for j=1:30; % number of trails except UCS
            n=j+2;
            ROI(i,n)=corr(data(:,j),UCS_MEAN);
        end
%     for j=1:30; % number of trails except UCS
%         n=j+2;
%         ROI(i,n)=corr(data(:,j),UCS_MEAN);
%     end
end

    
  cd ('/brain/iCAN/home/tianyanqiu/CHS/Result_RSA');  
  save('RSA_CHS_2x2_RHPC_cluster_32-28-12_0s_RSA_UCSmean','ROI')
    
    
        

