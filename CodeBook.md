---
title: "Code_Book"
author: "Mauro Nicolás Acuña González"
output: html_document
---
# Code Book

Summary of the resulting data fields in `tidy_data.txt`.

## Identifiers

* `activity` - Type of activity carried out when corresponding measurements were taken.
* `subject` - Subject ID

## Measurements

* `timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation`
* `frequencyDomainBodyAccelerometerMeanX`
* `frequencyDomainBodyAccelerometerMeanY`
* `frequencyDomainBodyAccelerometerMeanZ`
* `frequencyDomainBodyAccelerometerStandardDeviationX`
* `frequencyDomainBodyAccelerometerStandardDeviationY`
* `frequencyDomainBodyAccelerometerStandardDeviationZ`
* `frequencyDomainBodyAccelerometerMeanFrequencyX`
* `frequencyDomainBodyAccelerometerMeanFrequencyY`
* `frequencyDomainBodyAccelerometerMeanFrequencyZ`
* `frequencyDomainBodyAccelerometerJerkMeanX`
* `frequencyDomainBodyAccelerometerJerkMeanY`
* `frequencyDomainBodyAccelerometerJerkMeanZ`
* `frequencyDomainBodyAccelerometerJerkStandardDeviationX`
* `frequencyDomainBodyAccelerometerJerkStandardDeviationY`
* `frequencyDomainBodyAccelerometerJerkStandardDeviationZ`
* `frequencyDomainBodyAccelerometerJerkMeanFrequencyX`
* `frequencyDomainBodyAccelerometerJerkMeanFrequencyY`
* `frequencyDomainBodyAccelerometerJerkMeanFrequencyZ`
* `frequencyDomainBodyGyroscopeMeanX`
* `frequencyDomainBodyGyroscopeMeanY`
* `frequencyDomainBodyGyroscopeMeanZ`
* `frequencyDomainBodyGyroscopeStandardDeviationX`
* `frequencyDomainBodyGyroscopeStandardDeviationY`
* `frequencyDomainBodyGyroscopeStandardDeviationZ`
* `frequencyDomainBodyGyroscopeMeanFrequencyX`
* `frequencyDomainBodyGyroscopeMeanFrequencyY`
* `frequencyDomainBodyGyroscopeMeanFrequencyZ`
* `frequencyDomainBodyAccelerometerMagnitudeMean`
* `frequencyDomainBodyAccelerometerMagnitudeStandardDeviation`
* `frequencyDomainBodyAccelerometerMagnitudeMeanFrequency`
* `frequencyDomainBodyAccelerometerJerkMagnitudeMean`
* `frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation`
* `frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency`
* `frequencyDomainBodyGyroscopeMagnitudeMean`
* `frequencyDomainBodyGyroscopeMagnitudeStandardDeviation`
* `frequencyDomainBodyGyroscopeMagnitudeMeanFrequency`
* `frequencyDomainBodyGyroscopeJerkMagnitudeMean`
* `frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation`
* `frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency`

## Activity Labels

* `LAYING`: subject was laying down during the test
* `SITTING`: subject was sitting during the test
* `STANDING`: subject was standing during the test
* `WALKING`: subject was walking during the test
* `WALKING_DOWNSTAIRS`: subject was walking down a staircase during the test
* `WALKING_UPSTAIRS`: subject was walking up a staircase during the test

## Transformations 

1. Train data and test data have been merged.
2. Measurements on the mean and standard deviation have been extracted, discarding the others.
3. The activity identifiers (1 to 6) have been replaced with activity names.
4. The variable names have been replaced with descriptive variable names, the following set of rules has been followed: 

    * The typo `BodyBody` has been replaced with `Body`.
	* Initials `f` and `t` have been expanded to `frequencyDomain` and `timeDomain` respectively.
	* `mean`, `std`,`Acc`, `Gyro`, `Mag` and `Freq` have been replaced with `Mean`,     `StandardDeviation`,`Accelerometer`, `Gyroscope`, `Magnitude` and `Frequency`.
	* Special characters (i.e. `(`, `)`, and `-`) have been removed.
	
5. A final data set with the average of each variable for each activity and each subject has been created.
