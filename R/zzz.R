.onLoad <- function(libname, pkgname) {
  # nocov start

  shiny::addResourcePath(
    "blockr-bi-js",
    system.file("js", package = pkgname)
  )
  shiny::addResourcePath(
    "blockr-bi-css",
    system.file("css", package = pkgname)
  )

  register_bi_blocks()
  echart_theme_blockr_bi()
  register_drilldown_ai_effect()

  invisible(NULL)
} # nocov end

.onAttach <- function(libname, pkgname) {
  # nocov start
  packageStartupMessage(
    "blockr.bi is DEPRECATED and no longer maintained.\n",
    "It has been renamed and moved to 'blockr.viz':\n",
    "  https://github.com/BristolMyersSquibb/blockr.viz\n",
    "Please switch with: pak::pak(\"BristolMyersSquibb/blockr.viz\")"
  )
  invisible(NULL)
  # nocov end
}
