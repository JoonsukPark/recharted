library(ggplot2)
data <- read.csv("unemployment_rate.csv")
data2 <- read.csv("unemployment_rate2.csv")

data$Month <- as.Date(data$Month)
data2$Month <- as.Date(data2$Month)

p <- ggplot(data, aes(x=Month, y=Unemployment_Rate, color=Country)) + geom_line(lwd=1.2)+
  scale_x_date(date_breaks = "1 year", date_labels="%Y/%b") + xlab("½Ã±â") + ylab("½Ç¾÷·ü")+
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title.x = element_text(size=15), axis.title.y = element_text(size=15),
        legend.text = element_text(size=15), legend.title = element_text(size=15),
        panel.border = element_rect(linetype = "solid", fill=NA),
        panel.grid.major = element_line(color='grey', linetype='dashed'))

p2 <- ggplot(data2, aes(x=Month, y=Unemployment_Rate, color=Country)) + geom_line(lwd=1.2)+
  scale_x_date(date_breaks = "1 year", date_labels="%Y/%b") + xlab("½Ã±â") + ylab("½Ç¾÷·ü")+
  theme(axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),
        axis.title.x = element_text(size=15), axis.title.y = element_text(size=15),
        legend.text = element_text(size=15), legend.title = element_text(size=15),
        panel.border = element_rect(linetype = "solid", fill=NA),
        panel.grid.major = element_line(color='grey', linetype='dashed'))+
        geom_vline(xintercept = "2018-06-01", linetype="dotted", color = "blue", size=1.5)
  

ggsave('unemployment_rate.png', p, width=8, height=5)
ggsave('unemployment_rate2.png', p2, width=8, height=5)
