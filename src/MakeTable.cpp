//建立sqrt表
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc,char** argv)
{
    double result;

    if(argc < 2)
    {
        return 1;
    }

    FILE* fp = fopen(argv[1],"w");
    if(!fp)
    {
        fp = NULL;
        return 1;
    }

    fprintf(fp,"double sqrtTable[] = {\n");
    for (int i = 0; i < 10; ++i)
    {
        result = sqrt(static_cast<double>(i));
        fprintf(fp,"%g, \n",result);
    }

    fprintf(fp,"0};\n");
    fclose(fp);
    fp = NULL;

    return 0;

}
