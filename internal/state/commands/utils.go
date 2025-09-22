package commands

import "strconv"

func parseToInt64(s string) (int64,error) {
    return strconv.ParseInt(s,10,64)
}

func parseCoords(x string,y string) (int64,int64,error) {
    i_x, err := parseToInt64(x)
    if err != nil{
        return 0,0,err
    }
    i_y, err := parseToInt64(y)
    if err != nil{
        return 0,0,err
    }
    return i_x,i_y,err
}
