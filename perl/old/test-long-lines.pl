#!e:\perl\bin -w

#no strict;
use warnings;
#use Encode qw(decode encode);
 use utf8;
use open ':encoding(utf8)';

binmode(STDOUT, ":utf8");

$count = 0;
$lines_ctr = 0;
$length = 0;
$limit = 150;
$line = "";

# Open work file

$intxt = "\.\.\\work\\02-Aug-2025-Heb-work-UTF-8-HN-V4.txt";
print ("Input file name is " ,  $intxt ,  "\n");

 if (open(INFILE, $intxt))
 {
    $line = <INFILE> || "";
 #   $eq = index($line, "=");
 #   $line = substr($line, $eq+1);

    
     while ($line ne "")
    {
 #   	print ($line, "\n\n");
    	$lines_ctr++;
#	$length  =  length(Encode::encode_utf8($line));
#	print ("Line ", $lines_ctr,   " length -encode is ", $length, "\n");
#	$length  =  length(Encode::decode_utf8($line));
#	print ("Line ", $lines_ctr, " length -decode is ", $length, "\n");
        $line = <INFILE> || "";
	$length  =int(  length    ($line) );

	if ($length > $limit)
	{
	print ("\n=====================================\nFull Line: ", $lines_ctr, " length is ", $length, "\n\n");
	    	print ("Full line: ", $line, "\n\n");
		$eq = index($line, "=");
		$short_line = substr($line, $eq+1);
		$length =  int( length($short_line) );
		print ("index is: ", $eq, " Reduced Line length is ", $length, "\n\n");
		print($short_line, "\n");

		$count++;
	}

       
 
    }
 }
else
 {
    die ("\n\n  ERROR: cannot open input file $intxt\n");   
 }

close (INFILE);
print ("Number of lines with length over " , $limit , "  is " , $count, " Out of  ", 	$lines_ctr , "\n\n\n");
#read line

#check length

#count long lines

#report numberof long lines

