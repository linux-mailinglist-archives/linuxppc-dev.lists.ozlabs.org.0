Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DEC7281AC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 15:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcQWc259tz3fBD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 23:47:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HqK/AlDp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HqK/AlDp;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcQVj1bYLz3dsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 23:46:51 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 103221FDCA;
	Thu,  8 Jun 2023 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686232003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KBbWiKkW090r6xpGGTvZasEo61erYv6UtVsy3logoc=;
	b=HqK/AlDpvfGbTNDmGl55bMAaRj6QwKTZptYCWk/8avkFYFqLmq4bw6Sw0GLb/IrsNS/G57
	8gK1NfadlvJi1Meb9tkQezNlillNl9LFNkb33uQxqs8z0wBiQjM/DsuMQveTjApYL/MMhg
	MqyEbMnJuAYDNVYk5+VBUPnksHEqbWY=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 46C822C141;
	Thu,  8 Jun 2023 13:46:41 +0000 (UTC)
Date: Thu, 8 Jun 2023 15:46:38 +0200
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/7] watchdog/hardlockup: Enable HAVE_NMI_WATCHDOG only
 on sparc64
Message-ID: <ZIHbvlw05razk-oJ@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-5-pmladek@suse.com>
 <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
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

On Wed 2023-06-07 16:36:35, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 13c6e596cf9e..57f15babe188 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -404,10 +404,9 @@ config HAVE_NMI_WATCHDOG
> >         depends on HAVE_NMI
> >         bool
> >         help
> > -         The arch provides its own hardlockup detector implementation instead
> > +         Sparc64 provides its own hardlockup detector implementation instead
> >           of the generic perf one.
> 
> It's a little weird to document generic things with the specifics of
> the user. The exception, IMO, is when something is deprecated.
> Personally, it would sound less weird to me to say something like:

Or I could replace "The arch" by "Sparc64" in the 5th patch which
renames the variable to HAVE_HARDLOCKUP_DETECTOR_SPARC64. It will
not longer be a generic thing...

Or I could squash the two patches. I did not want to do too many
changes at the same time. But it might actually make sense to
do this in one step.

> 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index d201f5d3876b..4b4aa0f941f9 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -1050,15 +1050,13 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
> >  #      sparc64: has a custom implementation which is not using the common
> >  #              hardlockup command line options and sysctl interface.
> >  #
> > -# Note that HAVE_NMI_WATCHDOG is used to distinguish the sparc64 specific
> > -# implementaion. It is automatically enabled also for other arch-specific
> > -# variants which set HAVE_HARDLOCKUP_DETECTOR_ARCH. It makes the check
> > -# of avaialable and supported variants quite tricky.
> > +# Note that HAVE_NMI_WATCHDOG is set when the sparc64 specific implementation
> > +# is used.
> >  #
> >  config HARDLOCKUP_DETECTOR
> >         bool "Detect Hard Lockups"
> > -       depends on DEBUG_KERNEL && !S390
> > -       depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
> > +       depends on DEBUG_KERNEL && !S390 && !HAVE_NMI_WATCHDOG
> > +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
> 
> If you add the "!HAVE_NMI_WATCHDOG" as a dependency to
> HAVE_HARDLOCKUP_DETECTOR_BUDDY, as discussed in a previous patch, you
> can skip adding it here.

It it related to the 2nd patch. Let's discuss it there.

> 
> >         imply HARDLOCKUP_DETECTOR_PERF
> >         imply HARDLOCKUP_DETECTOR_BUDDY
> >         select LOCKUP_DETECTOR
> > @@ -1079,7 +1077,7 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> >         bool "Prefer the buddy CPU hardlockup detector"
> >         depends on HARDLOCKUP_DETECTOR
> >         depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
> > -       depends on !HAVE_NMI_WATCHDOG
> > +       depends on !HAVE_HARLOCKUP_DETECTOR_ARCH
> 
> Don't need this. Architectures never are allowed to define
> HAVE_HARDLOCKUP_DETECTOR_PERF and HAVE_HARLOCKUP_DETECTOR_ARCH

Same here...

Best Regards,
Petr
