/*********************************************************************************************
**  ex2.c
**  ex												
**																							
**  Created by Rafael Grossi on 05/24/19.				
**  Copyright 2019. Rafael Grossi. All rights reserved.	
*********************************************************************************************/

#include "stdio.h"

typedef struct _info
{
	int blanks;
	int tabs;
	int newline;
}fileinfo;

int main()
{
	int c;
	fileinfo File;
	File.blanks = 0;
	File.tabs = 0;
	File.newline = 0;

	while ((c = getchar()) != EOF)
	{
		if (c == '\n') File.newline++;
		if (c == ' ')  File.blanks++;
		if (c == '\t') File.tabs++;
	}
	printf("Lines = %d\tBlanks = %d\tTabs = %d\n", File.newline, File.blanks, File.tabs);
	return 0;
}

