//
//  main.c
//  Assignment 1
//
//  Created by Rakshit Pithadia on 8/25/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#include <stdio.h>
#include <math.h>

int cube(int n)
{
    return n*n*n;
}

//Question 1
void polyTable(int N)
{
    for (int k = 1; k<=N; k++) {
        printf("k = %d \n",k);
        printf("k^3 + 2k - 3 = %d \n \n",(cube(k)+(2*k)-3));
    }
}

//Question 3
int runningSum(int num)
{
    static int sum = 0;
    sum += num;
    return sum;
}

//Question 5
int fibonacci(int n)
{
    if (n == 0)
        return 0;
    else if(n == 1)
        return 1;
    else
        return (fibonacci(n - 1) + fibonacci(n - 2));
}

//Question 6
float compute(int n) {
    float y = 1.1;
    for (int k = 0;k < n;k++)
        for (int j = 0; j < n;j++) {
            y = sin(k*j + y);
            printf("%f", y);
        }
    return y;
}



int main(int argc, const char * argv[])
{
    int x1,x2,x3,x4;
    
    polyTable(5);

    x1 = runningSum(2);
    printf("x1 = %d \n \n", x1);
    x2 = runningSum(2);
    printf("x2 = %d \n \n", x2);
    x3 = runningSum(3);
    printf("x3 = %d \n \n", x3);
    x4 = runningSum(5);
    printf("x4 = %d \n \n", x4);

    int fib = fibonacci(3);
    printf("The Nth fibonacci number is : %d \n \n",fib);
    
//  compute(1100); //this call was commented because it takes a long time to complete.
    
    return 0;
}


