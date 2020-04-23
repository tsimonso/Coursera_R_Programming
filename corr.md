R programming, week 2 assignment.
---------------------------------

### Part 3 : correlation between sulfate and nitrate for monitor locations where the number of comple cases is greater than a threshold

    print(R.version.string)

    ## [1] "R version 3.6.3 (2020-02-29)"

    source("corr.R")
    source("complete.R")
    cr <- corr("specdata", 150)
    head(cr)

    ## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

    summary(cr)

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

    cr <- corr("specdata", 400)
    head(cr)

    ## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

    summary(cr)

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

    cr <- corr("specdata", 5000)
    summary(cr)

    ## Length  Class   Mode 
    ##      0   NULL   NULL

    length(cr)

    ## [1] 0

    cr <- corr("specdata")
    summary(cr)

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000

    length(cr)

    ## [1] 323
