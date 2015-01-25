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
7. tBodyAcc.std...X
