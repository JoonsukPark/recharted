library(ggplot2)

year_2019 = c(26232, 26346, 26805, 27038, 27322, 27408)
year_2018 = c(26213, 26083, 26555, 26868, 27064, 27126)

year <- rep(c("2018","2019"), each=6)

labels <- rep(c("1월","2월","3월","4월","5월","6월"), 2)

data <- data.frame(y=c(year_2018, year_2019), labels=labels, year=year)

p <- ggplot(data, aes(x=labels, y=y, group=year, linetype=year)) + xlab("") + ylab("") + ylim(26000, 27500) +
  ggtitle("월별 취업자 증가 추이 (단위: 천명, 통계청)")+
  geom_line(aes(color=year), lwd=1)+geom_point(aes(color=year), cex=3)+
  scale_linetype_manual(values=c("dashed", "solid"))+
  scale_color_manual(values=c("#A9A9A9", "#000000"))+
  theme_minimal()+
  theme(panel.grid=element_blank(),
        axis.text.x = element_text(size=15),
        axis.text.y = element_blank(),
        axis.title.x = element_text(size=20, margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size=20, margin = margin(t = 0, r = 20, b = 0, l = 0)),
        legend.text = element_text(size=20),
        legend.title = element_blank(),
        legend.key.size = unit(1, "cm"),
        legend.position=c(0.15, 0.85),
        title = element_text(size=20),
        plot.title = element_text(hjust=0.5))+
  geom_text(aes(x=labels, y=y, label=format(y,big.mark=",",scientific=FALSE), color=year),
            fontface='bold',
            vjust=c(2,2,2.5,3,2.5,2.5,
                    -1.5, -1.5, -1.5, -1.5, -1, -1.5),
            hjust=c(.5, .5, .3, .5, .5, .5,
                    .5, .8, .5, .5, .5, .5),
            size=5)
p

ggsave('employment.png', p, units='in', width=10, height=5)
