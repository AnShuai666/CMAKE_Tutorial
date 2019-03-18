//
// Created by yhl on 19-3-18.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "TutorialConfig.h"
#ifdef USE_MYMATH
#include "mysqrt.h"
#endif
int main(int argc, char **argv)
{
    if(argc < 2)
    {
        fprintf(stdout,"%s Version %d.%d\n",
                argv[0],
                Tutorial_VERSION_MAJOR,
                Tutorial_VERSION_MINOR
                );

        fprintf(stdout,"Usage: %s number \n",argv[0]);
        return 1;
    }


    double inputvalue = atof(argv[1]);

#ifdef USE_MYMATH
    fprintf(stdout,"Using the tutorial provided math library\n");
    double outputvalue = mysqrt(inputvalue);
#else
    fprintf(stdout,"Using the std system math library\n");
    double outputvalue = sqrt(inputvalue);
#endif

    fprintf(stdout, " The square root of %g is %g\n",inputvalue,outputvalue);
    return 0;
}