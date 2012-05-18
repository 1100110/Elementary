import std.string;
import std.stdio;

int main(string[] args) {
    
    immutable char* temp1 = args[0].toStringz();
    immutable char** temp2 = &temp1;
return 0;
}
