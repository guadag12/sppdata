# Network-touching test. Must never run on the CRAN check farm and must not
# fail when offline — CRAN policy for packages that use internet resources.

test_that("spp_data() downloads and returns a data frame", {
  skip_on_cran()
  skip_if_offline()
  skip_if_not_installed("piggyback")

  sed <- spp_data("SED")
  # If the resource is unreachable, spp_data() returns NULL (by design);
  # skip rather than fail so the suite is robust on flaky networks.
  skip_if(is.null(sed), "SPP data not reachable")

  expect_s3_class(sed, "data.frame")
  expect_true("country_state_code" %in% names(sed))
})
