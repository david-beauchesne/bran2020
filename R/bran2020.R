#' Download BRAN2020 data from NCI data catalog
#'
#' This function is used to access spatially filtered BRAN2020 using a bounding box.
#'
#' @param year years to fetch (starts 1993-01)
#' @param month months to fetch (starts 1993-01)
#' @param var variables to fetch 
#' @param xmin minimum longitude of bounding box in decimal degrees (epsg:4326)
#' @param ymin minimum latitude of bounding box in decimal degrees (epsg:4326)
#' @param xmax maximum longitude of bounding box in decimal degrees (epsg:4326)
#' @param ymax maximum latitude of bounding box in decimal degrees (epsg:4326)
#'
#' @return This function returns the queried raw data, formatted data, metadata and bibtex associated with the raw data.
#'
#' @examples
#' \dontrun{
#' }
#' @export
bran2020 <- function(year, month, var, xmin, ymin, xmax, ymax) {
  # Create URLs
  tm = "0:1:30" # "0:1:30"
  st = "0:1:50" # "0:1:50"
  yu = "0:1:100" # "0:1:1499"
  xu = "0:1:100" # "0:1:3599"
  bs <- "https://dapds00.nci.org.au/thredds/dodsC/gb6/BRAN/BRAN2020/daily/ocean_u_2010_01.nc?"
  urls = glue::glue("{bs}u%5B{tm}%5D%5B{st}%5D%5B{yu}%5D%5B{xu}%5D")
  nc <- ncdf4::nc_open(urls)
  u <- ncdf4::ncvar_get(nc, "u")
  
  # # Download list of urls
  # lapply(
  #   urls,
  #   function(x) curl::curl_download(x, destfile = here::here(output, "ocean_v_1994_02.nc"))
  # )
}
