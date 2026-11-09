# CRAN audit — sppdata (2026-11-09)

## Corrections made

- Kept only four exported functions: `spp_data()`, `spp_datasets()`, `spp_codebook()`, `spp_citation()`.
- Internal cache/describe helpers remain non-exported and do not execute as examples during checks.
- The downloader now defaults to the published GitHub release tag `v2.0`, instead of floating `latest`.
- The network-requiring `spp_data()` example is wrapped in `\dontrun{}`; it is shown to users without contacting GitHub during CRAN example checks.
- Added cross-platform R-CMD-check GitHub Actions (R release on Ubuntu/Windows/macOS plus R devel).
- Kept the original minimal pkgdown style, without a large homepage map.

## Blocking checks not performed in this environment

R is not installed here. We have NOT run `R CMD build`, `R CMD check --as-cran`, testthat or a rendered pkgdown build. GitHub has not been updated or deployed.

## Checks needed before submitting

1. Replace/confirm the maintainer email in DESCRIPTION with a reachable address for CRAN correspondence (current address is a GitHub noreply placeholder).
2. Verify each of the six `*.rds` assets actually downloads correctly from release `v2.0`; inspect columns and data types.
3. Validate all six Harvard Dataverse citations/DOIs against the published deposit, and the OSF codebook DOI.
4. Confirm the bundled 2.7 KB codebook is the intended **complete** codebook; if not, replace it with the complete version.
5. Run `devtools::document()` and inspect generated help pages; then run `devtools::check(cran=TRUE)` and resolve every ERROR/WARNING/NOTE.
6. Run GitHub Actions check across all target OS; verify pkgdown builds, then configure GitHub Pages to publish `gh-pages` (root).
7. Verify the resulting pages and accessible DOI links before CRAN release.

## Local R commands

```r
install.packages(c("devtools", "roxygen2", "pkgdown"))
devtools::document()
devtools::check(cran = TRUE)
pkgdown::build_site()
```

## GitHub Pages

The existing `.github/workflows/pkgdown.yaml` deploys `docs/` to branch `gh-pages` on a push to `master`. In GitHub: Settings > Pages > Build and deployment > Deploy from a branch > `gh-pages` / `(root)`. Review the Actions logs before trusting the public site.
