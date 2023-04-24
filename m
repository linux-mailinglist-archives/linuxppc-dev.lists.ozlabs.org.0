Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F886ED123
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 17:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4pgK61vWz3fVn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 01:18:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4pfs6vMQz3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 01:18:13 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 33OFDqb6006351;
	Mon, 24 Apr 2023 10:13:52 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 33OFDpYA006350;
	Mon, 24 Apr 2023 10:13:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 24 Apr 2023 10:13:51 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <20230424151351.GP19790@gate.crashing.org>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com> <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com> <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fs8pzalj.fsf@mail.concordia>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Joel Fernandes <joel@joelfernandes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Apr 24, 2023 at 11:14:00PM +1000, Michael Ellerman wrote:
> Boqun Feng <boqun.feng@gmail.com> writes:
> > On Sat, Apr 22, 2023 at 09:28:39PM +0200, Joel Fernandes wrote:
> >> On Sat, Apr 22, 2023 at 2:47 PM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> >> > by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> >> > but if there is a context-switch before c000000000226edc, a false
> >> > positive will be reported.

> I've never understood why the compiler wants to make a copy of a
> register variable into another register!? >:#

It is usually because a) you told it to (maybe via an earlyclobber), or
b) it looked cheaper.  I don't see either here :-(

> > here I think that the compiler is using r10 as an alias to r13, since
> > for userspace program, it's safe to assume the TLS pointer doesn't
> > change. However this is not true for kernel percpu pointer.

r13 is a "fixed" register, but that means it has a fixed purpose (so not
available for allocation), it does not mean "unchanging".

> > The real intention here is to compare 40(r1) vs 3192(r13) for stack
> > guard checking, however since r13 is the percpu pointer in kernel, so
> > the value of r13 can be changed if the thread gets scheduled to a
> > different CPU after reading r13 for r10.
> 
> Yeah that's not good.

The GCC pattern here makes the four machine insns all stay together.
That is to make sure to not leak any secret value, which is impossible
to guarantee otherwise.

What tells GCC r13 can randomly change behind its back?  And, what then
makes GCC ignore that fact?

> > 	+       asm volatile("" : : : "r13", "memory");

Any asm without output is always volatile.

> > Needless to say, the correct fix is to make ppc stack protector aware of
> > r13 is volatile.
> 
> I suspect the compiler developers will tell us to go jump :)

Why would r13 change over the course of *this* function / this macro,
why can this not happen anywhere else?

> The problem of the compiler caching r13 has come up in the past, but I
> only remember it being "a worry" rather than causing an actual bug.

In most cases the compiler is smart enough to use r13 directly, instead
of copying it to another reg and then using that one.  But not here for
some strange reason.  That of course is a very minor generated machine
code quality bug and nothing more :-(

> We've had the DEBUG_PREEMPT checks in get_paca(), which have given us at
> least some comfort that if the compiler is caching r13, it shouldn't be
> doing it in preemptable regions.
> 
> But obviously that doesn't help at all with the stack protector check.
> 
> I don't see an easy fix.
> 
> Adding "volatile" to the definition of local_paca seems to reduce but
> not elimate the caching of r13, and the GCC docs explicitly say *not* to
> use volatile. It also triggers lots of warnings about volatile being
> discarded.

The point here is to say some code clobbers r13, not the asm volatile?

> Or something simple I haven't thought of? :)

At what points can r13 change?  Only when some particular functions are
called?


Segher
