Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC54B3A89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 10:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxMHF16dyz30NG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 20:19:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JxMGm31qCz30FH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 20:18:39 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21D9GKNV030588;
 Sun, 13 Feb 2022 03:16:20 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21D9GJKW030587;
 Sun, 13 Feb 2022 03:16:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 13 Feb 2022 03:16:19 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] net: Remove branch in csum_shift()
Message-ID: <20220213091619.GY614@gate.crashing.org>
References: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
 <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 13, 2022 at 02:39:06AM +0000, David Laight wrote:
> From: Christophe Leroy
> > Sent: 11 February 2022 08:48
> > 
> > Today's implementation of csum_shift() leads to branching based on
> > parity of 'offset'
> > 
> > 	000002f8 <csum_block_add>:
> > 	     2f8:	70 a5 00 01 	andi.   r5,r5,1
> > 	     2fc:	41 a2 00 08 	beq     304 <csum_block_add+0xc>
> > 	     300:	54 84 c0 3e 	rotlwi  r4,r4,24
> > 	     304:	7c 63 20 14 	addc    r3,r3,r4
> > 	     308:	7c 63 01 94 	addze   r3,r3
> > 	     30c:	4e 80 00 20 	blr
> > 
> > Use first bit of 'offset' directly as input of the rotation instead of
> > branching.
> > 
> > 	000002f8 <csum_block_add>:
> > 	     2f8:	54 a5 1f 38 	rlwinm  r5,r5,3,28,28
> > 	     2fc:	20 a5 00 20 	subfic  r5,r5,32
> > 	     300:	5c 84 28 3e 	rotlw   r4,r4,r5
> > 	     304:	7c 63 20 14 	addc    r3,r3,r4
> > 	     308:	7c 63 01 94 	addze   r3,r3
> > 	     30c:	4e 80 00 20 	blr
> > 
> > And change to left shift instead of right shift to skip one more
> > instruction. This has no impact on the final sum.
> > 
> > 	000002f8 <csum_block_add>:
> > 	     2f8:	54 a5 1f 38 	rlwinm  r5,r5,3,28,28
> > 	     2fc:	5c 84 28 3e 	rotlw   r4,r4,r5
> > 	     300:	7c 63 20 14 	addc    r3,r3,r4
> > 	     304:	7c 63 01 94 	addze   r3,r3
> > 	     308:	4e 80 00 20 	blr
> 
> That is ppc64.

That is 32-bit powerpc.

> What happens on x86-64?
> 
> Trying to do the same in the x86 ipcsum code tended to make the code worse.
> (Although that test is for an odd length fragment and can just be removed.)

In an ideal world the compiler could choose the optimal code sequences
everywhere.  But that won't ever happen, the search space is way too
big.  So compilers just use heuristics, not exhaustive search like
superopt does.  There is a middle way of course, something with directed
searches, and maybe in a few decades systems will be fast enough.  Until
then we will very often see code that is 10% slower and 30% bigger than
necessary.  A single insn more than needed isn't so bad :-)

Making things branch-free is very much worth it here though!


Segher
