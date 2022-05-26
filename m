Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFDE534F81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 14:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L870F1fvsz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 22:43:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L86zr0g77z2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 22:43:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8242A1688;
	Thu, 26 May 2022 05:42:44 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.27.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D8193F70D;
	Thu, 26 May 2022 05:42:41 -0700 (PDT)
Date: Thu, 26 May 2022 13:42:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] locking/lockref: Use try_cmpxchg64 in CMPXCHG_LOOP
 macro
Message-ID: <Yo91omfDZtTgXhyn@FVFF77S0Q05N.cambridge.arm.com>
References: <CAHk-=wh1XeaxWXG5QziGA4ds918UnW1hO924kusgVB-wGj+9Og@mail.gmail.com>
 <871qwgmqws.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qwgmqws.fsf@mpe.ellerman.id.au>
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
Cc: Waiman.Long@hp.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, the arch/x86 maintainers <x86@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 10:14:59PM +1000, Michael Ellerman wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> > On Wed, May 25, 2022 at 7:40 AM Uros Bizjak <ubizjak@gmail.com> wrote:
> >>
> >> Use try_cmpxchg64 instead of cmpxchg64 in CMPXCHG_LOOP macro.
> >> x86 CMPXCHG instruction returns success in ZF flag, so this
> >> change saves a compare after cmpxchg (and related move instruction
> >> in front of cmpxchg). The main loop of lockref_get improves from:
> >
> > Ack on this one regardless of the 32-bit x86 question.
> >
> > HOWEVER.
> >
> > I'd like other architectures to pipe up too, because I think right now
> > x86 is the only one that implements that "arch_try_cmpxchg()" family
> > of operations natively, and I think the generic fallback for when it
> > is missing might be kind of nasty.
> >
> > Maybe it ends up generating ok code, but it's also possible that it
> > just didn't matter when it was only used in one place in the
> > scheduler.
> 
> This patch seems to generate slightly *better* code on powerpc.
> 
> I see one register-to-register move that gets shifted slightly later, so
> that it's skipped on the path that returns directly via the SUCCESS
> case.

FWIW, I see the same on arm64; a register-to-register move gets moved out of
the success path. That changes the register allocation, and resulting in one
fewer move, but otherwise the code generation is the same.

Thanks,
Mark.
