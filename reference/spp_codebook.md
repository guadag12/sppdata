# Consult or download the SPP codebook

By default, returns the variable-level table bundled with the package,
which is available offline. With `download = TRUE`, downloads the
official PDF codebook for the requested GitHub Release (v1.0 or v2.0).
The bundled CSV is not a historical versioned PDF codebook.

## Usage

``` r
spp_codebook(
  dataset = NULL,
  download = FALSE,
  file = NULL,
  version = spp_default_tag()
)
```

## Arguments

- dataset:

  Optional dataset abbreviation, e.g. `"SED"`, to filter the offline
  variable table. Ignored for PDFs only when `NULL`; specify no dataset
  when downloading the full versioned PDF.

- download:

  If `TRUE`, download the official PDF rather than return the bundled
  variable table.

- file:

  Optional destination path for the PDF. Defaults to
  `spp_codebook_v1.pdf` or `spp_codebook_v2.pdf` in the working
  directory.

- version:

  Published codebook version, `"v1.0"` or `"v2.0"`. Used only when
  `download = TRUE`.

## Value

With `download = FALSE`, a data frame (`dataset`, `variable`, `label`,
`type`, `description`). With `download = TRUE`, the path of the saved
PDF (invisibly), or `NULL` if downloading fails.

## Examples

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
if (FALSE) { # \dontrun{
spp_codebook(version = "v1.0", download = TRUE)
spp_codebook(version = "v2.0", download = TRUE)
} # }
```
