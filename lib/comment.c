# include<stdio.h>
# include<conio.h>

int  main(){
    int a =0;
   int  i = 2;
    char comment[80];
    printf("Enter a comment: ");
    fgets(comment, sizeof(comment), stdin);


if (comment[0] == '/'){
    if(comment[1] == '/'){
        printf("%s  is a commit", comment);
    }
	if(comment[1]=='*'){
		for(i=2;i<80;i+=){
			
			if(com[i]=="*"&& com[i+1] =="/"){
                a = 1;
                break;

                printf("%s  is a commit", comment);
			}
		}
        if(a==0){
            printf("%s  is not a commit", comment);
        }
	}
}


}