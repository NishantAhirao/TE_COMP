db.zips.aggregate( { $group :
                         { _id : "$state",
                           totalPop : { $sum : "$pop" } } })