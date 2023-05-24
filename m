Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFA70F7C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 15:39:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRC301NhWz3fDX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 23:39:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=b+R628Ql;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=b+R628Ql;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRC2B47kWz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 23:38:40 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 82F0E21FE4;
	Wed, 24 May 2023 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684935517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9PpiufmZYzleg+TlrTh557lZlXDEM/AsL/PhNB0ois=;
	b=b+R628QlRTNsSzyUC35Lh1Knve1z2zY9IzRDNTMeINWO8KcOzZ3/0LdvMfmwhO3yUgN9u0
	3NjN78LPfVkSTa/C8qWoZJEhRh0s7kTbxRKhntcnuX12jzeNk1N45LuX7TCP5yoMvJy4ij
	lnbnezv8q8w8QHqxzgg76qOTb5SCv3E=
Received: from suse.cz (dhcp129.suse.cz [10.100.51.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 3F3BE2C141;
	Wed, 24 May 2023 13:38:36 +0000 (UTC)
Date: Wed, 24 May 2023 15:38:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 12/18] watchdog/hardlockup: Rename some "NMI watchdog"
 constants/function
Message-ID: <ZG4TW--j-DdSsUO6@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozl
 abs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-05-19 10:18:36, Douglas Anderson wrote:
> Do a search and replace of:
> - NMI_WATCHDOG_ENABLED => WATCHDOG_HARDLOCKUP_ENABLED
> - SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED
> - watchdog_nmi_ => watchdog_hardlockup_
> - nmi_watchdog_available => watchdog_hardlockup_available
> - nmi_watchdog_user_enabled => watchdog_hardlockup_user_enabled
> - soft_watchdog_user_enabled => watchdog_softlockup_user_enabled
> - NMI_WATCHDOG_DEFAULT => WATCHDOG_HARDLOCKUP_DEFAULT
> 
> Then update a few comments near where names were changed.
> 
> This is specifically to make it less confusing when we want to
> introduce the buddy hardlockup detector, which isn't using NMIs. As
> part of this, we sanitized a few names for consistency.
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -30,17 +30,17 @@
>  static DEFINE_MUTEX(watchdog_mutex);
>  
>  #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
> -# define NMI_WATCHDOG_DEFAULT	1
> +# define WATCHDOG_HARDLOCKUP_DEFAULT	1
>  #else
> -# define NMI_WATCHDOG_DEFAULT	0
> +# define WATCHDOG_HARDLOCKUP_DEFAULT	0
>  #endif
>  
>  unsigned long __read_mostly watchdog_enabled;
>  int __read_mostly watchdog_user_enabled = 1;
> -int __read_mostly nmi_watchdog_user_enabled = NMI_WATCHDOG_DEFAULT;
> -int __read_mostly soft_watchdog_user_enabled = 1;
> +int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
> +int __read_mostly watchdog_softlockup_user_enabled = 1;

I still see nmi_watchdog_user_enabled and soft_watchdog_user_enabled
in include/linux/nmi.h. They are declared there and also mentioned
in a comment.

It seems that they do not actually need to be declared there.
I guess that it was need for the /proc stuff. But it was
moved into kernel/watchdog.c by the commit commit dd0693fdf054f2ed37
("watchdog: move watchdog sysctl interface to watchdog.c").

>  int __read_mostly watchdog_thresh = 10;
> -static int __read_mostly nmi_watchdog_available;
> +static int __read_mostly watchdog_hardlockup_available;
>  
>  struct cpumask watchdog_cpumask __read_mostly;
>  unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);

Otherwise, I like the changes.

With the following:

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 83076bf70ce8..d14fe345eae9 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -17,8 +17,6 @@ void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
 
 extern int watchdog_user_enabled;
-extern int nmi_watchdog_user_enabled;
-extern int soft_watchdog_user_enabled;
 extern int watchdog_thresh;
 extern unsigned long watchdog_enabled;
 
@@ -68,8 +66,8 @@ static inline void reset_hung_task_detector(void) { }
  * 'watchdog_enabled' variable. Each lockup detector has its dedicated bit -
  * bit 0 for the hard lockup detector and bit 1 for the soft lockup detector.
  *
- * 'watchdog_user_enabled', 'nmi_watchdog_user_enabled' and
- * 'soft_watchdog_user_enabled' are variables that are only used as an
+ * 'watchdog_user_enabled', 'watchdog_hardlockup_user_enabled' and
+ * 'watchdog_softlockup_user_enabled' are variables that are only used as an
  * 'interface' between the parameters in /proc/sys/kernel and the internal
  * state bits in 'watchdog_enabled'. The 'watchdog_thresh' variable is
  * handled differently because its value is not boolean, and the lockup

Reviewed-by: Petr Mladek <pmladek@suse.com>

Even better might be to remove the unused declaration in a separate
patch. I think that more declarations are not needed after moving
the /proc stuff into kernel/watchdog.c.

But it might also be fixed later.

Best Regards,
Petr
