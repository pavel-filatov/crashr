library(tidyverse)
library(rvest)


url_football <- "https://datahub.io/sports-data/english-premier-league"


if (!dir.exists("data/epl")) {
  dir.create("data/epl", recursive = TRUE)
}

read_html(url_football) %>% 
  html_node("body") %>% 
  html_nodes("a") %>% 
  html_attr("href") %>% 
  keep(str_detect, "season.*\\.csv") %>% 
  unique() %>% 
  paste0("https://datahub.io", .) %>%
  set_names(.) %>% 
  map(str_replace, "(.+)(/season.+\\.csv)", "data/epl\\2") %>% 
  iwalk(~ download.file(.y, .x))
