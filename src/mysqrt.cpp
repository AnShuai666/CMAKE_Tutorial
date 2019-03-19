//
// Created by yhl on 19-3-18.
//

#include "mysqrt.h"
#include "TutorialConfig.h"
double mysqrt(double in)
{
    return sqrt(in);
}


double mysqrt_1(double x)
{
    double result;
#if defined(HAVE_LOG) && defined(HAVE_EXP)
    result = exp(log(x) * 0.5);
#else
    result = mysqrt(x);
#endif
    return result;
}


