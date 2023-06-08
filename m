Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0A727D75
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 13:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcLsz2v40z3f6L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:03:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CCLKjh4l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CCLKjh4l;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcLs43xTFz3dsc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 21:02:31 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 722EC1FDE2;
	Thu,  8 Jun 2023 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686222147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6g44MDDH9tfB/XpM0/EESISEKQiRS6U0QnFvaGcmzdk=;
	b=CCLKjh4l086lb/mfvsw8O378/hEr9vO/2QT8GYe9J9S/ENCObCwIhDoN0A8TCMonSEPAkF
	NYZZCOgVX0xxpN+/I41wO4gktn2BkEypvV6mCUFLMhGH6Lie8tFWk9aANtZJqOZH95HZFv
	n9GWwORRzUw0ojKl1Ui++tV2Z8p66P0=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 012D62C141;
	Thu,  8 Jun 2023 11:02:26 +0000 (UTC)
Date: Thu, 8 Jun 2023 13:02:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/7] watchdog/hardlockup: Make the config checks more
 straightforward
Message-ID: <ZIG1Qi0iUjTKICQM@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2023-06-07 16:35:09, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 422f0ffa269e..13c6e596cf9e 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -404,17 +404,27 @@ config HAVE_NMI_WATCHDOG
> >         depends on HAVE_NMI
> >         bool
> >         help
> > -         The arch provides a low level NMI watchdog. It provides
> > -         asm/nmi.h, and defines its own watchdog_hardlockup_probe() and
> > -         arch_touch_nmi_watchdog().
> > +         The arch provides its own hardlockup detector implementation instead
> > +         of the generic perf one.
> 
> nit: did you mean to have different wording here compared to
> HAVE_HARDLOCKUP_DETECTOR_ARCH? Here you say "the generic perf one" and
> there you say "the generic ones", though it seems like you mean them
> to be the same.

Good point, I'll fix it in v2.

> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 3e91fa33c7a0..d201f5d3876b 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -1035,16 +1035,33 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
> >
> >           Say N if unsure.
> >
> > +config HAVE_HARDLOCKUP_DETECTOR_BUDDY
> > +       bool
> > +       depends on SMP
> > +       default y
> 
> I think you simplify your life if you also add:
> 
>   depends on !HAVE_NMI_WATCHDOG
> 
> The existing config system has always assumed that no architecture
> defines both HAVE_HARDLOCKUP_DETECTOR_PERF and HAVE_NMI_WATCHDOG
> (symbols would have clashed and you would get a link error as two
> watchdogs try to implement the same weak symbol). If you add the extra
> dependency to "buddy" as per above, then a few things below fall out.
> I'll try to point them out below.

My aim is to have two variables with and without HAVE_* prefix
for each variant. They already existed for perf:

   + HAVE_HARDLOCKUP_DETECTOR_PERF means that it is supported by the arch.
   + HARDLOCKUP_DETECTOR_PERF means that it will really be built.

1. It will make it clear what variants are available on the give system.
   And it will make it clear what variant is used in the end.

2. It allows to add the dependecy on the global switch HARDLOCKUP_DETECTOR.
   It makes it clear that the detector could be disabled by this switch.
   Also it actually allows to use both top-bottom logic and C-like
   definition ordering.


> 
> > +
> >  #
> > -# arch/ can define HAVE_HARDLOCKUP_DETECTOR_ARCH to provide their own hard
> > -# lockup detector rather than the perf based detector.
> > +# Global switch whether to build a hardlockup detector at all. It is available
> > +# only when the architecture supports at least one implementation. There are
> > +# two exceptions. The hardlockup detector is newer enabled on:
> 
> s/newer/never/

Great catch. Will fix in v2.

> > +#
> > +#      s390: it reported many false positives there
> > +#
> > +#      sparc64: has a custom implementation which is not using the common
> > +#              hardlockup command line options and sysctl interface.
> > +#
> > +# Note that HAVE_NMI_WATCHDOG is used to distinguish the sparc64 specific
> > +# implementaion. It is automatically enabled also for other arch-specific
> > +# variants which set HAVE_HARDLOCKUP_DETECTOR_ARCH. It makes the check
> > +# of avaialable and supported variants quite tricky.
> >  #
> >  config HARDLOCKUP_DETECTOR
> >         bool "Detect Hard Lockups"
> >         depends on DEBUG_KERNEL && !S390
> > -       depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
> > +       depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
> 
> Adding the dependency to buddy (see ablove) would simplify the above
> to just this:
> 
> depends on HAVE_HARDLOCKUP_DETECTOR_PERF ||
> HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH

This is exactly what I do not want. It would just move the check
somewhere else. But it would make the logic harder to understand.
Especially when the related definitions could not be found by cscope.

> As per above, it's simply a responsibility of architectures not to
> define that they have both "perf" if they have the NMI watchdog, so
> it's just buddy to worry about.

Where is this documented, please?
Is it safe to assume this?

I would personally prefer to ensure this by the config check.
It is even better than documentation because nobody reads
documentation ;-)

It took me long time to understand all the dependencies and
possibilities. My motivation is that neither me nor others
would need to absolve the same adventure in the future.

> 
> > +       imply HARDLOCKUP_DETECTOR_PERF
> > +       imply HARDLOCKUP_DETECTOR_BUDDY
> >         select LOCKUP_DETECTOR
> > -       select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> >
> >         help
> >           Say Y here to enable the kernel to act as a watchdog to detect
> > @@ -1055,9 +1072,15 @@ config HARDLOCKUP_DETECTOR
> >           chance to run.  The current stack trace is displayed upon detection
> >           and the system will stay locked up.
> >
> > +#
> > +# Note that arch-specific variants are always preferred.
> > +#
> >  config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> >         bool "Prefer the buddy CPU hardlockup detector"
> > -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
> > +       depends on HARDLOCKUP_DETECTOR
> > +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
> > +       depends on !HAVE_NMI_WATCHDOG
> 
> Can get rid of above "!HAVE_NMI_WATCHDOG" if it's added to
> HAVE_HARDLOCKUP_DETECTOR_BUDDY.

I would prefer to keep it hear to make it clear on the first look.

> > +       default n
> 
> I'm pretty sure "default n" isn't needed.

I'll try and fix in v2.

> 
> >         help
> >           Say Y here to prefer the buddy hardlockup detector over the perf one.
> >
> > @@ -1071,39 +1094,27 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> >
> >  config HARDLOCKUP_DETECTOR_PERF
> >         bool
> > -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF
> > +       depends on HARDLOCKUP_DETECTOR
> > +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > +       depends on !HAVE_NMI_WATCHDOG
> 
> We don't really need the "!HAVE_NMI_WATCHDOG". A user wouldn't be able
> to mess this up and it's up to an architecture not to define both
> HAVE_HARDLOCKUP_DETECTOR_PERF and HAVE_NMI_WATCHDOG.

This is an assumption that only few people knows. I would prefer
to enforce this by the check.

> Overall, though, I agree that this improves things! Thanks! :-)

Thanks a lot for the review. I did my best and I got lost many times ;-)

Best Regards,
Petr
