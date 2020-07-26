Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0222E227
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:09:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFCDg3q37zF0ZQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:09:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCBv2F89zDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:08:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7DpA9fUthc/SbMVBQd+Vo2TxG0ByMuuOrjjFcJZXlH0=; b=Ena7rR7PcOu3DPBJc+pY2K4yoP
 Dhy3lL8Eng+GWAI8BKWoa9tfGxOlSXp5h1Ue7LB1NCjdKnduRowe8lKDOu8SZcSbGJrUM+ksSd8hz
 m0b16Om8PJnhi3QFnZ5y/XeojHCxnS7JtAJkzwCvkhMoC6UPzM2hyNB0p7UHMgoNALFeijCFYR5+c
 GeBbMlgWg33g5wrmYo4UuvuMoVhpgE4UQWpA5L5XNiWSjV5yBNgdm38D5VGONzhH/D89aGXDvs622
 NWbDP4s3EWfxRZp/BgI8uwRAU63ejWX6mwFJ/L9xgMHNkmHIQT3OqKnM0gQCeqQtcpxWIiLSCnlca
 JRTWcYBw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzm0L-0001tR-1K; Sun, 26 Jul 2020 19:08:13 +0000
Subject: Re: [PATCH 0/9] powerpc: delete duplicated words
To: Joe Perches <joe@perches.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200726162902.Horde.TCqHYaODbkzEpM-rFzDd8A2@messagerie.si.c-s.fr>
 <b796e912-e945-3cb1-03f8-0f38009634a4@infradead.org>
 <add7c13b1ca24c8cb6f243b99d61c19287020efd.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4e505c35-8428-89bb-7f9b-bc819382c3cd@infradead.org>
Date: Sun, 26 Jul 2020 12:08:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <add7c13b1ca24c8cb6f243b99d61c19287020efd.camel@perches.com>
Content-Type: multipart/mixed; boundary="------------063DA744BA13B2CA39DCBC0B"
Content-Language: en-US
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------063DA744BA13B2CA39DCBC0B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 7/26/20 10:49 AM, Joe Perches wrote:
> On Sun, 2020-07-26 at 10:23 -0700, Randy Dunlap wrote:
>> On 7/26/20 7:29 AM, Christophe Leroy wrote:
>>> Randy Dunlap <rdunlap@infradead.org> a écrit :
>>>
>>>> Drop duplicated words in arch/powerpc/ header files.
>>>
>>> How did you detect them ? Do you have some script for tgat, or you just read all comments ?
>>
>> Yes, it's a script that finds lots of false positives, so I have to check
>> each and every one of them for validity.
> 
> And it's a lot of work too. (thanks Randy)
> 
> It could be something like:
> 
> $ grep-2.5.4 -nrP --include=*.[ch] '\b([A-Z]?[a-z]{2,}\b)[ \t]*(?:\n[ \t]*\*[ \t]*|)\1\b' * | \
>   grep -vP '\b(?:struct|enum|union)\s+([A-Z]?[a-z]{2,})\s+\*?\s*\1\b' | \
>   grep -vP '\blong\s+long\b' | \
>   grep -vP '\b([A-Z]?[a-z]{2,})(?:\t+| {2,})\1\b'

Hi Joe,

(what is grep-2.5.4 ?)

It looks like you tried a few iterations of this -- since it drops things
like "long long".  There are lots of data types that are repeated & valid.
And many struct names, like "struct kref kref", "struct completion completion",
and "struct mutex mutex".  I handle (ignore) those manually, although that
could be added to the Perl script.

v0.1 of this script also found lots of repeated numbers and strings of
special characters (ASCII art etc.), so now it ignores duplicated numbers
or special characters -- since it is really looking for duplicate words.

Anyway, I might as well attach it. It's no big deal.
And if someone else wants to tackle using it, go for it.

-- 
~Randy


--------------063DA744BA13B2CA39DCBC0B
Content-Type: application/x-perl;
 name="find_dup_words.pl"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="find_dup_words.pl"

#! /usr/bin/perl
# find duplicate words on one line
# also finds repeated last word on lineN and first word of lineN+1
#
# For source files (vs. Docs), drop a leading " *" in case it might be
# kernel-doc notation. This would facilitate catching repeated words
# at the end of one line and the beginning of the next line, after the " *".

# TBD: print entire offending line(s) when a repeated word is found.
# can this use an environment variable instead of ARGV?

$VERSION = "v0.2";

my $infile;
my $line;
my $line_num;
my $last_word;
my $ix;
my $last_ix;

sub usage()
{
	print "find_dup_words <filenames>  {$VERSION}\n";
	exit 1;
}

# test for integer number or hex number (0x0-9a-f)
sub is_numeric($)
{
	$var = shift;

	return 1 if ($var =~ /^[+-]?\d+$/);
	return 1 if ($var =~ /^0x[0-9A-F]+$/i);
	return 0;
}

sub is_special_chars($)
{
	$var = shift;

	return 1 if ($var =~ /[^[a-zA-Z0-9 ]]*/);
	##return 1 if ($var =~ /[[:punct:]]*/);
	return 0;
}


sub report_words($$$$$)
{
	$file = $_[0];
	$line = $_[1];
	$crossline = $_[2];
	$word1 = $_[3];
	$word2 = $_[4];
	$crossing = $crossline ? "/=" : "==";

	print "$file:$line: '$word1' $crossing '$word2'\n";
}

sub dump_line_words($$$)
{
	$line = shift(@_);
	$mx = shift(@_);
	@wrds = @_;

	print "## $line_num: #wrds=$mx: ";
	print "@wrds\n";
}

# main:

if (int(@ARGV) == 0 || $ARGV[0] eq "-h" || $ARGV[0] eq "--help") {
	usage();
}

foreach $infile (@ARGV)
{
	open (INFILE, $infile) or die "cannot open '$infile'\n";
	$line_num = 0;
	$last_word = "";

LINE:
	while ($line = <INFILE>) {
		$line_num++;
		chomp $line;
		next LINE if $line eq "";

		# drop common punctuation: period, comma, qmark, semi-colon, colon
		$line =~ tr/.,;:?//d;

		@words = split(/\s+/, $line);

		# For a line that begins with " * foobar() does soandso.",
		# words[0] is "" and words[1] eq "*", so ignore both of them.
		if ($words[0] eq "") {
			shift @words;
		}
		if ($words[0] eq "*") {
			shift @words;
		}

		next LINE if ($last_word eq "" && $words[0] eq "");

		##dump_line_words($line_num, scalar @words, @words);
		$numwords = scalar @words;
		##print "## $line_num: #wrds=$numwords:=\n";
		##print "@words\n";

		if (lc($last_word) eq lc($words[0])) {
			if (is_numeric($last_word) || is_special_chars($last_word)) {}
			else {
				report_words($infile, $line_num, 1, $last_word, $words[0]);
			}
		}

		# note: using /m/ matches succeed on subsets,
		# e.g., "this" matches "is". Not good.
		# So I am using lc(word1) eq lc(word2) instead.

		for ($ix = 1; $ix < scalar @words; $ix++) {
			if (lc($words[$ix - 1]) eq lc($words[$ix])) {
				if (is_numeric($words[$ix]) || is_special_chars($words[$ix])) {}
				else {
					report_words($infile, $line_num, 0,
						$words[$ix - 1], $words[$ix]);
				}
			}
			$last_ix = $ix;
		}

		$last_word = $words[$last_ix];
	} # end one infile

	close INFILE;
	print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";

} # end for all infiles

# end find_dup_words.pl;

--------------063DA744BA13B2CA39DCBC0B--
