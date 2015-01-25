run_analysis <- function() {
    require(data.table)
    require(dplyr)

    # read files 
    
    # activity_tables is a list of activities (length=6)
    # features is a list of measuements and summaries (length=561),
    #  corresponding to the columns of X.test and X.train
    activity.labels <<- read.table("activity_labels.txt")
    features <<- read.table("features.txt",as.is=T)
    # add component information where missing
    ix <- c(303:316,382:395,461:474)
    iy <- c(317:330,396:409,475:488)
    iz <- c(331:334,410:423,489:502)
    features$V2[ix] <<- gsub('$','-X',features$V2[ix])
    features$V2[iy] <<- gsub('$','-Y',features$V2[iy])
    features$V2[iz] <<- gsub('$','-Z',features$V2[iz])
    
    # select only columns with mean() and std() labels
    i1 <- grep('mean()',features$V2,fixed=T)
    i2 <- grep('std()',features$V2,fixed=T)
    i12 <- sort(c(i1,i2))
    print(features$V2[i12])
    #return

    # both test and train directories contain
    #  subject_test which contains the subject id for each measurement, and
    #   y which contains the activity id for each measurement
    
    # we are not handling the Inertial Signals directory at all
    
    # test set
    subject.test <<- read.table("test/subject_test.txt")
    x.test <- read.table(
        "test/X_test.txt",col.names=features$V2)
    y.test <- read.table("test/y_test.txt")
    
    # training set
    subject.train <- read.table("train/subject_train.txt")
    x.train <- read.table(
        "train/X_train.txt",col.names=features$V2)
    y.train <- read.table("train/y_train.txt")
    
    # assign some names
    names(subject.test) <- 'subject'
    names(y.test) <- 'activity'

    names(subject.train) <- 'subject'
    names(y.train) <- 'activity'
    
    # column-bind the subject and activity to the measurements for both
    #  test and train
    testdata <- cbind(subject.test,y.test,x.test[,i12])
    traindata <- cbind(subject.train,y.train,x.train[,i12])
    
    # row-bind the test and train data into one data frame
    data <- rbind(testdata,traindata)
    
    # group the data by subject and activity id
    #  then calculate the mean of each column of data for each
    #   (subect,actitvity) pair
    g <- group_by(data,subject,activity)
    # summarise_each applies the function to all columns
    summ <- summarise_each(g,funs(mean))
    #labels <- c('subject','activity',features$V2)
    
    #summ <= data.frame(cbind(rep(1:30,each=6),rep(1:6,30)))
    #for (k in seq(length(features$V2))) {
    #    print(features$V2[k])
    #    #y <- summarize(g,mean(f))[,3]
    #    #summ <- cbind(summ,y)
    #}
    #ns <- length(table(subject))
    #na <- length(table(activity))
    #summ <- data.frame(
    #    matrix(0,nrow=ns*na,ncol=2+length(features$V2)))
    #colnames(summ) <- labels
    
    #nf <- length(features$V2)
    #k = 1
    #for (i in seq(ns)) {
    #    for (j in seq(na)) {
    #        summ[k,'subject'] <- i
    #        summ[k,'activity'] <- j
    #        for (l in seq(nf)) {
    #            s <- subject == i & activity == j
    #            summ[k,l+2] <- mean(data[s,l])
    #        }
    #        k <- k + 1
    #    }
    #}

    return(summ)
}
