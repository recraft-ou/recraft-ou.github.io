library(magick)

image_read("images/recraft-transparent-square.png") %>%
  image_trim %>%
#  image_crop("360x600+40+40") %>%
#  image_trim %>%
#  image_background("white") %>%
  image_convert(format = "png", depth = 8) %>%
image_resize("x35") %>%
  image_write("images/logo-small.png")

image_append(stack = FALSE, c(
  image_read("images/recraft-transparent-square.png") %>%
    image_resize("x300") %>% image_trim, #%>%
    #image_background("transparent") %>%
    #image_border("transparent", "18x18")
  image_blank(40, 300, color = "transparent"),
  image_read("images/TERC_logo_label_RGB_transparent.png") %>% 
    image_trim %>% image_resize("x300")
)) %>%
  image_write("images/logo-index.png")


image_read("images/R.png") %>%
    image_trim %>%
#    image_background("white") %>%
    image_convert(format = "png", depth = 8) %>%
  image_resize("32x32") %>%
    image_write("images/favicon.png")

image_read("images/terc.png") %>%
  image_convert(format = "png", depth = 8) %>%
  image_write("images/terc.png")

system("icotool -o favicon.ico -c images/favicon.png")
system("icotool -o images/favicon.ico -c images/favicon.png")
