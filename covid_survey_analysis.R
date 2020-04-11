source('styleguide.R')
library(stringr)
df <- read.csv("covid_survey_data.csv")
df$location

ggplot(data=df, aes(x=reorder(location, -table(location)[location]))) + 
  geom_bar(stat="count", fill = primary) + 
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) + 
  theme_hodp() + 
  xlab("Location") + 
  ylab("Count") + 
  labs(title="TODO") 
                   
# Add Logo
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), 
                  width = unit(1.5, 'cm'))

sum(df$location == "On campus with exemption") / length(df$location)
nrow(df)


top10 = names(sort(table(df$concentration)[table(df$concentration) > 1], decreasing = T)[c(1, 3:11)])
df_conc = df[df$concentration  %in% top10, ]

# COLORS TODO
colors = rev(c(primary,primary))

ggplot(data=df_conc, aes(x=reorder(concentration, -table(concentration)[concentration]))) + 
  geom_bar(stat="count", fill = colors) + # put colors here
  scale_x_discrete(labels = function(x) str_wrap(x, width = 25)) + 
  theme_hodp() + 
  theme(axis.text.x = element_text(face = "bold", 
                                   size = 12),
        axis.text.y = element_text(face = "bold", 
                                   size = 8)) +
  coord_flip() + 
  xlab("Count") + 
  ylab("Concentration") + 
  labs(title="TODO") 
                   
# Add Logo
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), 
                  width = unit(1.5, 'cm'))

