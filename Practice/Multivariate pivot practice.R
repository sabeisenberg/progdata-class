library(tidyverse)

WHO <- who |>
  select(country:year, starts_with("new_")) |> 
  rename_with(~ stringr::str_replace(.x, "f", "f_"), starts_with("new_")) |> 
  rename_with(~ stringr::str_replace(.x, "m", "m_"), starts_with("new_"))
knitr::kable(WHO, rownames = FALSE)

WHO |> pivot_longer(
  cols = new_sp_m_014:new_ep_f_65,
  names_to = c("diagnosis", "gender", "age"), 
  names_prefix = "new_",
  names_sep = "_",
  values_to = "count"
)

fam_dat <- tribble(
  ~family,  ~dob_child1,  ~dob_child2, ~gender_child1, ~gender_child2,
  1L, "1998-11-26", "2000-01-29",             1L,             2L,
  2L, "1996-06-22",           NA,             2L,             NA,
  3L, "2002-07-11", "2004-04-05",             2L,             2L,
  4L, "2004-10-10", "2009-08-27",             1L,             1L,
  5L, "2000-12-05", "2005-02-28",             2L,             1L,
)
fam_dat <- fam_dat |> mutate_at(vars(starts_with("dob")), parse_date)
fam_dat

fam_dat |> 
  pivot_longer(
    cols = -family,
    names_to = c(".value", "child"), 
    names_sep = "_", 
    values_drop_na = TRUE
  )

fam_dat_long <- fam_dat |> 
  pivot_longer(
    cols = -family,
    names_to = c(".value", "child"), 
    names_sep = "_", 
    values_drop_na = TRUE
  ) |> 
  mutate(child = stringr::str_replace(child, "child", "")) |> 
  mutate(child = as.integer(child))

fam_dat_long |> 
  pivot_wider(id_cols     = family,
              names_from  = c(child, gender), 
              names_prefix = "child",
              names_sep   = "_gender", 
              values_from = dob)

fam_dat_long |> 
  pivot_wider(id_cols     = family, 
              names_from  = child,
              names_prefix = "child",
              names_sep   = "_",
              values_from = c(dob, gender))