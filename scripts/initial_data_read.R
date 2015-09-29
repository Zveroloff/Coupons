library(data.table)

visits <- fread("coupon_visit_train.csv")
users <- fread("user_list.csv")
purchases <- fread("coupon_detail_train.csv")
coupons <- fread("coupon_list_train.csv")
locations <- fread("coupon_area_train.csv")

visits <- visits[c(1,2,3,6,7,8), ]
users <- users
purchases <- purchases
coupons <- coupons
location <- locations

