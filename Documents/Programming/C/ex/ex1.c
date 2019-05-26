/*********************************************************************************************
 **  ex1.c
 **  ex												
 **																							
 **  Created by Rafael Grossi on 03/07/19.				
 **  Copyright 2019. Rafael Grossi. All rights reserved.	
 *********************************************************************************************/

#include "stdio.h"

int main()
{
	int c = getchar() != EOF;
	printf("EOF? \t%d\nActual EOF = %d", c, EOF);
	return 0;

}
