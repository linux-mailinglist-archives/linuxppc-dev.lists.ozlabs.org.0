Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E95F79DA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 16:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkWGZ5m3Zz3dwH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 01:41:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkWG21FkNz2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 01:41:12 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 297Ec5Il011226;
	Fri, 7 Oct 2022 09:38:05 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 297Ec5qG011225;
	Fri, 7 Oct 2022 09:38:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 7 Oct 2022 09:38:04 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Message-ID: <20221007143804.GX25951@gate.crashing.org>
References: <20220923033004.536127-1-npiggin@gmail.com> <20221006195411.GS25951@gate.crashing.org> <CNF6C5XSIE75.3R12NULNLHEN2@bobo> <20221006232345.GW25951@gate.crashing.org> <CNF91RLXUENG.32NIZ5S1R3UCZ@bobo> <87wn9cnqrz.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn9cnqrz.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 04:31:28PM +1100, Michael Ellerman wrote:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
> > On Fri Oct 7, 2022 at 9:23 AM AEST, Segher Boessenkool wrote:
> >> On Fri, Oct 07, 2022 at 07:56:09AM +1000, Nicholas Piggin wrote:
> >> > On Fri Oct 7, 2022 at 5:54 AM AEST, Segher Boessenkool wrote:
> >> > > On Fri, Sep 23, 2022 at 01:30:04PM +1000, Nicholas Piggin wrote:
> ...
> >> > > > +# No AltiVec or VSX or MMA instructions when building kernel
> >> > > >  KBUILD_CFLAGS += $(call cc-option,-mno-altivec)
> >> > > >  KBUILD_CFLAGS += $(call cc-option,-mno-vsx)
> >> > > > +KBUILD_CFLAGS += $(call cc-option,-mno-mma)
> >> > >
> >> > > MMA code is never generated unless the code asks for it explicitly.
> >> > > This is fundamental, not just an implementations side effect.
> >> > 
> >> > Well, now it double won't be generated :)
> >>
> >> Yeah, but there are many other things you can unnecessarily disable as
> >> well!  :-)
> >>
> >> VMX and VSX are disabled here because the compiler *will* use those
> >> registers if it feels like it (that is, if it thinks that will be
> >> faster).  MMA is a very different beast: the compiler can never know if
> >> it will be faster, to start with.
> >
> > True, but now I don't have to find the exact clause and have my lawyer
> > confirm that it definitely probably won't change in future and break
> > things.
> 
> Right. If someone asks "does the kernel ever use MMA instructions?" we
> can just point at that line and we have a definite answer. No need to
> audit the behaviour of all GCC and Clang versions ever released.

As I said, no sane compiler can use MMA ever (unless asked for it
directly of course).  But yeah, who knows what clang does!


Segher
