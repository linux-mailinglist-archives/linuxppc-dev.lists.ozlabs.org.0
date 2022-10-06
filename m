Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB285F71BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk6yN6DPtz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 10:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk6xn1nnNz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 10:25:48 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 296NNj8T025405;
	Thu, 6 Oct 2022 18:23:45 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 296NNjhP025402;
	Thu, 6 Oct 2022 18:23:45 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 6 Oct 2022 18:23:45 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Message-ID: <20221006232345.GW25951@gate.crashing.org>
References: <20220923033004.536127-1-npiggin@gmail.com> <20221006195411.GS25951@gate.crashing.org> <CNF6C5XSIE75.3R12NULNLHEN2@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CNF6C5XSIE75.3R12NULNLHEN2@bobo>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 07:56:09AM +1000, Nicholas Piggin wrote:
> On Fri Oct 7, 2022 at 5:54 AM AEST, Segher Boessenkool wrote:
> > On Fri, Sep 23, 2022 at 01:30:04PM +1000, Nicholas Piggin wrote:
> > > This adds basic POWER10_CPU option, which builds with -mcpu=power10.
> >
> > > +# No prefix or pcrel
> > > +KBUILD_CFLAGS += $(call cc-option,-mno-prefixed)
> > > +KBUILD_CFLAGS += $(call cc-option,-mno-pcrel)
> >
> > Why do you disable all prefixed insns?  What goes wrong if you don't?
> 
> Potentially things like kprobes.

So mention that?  "This patch is due to an abundance of caution".

What I meant to ask is if you *saw* something going wrong, not if you
can imagine something going wrong.  I can imagine ten gazillion things
going wrong, that is not why I asked :-)

> > Same question for pcrel.  I'm sure you want to optimise it better, but
> > it's not clear to me how it fails now?
> 
> For pcrel addressing? Bootstrapping the C environment is one, the
> module dynamic linker is another.

I don't know what either of those mean.

> Some details in this series.
> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/248521.html

I've watched that series with great interest, but I don't remember
anything like that?  Are you refering to the commentary in 7/7?
"Definitely ftrace and probes, possibly BPF and KVM have some breakage.
I haven't looked closely yet."...  This doesn't mean much does it :-)
It can be a triviality or two.  Or it could be a massive roadblock.

Just say in a comment where you disable stuff that it is to prevent
possible problems, this is a WIP, that kind of thing?  Otherwise other
people (like me :-) ) will read it and think there must be some deeper
reason.  Like, changing code to work with pcrel is hard or a lot of
work -- it isn't :-)  As you say in 0/7 yourself btw!

> > > +# No AltiVec or VSX or MMA instructions when building kernel
> > >  KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
> > >  KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
> > > +KBUILD_CFLAGS += $(call cc-option,-mno-mma)
> >
> > MMA code is never generated unless the code asks for it explicitly.
> > This is fundamental, not just an implementations side effect.
> 
> Well, now it double won't be generated :)

Yeah, but there are many other things you can unnecessarily disable as
well!  :-)

VMX and VSX are disabled here because the compiler *will* use those
registers if it feels like it (that is, if it thinks that will be
faster).  MMA is a very different beast: the compiler can never know if
it will be faster, to start with.


Segher
