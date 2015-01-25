# GetDataAssigment


## Code Description

The run_analysis program is run in the top of the directory containing the
motion data.

It reads the the following files form the top directory:

* activity_labels.txt
* features.txt

We are only anlysizin the mean and std components of the data, so use grep
to find indeces of variable labels matching those string

Then from each of the test/ and train/ directories, it reads

* subject_{test/train}.txt
* X_{test/train}.txt
* y_{test/train}.txt
