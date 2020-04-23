R programming, week 2 assignment.
---------------------------------

Part 2 : Reporting the number of completely observed cases in each data file.
-----------------------------------------------------------------------------

    print(R.version.string)

    ## [1] "R version 3.6.3 (2020-02-29)"

    source("complete.R")
    complete("specdata", 1)

    ##  id nobs
    ##   1  117

    complete("specdata", c(2, 4, 8, 10, 12))

    ##  id nobs
    ##   2 1041
    ##   4  474
    ##   8  192
    ##  10  148
    ##  12   96

    complete("specdata", 30:25)

    ##  id nobs
    ##  30  932
    ##  29  711
    ##  28  475
    ##  27  338
    ##  26  586
    ##  25  463

    complete("specdata", 3)

    ##  id nobs
    ##   3  243
