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
