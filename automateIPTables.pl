#perl script because I said so

#you can use any file you want as long as xlst format
open(FILE, "testFile") or die "cannot open file: $! ruhroh";

#remove the trailing _ and push the substrings into hold array
while(<FILE>){
    chomp $_;
    push(@hold, $_);
}

while (<>) {
    $line = $_;
    chomp $line;

    #if the chomped line has the following string 
    if ($line =~ m/--log-prefix\"IPT:\"ls*$/i){
        foreach my$ip(@hold){
            print("$ip/32 -p -tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT \n");
            print("$ip/32 -p -udp -m state --state NEW -m udp --dport 22 -j ACCEPT \n");
        }
        print "$line\n";
    }
    else {
        print "$line\n";
    }
}