Exercises to Accompany TeachingWithR Workshop
================
Matthew Beckman & Justin Post
June 25, 2021

# Part 2. Import Data

<hr>

## 2.1 Packages

-   **Task 1:** call the `dcData` and `tidyverse` packages
    -   Note: `dcData` is installed from GitHub, so it requires an extra
        step. You may have already done this from the instructions prior
        to the workshop, but it is shown again here if needed:
    -   `devtools::install_github("mdbeckman/dcData")`
    -   this might take a while (30+ sec?) depending on your Internet
        connection

<hr>

## 2.2 Data Intake: `BabyNames`

-   **Task 1:** Read `BabyNames` data from `dcData` into your R
    environment using the `data()` function
    -   Locate the `BabyNames` object in the Environment pane  
    -   Double click the object name to open a spreadsheet View (a nice
        feature of RStudio)  
    -   Spreadsheet view includes basic sorting capability

Use the spreadsheet view to answer the following:

-   **Task 2:** how many total rows of data are included?

-   **Task 3:** describe what each row in the data *actually*
    represents.

-   **Task 4:** find the largest `count` in the `BabyNames` data. How
    would you interpret this result?

-   **Task 5:** what are the max & min available `year` in the data?

<hr>

## 2.3 Data Intake: `BabyNamesSupp`

The file “BabyNameSupp.csv” includes a few years of more recent data to
augment the `BabyNames` data. Run the starter code shown below to read
the data and complete the tasks.

**Important:** The starter code **will** produce a warning message!
Don’t worry, it’s part of the exercise!

``` r
# starter code for BabyNamesSupp 
library(tidyverse)

BabyNamesSupp <- 
  read_csv("https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv")
```

    ## Warning: 84619 parsing failures.
    ##   row col           expected actual                                                                 file
    ## 19208 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19209 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19210 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19211 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19212 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## ..... ... .................. ...... ....................................................................
    ## See problems(...) for more details.

-   **Task 1:** Read the warning message carefully; what seems to have
    gone wrong?

-   **Task 2:** open the spreadsheet view to investigate
    `BabyNamesSupp`…

    -   Which years of data are available to us in `BabyNamesSupp`?
    -   Can you confirm what seems to have gone wrong during the data
        intake?

-   **Task 3:** use the following R functions to investigate
    `BabyNamesSupp` further:

    -   `head(BabyNamesSupp)`
    -   `tail(BabyNamesSupp)`
    -   `str(BabyNamesSupp)`

-   **Task 4 (Challenge):** Why did `read_csv( )` seem to have this
    problem with the data intake? Any ideas how we might fix it?

    -   Hint: “RStudio &gt;&gt; Help &gt;&gt; read\_csv”
    -   don’t worry about *actually* fixing it yet, just try to identify
        root cause.

At this point, we aren’t attempting to prepare the `BabyNamesSupp` data
for analysis. We’re just reading it into the R environment and making
observations. We’ll be using these data again in later exercises, so we
will make the necessary corrections at that point.

<hr>

## 2.4 Help Documentation for Data Sets

Search “RStudio &gt;&gt; Help” to learn about the data…

-   **Task 1:** what can you learn about `BabyNames` data from RStudio
    Help?
-   **Task 2:** what can you learn about `BabyNamesSupp` data from
    RStudio Help? What happened?

<hr>

## 2.5 Data for 2020 (Challenge)

**Task 1:** Want to include 2020 data too? See if you can locate it,
read the data into R, and review the data intake (hint: `BabyNames` help
documentation includes a source to investigate).

Again, we aren’t attempting to process the 2020 data yet. We’re just
reading it into the R environment and making observations about that
process. We’ll be using this data again later in the exercises, so we
will make the necessary corrections at that point.

<hr>

# Part 3. R Markdown

Note: you might hang onto the RStudio default text provided in the new R
Markdown file for the moment… it’s packed with tiny examples that will
come in handy!

\[coming up next…\]

<hr>

<br>

<a href = "https://jbpost2.github.io/TeachingWithR/CourseFiles.html"><button type="button">Course
Files Page</button></a>
