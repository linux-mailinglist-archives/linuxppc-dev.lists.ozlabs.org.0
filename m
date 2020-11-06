Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 810752A9679
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 13:53:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSL0y15gxzDrLb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 23:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSKy46ClFzDrJJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 23:51:07 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B593ABDE;
 Fri,  6 Nov 2020 12:51:03 +0000 (UTC)
Date: Fri, 6 Nov 2020 13:51:01 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Carl Jacobsen <cjacobsen@storix.com>
Subject: Re: Kernel panic from malloc() on SUSE 15.1?
Message-ID: <20201106125101.GS29778@kitsune.suse.cz>
References: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 02, 2020 at 12:14:27PM -0800, Carl Jacobsen wrote:
> I've got a SUSE 15.1 install (on ppc64le) that kernel panics on a very
> simple
> test program, built in a slightly unusual way.
> 
> I'm compiling on SUSE 12, using gcc 4.8.3. I'm linking to a static
> copy of libcrypto.a (from openssl-1.1.1g), built without threads.
> I have a 10 line C test program that compiles and runs fine on the
> SUSE 12 system. If I compile the same program on SUSE 15.1 (with
> gcc 7.4.1), it runs fine on SUSE 15.1.
> 
> But, if I run the version that I compiled on SUSE 12, on the SUSE 15.1
> system, the call to RAND_status() gets to a malloc() and then panics.
> (And, of course, if I just compile a call to malloc(), that runs fine
> on both systems.) Here's the test program, it's really just a call to
> RAND_status():
> 
>     #include <stdio.h>
>     #include <openssl/rand.h>
> 
>     int main(int argc, char **argv)
>     {
>         int has_enough_data = RAND_status();
>         printf("The PRNG %s been seeded with enough data\n",
>                has_enough_data ? "HAS" : "has NOT");
>         return 0;
>     }
> 
> openssl is configured/built with:
>     ./config no-shared no-dso no-threads -fPIC -ggdb3 -debug -static
>     make
> 
> and the test program is compiled with:
>     gcc -ggdb3 -o rand_test rand_test.c libcrypto.a
> 
> The kernel on SUSE 12 is: 3.12.28-4-default
> And glibc is: 2.19
> 
> The kernel on SUSE 15.1 is: 4.12.14-197.18-default
> And glibc is: 2.26

SLE 12 SP5 has pretty much the same kernel as SLE 15 SP1 and pretty much
the same compiler as SLE 12 so it might be interesting data point to try
there.

Also I saw you are using very old VIOS (which should not make much of a
difference) but did not see what firmware version the machine has.

There have been cases of mysterious crashes solved by updating the
firmware.

Thanks

Michal
