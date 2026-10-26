# Local cache directory for SPP data

Downloaded datasets are cached here so they are fetched from the network
only once per version. The location follows the CRAN-sanctioned
[`tools::R_user_dir()`](https://rdrr.io/r/tools/userdir.html) convention
and can be overridden with the `sppdata.cache` option or the
`SPPDATA_CACHE` environment variable.

## Usage

``` r
spp_cache_dir()
```

## Value

The cache directory path (character scalar). Created if needed.

## Examples

``` r
spp_cache_dir()
#> [1] "/home/runner/.cache/R/sppdata"
```
