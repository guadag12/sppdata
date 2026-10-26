# How to cite the SPP

Prints the official Harvard Dataverse citation for each dataset. Pass a
dataset abbreviation to print just that one.

## Usage

``` r
spp_citation(dataset = NULL)
```

## Arguments

- dataset:

  Optional abbreviation (e.g. "SED"). If omitted, prints the citation
  for every dataset.

## Value

Invisibly, `NULL`.

## Examples

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
spp_citation("SED")
#> Subnational Politics Project (SPP)
#> ------------------------------------------------------------
#> 
#> SED
#> Giraudy, Agustina; Gonzalez, Guadalupe Andrea; Urdinez, Francisco, 2025, "Subnational Executive Database (SED) (v. 2)", https://doi.org/10.7910/DVN/1D3P3J, Harvard Dataverse, V3
#> 
#> Codebook (OSF): https://doi.org/10.17605/OSF.IO/H96FD.
#> Site: https://subnationalpolitics.com
```
