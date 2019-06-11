library(ggplot2)

year2018 <- c(26.2, 23.4, 32.9, 5.2, 3.1, 15.8)
year2019 <- c(26.2, 24.9, 33.2, 4.6, 2.7, 14.8)

labels <- factor(c("소득세","법인세","부가가치세","교통세","관세","기타"),
                 levels = c("소득세","법인세","부가가치세","교통세","관세","기타"))

group <- factor(c(" 2018"," 2019"))

data <- data.frame(y = c(year2018, year2019),
                   labels = rep(labels, 2),
                   group = rep(group, each=length(year2018)))

p <- ggplot(data, aes(x=labels, y=y, fill=group)) + xlab("항목") + ylab("금액 (조)") + ggtitle("1-4월 세목별 국세수입 규모") +
  geom_bar(stat='identity', position = position_dodge(0.7), width=0.5)+
  scale_fill_manual(values=c("#B0B0B0", "#808080"))+
  geom_text(data=data, aes(x=labels, y=y, label=y), vjust=1.5, size=4, position=position_dodge(0.7),
            color='white')+
  theme(axis.title.x = element_text(size=15, face='bold', margin = margin(t = 20, r = 0, b = 0, l = 0)),
        plot.title = element_text(size=30, hjust=0.5, face='bold', margin = margin(t = 10, r = 0, b = 10, l = 0)),
        legend.position=c(0.85, 0.85),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        legend.text = element_text(size=15),
        legend.title = element_blank(),
        legend.key.height = unit("0.8", "cm"),
        legend.key.size = unit("0.8", "cm"),
        axis.text = element_text(size=15, face='bold'))

p

ggsave("recharted_20190611.png", plot=p, width=10, height=7)
