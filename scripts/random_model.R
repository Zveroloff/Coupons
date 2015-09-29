library(data.table)

visits <- fread("coupon_visit_train.csv")
users <- fread("user_list.csv")
purchases <- fread("coupon_detail_train.csv")
coupons <- fread("coupon_list_train.csv")
locations <- fread("coupon_area_train.csv")

visits <- visits[ ,c(1,2,3,6,7,8)]
users <- users
purchases <- purchases
coupons <- coupons
locations <- locations

coupons <- fread("coupon_list_test.csv")

results <- fread("sample_submission.csv")
l <- dim(results)[1]
coupons.pur <- rnorm(l, 3, 1)
coupons.pur[coupons.pur < 0] <- 0
coupons.pur <- floor(coupons.pur)

guessed.list <- lapply(coupons.pur, runif, min = 1, max = 19413)
guessed.hashes <- lapply(guessed.list, f <- function(x) {
 coupons[x, COUPON_ID_hash] 
} )
guessed.vec <- sapply(guessed.hashes, paste, collapse= " ")

results$PURCHASED_COUPONS <- guessed.vec

write.csv(results, file="results_random.csv", quote = F, row.names = F)