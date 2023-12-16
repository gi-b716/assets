#include <iostream>
using namespace std;
int main(){
	for(int i=1000;i<=9999;i++){
		int a=i/100, b=i%100;
		bool temp = (a+b)*(a+b)==i;
		if(temp){
			cout << i << " ";
		}
	}
	return 0;
}

/*
#include <iostream>
using namespace std;
int main(){
	cout << "2025 3025 9801";
	return 0;
}
*/
