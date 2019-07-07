library(ggplot2)

y1 = c(47.82, 53, 50.55, 61, 62.05, 65.98, 60.56, 58.48,
      65.46, 59.27, 52.38, 56)
y2 = c(5.2, 9.2, 9.9, 14, 14.53, 15.15, 15.64, 14.87,
       17.57, 10.8, 6.23, 6.5)

type = factor(rep(c("매출","영업이익"),each=length(y1)), levels=c("영업이익","매출"))

labels <- rep(c('16_Q3','16_Q4',
            '17_Q1','17_Q2','17_Q3','17_Q4',
            '18_Q1','18_Q2','18_Q3','18_Q4',
            '19_Q1','19_Q2'),2)

data <- data.frame(y=c(y1,y2), labels=labels, type=type)

p <- ggplot(data, aes(x=labels, y=y, fill=type)) + xlab("시기") + ylab("(단위: 조원)") +
  geom_bar(stat='identity', position=position_dodge(1), width=.7)+
  scale_fill_manual(values = c("#D0D0D0","#00BFFF"), name='구분')+
  theme_minimal()+ggtitle("삼성전자 분기별 실적 비교")+ylim(0,70)+
  theme(panel.grid=element_blank(),
        axis.text = element_text(size=15),
        axis.title.x = element_text(size=20, margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size=20, margin = margin(t = 0, r = 20, b = 0, l = 0)),
        legend.text = element_text(size=20),
        legend.title = element_text(size=20),
        title = element_text(size=20))+
        geom_text(aes(x=labels, y=y, label=y, color=type), fontface='bold',
                  position=position_dodge(1), vjust=-0.5)+
        scale_color_manual(values = c("#D0D0D0","#00BFFF"))+guides(color=F)
p

ggsave('samsung_revenue.png', p, units='in', width=12, height=6)
