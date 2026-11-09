# sppdata

Access to the **Subnational Politics Project (SPP)** datasets from R.

`sppdata` lets you explore and download harmonized subnational political
datasets for Argentina, Brazil, and Mexico. Data are fetched on demand
and cached locally; the archival, citable copies are hosted on [Harvard
Dataverse](https://dataverse.harvard.edu/dataverse/spp/).

**Project website:**
[subnationalpolitics.com](https://www.subnationalpolitics.com/)

## Installation

``` r

# Development version
install.packages("pak")
pak::pak("guadag12/sppdata")
```

## Getting started

``` r

library(sppdata)

spp_datasets()                     # available datasets
spp_codebook("SED")              # inspect variables offline
spp_codebook(download = TRUE)     # save the codebook

sed <- spp_data("SED")            # download SED
head(sed)

spp_citation("SED")              # citation and DOI
spp_citation()                   # all citations and DOIs
```

## Datasets

| Abbreviation | Dataset                                                  |
|--------------|----------------------------------------------------------|
| NED          | National Executive Database                              |
| SED          | Subnational Executive Database                           |
| SEED         | Subnational Executive Elections Database                 |
| SLED         | Subnational Legislative Elections Database               |
| SDI          | Subnational Democracy Indices                            |
| CFTDFLD      | Capital Federal & Tierra del Fuego Legislatures Database |

See the [Getting started
vignette](https://guadag12.github.io/sppdata/articles/getting-started.html)
for a mapping example, or visit the [SPP interactive
website](https://www.subnationalpolitics.com/) to explore the data
visually.

## Authors

Guadalupe Gonzalez (author and maintainer) and Agustina Giraudy
(author). Additional team members are credited as contributors in the
package metadata.

## License

MIT. See `LICENSE`.
