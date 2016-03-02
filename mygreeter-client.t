#!/usr/bin/perl

use 5.18.2;
use strict;
use warnings;

use Test::More;

use POSIX qw(strftime);

#Check whether MyGreeter::client is a valid package.
use_ok 'MyGreeter::Client';


#########################################
## First test case to test whether 
## MyGreeter::Client is instantiated.
#########################################
subtest 'Test instance' => sub {

	my $res = MyGreeter::Client->new;

	isa_ok $res, 'MyGreeter::Client';
};

#########################################
## Second test case to test if get_greeting 
## subroutine works well.
#########################################
subtest 'Test get_greeting' => sub  {

	my $res = MyGreeter::Client->new;
	my $currentHour = strftime "%H", localtime;

	if($currentHour >= 0 && $currentHour < 12){
		is $res->get_greeting, 'Good Morning'
	}else {

		if($currentHour >= 12 && $currentHour < 18){

			is $res->get_greeting, 'Good Afternoon'
			} else {
				is $res->get_greeting, 'Good Evening'
			}
	}
};

# Finish all the test cases.
done_testing;