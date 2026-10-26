# Getting started with sppdata

``` r

library(sppdata)
```

## What’s in the SPP

The Subnational Politics Project harmonizes subnational political data
for Argentina, Brazil, and Mexico. The package exposes six relational
datasets:

``` r

spp_datasets()
#>    abbrev                                                     name
#> 1     NED                              National Executive Database
#> 2     SED                           Subnational Executive Database
#> 3    SEED                 Subnational Executive Elections Database
#> 4    SLED               Subnational Legislative Elections Database
#> 5     SDI                            Subnational Democracy Indices
#> 6 CFTDFLD Capital Federal & Tierra del Fuego Legislatures Database
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             description
#> 1                                                                                                                                                The National Executive Database (NED) (v. 2) compiles data on national executives in Argentina, Brazil, and Mexico from 1983 to 2026. Produced by the Subnational Politics Project (SPP) team, the database includes information on national executives' names, gender, party affiliation, reelection status, ideological orientation, partisan alignment with the national government, and other relevant attributes.
#> 2                                                                                                                                       The Subnational Executive Database (SED) (v. 2) compiles data on subnational executives in Argentina, Brazil, and Mexico from 1983 to 2026. Produced by the Subnational Politics Project (SPP) team, the database includes information on subnational executives' names, gender, party affiliation, reelection status, ideological orientation, partisan alignment with the national government, and other relevant attributes.
#> 3 The Subnational Executive Elections Database (SEED) (v. 2) compiles data on subnational executive elections in Argentina, Brazil, and Mexico from 1983 to 2026. Produced by the Subnational Politics Project (SPP) team, the database includes information on winning candidates at the subnational level, percentage of votes obtained by the winner, runner-up, and last-place candidates, election date, number of registered voters, valid and invalid votes, number of parties in contest, the effective number of parties (ENP), and other relevant attributes.
#> 4                                         The Subnational Legislative Elections Database (SLED) (v. 2) compiles data on subnational legislative elections in Argentina, Brazil, and Mexico from 1983 to 2026. Produced by the Subnational Politics Project (SPP) team, the database includes information on parties competing in legislative elections, number of votes obtained by party, number of seats, election date, effective number of parties (ENP), number of registered voters, and number of valid, null, and blank votes, among other relevant attributes.
#> 5                                                                                                                                                                                                                                                                         The Subnational Democracy Index (SDI) (v. 2) compiles data on subnational democracy in Argentina, Brazil, and Mexico from 1983 to 2026. Produced by the Subnational Politics Project (SPP) team, the database includes a subnational democracy index as developed by Agustina Giraudy (2015).
#> 6                                                                                                                                                                                                                                                                                                                                                           The Capital Federal & Tierra del Fuego Legislatures Database (CFTDFLD) (v. 1) compiles data on subnational legislative elections in Capital Federal and Tierra del Fuego (Argentina) between 1983 and 1996.
```

## Exploring variables (offline)

The codebook is bundled with the package, so you can browse variables
without downloading anything:

``` r

head(spp_codebook())
#>   dataset                variable                       label      type
#> 1     SED      country_state_code          Country State Code        id
#> 2     SED       name_head_sub_exe      Governor Given Name(s) character
#> 3     SED    surname_head_sub_exe         Governor Surname(s) character
#> 4     SED start_date_head_sub_exe Start Date of Governor Term      date
#> 5     SED   end_date_head_sub_exe   End Date of Governor Term      date
#> 6     SED     gender_head_sub_exe             Governor Gender    factor
#>                                                             description
#> 1 Unique identifier for a country-state unit; join key across datasets.
#> 2                                Given name(s) of the sitting governor.
#> 3                                   Surname(s) of the sitting governor.
#> 4                                       Date the governor's term began.
#> 5                                       Date the governor's term ended.
#> 6                                               Gender of the governor.

# Just one dataset:
spp_codebook("SED")
#>    dataset                          variable
#> 1      SED                country_state_code
#> 2      SED                 name_head_sub_exe
#> 3      SED              surname_head_sub_exe
#> 4      SED           start_date_head_sub_exe
#> 5      SED             end_date_head_sub_exe
#> 6      SED               gender_head_sub_exe
#> 7      SED                party_head_sub_exe
#> 8      SED                early_exit_sub_exe
#> 9      SED    consecutive_reelection_sub_exe
#> 10     SED             turnover_head_sub_exe
#> 11     SED   cumulative_changes_head_sub_exe
#> 12     SED cumulative_years_in_power_sub_exe
#> 13     SED                       enp_sub_exe
#>                                      label      type
#> 1                       Country State Code        id
#> 2                   Governor Given Name(s) character
#> 3                      Governor Surname(s) character
#> 4              Start Date of Governor Term      date
#> 5                End Date of Governor Term      date
#> 6                          Governor Gender    factor
#> 7                           Governor Party character
#> 8                      Governor Early Exit    factor
#> 9                      Governor Reelection   integer
#> 10                       Governor Turnover    binary
#> 11          Cumulative Changes of Governor   integer
#> 12                 Governor Years in Power   numeric
#> 13 Effective Number of Parties (executive)   numeric
#>                                                                         description
#> 1             Unique identifier for a country-state unit; join key across datasets.
#> 2                                            Given name(s) of the sitting governor.
#> 3                                               Surname(s) of the sitting governor.
#> 4                                                   Date the governor's term began.
#> 5                                                   Date the governor's term ended.
#> 6                                                           Gender of the governor.
#> 7                                                            Party of the governor.
#> 8             Whether/why the governor left office before the term's scheduled end.
#> 9                      Count of consecutive reelections for the incumbent governor.
#> 10                                  Whether the governorship changed party control.
#> 11                                  Running count of governor changes in the state.
#> 12                  Cumulative years the incumbent party has held the governorship.
#> 13 Effective number of parties (Laakso and Taagepera, 1979) for the executive race.
```

For a readable, printed view of a dataset’s variables:

``` r

spp_describe("SED")
#> Dataset: SED (13 variables)
#> ------------------------------------------------------------
#> country_state_code [id]
#>   Country State Code
#>   Unique identifier for a country-state unit; join key across datasets.
#> 
#> name_head_sub_exe [character]
#>   Governor Given Name(s)
#>   Given name(s) of the sitting governor.
#> 
#> surname_head_sub_exe [character]
#>   Governor Surname(s)
#>   Surname(s) of the sitting governor.
#> 
#> start_date_head_sub_exe [date]
#>   Start Date of Governor Term
#>   Date the governor's term began.
#> 
#> end_date_head_sub_exe [date]
#>   End Date of Governor Term
#>   Date the governor's term ended.
#> 
#> gender_head_sub_exe [factor]
#>   Governor Gender
#>   Gender of the governor.
#> 
#> party_head_sub_exe [character]
#>   Governor Party
#>   Party of the governor.
#> 
#> early_exit_sub_exe [factor]
#>   Governor Early Exit
#>   Whether/why the governor left office before the term's scheduled end.
#> 
#> consecutive_reelection_sub_exe [integer]
#>   Governor Reelection
#>   Count of consecutive reelections for the incumbent governor.
#> 
#> turnover_head_sub_exe [binary]
#>   Governor Turnover
#>   Whether the governorship changed party control.
#> 
#> cumulative_changes_head_sub_exe [integer]
#>   Cumulative Changes of Governor
#>   Running count of governor changes in the state.
#> 
#> cumulative_years_in_power_sub_exe [numeric]
#>   Governor Years in Power
#>   Cumulative years the incumbent party has held the governorship.
#> 
#> enp_sub_exe [numeric]
#>   Effective Number of Parties (executive)
#>   Effective number of parties (Laakso and Taagepera, 1979) for the executive race.
```

## Downloading data

[`spp_data()`](https://guadag12.github.io/sppdata/reference/spp_data.md)
fetches a dataset from the project’s GitHub Releases mirror and caches
it locally, so it only hits the network once per version.

``` r

sed <- spp_data("SED")
head(sed)
```

By default you get the version this package was built against, which
keeps analyses reproducible. To pull a specific published version:

``` r

sed_v1 <- spp_data("SED", tag = "v1.0")
```

## Managing the cache

``` r

spp_cache_dir()     # where downloads live
spp_cache_clear()   # reclaim the space
```

## Citing the data

The archival, citable copies of the datasets live on Harvard Dataverse.
The GitHub Releases mirror is a convenience download channel only.

``` r

spp_citation()
#> Subnational Politics Project (SPP)
#> ------------------------------------------------------------
#> 
#> NED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Huertas-Hernandez, Sergio; Urdinez, Francisco, 2025, "National Executive Database (NED) (v. 2)", https://doi.org/10.7910/DVN/HNKQUH, Harvard Dataverse, V3
#> 
#> SED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Urdinez, Francisco, 2025, "Subnational Executive Database (SED) (v. 2)", https://doi.org/10.7910/DVN/1D3P3J, Harvard Dataverse, V3
#> 
#> SEED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Huertas-Hernandez, Sergio; Urdinez, Francisco, 2025, "Subnational Executive Elections Database (SEED) (v. 2)", https://doi.org/10.7910/DVN/UPOWMW, Harvard Dataverse, V3
#> 
#> SLED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea, 2025, "Subnational Legislative Elections Database (SLED) (v. 2)", https://doi.org/10.7910/DVN/084FXF, Harvard Dataverse, V3
#> 
#> SDI
#> Giraudy, Agustina, 2025, "Subnational Democracy Index (SDI) (v. 2)", https://doi.org/10.7910/DVN/7TNLBW, Harvard Dataverse, V3
#> 
#> CFTDFLD
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea, 2025, "Capital Federal & Tierra del Fuego Legislatures Database (CFTDFLD) (v. 1)", https://doi.org/10.7910/DVN/AJJLHX, Harvard Dataverse, V2
#> 
#> Codebook (OSF): https://doi.org/10.17605/OSF.IO/H96FD.
#> Site: https://subnationalpolitics.com
```
