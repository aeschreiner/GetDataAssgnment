# GetDataAssigment


## Code Description

The run_analysis program is run in the top of the directory containing the
motion data.

It reads the the following files form the top directory:

* activity_labels.txt (into activity.labels)
* features.txt (into features)

We are only anlysizing the mean and std components of the data, so use grep
to find indeces of variable labels matching those string

Then from each of the test/ and train/ directories, it reads

* subject_{test/train}.txt (into suject.{test/train)
* X_{test/train}.txt (into x.{test/train})
* y_{test/train}.txt (into y.{test/train}

subect, y and x[,matched indeces] are then column-bound into testdata and traindata respectively,
and then those two tables are row-bound into data, which has 68 columns, with the subject id, the activity id
and the 66 mean and std features.

group_by(data,subject,activity) creates 6x30=180 groups, then
summarise_each() is used with the mean function to create a  grouped mean of the mean and std variables. The resulting
summary table had dimension 180 x 68, and this is what is output by run_analysis()

# code book

The variables in the output are:

1. subject id, ranging from 1-30
2. activity id, ranging from 1-6, and present for each of the 30 subjects
3. tBodyAcc.mean...X
4. tBodyAcc.mean...Y
5. tBodyAcc.mean...Z
6. tBodyAcc.std...X
7. tBodyAcc.std...Y
8. tBodyAcc.std...Z
9. tGravityAcc.mean...X
10. tGravityAcc.mean...Y
11. tGravityAcc.mean...Z
12. tGravityAcc.std...X
13. tGravityAcc.std...Y
14. tGravityAcc.std...Z
15. tBodyAccJerk.mean...X
16. tBodyAccJerk.mean...Y
17. tBodyAccJerk.mean...Z
18. tBodyAccJerk.std...X
19. tBodyAccJerk.std...Y
20. tBodyAccJerk.std...Z
21. tBodyGyro.mean...X
22. tBodyGyro.mean...Y
23. tBodyGyro.mean...Z
24. tBodyGyro.std..X
25. tBodyGyro.std..Y
26. tBodyGyro.std..Z
27. tBodyGyroJerk.mean..X
28. tBodyGyroJerk.mean..Y
29. tBodyGyroJerk.mean..Z
30. tBodyGyroJerk.std...X
31. tBodyGyroJerk.std...Y
32. tBodyGyroJerk.std...Z
33. tBodyAccMag.mean..
34. tBodyAccMag.std..
35. tGravityAccMag.mean..
36. tGravityAccMag.std..
37. tBodyAccJerkMag.mean..
38. tBodyAccJerkMag.std..
39. tBodyGyroMag.mean..
40. tBodyGyroMag.std..
41. tBodyGyroJerkMag.mean..
42. tBodyGyroJerkMag.std..
43. fBodyAcc.mean...X
44. fBodyAcc.mean...Y
45. fBodyAcc.mean...Z
46. fBodyAcc.std...X
47. fBodyAcc.std...Y
48. fBodyAcc.std...Z
49. fBodyAccJerk.mean...X
50. fBodyAccJerk.mean...Y
51. fBodyAccJerk.mean...Z
52. fBodyAccJerk.std...X
53. fBodyAccJerk.std...Y
54. fBodyAccJerk.std...Z
55. fBodyGyro.mean...X
56. fBodyGyro.mean...Y
57. fBodyGyro.mean...Z
58. fBodyGyro.std...X
59. fBodyGyro.std...Y
60. fBodyGyro.std...Z
61. fBodyAccMag.mean..
62. fBodyAccMag.std..
63. fBodyBodyAccJerkMag.mean..
64. fBodyBodyAccJerkMag.std..
56. fBodyBodyGyroMag.mean..
66. fBodyBodyGyroMag.std..
67. fBodyBodyGyroJerkMag.mean..
68. fBodyBodyGyroJerkMag.std..

