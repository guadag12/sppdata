# Clear the SPP data cache

Removes cached datasets. CRAN policy requires that cached contents be
actively managed, so this gives users a simple way to reclaim the space.

## Usage

``` r
spp_cache_clear(tag = NULL)
```

## Arguments

- tag:

  Optional release tag. If supplied, only that version's cache is
  cleared; otherwise the whole cache is emptied.

## Value

Invisibly, `TRUE` on success.

## Examples

``` r
# \donttest{
spp_cache_clear()
#> Cleared SPP cache: /home/runner/.cache/R/sppdata
# }
```
