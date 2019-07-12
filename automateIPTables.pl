#perl script because I said so

#you can use any file you want as long as xlst format
open(FILE, "testFile") or die "cannot open file: $! ruhroh";

#remove the trailing _ and push the substrings into hold array
while(<FILE>){
    chomp $_;
    push(@hold, $_);
}