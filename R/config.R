# Internal configuration -------------------------------------------------
# Single place to change where data is fetched from and which version is
# the default. Edit these when you cut a new GitHub release or deposit a
# new Dataverse version.

# GitHub repo hosting the data as Release assets ("owner/repo").
.spp_repo <- "guadag12/sppdata"
# Default Release tag to download from. Pin users to a known-good version
# so results are reproducible; bump when you publish a new release.
.spp_default_tag <- "latest"

# Archival, citable source (Harvard Dataverse DOI for the whole project).
.spp_dataverse_doi <- "10.17605/OSF.IO/H96FD"

# Codebook / OSF DOI, for the suggested citation.
.spp_osf_doi <- "10.17605/OSF.IO/H96FD."

spp_repo <- function() getOption("sppdata.repo", .spp_repo)
spp_default_tag <- function() getOption("sppdata.tag", .spp_default_tag)
