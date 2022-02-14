Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138B4B45BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 10:32:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxzWm3ZG9z3bbG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 20:32:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JxzWM2SW0z3bTD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 20:31:42 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21E9TID0001939;
 Mon, 14 Feb 2022 03:29:19 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21E9TIVC001937;
 Mon, 14 Feb 2022 03:29:18 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 14 Feb 2022 03:29:18 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH] net: Remove branch in csum_shift()
Message-ID: <20220214092918.GZ614@gate.crashing.org>
References: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
 <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
 <20220213091619.GY614@gate.crashing.org>
 <476aa649389345db92f86e9103a848be@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <476aa649389345db92f86e9103a848be@AcuMS.aculab.com>
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

On Sun, Feb 13, 2022 at 05:47:52PM +0000, David Laight wrote:
> From: Segher Boessenkool 
> > Sent: 13 February 2022 09:16
> > In an ideal world the compiler could choose the optimal code sequences
> > everywhere.  But that won't ever happen, the search space is way too
> > big.  So compilers just use heuristics, not exhaustive search like
> > superopt does.  There is a middle way of course, something with directed
> > searches, and maybe in a few decades systems will be fast enough.  Until
> > then we will very often see code that is 10% slower and 30% bigger than
> > necessary.  A single insn more than needed isn't so bad :-)
> 
> But it can be a lot more than that.

Obviously, but that isn't the case here (for powerpc anyway).  My point
here is that you won't ever get ideal generated code from your high-
level code (which is what C is), certainly not for all architectures.
But it *is* possible to get something reasonably good.

> > Making things branch-free is very much worth it here though!
> 
> I tried to find out where 'here' is.

I meant "with this patch".

Unpredictable branches are very expensive.  They already were something
to worry about on single-issue in-order processors, but they are much
more expensive now.

> I can't get godbolt to generate anything like that object code
> for a call to csum_shift().
> 
> I can't actually get it to issue a rotate (x86 of ppc).

All powerpc rotate insns start with "rl", and no other insns do.  There
also are extended mnemonics to ease programming, like "rotlw", which is
just a form of rlwinm (rotlw d,s,n is rlwnm d,s,n,0,31).

Depending on what tool you use to display binary code it will show you
extended mnemonics for some insns or just the basic insns.

> I think it is only a single instruction because the compiler
> has saved 'offset & 1' much earlier instead of doing testing
> 'offset & 1' just prior to the conditional.

rlwinm -- "nm" means "and mask".  rlwnm d,s,n,mb,me rotates register s
left by the contents of register n bits, and logical ands it with the
mask from bit mb until bit me.

> It certainly has a nasty habit of doing that pessimisation.

?  Not sure what you mean here.

> I also suspect that the addc/addze pair could be removed
> by passing the old checksum into csum_partial.

Maybe?  Does it not have to return a reduced result here?


Segher
