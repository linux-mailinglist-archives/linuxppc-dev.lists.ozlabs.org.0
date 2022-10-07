Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52A5F7A2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 17:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkWgd1jn4z3drS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 01:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkWg54nNqz3bmW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 01:59:28 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 297EvPPc012174;
	Fri, 7 Oct 2022 09:57:25 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 297EvP5g012173;
	Fri, 7 Oct 2022 09:57:25 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 7 Oct 2022 09:57:25 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Message-ID: <20221007145725.GY25951@gate.crashing.org>
References: <20220923033004.536127-1-npiggin@gmail.com> <20221006195411.GS25951@gate.crashing.org> <CNF6C5XSIE75.3R12NULNLHEN2@bobo> <20221006232345.GW25951@gate.crashing.org> <CNF91RLXUENG.32NIZ5S1R3UCZ@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CNF91RLXUENG.32NIZ5S1R3UCZ@bobo>
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

On Fri, Oct 07, 2022 at 10:03:38AM +1000, Nicholas Piggin wrote:
> On Fri Oct 7, 2022 at 9:23 AM AEST, Segher Boessenkool wrote:
> > > For pcrel addressing? Bootstrapping the C environment is one, the
> > > module dynamic linker is another.
> >
> > I don't know what either of those mean.
> 
> arch/powerpc/kernel/head_64.S and arch/powerpc/kernel/module_64.c
> 
> Can discuss in the pcrel patch series thread if you would like to know
> more.

So "bootstrapping the C environment" is meant to mean "initialising it",
like *rt*.o ("C runtime") does normally?

And "module dynamic linker" is "module loader" here?

Yes, those things probably need some attention for pcrel, but
"bootstrapping" and "dynamic" had me scratch my head: there is nothing
that pulls itself up by its bootstraps (like, the initialisation itself
would be done in C code), and module loading is much closer to static
loading than to dynamic loading :-)

> > Just say in a comment where you disable stuff that it is to prevent
> > possible problems, this is a WIP, that kind of thing?  Otherwise other
> > people (like me :-) ) will read it and think there must be some deeper
> > reason.  Like, changing code to work with pcrel is hard or a lot of
> > work -- it isn't :-)  As you say in 0/7 yourself btw!
> 
> I will describe limitations and issues a bit more in changelog of patches
> to enable prefix and pcrel when I submit as non-RFC candidate. It would
> probably not be too hard to get things to a workable state that could be
> merged.

Looking forward to it!

> > VMX and VSX are disabled here because the compiler *will* use those
> > registers if it feels like it (that is, if it thinks that will be
> > faster).  MMA is a very different beast: the compiler can never know if
> > it will be faster, to start with.
> 
> True, but now I don't have to find the exact clause and have my lawyer
> confirm that it definitely probably won't change in future and break
> things.

Your lawyer won't be able to tell you, but I can.  And I did already.


The reason I care about these things is that very often people look at
what the kernel does as a "best practices" example.  And then copy this
stuff as some cargo cult incantations :-/


Segher
