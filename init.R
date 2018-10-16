library(magick)

image_read("images/logo.png") %>%
  image_trim %>%
  image_crop("360x600+40+40") %>% 
  image_trim %>%
  image_background("white") %>%
  image_convert(format = "png", depth = 8) %>%
image_resize("x32") %>%
  image_write("images/favicon.png")

system("icotool -o favicon.ico -c images/favicon.png")
system("icotool -o images/favicon.ico -c images/favicon.png")
