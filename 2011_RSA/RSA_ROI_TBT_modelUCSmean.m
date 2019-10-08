clear;
clc;
dir='/home/yunzhe/Desktop/Stress_Fear_conditionning/FunImgARWS';
cd (dir);
i=0;

for sub=1:67
    if sub==33|| sub==37||sub==43||sub==50 ||sub==51 ||sub==52 || sub==11|| sub==18|| sub==30|| sub==45|| sub==49|| sub==57;
    
        continue;
    end
    subdir=[dir sprintf('/%02d/Result_0s_RSA_meanUCS',sub)];
    cd (subdir);
    for m=1:31;
        file_source{m}=[subdir sprintf('/beta_00%02d',m),'.nii'];
    end
    sources=char(file_source);
    mask='/home/yunzhe/Desktop/Stress_Fear_conditionning/Masks/Bi_Hippocampus.nii';
    R=rex(sources, mask, 'level','voxels','select_clusters',0); 
    %load rAAL_amg.rex.mat;
    data=R';
    
    i=i+1;
  
      
    idx=(isnan(data));
    
    data(idx(:,1),:)=[];
    
    UCS_MEAN=data(:,31);

    j=1;
    ROI(i,1)=sub;
    
    for j=1:30;
        n=j+1;
        ROI(i,n)=corr(data(:,j),UCS_MEAN);
    end    
end

    
  cd ('/home/yunzhe/Desktop/Stress_Fear_conditionning/Result_0s_RSA_meanUCS');  
  save('RSA_ROI_Bi_Hippocampus_TBT_Result_0s_RSA_meanUCS','ROI')
    
    
        
    
