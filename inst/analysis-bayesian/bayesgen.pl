# Runs mpts.run for files 001 > 100
# Set $dir below to point to the working directory.
# This directory should contain mrbayesblock.nex, and the trees from Congreve &
# Lamsdell's data dryad repository (copied in this repository in inst/matrices/###.txt.nex)
$dir = "C:/Research/Bayes64/iw";
$bayes_dir = "C:/Research/Bayes64";

# Nothing below this line should require editing.
open (MBB, "<$dir/mrbayesblock.nex") or warn "ERROR: can't find template file at $dir/mrbayesblock.nex";
@template = <MBB>;
close MBB;

foreach my $i (1..100) {
  $fileno = sprintf("%03d", $i);
  print "\n Processing $fileno...";
  open (MATRIX, "<$dir/$fileno.txt.nex") or warn "Can't open sourcefile $dir/$fileno.txt.nex";
  @matrix = <MATRIX>;
  close (MATRIX);
  $splicefile = "$dir/$fileno.nex";
  open (SPLICE, ">", $splicefile) or warn "Can't open output file $dir/$fileno.nex";
  for (@matrix) {
    print SPLICE;
  }
  for (@template) {
    print SPLICE;
  }
  close SPLICE;
  system("$bayes_dir/mrbayes_x64.exe $splicefile");

  open (CONSENSUS, "<$dir/$fileno.nex.con.tre") or warn ("Can't open consensus trees");
  @lines = <CONSENSUS>;
  close CONSENSUS;
  open (CONSOUT, ">$dir/$fileno.con.tre.nex") or warn ("Can't create new consensus tree file");
  for (@lines) {
    s/:[\d\.e\-]+//g;
    s/\[[^\]]+\]//g;
    print CONSOUT;
  }
  close CONSOUT;
}
