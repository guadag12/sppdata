# sppdata <img src="man/figures/logo.png" align="right" height="138" />

Access to the **Subnational Politics Project (SPP)** datasets from R.

The [Subnational Politics Project](https://www.subnationalpolitics.com/) provides harmonized subnational political data for Argentina, Brazil, and Mexico.

`sppdata` facilitates access to datasets on political institutions, elections, and subnational democracy. Data is downloaded from GitHub Releases and cached locally, while archival and citable versions are hosted on [Harvard Dataverse](https://dataverse.harvard.edu/dataverse/spp/).

## Installation

Install the development version from GitHub:

```r
# install.packages("pak")
pak::pak("guadag12/sppdata")
```

## Getting started

```r
library(sppdata)

# Explore available datasets
spp_datasets()

# Download a dataset (default: v2.0)
sed <- spp_data("SED")
head(sed)

# Download an earlier version
sed_v1 <- spp_data("SED", tag = "v1.0")
```

## Available datasets

| Dataset | Description | v1.0 | v2.0 |
|---------|-------------|------|------|
| NED | National Executive Database | Yes | Yes |
| SED | Subnational Executive Database | Yes | Yes |
| SEED | Subnational Executive Elections Database | Yes | Yes |
| SLED | Subnational Legislative Elections Database | Yes | Yes |
| SDI | Subnational Democracy Indices | Yes | Yes |
| CFTDFLD | Capital Federal & Tierra del Fuego Legislatures Database | Yes | — |

The latest release is `v2.0`. The `CFTDFLD` dataset is available in `v1.0`.

## Codebooks

The package provides access to the SPP codebooks, including downloadable PDFs for both published versions.

```r
# Explore variables directly in R
spp_codebook("SED")

# Download official PDF codebooks
spp_codebook(version = "v1.0", download = TRUE)
spp_codebook(version = "v2.0", download = TRUE)
```

The PDF codebooks are distributed through [GitHub Releases](https://github.com/guadag12/sppdata/releases).

## Geographic boundaries

Geographic boundaries for subnational units in Argentina, Brazil, and Mexico are available as a GeoJSON file.

Download the boundaries directly from the [v2.0 release](https://github.com/guadag12/sppdata/releases/download/v2.0/map_subnational_units.geojson).

Example using R:

```r
library(sf)
library(ggplot2)

url <- paste0(
  "https://github.com/guadag12/sppdata/releases/",
  "download/v2.0/map_subnational_units.geojson"
)

map_file <- tempfile(fileext = ".geojson")
download.file(url, map_file, mode = "wb")

map <- st_read(map_file, quiet = TRUE)

ggplot(map) +
  geom_sf(fill = "#E9ECEF", color = "white", linewidth = 0.2) +
  theme_void()
```

## Citation

To retrieve citation information and DOIs for SPP datasets and documentation:

```r
spp_citation()
```

When using SPP data in academic research, please cite the relevant dataset version and its archival record on Harvard Dataverse.

## Data availability

- **Project website:** https://www.subnationalpolitics.com/
- **Documentation:** https://guadag12.github.io/sppdata/
- **Data downloads:** https://github.com/guadag12/sppdata/releases
- **Archival repository:** https://dataverse.harvard.edu/dataverse/spp/

## Authors

**Guadalupe Gonzalez** — Author and maintainer

**Agustina Giraudy** — Author

Additional research team members are acknowledged as contributors in the package documentation.

## License

MIT. See `LICENSE`.
