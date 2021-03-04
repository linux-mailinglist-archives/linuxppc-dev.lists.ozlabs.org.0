Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC332D926
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 19:02:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrzGl3R67z3dCt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 05:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DrzGQ36ytz3bPG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 05:02:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3662731B;
 Thu,  4 Mar 2021 10:01:59 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.53.210])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38B273F7D7;
 Thu,  4 Mar 2021 10:01:57 -0800 (PST)
Date: Thu, 4 Mar 2021 18:01:54 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210304180154.GD60457@C02TD0UTHF1T.local>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
 <YEEYDSJeLPvqRAHZ@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEEYDSJeLPvqRAHZ@elver.google.com>
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
 linux-toolchains@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 06:25:33PM +0100, Marco Elver wrote:
> On Thu, Mar 04, 2021 at 04:59PM +0000, Mark Rutland wrote:
> > On Thu, Mar 04, 2021 at 04:30:34PM +0100, Marco Elver wrote:
> > > On Thu, 4 Mar 2021 at 15:57, Mark Rutland <mark.rutland@arm.com> wrote:
> > > > [adding Mark Brown]
> > > >
> > > > The bigger problem here is that skipping is dodgy to begin with, and
> > > > this is still liable to break in some cases. One big concern is that
> > > > (especially with LTO) we cannot guarantee the compiler will not inline
> > > > or outline functions, causing the skipp value to be too large or too
> > > > small. That's liable to happen to callers, and in theory (though
> > > > unlikely in practice), portions of arch_stack_walk() or
> > > > stack_trace_save() could get outlined too.
> > > >
> > > > Unless we can get some strong guarantees from compiler folk such that we
> > > > can guarantee a specific function acts boundary for unwinding (and
> > > > doesn't itself get split, etc), the only reliable way I can think to
> > > > solve this requires an assembly trampoline. Whatever we do is liable to
> > > > need some invasive rework.
> > > 
> > > Will LTO and friends respect 'noinline'?
> > 
> > I hope so (and suspect we'd have more problems otherwise), but I don't
> > know whether they actually so.
> > 
> > I suspect even with 'noinline' the compiler is permitted to outline
> > portions of a function if it wanted to (and IIUC it could still make
> > specialized copies in the absence of 'noclone').
> > 
> > > One thing I also noticed is that tail calls would also cause the stack
> > > trace to appear somewhat incomplete (for some of my tests I've
> > > disabled tail call optimizations).
> > 
> > I assume you mean for a chain A->B->C where B tail-calls C, you get a
> > trace A->C? ... or is A going missing too?
> 
> Correct, it's just the A->C outcome.

I'd assumed that those cases were benign, e.g. for livepatching what
matters is what can be returned to, so B disappearing from the trace
isn't a problem there.

Is the concern debugability, or is there a functional issue you have in
mind?

> > > Is there a way to also mark a function non-tail-callable?
> > 
> > I think this can be bodged using __attribute__((optimize("$OPTIONS")))
> > on a caller to inhibit TCO (though IIRC GCC doesn't reliably support
> > function-local optimization options), but I don't expect there's any way
> > to mark a callee as not being tail-callable.
> 
> I don't think this is reliable. It'd be
> __attribute__((optimize("-fno-optimize-sibling-calls"))), but doesn't
> work if applied to the function we do not want to tail-call-optimize,
> but would have to be applied to the function that does the tail-calling.

Yup; that's what I meant then I said you could do that on the caller but
not the callee.

I don't follow why you'd want to put this on the callee, though, so I
think I'm missing something. Considering a set of functions in different
compilation units:

  A->B->C->D->E->F->G->H->I->J->K

... if K were marked in this way, and J was compiled with visibility of
this, J would stick around, but J's callers might not, and so the a
trace might see:

  A->J->K

... do you just care about the final caller, i.e. you just need
certainty that J will be in the trace?

If so, we can somewhat bodge that by having K have an __always_inline
wrapper which has a barrier() or similar after the real call to K, so
the call couldn't be TCO'd.

Otherwise I'd expect we'd probably need to disable TCO generally.

> So it's a bit backwards, even if it worked.
> 
> > Accoding to the GCC documentation, GCC won't TCO noreturn functions, but
> > obviously that's not something we can use generally.
> > 
> > https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes
> 
> Perhaps we can ask the toolchain folks to help add such an attribute. Or
> maybe the feature already exists somewhere, but hidden.
> 
> +Cc linux-toolchains@vger.kernel.org
> 
> > > But I'm also not sure if with all that we'd be guaranteed the code we
> > > want, even though in practice it might.
> > 
> > True! I'd just like to be on the least dodgy ground we can be.
> 
> It's been dodgy for a while, and I'd welcome any low-cost fixes to make
> it less dodgy in the short-term at least. :-)

:)

Thanks,
Mark.
