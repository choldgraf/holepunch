test_that("Badge works", {
  # Start of the block that needs to be a helper function
  temp_path <- paste0(tempdir(), "/testcompendium")
  dir.create(temp_path, showWarnings = FALSE)
  old_path <- getwd()
  # Note: suppressing warnings here because if I don't I see this:
  # warning: `recursive` is deprecated, please use `recurse` instead
  suppressWarnings(usethis::create_project(path = temp_path, open = FALSE))
  setwd(temp_path)
  git2r::init(temp_path)
  
  # This is a horrifying way to write a config manually, but
  # . ¯\_(ツ)_/¯
  # I don't know a better way for now.
  config <- glue::glue(
    "
[core]
	bare = false
	repositoryformatversion = 0
	filemode = true
	ignorecase = true
	precomposeunicode = true
	logallrefupdates = true
[remote \"origin\"]
	url = git@github.com:user/repo.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch \"master\"]
	remote = origin
	merge = refs/heads/master
"
  )
  fileConn <- file(glue::glue("{temp_path}/.git/config"))
  writeLines(config, fileConn)
  close(fileConn)
  
  cat(
    "```{r}\nlibrary(dplyr)\nrequire(ggplot2)\nglue::glue_collapse(glue::glue('{1:10}'))\n```\n",
    file = paste0(temp_path, "/test.Rmd")
  )
  # End of the block that needs to be a helper function
  expect_true(generate_badge())
  unlink(temp_path)
  setwd(old_path)
})

test_that("Mybinder badge works", {
  source(test_path("common.R"))
  expect_output(
    generate_badge(path = temp_path, hub = "mybinder.org"),
    "https://mybinder.org/v2/gh/user/repo/master"
  )
  expect_output(
    generate_badge(path = temp_path, hub = "mybinder.org"),
    "[Launch Rstudio Binder]"
  )
  expect_output(
    generate_badge(path = temp_path, hub = "binder.pangeo.io"),
    "https://binder.pangeo.io/v2/gh/user/repo/master"
  )

  
  setwd(old_path)
})
