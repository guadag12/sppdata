# These run anywhere: they only touch bundled metadata, never the network.

test_that("spp_datasets() returns the six SPP datasets", {
  ds <- spp_datasets()
  expect_s3_class(ds, "data.frame")
  expect_setequal(ds$abbrev, c("NED", "SED", "SEED", "SLED", "SDI", "CFTDFLD"))
  expect_named(ds, c("abbrev", "name", "description"))
})

test_that("spp_codebook() returns the expected columns", {
  cb <- spp_codebook()
  expect_named(cb, c("dataset", "variable", "label", "type", "description"))
  expect_gt(nrow(cb), 0)
})

test_that("spp_codebook() filters by dataset, case-insensitively", {
  expect_true(all(spp_codebook("sed")$dataset == "SED"))
  expect_error(spp_codebook("NOPE"), "No codebook entries")
})

test_that("spp_describe() returns its data invisibly", {
  out <- withVisible(spp_describe("SED"))
  expect_false(out$visible)
  expect_s3_class(out$value, "data.frame")
})

test_that("spp_data() rejects unknown datasets before any download", {
  expect_error(spp_data("NOTADATASET"), "Unknown dataset")
})
