Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FEE3FDDF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 16:46:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H06MK1x6qz305L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 00:46:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H06Ls1dQbz2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 00:46:12 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 181Ei1DX012275;
 Wed, 1 Sep 2021 09:44:01 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 181Ei1Gd012274;
 Wed, 1 Sep 2021 09:44:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 1 Sep 2021 09:44:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/bug: Cast to unsigned long before passing to
 inline asm
Message-ID: <20210901144401.GI1583@gate.crashing.org>
References: <20210831132720.881643-1-mpe@ellerman.id.au>
 <20210831213432.GF1583@gate.crashing.org> <87tuj43gu1.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuj43gu1.fsf@mpe.ellerman.id.au>
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 01, 2021 at 05:17:26PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > On Tue, Aug 31, 2021 at 11:27:20PM +1000, Michael Ellerman wrote:
> >> Nathan filed an LLVM bug [2], in which Eli Friedman explained that "if
> >> you pass a value of a type that's narrower than a register to an inline
> >> asm, the high bits are undefined". In this case we are passing a bool
> >> to the inline asm, which is a single bit value, and so the compiler
> >> thinks it can leave the high bits of r30 unmasked, because only the
> >> value of bit 0 matters.
> >> 
> >> Because the inline asm compares the full width of the register (32 or
> >> 64-bit) we need to ensure the value passed to the inline asm has all
> >> bits defined. So fix it by casting to long.
> >> 
> >> We also already cast to long for the similar case in BUG_ENTRY(), which
> >> it turns out was added to fix a similar bug in 2005 in commit
> >> 32818c2eb6b8 ("[PATCH] ppc64: Fix issue with gcc 4.0 compiled kernels").
> >
> > That points to <https://gcc.gnu.org/PR23422>, which shows the correct
> > explanation.
> 
> That's a pity because I don't understand that explanation ^_^
> 
> Why does sign extension matter when we're comparing against zero?

The "td" insn wants a 64-bit quantity.  You have to provide one, the
compiler will not do an extend itself, it does not try to understand the
asm template in any way.

> > The code as it was did **not** pass a bool.  It perhaps passed an int
> > (so many macros in play, it is hard to tell for sure, but it is int or
> > long int, perhaps unsigned (which does not change anything here).
> 
> I don't understand that. It definitely is passing a bool at the source
> level. Are you saying it's getting promoted somehow?
> 
> It expands to:

<snip>

> And knode_dead() returns bool:
> 
>   static bool knode_dead(struct klist_node *knode)
>   {
>   	return (unsigned long)knode->n_klist & KNODE_DEAD;
>   }
> 
> So in my book that means the type there is bool. But I'm not a compiler
> guy so I guessing I'm missing something.

I was confused by all the macros and stuff.  And "bool" in the kernel
means "_Bool" now (so it is a character type, with GCC).

> > If this is not the correct explanation for LLVM, it needs to solve some
> > other bug.
> 
> OK. I just need to get this fixed in the kernel, so I'll do a new
> version with a changelog that is ~= "shrug not sure what's going on" and
> merge that. Then we can argue about what is really going on later :)

One thing you should probably do is never pass expressions as asm
operands that are "r".  Instead, make a temporary var and assign to that,
so it will have the type you want, without being able to forget to add
a cast :-)


Segher
