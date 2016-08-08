# Project code book

## step4_data.table

Dataset contains modified [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Features

* Activity - one of following activities:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
* Subject - ID of the subject who performed the activity. ID is a number from 1 to 30.
* 66 features from original HAR dataset. Features are means and standard deviations of the 3-axial raw values taken from the accelerometer and the gyroscope.


## step5_data.table

### Features

* Activity - same as above
* Subject - same as above
* 66 variables containing mean values of original variables from step4 datasets, grouped by activity and subject.
