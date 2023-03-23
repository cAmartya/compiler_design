#include<bits/stdc++.h>
#include<iostream>

using namespace std;
vector<string> x_split(string &s, char b)    {

    vector<string> res;
    string t = "";
    for(char c: s)  {
        if(c != b)  {
            t += c;
        }else   {
            if(t[0] != b)
                res.push_back(t);
            t = "";
        }
    }

    return res;
}
int main()  {
    string s;
    cin >> s;
    vector<string> tokens = x_split(s, ' ');

    if(tokens[0] != tokens[2])  {
        cout << "NO LEFT RECURSION\n";
        return 0;
    }
    
    
    return 0;
}