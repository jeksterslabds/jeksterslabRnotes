#' ---
#' title: "Compile reports from R scripts"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date : "February 16, 2020"
#' output: github_document
#' ---

#' R scripts can be compiled into reports
#' with the help `roxygen` comments (`#'`).
#' Anything after `#'` will be treated as markdown text.
#'

#' ## Markdown

#' ```
#' #' - This line is rendered as markdown.
#' #' - The next word is rendered in **bold** typeface.
#' #' - The next word is rendered in *italics* typeface.
#' #' - More info on R markdown is available in this [link](https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf).
#' ```

#' - This line is rendered as markdown.
#' - The next word is rendered in **bold** typeface.
#' - The next word is rendered in *italics* typeface.
#' - More info on R markdown is available in this [link](https://rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf).
#'

#' ## YAML

#' The `YAML` preamble can be specified as follows:

#' ```
#' #' ---
#' #' title: "Compile reports from R scripts"
#' #' author: "Ivan Jacob Agaloos Pesigan"
#' #' date: "February 16, 2020"
#' #' output: github_document
#' #' ---
#' ```
#'

#' ## Code chunks

#' Code chunks can be specified using `#+`.
#' For example, the code chunk below is named `plot`
#' with specified figure width and height.

#' ```
#' #+ plot, fig.width=5, fig.height=5
#' plot(iris)
#' ```

#+ plot, echo=FALSE, fig.width=5, fig.height=5
plot(iris)

#' ## Rendering

#' The R script can be rendered, as usual, using the `rmarkdown::render` function.

#' ```
#' rmarkdown::render("Rscript.R")
#' ```
