#!/bin/perl

$content = "";

opendir(DIR, ".") or die "cannot open directory";
@docs = grep(/\.md$/,readdir(DIR));
foreach $file (@docs) {
	$nicename = $file;
	$nicename =~ s/\-/ /g;
	$nicename =~ s/\.md//;
	$nicefile = $file;
	$nicefile =~ s/\.md/.html/;
	
	$link = "<a href=\"$nicefile\">$nicename</a>\n";
	$content = $content . $link;
}

unless (open($input, "<", "_Layout.html")) {
	print STDERR "Can't open $filename: $!\n";
	return;
}

$html = "";
while ($line = <$input>) {
	$line =~ s/\{\{ page.content \}\}/$content/;
	$line =~ s/\{\{ page.title \}\}/Ingredients/;
	$line =~ s/\{\{ page.date \}\}/ /;
	$line =~ s/\{\{ wiki.base_path \}\}//;
	$html = $html . $line;
}

print $html;

