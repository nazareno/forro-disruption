  library("readr")
  library("ggplot2")
  library("tidyr")
  
  songs <- read_csv("data/songs_decade.csv") %>%
    gather("scenario", "value", 2:3) %>%
    dplyr::mutate(Decade = as.character(Decade)) %>% 
    dplyr::filter(Decade != "Total")
  
  songs$scenario <- factor(songs$scenario, levels = c("Before Correction", "After Correction"))
  
  p1 <- ggplot(songs, aes(Decade, value, fill = scenario)) + 
    geom_bar(stat = "identity", position = position_dodge()) + 
    theme_bw(base_size = 14) + 
    theme(legend.position = "top",  
          legend.background = element_rect(size=0.1)) + 
    ylab("Number of songs") +
    xlab(NULL) +
    scale_fill_brewer(palette = "Dark2", "") + 
    scale_y_continuous(breaks = seq(0, 7000, 1000))
  
  p1
  ggsave(plot = p1,  "data/histogram-songs_v2.png", width = 6, height = 3.5)  
  
  
  albums <- read_csv("data/albums_decade.csv") %>%
    gather("scenario", "value", 2:3) %>%
    dplyr::mutate(Decade = as.character(Decade)) %>% 
    dplyr::filter(Decade != "Total")
  
  albums$scenario <- factor(songs$scenario, levels = c("Before Correction", "After Correction"))
  
  p2 <- ggplot(albums, aes(Decade, value, fill = scenario)) + 
    geom_bar(stat = "identity", position = position_dodge()) + 
    theme_bw(base_size = 14) + 
    theme(legend.position = "top", 
          legend.background = element_rect(size=0.1)) + 
    ylab("Number of albums") + 
    xlab(NULL) +
    scale_fill_brewer(palette = "Dark2", "") + 
    scale_y_continuous(breaks = seq(0, 600, 100), limits = c(0, 600))
  
  p2
  ggsave(plot = p2,  "data/histogram-albums_v2.png", width = 6, height = 3.5)  
  
      
