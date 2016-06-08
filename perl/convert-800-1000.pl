#!e:\perl\bin -w

no strict;
use warnings;


# Name of input Hebrew text file

$intxt =  "\.\.\\work\\hebrew_translate.xpl-800-1000.txt";
print ($intxt, "\n");

# Name of output Hebrew HTML file
$outhtml =  "\.\.\\out\\hebrew_translate.xpl-800-1000.html" ;
print ($outhtml, "\n");

open(OUTFILE, '>', $outhtml) ||
   die ("\n\n  ERROR: cannot open output file $outhtml \n");

$head = '<!DOCTYPE HTML> 
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>2016-02-02-Translation-CRM-v9</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body dir="rtl">';

print OUTFILE ($head, "\n");


$i = 1;
 if (open(INFILE, $intxt))
 {
    $line = <INFILE>;
     $eq = index($line, "=");
    $line = substr($line, $eq+1);
   
    print OUTFILE ($i++, "  ::  ", $line, '<br/>');
    
    
    while ($line ne "")
    {
        #print ($line);
       $line = <INFILE> || "";
       $eq = index($line, "=");
       $line = substr($line, $eq+1);
       print OUTFILE ($i++, "  ::  ", $line, '<br/>');
     }
 }
 else
 {
    die ("\n\n  ERROR: cannot open input file $intxt\n");   
 }

$foot = '</body>
</html>
';
print OUTFILE ("\n", $foot);
close (OUTFILE);
close (INFILE);