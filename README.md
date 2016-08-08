# Getting and Cleaning Data

This repository contains course project written for the "Getting and Cleaning Data" course.

## Input dataset

Input dataset is [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

It would be downloaded and extracted automatically during script execution.

## Output dataset

Script will create two datasets:

* `step4_data.table` - tidy dataset, according to 4th step of the assignment
* `step5_data.table` - independent dataset, which contains mean values of for variables grouped by activity and subject.

Codebook could be found in `CODEBOOK.md` file inside this repository.

You could quickly examine results with:

`data <- read.table("step5_data.table", header=T)`

## Running script

You could run script either via RStudio or with CLI R.

`R -f run_analysis.r`
