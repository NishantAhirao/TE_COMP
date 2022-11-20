import java.util.Scanner;

public class worst_fit {

        static void worstFit(int[] blockSize, int m, int[] processSize, int n)
        {
            // Stores block id of the block allocated to a
            // process
            int[] allocation = new int[n];
            for (int i = 0; i < allocation.length; i++){
                allocation[i] = -1;
            }

            for (int i=0; i<n; i++)
            {
                int wstIdx = -1;
                for (int j=0; j<m; j++)
                {
                    if (blockSize[j] >= processSize[i])
                    {
                        if (wstIdx == -1)
                            wstIdx = j;
                        else if (blockSize[wstIdx] < blockSize[j])
                            wstIdx = j;
                    }
                }
                if (wstIdx != -1)
                {
                    allocation[i] = wstIdx;
                    blockSize[wstIdx] -= processSize[i];
                }
            }

            System.out.println("\nProcess No.\tProcess Size\tBlock no.");
            for (int i = 0; i < n; i++)
            {
                System.out.print("   " + (i+1) + "\t\t" + processSize[i] + "\t\t");
                if (allocation[i] != -1)
                    System.out.print(allocation[i] + 1);
                else
                    System.out.print("Not Allocated");
                System.out.println();
            }
        }


        public static void main(String[] args)
        {
            Scanner sc = new Scanner(System.in);
            int m, n;
            System.out.println("Enter no. of blocks: ");
            m = sc.nextInt();
            int[] blockSize = new int[m];
            for(int i = 0;i<m;i++)
            {
                System.out.println("Enter block " + (i+1) + " size: ");
                blockSize[i] = sc.nextInt();
            }

            System.out.println("Enter no. of processes: ");
            n = sc.nextInt();
            int[] processSize = new int[n];
            for(int i = 0;i<n;i++)
            {
                System.out.println("Enter process " + (i+1)+ " size: ");
                processSize[i] = sc.nextInt();
            }

            worstFit(blockSize, m, processSize, n);
        }
    }
