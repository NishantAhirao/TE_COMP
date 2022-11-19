# include <stdio.h>
# include <unistd.h>
#include <stdlib.h>

int main() 
{
	char * args[]={"hello","bye",NULL};
	char number;
	int cpid;
	int a;
	pid_t var;

	do
	{
		printf("\nmenu\n1.ps\n2.join\n3.fork\n4.wait\n5.execv\n6.exit");
		printf("\nEnter function number\n");
		scanf("%d", &number);

		switch(number)
		{
		case 1:
			system("ps");
			break;

		case 2:
			printf("output of join command\n");
			system("join t1.txt t2.txt ");

			break;

		case 3:
			var = fork();
			if(var==0)
                        {
                          printf("\n%d: child and its parent in of  is %d",getpid(),getppid());
                  
                         }
                         else
                         {
                           printf("\n%d child and its parent in else is %d",var,getpid());
                         }
			
			
			break;
		case 4:

			if(fork()==0)
			{
			exit(0);
			}
			else{cpid=wait(NULL);
			printf("\n parent pid is %d",getpid());
			printf("\n child pid is %d",cpid);}
			
			break;
		case 5:

			printf("hello1 from prgram 1 \n");

			printf("hello2 from prgram 1 \n");
			execv("b.o",args);
			printf("hello3 from prgram 1 \n");
			break;
		case 6:
			printf("thankyou !!\n");
			exit(0);
			break;  
		
		}
	}while(number!=0);
	return 0;
}
