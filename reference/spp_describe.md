# Describe the variables in one dataset

Prints the codebook entries for a single dataset in a compact, readable
form. A convenience wrapper over
[`spp_codebook()`](https://guadag12.github.io/sppdata/reference/spp_codebook.md)
for interactive use.

## Usage

``` r
spp_describe(dataset)
```

## Arguments

- dataset:

  Dataset abbreviation, e.g. `"SEDI"` or `"SED"`.

## Value

The filtered codebook data frame, invisibly.

## Examples

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
#> 
```
