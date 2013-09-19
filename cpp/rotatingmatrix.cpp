/*Given an image represented by an NxN matrix, where each pixel in the image is 4
bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
*/
#include <iostream>
#include <stdlib.h>

using namespace std;

//rotate counter clock wise 90
//flip x and y, then put upside down

//rotate clockwise 90
//put upside down then flip x, y


int main(int argc, char* argv[]){
	int n = atoi(argv[1]), counter = 0;
	int board[n][n];

	//printing out and setting example array
	cout << "original matrix" << endl;
	for(int x = 0; x < n; x++){
		for(int y = 0; y < n; y++){
			board[x][y]=counter++;
			cout << board[x][y] << "\t";
		}
		cout << endl;
	}


	cout << endl;
	cout << endl;
	cout << endl;

	cout << "rotated matrix" << endl;
	for(int x = n - 1; x >= 0; x--){
		for(int y = 0; y < n; y++){
			cout << board[y][x] << "\t";
		}
		cout << endl;
	}

	
}