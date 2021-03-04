Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA2832D834
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 17:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drxtc5637z3dCW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 03:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DrxtJ5mPQz3clq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 03:59:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E108031B;
 Thu,  4 Mar 2021 08:59:30 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.53.210])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA6FF3F7D7;
 Thu,  4 Mar 2021 08:59:28 -0800 (PST)
Date: Thu, 4 Mar 2021 16:59:23 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210304165923.GA60457@C02TD0UTHF1T.local>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, kasan-dev <kasan-dev@googlegroups.com>,
 linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 04:30:34PM +0100, Marco Elver wrote:
> On Thu, 4 Mar 2021 at 15:57, Mark Rutland <mark.rutland@arm.com> wrote:
> > [adding Mark Brown]
> >
> > The bigger problem here is that skipping is dodgy to begin with, and
> > this is still liable to break in some cases. One big concern is that
> > (especially with LTO) we cannot guarantee the compiler will not inline
> > or outline functions, causing the skipp value to be too large or too
> > small. That's liable to happen to callers, and in theory (though
> > unlikely in practice), portions of arch_stack_walk() or
> > stack_trace_save() could get outlined too.
> >
> > Unless we can get some strong guarantees from compiler folk such that we
> > can guarantee a specific function acts boundary for unwinding (and
> > doesn't itself get split, etc), the only reliable way I can think to
> > solve this requires an assembly trampoline. Whatever we do is liable to
> > need some invasive rework.
> 
> Will LTO and friends respect 'noinline'?

I hope so (and suspect we'd have more problems otherwise), but I don't
know whether they actually so.

I suspect even with 'noinline' the compiler is permitted to outline
portions of a function if it wanted to (and IIUC it could still make
specialized copies in the absence of 'noclone').

> One thing I also noticed is that tail calls would also cause the stack
> trace to appear somewhat incomplete (for some of my tests I've
> disabled tail call optimizations).

I assume you mean for a chain A->B->C where B tail-calls C, you get a
trace A->C? ... or is A going missing too?

> Is there a way to also mark a function non-tail-callable?

I think this can be bodged using __attribute__((optimize("$OPTIONS")))
on a caller to inhibit TCO (though IIRC GCC doesn't reliably support
function-local optimization options), but I don't expect there's any way
to mark a callee as not being tail-callable.

Accoding to the GCC documentation, GCC won't TCO noreturn functions, but
obviously that's not something we can use generally.

https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes

> But I'm also not sure if with all that we'd be guaranteed the code we
> want, even though in practice it might.

True! I'd just like to be on the least dodgy ground we can be.

Thanks,
Mark.
