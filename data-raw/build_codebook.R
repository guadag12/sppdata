# data-raw/build_codebook.R
# ---------------------------------------------------------------------------
# Regenerate inst/extdata/spp_codebook.csv from the authoritative OSF codebook,
# and (optionally) prepare the dataset files you attach to a GitHub Release.
#
# This script is NOT part of the installed package. Run it by hand when the
# codebook or the data changes, then commit the updated CSV.
# ---------------------------------------------------------------------------

# 1. CODEBOOK ---------------------------------------------------------------
# Replace this with however you extract the codebook from OSF (DOI 10.17605/
# OSF.IO/H96FD). The target is a tidy data frame with exactly these columns:
#   dataset, variable, label, type, description
#
# For example, if you maintain the codebook as a spreadsheet:
#
#   cb <- readxl::read_excel("~/Dropbox/SPP/codebook_master.xlsx")
#   cb <- cb[, c("dataset", "variable", "label", "type", "description")]
#   write.csv(cb, "inst/extdata/spp_codebook.csv", row.names = FALSE,
#             fileEncoding = "UTF-8")
#
# The CSV currently in inst/extdata is a seeded subset of the real v2 variables
# (SED / SEED / SLED / SDI / NED). Fill it out to the full variable list.


# 2. DATASET REGISTRY -------------------------------------------------------
# inst/extdata/spp_datasets.csv maps each dataset abbreviation to the asset
# file name on the GitHub Release. Keep `file` in sync with what you upload.


# 3. PREPARE + PUBLISH RELEASE ASSETS ---------------------------------------
# Save each dataset as .rds (fast native load) and attach to a GitHub Release.
# Run once per version; bump .spp_default_tag in R/config.R to match.
#
#   library(piggyback)
#   tag  <- "v1.0"
#   repo <- "subnationalpolitics/sppdata"
#
#   # Assuming you have the cleaned frames in memory:
#   saveRDS(ned,     "ned.rds")
#   saveRDS(sed,     "sed.rds")
#   saveRDS(seed,    "seed.rds")
#   saveRDS(sled,    "sled.rds")
#   saveRDS(sdi,     "sdi.rds")
#   saveRDS(cftdfld, "cftdfld.rds")
#
#   pb_new_release(repo, tag)                       # create the release once
#   pb_upload(c("ned.rds","sed.rds","seed.rds",
#               "sled.rds","sdi.rds","cftdfld.rds"),
#             repo = repo, tag = tag)
#
# The archival copies stay on Dataverse; GitHub Releases is just the fast
# download channel the package calls.
