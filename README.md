#README on  "run_analysis.R"
This is an R script produced by **Agris Nikitenko** in February 2015 within the course "Getting and Cleaning data" provided by online learning community Coursera. 

The script takes one parameter - directory, which is a character vector of length 1, indicating where the initial raw unzziped UCI HAR dataset is located and where the resultind tidy data set will be stored. The raw data files have to preserve the structure of the initial data set i.e. the one should not do any changes to the data or data set structure before running the script.

The resulting tidy data set will be stored as "tidy_Data_avg.txt" in the same directory. Before each raw data file loading its existence is checked. If any of files is missing or has different name the script will stop and provide the name of the missing file. 

The output file semantics and structure is described in "CodeBook.md"

Good luck!