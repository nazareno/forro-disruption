
import_data <- function(){
    d = read_delim(here::here("data/raw/dados do ismir/ranking - t090 - w10 -  warmup.txt"), 
                   delim = "|", 
                   col_names = F)
    d2 = d %>% 
        mutate(X2 = str_trim(X2)) %>% 
        separate(X2, sep = "-", into = c("year", "artist", "year2", "album"), remove = F) %>% 
        mutate(year = as.integer(str_remove_all(year, "[\\[\\]]")), 
               data = str_extract(X3, "(?<=\\[).+?(?=\\])")) %>% 
        separate(data, sep = ",", into = c("i", "j", "k", "D")) %>% 
        select(X1, X2, year, artist, album, song = X3, i, j, k, D)
    
    d2 %>% 
        write_csv(here::here("data/disruptions.csv"))
}

read_projectdata <- function(){

}
