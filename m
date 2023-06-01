Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A31719CE5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 15:04:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX5vP2ykCz3dxX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 23:04:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sWoQjeSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sWoQjeSw;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX5tT25NJz3bZS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 23:04:00 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2C0F221980;
	Thu,  1 Jun 2023 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685624632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u3dPTilvXGp8uxMn4l+Fg2INpSwUqim9wefqzjAgkeE=;
	b=sWoQjeSwqeyLwmTMHbHRK38BwL4BPEazkQloeg0LItKG4j9/aawcmj88GFMKrHarpA8e0E
	Ehq1Nt90b/lKIx9jbgcaGJiZEnTuSUReqF0MI+X4gZtM4+WPi/yWoq4XBhz7ZoTF3XDyX7
	nrCbe+8EAxSy9O43hxhmGrxArfXGyzc=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4B9812C142;
	Thu,  1 Jun 2023 13:03:48 +0000 (UTC)
Date: Thu, 1 Jun 2023 15:03:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 10/10] watchdog/hardlockup: Rename
 HAVE_HARDLOCKUP_DETECTOR_NON_ARCH to ..._PERF_OR_BUDDY
Message-ID: <ZHiXMK1QPlCpTmKV@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid>
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

On Fri 2023-05-26 18:41:40, Douglas Anderson wrote:
> HAVE_HARDLOCKUP_DETECTOR_NON_ARCH is a mouthful and
> confusing. HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY is even more of a
> mouthful, but probably less confusing. Rename the Kconfig names.

It is better. But I have an idea that might be even better.

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  lib/Kconfig.debug | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index eb1edd5905bc..b9e162698a82 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1058,7 +1058,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
>  # needs SMP). In either case, using the "non-arch" code conflicts with
>  # the NMI watchdog code (which is sometimes used directly and sometimes used
>  # by the arch-provided hardlockup detector).

The comment above still uses the term "no-arch" and tries to
explain the confusion around it.

> -config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +config HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  	bool
>  	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
>  	default y
> @@ -1077,10 +1077,10 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
>  	  an arch-specific hardlockup detector or if resources needed
>  	  for the hardlockup detector are better used for other things.
>  
> -# This will select the appropriate non-arch hardlockdup detector
> -config HARDLOCKUP_DETECTOR_NON_ARCH
> +# This will select the appropriate non-arch hardlockup detector
> +config HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  	bool
> -	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
>  	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
>  
> @@ -1098,9 +1098,9 @@ config HARDLOCKUP_CHECK_TIMESTAMP
>  config HARDLOCKUP_DETECTOR
>  	bool "Detect Hard Lockups"
>  	depends on DEBUG_KERNEL && !S390
> -	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
> +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
>  	select LOCKUP_DETECTOR
> -	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	select HARDLOCKUP_DETECTOR_PERF_OR_BUDDY if HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
>  
>  	help
>  	  Say Y here to enable the kernel to act as a watchdog to detect

I am sorry but I am still confused by the logic. For me, it is far
from clear what combinations are possible, impossible, and optional.

Especially, the effect of HAVE_NMI_WATCHDOG and
HAVE_HARDLOCKUP_DETECTOR_ARCH is quite tricky.

I was playing with it and came up with a more straightforward solution
and found more possibilities how the simplify the logic. I am going
to prepare a patchset that would replace this patch.

Just to get the idea. I made the following changes:

     + define the values in logical order:
	+ HAVE_*
	+ HARDLOCKUP_DETECTOR y/n value
	+ HARDLOCKUP_DETECTOR_PREFER_BUDDY y/n value
	+ HARDLOCKUP_DETECTOR_PERF decision based on above
	+ HARDLOCKUP_DETECTOR_BUDDY decision based on above

     + remove HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY,
       instead, explicitly define the dependencies on all HAVE_*
       variables to make it clear what it possible
       and what is not possible

     + remove HARDLOCKUP_DETECTOR_PERF_OR_BUDDY,
       instead use "imply" in HARDLOCKUP_DETECTOR to trigger
       re-evaluation of HARDLOCKUP_DETECTOR_PERF and
       HARDLOCKUP_DETECTOR_BUDDY decisions


My current version has the following in lib/Kconfig.devel:

--- cut ---
config HAVE_HARDLOCKUP_DETECTOR_BUDDY
	bool
	depends on SMP
	default y

#
# arch/ can define HAVE_NMI_WATCHDOG to provide their own hard
# lockup detector rather than the generic perf or buddy detector.
#
config HARDLOCKUP_DETECTOR
	bool "Detect Hard Lockups"
	depends on DEBUG_KERNEL && !S390
	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_NMI_WATCHDOG
	imply HARDLOCKUP_DETECTOR_PERF
	imply HARDLOCKUP_DETECTOR_BUDDY
	select LOCKUP_DETECTOR

	help
	  Say Y here to enable the kernel to act as a watchdog to detect
	  hard lockups.

	  Hardlockups are bugs that cause the CPU to loop in kernel mode
	  for more than 10 seconds, without letting other interrupts have a
	  chance to run.  The current stack trace is displayed upon detection
	  and the system will stay locked up.

#
# The architecture-specific variant is always used when available,
# see HAVE_NMI_WATCHDOG
#
config HARDLOCKUP_DETECTOR_PREFER_BUDDY
	bool "Prefer the buddy CPU hardlockup detector"
	depends on HARDLOCKUP_DETECTOR
	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY && !HAVE_NMI_WATCHDOG
	default n
	help
	  Say Y here to prefer the buddy hardlockup detector over the perf one.

	  With the buddy detector, each CPU uses its softlockup hrtimer
	  to check that the next CPU is processing hrtimer interrupts by
	  verifying that a counter is increasing.

	  This hardlockup detector is useful on systems that don't have
	  an arch-specific hardlockup detector or if resources needed
	  for the hardlockup detector are better used for other things.

config HARDLOCKUP_DETECTOR_PERF
	bool
	depends on HARDLOCKUP_DETECTOR
	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY && !HAVE_NMI_WATCHDOG
	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER

config HARDLOCKUP_DETECTOR_BUDDY
	bool
	depends on HARDLOCKUP_DETECTOR
	depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
	depends on HARDLOCKUP_DETECTOR_PREFER_BUDDY || !HAVE_HARDLOCKUP_DETECTOR_PERF
	depends on !HAVE_NMI_WATCHDOG
	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER

# Both the "perf" and "buddy" hardlockup detectors need counting hrtimer
# interrupts.
config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
	bool
	depends on HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_BUDDY
	select SOFTLOCKUP_DETECTOR
--- cut ---

Also I am going to break the dependency between HAVE_NMI_WATCHDOG and
HAVE_HADRDLOCKUP_DETECTOR_ARCH. HAVE_NMI_WATCHDOG is needed only
for the very special powerpc64 watchdog. I am going to make sure
that it will be used only there and it will not be needed for
sparc and arm. As a result, we would have 4 separate implementations:

    + HAVE_HARDLOCKUP_DETECTOR_BUDDY enabled on any SMP system

    + HAVE_HARDLOCKUP_DETECTOR_PERF enabled on architectures supporting
	this perf-based solution

    + HAVE_HARDLOCKUP_DETECTOR_ARCH enabled on architectures which
	need another solution instead of the perf interface;
	they would support the usual HARDLOCKUP_DETECTOR command
	line parameters and sysctl interface

    + HAVE_NMI_WATCHDOG enabled just on powerpc64; it is special
	solution with its own command line parameters. Also it does
	not support hardlockup sysctl interface. I think about
	renaming it to HAVE_HARDLOCKUP_DETECTOR_POWERPC64 or
	_CUSTOM.

Best Regards,
Petr
