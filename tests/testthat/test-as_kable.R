context("test-as_kable")
testthat::skip_on_cran()

test_that("tbl_summary", {
  expect_error(tbl_summary(trial) %>% as_kable(), NA)
  expect_warning(tbl_summary(trial) %>% as_kable(), NA)
})

test_that("tbl_summary", {
  expect_error(tbl_summary(trial) %>% as_kable(return_calls = TRUE), NA)
  expect_warning(tbl_summary(trial) %>% as_kable(return_calls = TRUE), NA)
})

test_that("tbl_regression", {
  expect_error(lm(marker ~ age, trial) %>% tbl_regression() %>% as_kable(), NA)
  expect_warning(lm(marker ~ age, trial) %>% tbl_regression() %>% as_kable(), NA)
})

test_that("tbl_uvregression", {
  expect_error(trial %>% tbl_uvregression(method = lm, y = age) %>% as_kable(), NA)
  expect_warning(trial %>% tbl_uvregression(method = lm, y = age) %>% as_kable(), NA)
})

test_that("tbl_survfit", {
  library(survival)
  fit1 <- survfit(Surv(ttdeath, death) ~ trt, trial)

  expect_error(tbl_survfit(fit1, times = c(12, 24), label = "{time} Months") %>% as_kable(), NA)
  expect_warning(tbl_survfit(fit1, times = c(12, 24), label = "{time} Months") %>% as_kable(), NA)
})


test_that("tbl_merge/tbl_stack", {
  library(survival)
  t1 <-
    glm(response ~ trt + grade + age, trial, family = binomial) %>%
    tbl_regression(exponentiate = TRUE)
  t2 <-
    coxph(Surv(ttdeath, death) ~ trt + grade + age, trial) %>%
    tbl_regression(exponentiate = TRUE)
  tbl_merge_ex1 <-
    tbl_merge(
      tbls = list(t1, t2),
      tab_spanner = c("**Tumor Response**", "**Time to Death**")
    )

  tbl_stack_ex1 <-
    tbl_stack(
      tbls = list(t1, t2),
      group_header = c("**Tumor Response**", "**Time to Death**")
    )

  expect_error(tbl_merge_ex1 %>% as_kable(), NA)
  expect_warning(tbl_merge_ex1 %>% as_kable(), NA)
  expect_error(tbl_stack_ex1 %>% as_kable(), NA)
  expect_warning(tbl_stack_ex1 %>% as_kable(), NA)

})
