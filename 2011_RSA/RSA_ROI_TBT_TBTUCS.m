clear;
clc;
basedir='/brain/iCAN/home/tianyanqiu/SPM12_scripts/RSA/CHSFC';
dir='/brain/iCAN/home/tianyanqiu/CHS/Result_IndividualStats/2011_TBT_UCSTBT_GN'; %mother file
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
subdir=fullfile(dir,YearID,database{a,2},'fmri/stats_spm12/FC/stats_spm12_swcar');
     % subdir=[dir sprintf(YearID,'/%02d/Result_0s_RSA_meanUCS',sub)]; %sub files
    cd (subdir);
    for m=1:52;%number of beta
        file_source{m}=[subdir sprintf('/beta_00%02d',m),'.nii'];
    end
    sources=char(file_source);
    mask='/brain/iCAN/home/tianyanqiu/SPM12_scripts/RSA/CHSFC/ROI_new/CHS_2x2_HPCpeak_6mm_32_-28_-12.nii';
    R=rex(sources, mask, 'level','voxels','select_clusters',0); 
    %load rAAL_amg.rex.mat;
    data=R';
    
    i=i+1;
  
      
    idx=(isnan(data));
    
    data(idx(:,1),:)=[];
    
    ROI(i,1)=sub;
    
    for j=1:15;%CSpp %CSpp_UCS
    n=j+1;
    k=j+30;%UCS
    ROI(i,n)=corr(data(:,j),data(:,k));
    end    
       
    for j=16:30;%CSm %CSm_UCS
    n=j+1;
    k=j+15;%UCS
    ROI(i,n)=corr(data(:,j),data(:,k));
    end 
end

    
  cd ('/brain/iCAN/home/tianyanqiu/CHS/Result_RSA');  
  save('GN_RSA_CHS_2x2_HPC_peak_0s_RSA_TBTUCS','ROI')
    
    
        
    
