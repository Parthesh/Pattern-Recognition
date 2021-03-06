% Parthesh Bulbule
% Indian Institute of Space Science and Technology 
% Mtech in Geoinformatics
% Subject: Pattern Recognition
% (K-Means Clustering)


%%

clc;
clear all;
close all;


%% Extracting Data

[X,txt]=xlsread('irisdata.xls');

l=length(txt);
classes=unique(txt);
classes_mat=zeros(l,1);
for i=1:l
    tf=strcmp(txt(i),classes(1));
    if(tf==1)
        classes_mat(i)=1;
    end
    tf=strcmp(txt(i),classes(2));
    if(tf==1)
        classes_mat(i)=2;
    end
    tf=strcmp(txt(i),classes(3));
    if(tf==1)
        classes_mat(i)=3;
    end
end

Y=classes_mat;


fprintf('Enter your choice 1 or 2\n 1: Use Manhattan Metric\n 2: Use Euclidean Metric\n');
prompt='What is Your Choice?\n';
dist_type = input(prompt);


%% Forming and iterating clusters
 [m,n]=size(X);
 cluster_matrix = zeros(m,1);

K = 3;  % value of k in k-means, can be varied(Davis Bould Index can be used for finding best value of 'k')
    dist=zeros(m,K);    % Distance Matrix
    
        C = double(X(randsample(m,K),:)); % Initial Centroids (seed points)
        iter=0;
        epsilon=100;

          while(max(epsilon)>0.0001)
          
            C_old=C; 
            if dist_type==1      % Manhattan
                for j = 1:K
                    for i = 1:m
                        diff(1,1:n) = (abs(C(j,:)-X(i,:)));
                        dist(i,j)=sum(diff(1,1:n));
                    end
                end
                for i=1:m
                    [xyz,cluster]=min(dist(i,:));
                    cluster_matrix(i,1)=cluster;
                end
                
       
                   for i = 1:K
                       [val1,val2]=size(X(cluster_matrix==i,:));
                       Xvector = X(cluster_matrix==i,:);
                       C(i,:) = sum(Xvector)./val1 ;
                   end
                 
                   

             
            elseif dist_type==2   %Euclidean

                for j = 1:K
                    for i = 1:m
                        diff(1,1:n) = abs((C(j,:)-X(i,:)));
                        diff = diff.^2;
                        dist(i,j)=sqrt(sum(diff(1,1:n)));
                    end
                end
                for i=1:m
                    [xyz,cluster]=min(dist(i,:));
                    cluster_matrix(i,1)=cluster;
                end

             
                   for i = 1:K
                       [val1,val2]=size(X(cluster_matrix==i,:));
                       Xvector = X(cluster_matrix==i,:);
                       C(i,:) = sum(Xvector)./val1 ;
                   end
           
            end     
                   iter=iter+1;
                   epsilon=(C_old-C).^2;
                   epsilon=sqrt(epsilon(:,1)+epsilon(:,2));
         end       



%% Plotting Clusters

% I'm plotting the clusters in 3D using the first 3 features of the IRIS
% Dataset. 4th feature is intrinsic.

 scatter3(X(cluster_matrix==1,1),X(cluster_matrix==1,2),X(cluster_matrix==1,3),'r.')
hold on
scatter3(X(cluster_matrix==2,1),X(cluster_matrix==2,2),X(cluster_matrix==2,3),'g.')
scatter3(X(cluster_matrix==3,1),X(cluster_matrix==3,2),X(cluster_matrix==3,3),'b.')
scatter3(C(:,1),C(:,2),C(:,3),'kx')
scatter3(C(:,1),C(:,2),C(:,3),'ko')
title('K-MEANS CLUSTERING')
legend('Cluster 1','Cluster 2','Cluster 3','Centroids')


