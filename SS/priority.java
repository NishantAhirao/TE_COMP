import java.util.Scanner;
 
public class priority {
public static void main(String args[])
{
	Scanner sc = new Scanner(System.in);
    System.out.println ("enter no of process:");
    int n = sc.nextInt();
    int pid[] = new int[n];
    int at[] = new int[n]; 
    int bt[] = new int[n]; 
    int p[] = new int[n];
    int ct[] = new int[n]; 
    int ta[] = new int[n]; 
    int wt[] = new int[n];  
    int f[] = new int[n];  
    int st=0, tot=0;
    float totwt=0, totta=0;
    for(int i=0;i<n;i++)
    {
    	System.out.println ("enter process " + (i+1) + " arrival time:");
        at[i] = sc.nextInt();
        System.out.println ("enter process " + (i+1) + " brust time:");
        bt[i] = sc.nextInt();
        System.out.println ("enter process " + (i+1) + " priority:");
        p[i] = sc.nextInt();
        pid[i] = i+1;
        f[i] = 0;
     }
    boolean a = true;
    while(true)
    {
    	int c=n, min=999;
    	if (tot == n) 
    		break;
    	for (int i=0; i<n; i++)
    	{
    		if ((at[i] <= st) && (f[i] == 0) && (p[i]<min))
    		{
    			min=p[i];
                c=i;
            }
        }
        if (c==n)
        	st++;
        else
        {
        	ct[c]=st+bt[c];
            st+=bt[c];
            ta[c]=ct[c]-at[c];
            wt[c]=ta[c]-bt[c];
            f[c]=1;
            tot++;
         }
     }
     System.out.println("\nPID AT BT P CT TAT WT");
     for(int i=0;i<n;i++)
     {
    	 totwt+= wt[i];
    	 totta+= ta[i];
    	 System.out.println(pid[i]+"\t"+at[i]+"\t"+bt[i]+"\t"+p[i]+"\t"+ct[i]+"\t"+ta[i]+"\t"+wt[i]);
     }
     System.out.println ("\naverage tat is "+ (float)(totta/n));
     System.out.println ("\naverage wt is "+ (float)(totwt/n));
     sc.close();
	}
}