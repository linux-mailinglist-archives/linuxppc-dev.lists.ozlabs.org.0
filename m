Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155C5E7A72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 14:22:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYrqy1Wmbz3dpj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 22:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYrqX2t0qz3c6B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 22:21:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28NCIU7x016687;
	Fri, 23 Sep 2022 07:18:30 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28NCITHi016686;
	Fri, 23 Sep 2022 07:18:29 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 23 Sep 2022 07:18:29 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in irq_soft_mask_{set,return}
Message-ID: <20220923121829.GL25951@gate.crashing.org>
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu> <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 05:08:13PM +1000, Nicholas Piggin wrote:
> On Tue Sep 20, 2022 at 4:41 PM AEST, Christophe Leroy wrote:
> > local_paca is declared as global register asm("r13"), it is therefore
> > garantied to always ever be r13.
> >
> > It is therefore not required to opencode r13 in the assembly, use
> > a reference to local_paca->irq_soft_mask instead.

> The code matches the changelog AFAIKS. But I don't know where it is
> guaranteed it will always be r13 in GCC and Clang. I still don't know
> where in the specification or documentation suggests this.

"Global Register Variables" in the GCC manual.

> There was some assertion it would always be r13, but that can't be a
> *general* rule. e.g., the following code:
> 
> struct foo {
> #ifdef BIGDISP
>         int array[1024*1024];
> #endif
>         char bar;
> };
> 
> register struct foo *foo asm("r13");
> 
> static void setval(char val)
> {
>         asm("stb%X0 %1,%0" : "=m" (foo->bar) : "r" (val));
> }
> 
> int main(void)
> {
>         setval(10);
> }

Just use r13 directly in the asm, if that is what you want!

> With -O0 this generates stb 9,0(10) for me for GCC 12, and with -O2
> -DBIGDISP it generates stb 10,0(9). So that makes me nervious. GCC
> does not have some kind of correctness guarantee here, so it must not
> have this in its regression tests etc., and who knows about clang.

GCC has all kinds of correctness guarantees, here and elsewhere, that is
90% of a compiler's job.  But you don't *tell* it what you consider
"correct" here.

You wrote "foo->bar", and this expression was translated to something
that derived from r13.  If you made the asm something like
	asm("stb%X0 %1,0(%0)" : : "r" (foo), "r" (val) : "memory");
it would work fine.  It would also work fine if you wrote 13 in the
template directly.  These things follow the rules, so are guaranteed.

The most important pieces of doc here may be
   * Accesses to the variable may be optimized as usual and the register
     remains available for allocation and use in any computations,
     provided that observable values of the variable are not affected.
   * If the variable is referenced in inline assembly, the type of
     access must be provided to the compiler via constraints (*note
     Constraints::).  Accesses from basic asms are not supported.
but read the whole "Global Register Variables" chapter?

> If it is true for some particular subset of cases that we can guarantee,
> e.g., using -O2 and irq_soft_mask offset within range of stb offset and
> we can point to specification such that both GCC and Clang will follow
> it, then okay. Otherwise I still think it's more trouble than it is
> worth.

-O2 makes it much more likely some inline assembler things work as
intended, but it guarantees nothing.  Sorry.


Segher
