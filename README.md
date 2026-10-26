# sppdata <img src="man/figures/logo.png" align="right" height="138" />

Access to the **Subnational Politics Project (SPP)** datasets from R.

`sppdata` lets you download the SPP's harmonized subnational political datasets
for Argentina, Brazil, and Mexico, and browse their variables offline. Data is
fetched on demand from a GitHub Releases mirror and cached locally; the
archival, citable copies live on [Harvard Dataverse](https://dataverse.harvard.edu/).

## Installation

From r-universe (recommended while in development):

```r
install.packages("sppdata", repos = "https://subnationalpolitics.r-universe.dev")
```

Or from GitHub:

```r
# install.packages("pak")
pak::pak("guadag12/sppdata")
```

## Usage

```r
library(sppdata)

spp_datasets()        # the six SPP datasets
spp_codebook("SED")   # variables in one dataset (offline)
spp_describe("SED")   # printed, readable view

sed <- spp_data("SED")  # download + cache
head(sed)

spp_citation()        # how to cite
```

## Datasets

| Abbrev  | Name |
|---------|------|
| NED     | National Executive Database |
| SED     | Subnational Executive Database |
| SEED    | Subnational Executive Elections Database |
| SLED    | Subnational Legislative Elections Database |
| SDI     | Subnational Democracy Indices |
| CFTDFLD | Capital Federal & Tierra del Fuego Legislatures Database |

## How it works

- **Download channel:** GitHub Releases, via the `piggyback` package.
- **Cache:** `tools::R_user_dir("sppdata", "cache")`; clear with `spp_cache_clear()`.
- **Archival source:** Harvard Dataverse (versioned DOIs) — the citable copy.
- **Codebook:** bundled as a CSV, so it works with no network.

## License

MIT. See `LICENSE`.
