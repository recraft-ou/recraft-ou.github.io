
# Deconstructing and reengineering the relational matrix

library(magick)

emomatrix <- 
  "https://kieranhealy.org/files/misc/package_wars.png" %>%
  image_read()

# data for image regions to crop
# :) inspired by TI Extended Basic DATA syntax
# http://www.99er.net/files/TI%20Extended%20Basic%20-%20Linked.pdf 
widths <- c(400, 400, 300, 278, 278)
heights <- c(270, 270, 270, 270, 240)
offsets_w <- cumsum(c(266, 400, 440, 350, 300))
offsets_h <- cumsum(c(226, 270, 270, 270, 270))

# assemble ImageMagick geometry strings
pluspaste <- function(x, y) paste0("+", paste(x, y, sep = "+"))
xpaste <- function(x, y) paste0(x, "x", y)
xy <- outer(offsets_w, offsets_h, pluspaste)
wh <- outer(widths, heights, xpaste)
whxy <- paste0(wh, xy)
dim(whxy) <- c(5, 5)
five <- c("STATA", "R", "SAS", "Python", "SPSS")

# extract and save all sub-images
library(purrr)
res <- map(whxy, function(x) image_crop(emomatrix, x))
dim(res) <- c(5, 5)
colnames(res) <- rownames(res) <- five

# R "as seen by" STATA
res["R", "STATA"]




res <- map(whxy, function(x) image_crop(memematrix, x) %>% 
  image_resize("x240") %>% image_write(paste0("statwars-", x, ".png")))

# The emomatrix
# the data is "relational data" - data describing a relationship between two communities
# for instance: the python community sees the R community as this meme which evokes these emotions
# so an emotional matrix - emomatrix

# webemomatrix

library(DT)

datatable(iris, colnames = c(ID = 1), extensions = c('ColReorder', 'RowReorder'), 
          options = list(colReorder = TRUE, rowReorder = TRUE, escape = FALSE))


# The memematrix - A future evolution of the emomatrix
# the data again is caricaturized relationship data - describing an opinion related to a specific concept with a particular community
# for instance: the R community would use this meme indicating its self-image while the Python community would use this one etc for all other involved communities... 



library(rvest)
library(httr)
library(tibble)
library(stringr)
library(dplyr)
templates <- content(GET("https://memegen.link/api/templates/"))
templates <- data_frame(title = names(templates), url = unlist(templates))

templates %>% mutate(is_hit = str_detect(title, "Boyfriend")) %>%
  filter(is_hit)


str_detect(templates$title, "Boyfriend")


library(readr)

imagedata <- read_delim(delim = ";", trim_ws = TRUE, file = "emo; url
IBM Business Automation Content Analyzer on Cloud; https://www.bpm.ibmcloud.com/images/baca/card3.jpg
A Rube Goldberg Machine; https://education.pasco.com/epub/PhysicsNGSS/Images/SB/23/LR/RubeGoldebergMachine.png
IBM 1800 DACS; http://www.opendragon.ca/Images/001_05_12_0006.jpg
Tech Bro Says You Just Do Not Understand the Blockchain; https://mondrian.mashable.com/uploads%252Fcard%252Fimage%252F877740%252F87e3e914-63e0-43f1-a53a-5d4cb1b12cc8.jpg%252F950x534__filters%253Aquality%252890%2529.jpg?signature=vin5OtSuozuc6naKbxCh0A85xhU=&source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com
YMCA; https://www.ymcala.org/sites/default/files/styles/node_teaser/public/2017-11/Graduates.jpg?itok=S2kLygK0
Giphy Monkey Stuff; http://cdn.lowgif.com/full/ba25ae8ed81cebe8-monkey-typing-gifs-tenor.gif
The Matrix 4 Rebooted; https://fsmedia.imgix.net/25/59/a1/34/315d/495a/9c0c/66b36664c23c/the-matrix6jpg.jpeg?rect=0%2C0%2C1920%2C960&auto=format%2Ccompress&w=650
SAGE; https://image.slidesharecdn.com/startsmall-staysmall-130829072518-phpapp01/95/start-small-stay-small-4-638.jpg?cb=1377768482
Distracted Boyfriend; https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fi.imgflip.com%2F1v1xf4.jpg&f=1
Spongebob and Patrick Are Best Friends Forever; https://static.artfire.com/uploads/images/561/45f/d3b/bee/large/56145fd3bbeea01212bff0e3a516eb506cc7ad63335596adb76006e5bcfd6ed0.jpg
European Teenage Business Man; https://image.shutterstock.com/image-photo/european-appearance-teenager-boy-business-450w-326683721.jpg
Avalon - Where Excalibur Gets Forged - Messy Computer Desk; https://c7.alamy.com/comp/A3NY2A/messy-computer-desk-A3NY2A.jpg
Analytics Dashboard; https://www.rythmos.com/hs-fs/hubfs/BI%20TOOLS%20BLOG.jpg?width=600&name=BI%20TOOLS%20BLOG.jpg
Tech Bro Says You Just Do Not Understand the Blockchain; https://mondrian.mashable.com/uploads%252Fcard%252Fimage%252F877740%252F87e3e914-63e0-43f1-a53a-5d4cb1b12cc8.jpg%252F950x534__filters%253Aquality%252890%2529.jpg?signature=vin5OtSuozuc6naKbxCh0A85xhU=&source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com
Baby with Laptop Feels Confused; http://image.shutterstock.com/display_pic_with_logo/237994/237994,1315555947,1/stock-photo-baby-with-laptop-confused-84320152.jpg
I Hate New Excel; https://www.insightsquared.com/wp-content/uploads/2012/04/i-hate-excel.png
The Homer - Your Dream Car With All Features; https://laughingsquid.com/wp-content/uploads/2014/05/14104880051_92d6e1f922_z.jpg
Comptometer; https://upload.wikimedia.org/wikipedia/commons/f/ff/Mechanical-Calculator.png
Tech Bro Says You Just Do Not Understand the Blockchain; https://mondrian.mashable.com/uploads%252Fcard%252Fimage%252F877740%252F87e3e914-63e0-43f1-a53a-5d4cb1b12cc8.jpg%252F950x534__filters%253Aquality%252890%2529.jpg?signature=vin5OtSuozuc6naKbxCh0A85xhU=&source=https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com
Correct Execution of the Process; https://image.shutterstock.com/image-vector/operator-controlling-correct-execution-process-450w-186044081.jpg
I Hate Old Excel; https://www.insightsquared.com/wp-content/uploads/2012/04/i-hate-excel.png
IBM Selective Sequence Electronic Calculator (SSEC)- Electromechanical Computing technology from 1959; https://slideplayer.fr/slide/3696889/12/images/13/1959.jpg
HAL 900 Eye; http://www.synthstuff.com/mt/archives/2008/Eye_HAL9000.jpg
African Rock Python; https://upload.wikimedia.org/wikipedia/commons/8/80/Python_sebae_head2a.jpg
Homework for Schoolkids; https://www.quill.com/is/image/Quill/JV53677_s7?$img400$
")

imagedata 

id <- imagedata %>% bind_cols(data_frame(
    alt = as.vector(outer(five, five, function(x, y) paste0(x, " as seen by ", y))),
    from = as.vector(outer(five, five, function(x, y) paste0(x))),
    to = as.vector(outer(five, five, function(x, y) paste0(y)))
  )
) %>%
#  mutate(imgfile = paste0("<img height=52 src='file:///home/roger/repos/recraft-ou.github.io/", as.character(res), "'></img>")) %>%
  mutate(imgurl = paste0("<a href='", url, "'><img height=52 title='", emo, "' src='", url, "'/></a>"))

library(tidyr)

res <- id %>% select(from, to, imgurl) %>% spread(from, imgurl) %>% rename(Community = to)

datatable(res, escape = FALSE, rownames = FALSE, filter = 'none', class = "compact",
          options = list(searching = FALSE, paging = FALSE, ordering = FALSE, info = FALSE,
                         columnDefs = list(list(className = 'dt-left', targets = 0:5))))


The images contain information in the form of inside jokes - not easy to get but with emotional content that an be understood by insiders.

Inside jokes - the emotional content can only be understood by insiders. Can an emotional API be used to automate the deciphering the meanings of these images better? Then be reencoded using a meme API?
  
  