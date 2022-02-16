library(tidyverse)

data <- read_csv('./Exp158_processed-data.csv')

data %>% 
  filter(Type == 'Specific' & Benz < 1e-7 & mean > -5) %>% 
  mutate(Time = as.character(Time)) %>% 
  ggplot(aes(x = Benz, y = mean)) +
  theme_bw() +
  theme(strip.background = element_rect(fill = 'white')) +
  geom_errorbar(aes(ymin = lower, ymax = upper)) +
  geom_point() +
  facet_wrap(vars(Time), ncol = 4) +
  labs(
    y = 'Mean specific counts',
    x = 'Benzamil (M)'
  )
ggsave('158_all-timepoints_low-conc.png', width = 6, height = 6)

data %>% 
  filter(Type == 'Specific' & mean > -5) %>% 
  mutate(Time = as.character(Time)) %>% 
  ggplot(aes(x = Benz, y = mean)) +
  theme_bw() +
  theme(strip.background = element_rect(fill = 'white'), panel.grid.minor.x = element_blank()) +
  annotation_logticks(sides = 't') +
  geom_errorbar(aes(ymin = lower, ymax = upper)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(vars(Time), ncol = 4) +
  labs(
    y = 'Mean specific counts',
    x = 'Benzamil (M)'
  )
ggsave('158_all-timepoints.png', width = 6, height = 6)    

