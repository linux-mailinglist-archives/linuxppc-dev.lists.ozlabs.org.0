Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9B5656B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 15:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc5r10p15z3btl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 23:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKbuqs1z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKbuqs1z;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc5qJ5HwTz30D0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 23:14:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49659614C0;
	Mon,  4 Jul 2022 13:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1EBC341C7;
	Mon,  4 Jul 2022 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656940441;
	bh=absJmAmdqt7XiszFOsAh/vphae1bYJibHDaFucdlIbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKbuqs1zF9TYYgBcxP/Wd2eTmm4950q4wfRQvi377PhwL/mYEBykuBrP0VQ8wSJ3v
	 PAdQzkl7QcgjVqc9JUHh9aFCpajVlu3Panm6xu8EcghEmgztHsyDVbjMrkqHgi/Mws
	 Fe8VnbqUzzRodH3afM7SU7MAG96z9ZKZXURd5IZXVOsjCddtbpZ2vF3M7f0fVu6XLs
	 RHVkAISiSbmWucyWsiyYcYg1TeA9sMwuqgVmH2NuyQaET2EPKUxtkbLwim+zw3Ezzz
	 nbEGSyJ2xvpoLk8XejWwH0BOz1/qIG0AQCoLuSa76CDYtH3xnnfdLg83XKaVJayHeR
	 GcU5dhr0WIKUw==
Received: by pali.im (Postfix)
	id 487F76E8; Mon,  4 Jul 2022 15:13:58 +0200 (CEST)
Date: Mon, 4 Jul 2022 15:13:58 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220704131358.fy3z7tjcmk2m6pfh@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 04 July 2022 14:07:10 Arnd Bergmann wrote:
> On Mon, Jul 4, 2022 at 12:39 PM Pali Rohár <pali@kernel.org> wrote:
> > On Monday 04 July 2022 20:23:29 Michael Ellerman wrote:
> > > On 2 July 2022 7:44:05 pm AEST, "Pali Rohár" <pali@kernel.org> wrote:
> > > >On Tuesday 24 May 2022 11:39:39 Pali Rohár wrote:
> > > >> gcc e500 compiler does not support -mcpu=powerpc option. When it is
> > > >> specified then gcc throws compile error:
> > > >>
> > > >>   gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
> > > >>   gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> > > >>
> > > >> So do not set -mcpu=powerpc option when CONFIG_E500 is set. Correct option
> > > >> -mcpu=8540 for CONFIG_E500 is set few lines below in that Makefile.
> > > >>
> > > >> Signed-off-by: Pali Rohár <pali@kernel.org>
> > > >> Cc: stable@vger.kernel.org
> > > >
> > > >Michael, do you have any objections about this patch?
> > >
> > > I don't particularly like it :)
> > >
> > > From the discussion with Segher, it sounds like this is a problem with a specific build of gcc that you're using, not a general problem with gcc built with e500 support.
> >
> > Well, the "full" build of gcc for e500 cores with SPE does not support
> > -mcpu=powerpc option. So I think this is a general problem. I do not
> > think that this is "specific build" as this is the correct build of gcc
> > for these processors with e500 cores.
> >
> > "stripped". build of gcc without SPE support for e500 cores does not
> > have this problem...
> 
> I can see a couple of problems with the CPU selection, but I don't think
> this is a major one, as nobody should be using those SPE compilers for
> building the kernel. Just use a modern powerpc-gcc build.

The point is to use same compiler for building kernel as for the all
other parts of the system.

I just do not see reason why for kernel it is needed to build completely
different toolchain and compiler.

> > > Keying it off CONFIG_E500 means it will fix your problem, but not anyone else who has a different non-e500 compiler that also doesn't support -mcpu=powerpc (for whatever reason).
> > >
> > > So I wonder if a better fix is to use cc-option when setting -mcpu=powerpc.
> > >
> >
> > Comment for that code which adds -mpcu=powerpc says:
> >
> >   they are needed to set a sane 32-bit cpu target for the 64-bit cross
> >   compiler which may default to the wrong ISA.
> >
> > So I'm not sure how to handle this in other way. GCC uses -mpcu=8540
> > option for specifying to compile code for e500 cores and seems that
> > -mcpu=8540 is supported by all e500 compilers...
> >
> > Few lines below is code
> >
> >   CFLAGS-$(CONFIG_E500) += $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)
> >
> > which for e500 kernel builds user either -mcpu=8540 or -mcpu=powerpc
> > (probably as a fallback if -mcpu=8540 is not supported).
> 
> The -mcpu=powerpc fallback can probably be skipped here, that must have been
> for compilers predating the addition of -mcpu=8540, and even the oldest ones
> support that now.

Ok, makes sense.

> > So for me it looks like that problematic code
> >
> >   KBUILD_CFLAGS         += -mcpu=powerpc
> >   KBUILD_AFLAGS         += -mcpu=powerpc
> >
> > needs to be somehow skipped when compiling for CONFIG_E500.
> >> My change which skips that code base on ifndef CONFIG_E500 should be
> > fine as when CONFIG_E500 is disabled it does nothing and when it is
> > enabled then code
> >
> >   CFLAGS-$(CONFIG_E500) += $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)
> >
> > is called which sets -mcpu option suitable for e500.
> 
> I think this part is indeed fishy, but adding another special case for E500
> seems to take it in the wrong direction.
> 
> Nick added this in 4bf4f42a2feb ("powerpc/kbuild: Set default generic
> machine type
> for 32-bit compile") as a compile-time fix to prevent the default target from
> getting used when the compiler supports both 64-bit and 32-bit. This is the
> right idea, but it's inconsistent to pass different flags depending on the type
> of toolchain, and it loses the more specific options.
> 
> Another problem I see is that a kernel that is built for both E500 and E500MC
> uses -mcpu=e500mc and may not actually work on the older ones either
> (even with your patch).

That is probably truth, -mcpu=8540 should have been chosen. (Anyway it
should have been called -mcpu=e500, no idea why gcc still name it 8540.)

> I think what you actually want is to set one option for each of the
> possible CPU types:
> 
> CFLAGS_CPU-$(CONFIG_PPC_BOOK3S_32) := -mcpu=powerpc
> CFLAGS_CPU-$(CONFIG_PPC_85xx) := -mcpu=8540
> CFLAGS_CPU-$(CONFIG_PPC8xx) := -mcpu=860
> CFLAGS_CPU-$(CONFIG_PPC44x) := -mcpu=440
> CFLAGS_CPU-$(CONFIG_PPC40x) := -mcpu=405
> ifdef CONFIG_CPU_LITTLE_ENDIAN
> CFLAGS_CPU-$(CONFIG_BOOK3S_64) := -mcpu=power8
> else
> CFLAGS_CPU-$(CONFIG_BOOK3S_64) := -mcpu=power5
> endif
> CFLAGS_CPU-$(CONFIG_BOOK3E_64) := -mcpu=powerpc64

Yes, this is something I would expect that in Makefile should be.

But what to do with fallback value?

> For the non-generic CPU types, there is also CONFIG_TARGET_CPU,
> and the list above could just get folded into that instead.
> 
>        Arnd
