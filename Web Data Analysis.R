

data <- readxl::read_excel('internet_dataset.xlsx')

summary(data)

sum(is.null(data))

#see if there is correlation vetween vairables
library(dplyr)

data_cor <- cor(data %>% select(- c(Continent, Sourcegroup)))
corrplot::corrplot(data_cor)


#is unique page view depend on visits?

#from the correlation plot above there is a clear relationship, but we will do corellation test between those 
#two variables to see the exact number
cor_test <- cor.test(data$Uniquepageviews, data$Visits)
cor_test



#why user leaves website for a session and moves on to another one?

exits_a <- aov(Exits ~ ., data = data)
exits_a


#Find the variables which possibly have an effect on the time on page.

timeOnPage_aov <- aov(Timeinpage ~ ., data = data)
timeOnPage_aov


#what factors are impacting the bounce?

bounce_aov <- aov(Bounces ~ . , data = data)
summary(glm(bounce_aov))


























