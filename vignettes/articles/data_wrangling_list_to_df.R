#' ---
#' title: "Convert a list of data frames into one data frame"
#' author: "Ivan Jacob Agaloos Pesigan"
#' data : "February 15, 2020"
#' output: github_document
#' ---

#' ### Generate data

#+ generate_data
generate_data <- function(n_list,
                          n_columns,
                          n_rows) {
  exe <- function(n_columns = n_columns,
                  n_rows = n_rows) {
    as.data.frame(
      replicate(
        n = n_columns,
        expr = rnorm(n = n_rows)
      )
    )
  }
  n_columns <- rep(
    x = n_columns,
    times = n_list
  )
  lapply(
    X = n_columns,
    FUN = exe,
    n_rows = n_rows
  )
}
list_of_dataframes <- generate_data(
  n_list = 10,
  n_columns = 10,
  n_rows = 10
)

#' ### Base R

#+ base
do.call(
  what = "rbind",
  args = list_of_dataframes
)

#' ### dplyr

#+ dplyr
dplyr::bind_rows(
  list_of_dataframes,
  .id = "column_label"
)

#' ### data.table

#+ data.table
data.table::rbindlist(
  l = list_of_dataframes
)

#' ### Benchmark

#+ benchmark
microbenchmark::microbenchmark(
  base = do.call(
    what = "rbind",
    args = list_of_dataframes
  ),
  dplyr = dplyr::bind_rows(
    list_of_dataframes,
    .id = "column_label"
  ),
  data.table = data.table::rbindlist(
    l = list_of_dataframes
  ),
  times = 1000
)
