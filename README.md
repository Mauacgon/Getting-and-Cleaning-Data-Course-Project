***
## This Github Repo holds in the following files:

* **CodeBook.md**: Summarizes all elements involved in the analysis (Masurements, identifiers and activities)
* **Run_Anaysis.R**: Script by which analysis is performed.
* **tidy_data.txt**: Resulting dataset from executing *Run_Analysis script*.
* **Readme**: Provides description of files contained in this Github repository and briefs all actions carried out by *Run_Analysis* script.

***

## The R Script *Run_Analysis* carries out the following actions:

1. Install packages ```data.table```, ```tidyr```, ```dplyr``` and ```reshape``` if they are not already installed and load them.

2. Download the dataset if it does not already exists in the working directory.

3. Load all the train and test info contained in the dataset

4. Label train and test data, giving them the right variable names and merge both into a single dataframe.

5. Keep only the variables which figures out a mean or a standard deviation. Discard the others.

6. Correctly label activity variable with its right descriptive names.

7. Sort column names, putting activity and subject variables into the first columns place.

8. Label data with the appropriate descriptive names of the variables.

9. Convert subject and activty vars. into factors.

10. Group dataset by activity and subject and create the final dataset summarizing all variables into its mean by subject and activity.

11. Write a table with the final dataset.
