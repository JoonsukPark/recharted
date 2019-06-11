library(ggplot2)

year2018 <- c(26.2, 23.4, 32.9, 5.2, 3.1, 15.8)
year2019 <- c(26.2, 24.9, 33.2, 4.6, 2.7, 14.8)

labels <- factor(c("소득세","법인세","부가가치세","교통세","관세","기타"),
                 levels = c("소득세","법인세","부가가치세","교통세","관세","기타"))

group <- factor(c(" 2018"," 2019"))

data <- data.frame(y = c(year2018, year2019),
                   labels = rep(labels, 2),
                   group = rep(group, each=length(year2018)))

p <- ggplot(data, aes(x=labels, y=y, fill=group)) + xlab("항목") + ylab("금액 (조)")+
  geom_bar(stat='identity', position = position_dodge(0.7), width=0.5)+
  scale_x_discrete(expand=c(0,0))+scale_y_continuous(expand=c(0,0))+
  scale_fill_manual(name="1-4월 세목별 국세수입 규모", values=c("#B0B0B0", "#808080"))+
  ylim(0,35)+
  geom_text(data=data, aes(x=labels, y=y, label=y), vjust=1.5, size=1, position=position_dodge(0.7),
            color='white')+
  theme(axis.title.x = element_text(size=5, face='bold'),
        plot.title = element_text(size=5, hjust=0.5, face='bold'),
        legend.position=c(0.85, 0.8),
        axis.title.y=element_blank(),
        axis.text.x=element_text(margin = margin(t=0, r=0, b=0, l=0)),
        axis.text.y=element_blank(),
        axis.ticks.x=element_blank(),
        axis.ticks.y=element_blank(),
        legend.text = element_text(size=4),
        legend.title = element_text(size=5),
        legend.key.height = unit("0.3", "cm"),
        legend.key.size = unit("0.3", "cm"),
        axis.text = element_text(size=5, face='bold'),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank())

ggsave("recharted_20190611.png", plot=p, width=3, height=2)
