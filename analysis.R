install.packages("car")
install.packages("lmtest")
install.packages("sandwich")
library(car)
library(lmtest)
library(sandwich)
load("ARE106_HW3_S2025.RData")
# Linear production model
model1 <- lm(Q ~ K + L, data = D)
summary(model1)
# Linear model residuals and heteroskedasticity-robust inference
residuals_model1 <- resid(model1)
plot(D$K, residuals_model1, xlab = "Land Input (K,hectares)", ylab = "Residuals", main = "Residuals vs Land Input (K)")
abline(h = 0, col = "red")
plot(D$L, residuals_model1, xlab = "Labor Input (L,person-days)", ylab = "Residuals", main = "Residuals vs Labor Input (L)")
abline(h = 0, col = "red")
bptest(model1, ~ K + L + I(K^2) + I(L^2) + I(K*L), data = D)
coeftest(model1, vcov = vcovHC(model1, type = "HC0"))
library(sandwich)
library(lmtest)
robust_se <- sqrt(diag(vcovHC(model1, type = "HC0")))
coef_est <- coef(model1)
lower <- coef_est - 1.96 * robust_se
upper <- coef_est + 1.96 * robust_se
cbind(lower, upper)
# Log-log production model
model2 <- lm(log(Q) ~ log(K) + log(L), data = D)
summary(model2) 
# Log-log model residual plots 
residuals_model2 <- resid(model2) 
plot(log(D$K), residuals_model2, xlab = "log(K)", ylab = "Residuals", main = "Residuals vs log(K)")
abline( h = 0, col = "red")
residuals_model2 <- resid(model2) 
plot(log(D$L), residuals_model2, xlab = "log(L)", ylab = "Residuals", main = "Residuals vs log(L)")
abline( h = 0, col = "red")
# Log-log model heteroskedasticity test
bptest(model2, ~ log(K) + log(L) + I(log(K)^2) + I(log(L)^2) + I(log(K)* log(L)), data = D)
# Log-log model confidence intervals
confint(model2, level = 0.95)
