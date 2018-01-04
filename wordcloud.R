library(tidyverse)
library(tidytext)
library(wordcloud)

data(stop_words)
load("tweets.Rdata")

the_wordcloud <- airline_tweets %>%
  dplyr::select(tweet_id, text) %>% 
  unnest_tokens(word, text) %>% 
  anti_join(stop_words) %>% 
  count(word) %>% 
  with(wordcloud(word, n, max.words = 100, use.r.layout = FALSE , colors=brewer.pal(8, "Dark2")))

par(mfrow=c(2,2))

the_wordcloud <- airline_tweets %>% 
  filter(airline_sentiment == 'negative') %>%
  dplyr::select(tweet_id, text) %>% 
  unnest_tokens(word, text) %>% 
  anti_join(stop_words) %>% 
  count(word) %>% 
  with(wordcloud(word, n, max.words = 100, use.r.layout = FALSE , colors=brewer.pal(8, "Dark2")))

the_wordcloud <- airline_tweets %>% 
  filter(airline_sentiment == 'positive') %>%
  dplyr::select(tweet_id, text) %>% 
  unnest_tokens(word, text) %>% 
  anti_join(stop_words) %>% 
  count(word) %>% 
  with(wordcloud(word, n, max.words = 100, use.r.layout = FALSE , colors=brewer.pal(8, "Dark2")))

colnames(airline_tweets)
head(airline_tweets)
