install.packages("usethis")
usethis::use_git()

library(usethis)
use_git_config(user.name = "Isabelle Gibson", user.email = "igibson@umd.edu")
usethis::use_git()

#pull any changes made and stored in your github repository 
#add those changes to your staging area, save all changes (select the paths, green means added)

library(usethis)
use_git_config(user.name = "Isabelle Gibson", user.email = "igibson@umd.edu")
usethis::create_github_token()
gitcreds::gitcreds_set()
