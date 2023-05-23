Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A089170D9B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQVCC47JFz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:59:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ukTNS+LA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ukTNS+LA;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQVBN1xT0z3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:58:18 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id ABFEE228CB;
	Tue, 23 May 2023 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684835895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nijlHHOQkzUZvFPKISvsuCEtH+liiy/rrVmusLy93j8=;
	b=ukTNS+LA6LnEMXgs7TAWMh1IEmoqBA7OQZDzqQXjQCWc5jDXPfiss/BRVs+P68hkc1jpJr
	c6osfgyH7PPHg1SaA9cUw8ILMGtVpU6UYgIiSt2i5Y85hLTxvlKanmjx7xXSsVqooWm2a+
	O77Wy9lZcLNnFK6dGprQMn1Tn2HdM8E=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 305BA2C141;
	Tue, 23 May 2023 09:58:14 +0000 (UTC)
Date: Tue, 23 May 2023 11:58:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 06/18] watchdog/hardlockup: Add comments to
 touch_nmi_watchdog()
Message-ID: <ZGyONWPXpE1DcxA5@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.6.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.6.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
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

On Fri 2023-05-19 10:18:30, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector, add comments to
> touch_nmi_watchdog() to make it obvious that it touches the configured
> hardlockup detector regardless of whether it's backed by an NMI. Also
> note that arch_touch_nmi_watchdog() may not be architecture-specific.
> 
> Ideally, we'd like to rename these functions but that is a fairly
> disruptive change touching a lot of drivers. After discussion [1] the
> plan is to defer this until a good time.
> 
> [1] https://lore.kernel.org/r/ZFy0TX1tfhlH8gxj@alley
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v5:
> - No longer rename touch_nmi_watchdog(), just add comments.
> 
> Changes in v4:
> - ("Rename touch_nmi_watchdog() to ...") new for v4.
> 
>  include/linux/nmi.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 454fe99c4874..fafab128f37e 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -125,15 +125,30 @@ void watchdog_nmi_disable(unsigned int cpu);
>  void lockup_detector_reconfigure(void);
>  
>  /**
> - * touch_nmi_watchdog - restart NMI watchdog timeout.
> + * touch_nmi_watchdog - manually pet the hardlockup watchdog.
>   *
> - * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
> - * may be used to reset the timeout - for code which intentionally
> - * disables interrupts for a long time. This call is stateless.
> + * If we support detecting hardlockups, touch_nmi_watchdog() may be
> + * used to pet the watchdog (reset the timeout) - for code which

Nit: I personally prefer "reset the timeout" over "pet the watchdog".
     "pet" is just another ambiguous name as "touch" ;-)

> + * intentionally disables interrupts for a long time. This call is stateless.
> + *
> + * Though this function has "nmi" in the name, the hardlockup watchdog might
> + * not be backed by NMIs. This function will likely be renamed to
> + * touch_hardlockup_watchdog() in the future.
>   */
>  static inline void touch_nmi_watchdog(void)
>  {
> +	/*
> +	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
> +	 * the hardlockup detector may not be arch-specific nor using NMIs
> +	 * and the arch_touch_nmi_watchdog() function will likely be renamed
> +	 * in the future.
> +	 */
>  	arch_touch_nmi_watchdog();
> +
> +	/*
> +	 * Touching the hardlock detector implcitily pets the
> +	 * softlockup detector too
> +	 */

s/implcitily/implicitly/

That said, I would remove this comment completely. It describes what
is clear from the code.

A more useful information would be why it is done. But it is probably
clear as well. CPU could not schedule when interrupts are disabled.

>  	touch_softlockup_watchdog();
>  }

With the removed comment above touch_softlockup_watchdog():

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
