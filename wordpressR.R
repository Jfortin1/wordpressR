# Code initially provided by John Muschelli and inspired by
# Yihui at http://yihui.name/knitr/demo/wordpress/
# Modified by Jean-Philippe Fortin / 2014 /May 19 


library(knitr)
library(RWordPress)

# 1. Replace "myPassword" by your WP password
password <- "myPassword"

# 2. Replace fortin946 by your WP username
options(WordpressLogin = c(fortin946 = password))

# 3. Replace the "http://jfortinbiostats.com" part by your url
#    but keep the "/xmlrpc.php" part
options( WordpressURL = 'http://jfortinbiostats.com/xmlrpc.php')
  
# 4. wpdir must be the directory path of your rmarkdown document
wpdir <- file.path("~/Dropbox/Wordpress") 
wpdir <- path.expand(wpdir)

# 5. Replace "my_first_post" by your rmarkdown file name
file <- "my_first_post" 
rmdname <- file.path(wpdir, paste0(file, ".Rmd"))

# This will upload the output images to imgur.com so that
# WP will automatically source the images
opts_knit$set(upload.fun = imgur_upload, base.url = NULL) 
opts_chunk$set(fig.width=5, fig.height=5, cache = TRUE)

# 6. This will push your post to WP
#    Set publish=TRUE if you're ready to publish it
knit2wp(input=rmdname, title="My First post", publish=FALSE) 
