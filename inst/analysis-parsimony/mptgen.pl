# Runs mpts.run for files 001 > 100
# Edit this line to point to your /Trees folder
$dir = "C:/Research/iw";

## Nothing below this line should need editing.
open (TEMPLATE, "<$dir/tnt_template.run") or warn "ERROR: can't find template file at $dir/tnt_template.run";
@template = <TEMPLATE>;
close TEMPLATE;

foreach my $i (1..100) {
  $fileno = sprintf("%03d", $i);
  print "\n processing $fileno...";
  $scriptfile = "$dir/temp_tnt_script_$fileno.run";
  open (SCRIPT, ">", $scriptfile) or warn "Can't open script file";
  for (@template) {
    $line = $_;
    $line =~ s/001\./$fileno\./g;
    print SCRIPT $line;
  }
  close SCRIPT;
  system("tnt proc $scriptfile");
  unlink($scriptfile);
}

## Uncomment the following line to convert TNT files to NEXUS format
## This may be useful if you wish to annalyse the trees in external software
# do "tnt2nex.pl";
