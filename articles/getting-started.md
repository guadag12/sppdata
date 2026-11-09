# Getting started with sppdata

``` r

library(sppdata)
```

## About the Subnational Politics Project

The [Subnational Politics Project
(SPP)](https://www.subnationalpolitics.com/) provides harmonized
subnational political data for Argentina, Brazil, and Mexico.

The `sppdata` package facilitates access to six datasets covering
subnational political institutions, elections, and democracy.

## Available datasets

To explore the datasets available through the package:

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

## Exploring variables

The package provides access to the SPP codebook, which documents the
variables included in each dataset.

You can explore variables directly in R without an internet connection:

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

# Explore variables for a specific dataset
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

The official PDF codebooks are also available for download. Each version
corresponds to a published release of the SPP datasets.

``` r

# Download the official v1.0 codebook
spp_codebook(version = "v1.0", download = TRUE)

# Download the official v2.0 codebook
spp_codebook(version = "v2.0", download = TRUE)
```

## Downloading data

Use
[`spp_data()`](https://guadag12.github.io/sppdata/reference/spp_data.md)
to download datasets from the project’s GitHub Releases. Downloaded
datasets are cached locally to avoid unnecessary downloads.

``` r

sed <- spp_data("SED")

head(sed)
```

You can also request a specific published version:

``` r

sed_v1 <- spp_data("SED", tag = "v1.0")
```

## Mapping subnational politics

SPP provides geographic boundaries for subnational units in Argentina,
Brazil, and Mexico.

The boundaries can be downloaded from the SPP v2.0 release.

``` r

library(sf)
library(ggplot2)

url <- paste0(
  "https://github.com/guadag12/sppdata/releases/",
  "download/v2.0/map_subnational_units.geojson"
)

map_file <- tempfile(fileext = ".geojson")

download.file(url, map_file, mode = "wb")

map <- sf::st_read(map_file, quiet = TRUE)

ggplot(map) +
  geom_sf(fill = "#E9ECEF", color = "white", linewidth = 0.2) +
  theme_void()
```

## Citing SPP data

The archival versions of the SPP datasets are hosted on Harvard
Dataverse.

Use
[`spp_citation()`](https://guadag12.github.io/sppdata/reference/spp_citation.md)
to retrieve citation information and DOIs for the datasets and codebook.

``` r

spp_citation()
#> Subnational Politics Project (SPP)
#> ------------------------------------------------------------
#> 
#> NED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Huertas-Hernandez, Sergio; Urdinez, Francisco, 2025, "National Executive Database (NED) (v. 2)", https://doi.org/10.7910/DVN/HNKQUH, Harvard Dataverse, V3
#> DOI: https://doi.org/10.7910/DVN/HNKQUH
#> 
#> SED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Urdinez, Francisco, 2025, "Subnational Executive Database (SED) (v. 2)", https://doi.org/10.7910/DVN/1D3P3J, Harvard Dataverse, V3
#> DOI: https://doi.org/10.7910/DVN/1D3P3J
#> 
#> SEED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Huertas-Hernandez, Sergio; Urdinez, Francisco, 2025, "Subnational Executive Elections Database (SEED) (v. 2)", https://doi.org/10.7910/DVN/UPOWMW, Harvard Dataverse, V3
#> DOI: https://doi.org/10.7910/DVN/UPOWMW
#> 
#> SLED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea, 2025, "Subnational Legislative Elections Database (SLED) (v. 2)", https://doi.org/10.7910/DVN/084FXF, Harvard Dataverse, V3
#> DOI: https://doi.org/10.7910/DVN/084FXF
#> 
#> SDI
#> Giraudy, Agustina, 2025, "Subnational Democracy Index (SDI) (v. 2)", https://doi.org/10.7910/DVN/7TNLBW, Harvard Dataverse, V3
#> DOI: https://doi.org/10.7910/DVN/7TNLBW
#> 
#> CFTDFLD
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea, 2025, "Capital Federal & Tierra del Fuego Legislatures Database (CFTDFLD) (v. 1)", https://doi.org/10.7910/DVN/AJJLHX, Harvard Dataverse, V2
#> DOI: https://doi.org/10.7910/DVN/AJJLHX
#> 
#> Codebook (OSF): https://doi.org/10.17605/OSF.IO/H96FD
#> Site: https://www.subnationalpolitics.com/
```

For additional information, visit the [Subnational Politics Project
website](https://www.subnationalpolitics.com/).
