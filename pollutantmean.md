R programming, week 2 assignment.
---------------------------------

### Part 1 : Mean of a pollutant (sulfate or nitrate) across a specified list of monitors.

    print(R.version.string)

    ## [1] "R version 3.6.3 (2020-02-29)"

    source("pollutantmean.R")
    pollutantmean("specdata","sulfate",1:10)

    ## [1] 4.064128

    pollutantmean("specdata","nitrate",70:72)

    ## [1] 1.706047

    pollutantmean("specdata","nitrate",23)

    ## [1] 1.280833
