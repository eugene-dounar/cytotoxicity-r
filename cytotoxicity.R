library(drc)
Inhibition <- function (e) (control.mean - e) / control.mean

od <- read.csv('experiment.csv')
control <- read.csv('control.csv')

control.mean <- mean(control[['Optical.Density']])
ic <- data.frame(Inhibition=apply(od["Optical.Density"], 1, Inhibition),
                 Concentration=od[["Concentration"]])

model <- drm(ic[c("Inhibition", "Concentration")],
    fct=LL.3(names=c("Slope", "Upper", "ED50")))

#plot(model, type="all")
