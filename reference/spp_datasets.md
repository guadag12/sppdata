# List the SPP datasets

Returns the six relational datasets that make up the Subnational
Politics Project, with their abbreviations and a one-line description.
Use the abbreviation (e.g. `"SED"`) as the `dataset` argument to
[`spp_data()`](https://guadag12.github.io/sppdata/reference/spp_data.md).

## Usage

``` r
spp_datasets()
```

## Value

A data frame with columns `abbrev`, `name`, and `description`.

## Examples

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
