# Pattern-Recognition (K-means Clustering)

Following is the algorithm used for IRIS Dataset:

1)	First we extract the data from excel sheet. (The excel file should be in the same folder as your code)
2)	Then we convert the labels from string format to numerical for computational ease.
3)	Then we choose the value of K (no. of clusters—in this case I took K=3).
4)	Then we select the seed points (means) randomly.
5)	We choose the type of distance metric to be used (either Manhattan or Euclidean).
6)	By finding the distances between each mean point and every sample point, we choose only that mean for which the distance is minimum.  And then we assign the sample point to that particular mean’s cluster.
7)	Thus we assign all points to one or the other cluster.
8)	Finally we are left with 3 clusters. Then we find the difference between previous means and new means. If any one of the difference is greater than a particular tolerance, we perform next iteration. We continue the iterations till € value is greater than 0.0001.



