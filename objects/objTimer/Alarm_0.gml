tMil-=1
if tMil == -1{
    tMil = 9
    tSec -=1
}
if tSec == -1{
    tSec = 3
    tMin -=1
}
if!(tMin == 0 && tSec == 0 && tMil==0){
    alarm[0] = 6
}else{
    objBase.timeOut=true
}