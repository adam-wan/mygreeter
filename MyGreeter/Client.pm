#!/usr/bin/perl

package MyGreeter::Client;

use 5.18.2;
use strict;
use warnings;
use Carp;

use POSIX qw(strftime);

#############################################
## The constructor method.
## Defines class variables here.
#############################################
sub new {

	my $class = shift or confess ("%ERROR: Cannot call without a valid object or class name!\n");
	my $self = {
		@_,
	};

	bless $self, ref($class) || $class;

	# TODO:: add logger.
	# $self ->{logger} = Log::Log4perl->get_logger("MyGreeter::Client");

	return $self;
}

#############################################
## Function get_greeting
## 		print good morning, afternoon, evening based on current local time.
#############################################
sub get_greeting() {

	my $msg = undef;
	# strftime %H - Hour in 24h format (00-23)
	my $currentHour = strftime "%H", localtime;
	
	if($currentHour >= 0 && $currentHour < 12){
		$msg = "Good Morning";
	} else {

		if($currentHour >= 12 && $currentHour < 18){
			$msg = "Good Afternoon";
			} else {
				$msg = "Good Evening";
			}
	}

	return $msg;
}


#############################################
## Package return;
#############################################
1;