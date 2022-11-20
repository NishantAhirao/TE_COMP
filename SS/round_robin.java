import java.util.*;
class round_robin
{ 
    public static void main(String[] args) 
    { 
     int num; 
     Scanner s = new Scanner(System.in); 
     System.out.print("Enter number of processes : "); 
     num = s.nextInt(); 
     int  wtime[],
     btime[],
     rtime[],
     quantum; 
     wtime = new int[num]; 
     btime = new int[num]; 
     rtime = new int[num]; 
     for(int i=0;i<num;i++)  
     {
    	 System.out.print("Enter Burst time for process "+(i+1)+" : ");      
    	 btime[i] = s.nextInt();      
    	 rtime[i] = btime[i];      
    	 wtime[i]=0;  
      } 
      System.out.print("\nEnter Time Slice : ");          
      quantum = s.nextInt();          
      int rp = num;         
      int i=0; 
      int time=0;          
      System.out.print("0");          
      s.close(); 
        wtime[0]=0; while(rp!=0)  
        {  
            if(rtime[i]>quantum) 
            { 
                rtime[i]=rtime[i]-quantum;                 
                System.out.print(" | P["+(i+1)+"] | ");                 
                time+=quantum; 
                System.out.print(time); 
            } 
            else if(rtime[i]<=quantum && rtime[i]>0) 
            { 
                time+=rtime[i];                 
                rtime[i]=rtime[i]-rtime[i]; 
                System.out.print(" | P["+(i+1)+"] | ");                 
                rp--; 
                System.out.print(time); 
            }             i++;             
            if(i==num) 
            {                 
            	i=0; 
            } 
        }  
    } 
}