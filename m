Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A339F570FA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhk6t3DSgz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 11:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S0/JcCbh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S0/JcCbh;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhk6G3312z3bsf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 11:43:00 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id s206so6271029pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=efBjI108FNDgrH81mWfuEW+8lOWoiTSn59YlZxopuqo=;
        b=S0/JcCbhklzJm37yA+X+xY4YciQKLZDOx18f5yXiSPq1kMGboCRhiToigj+Mvrzunm
         mAfbLqPfOwBakJYmDJ83kMjo+cCxQUiU+0PZ/Vs6jRfHrJ2ll5aRu/NlNkENnE3Bp7oC
         1uD+lvUh0kdlbOwL8/5BhB9OVRl7qkcdvIn2cnIl0VBzqnNHqX88QjvhrWM0M+jJYwbP
         UiCvG60QWRRi50X46Oi1OrAK6lkfeoH6k0C1wRelddCBbXKUpzn1dNRPEi2jYqxwOC9P
         eMAqB8tZzwVqMnqT8yc/kP9cBV5zVdQAWgDQqtzMFTZQtbiNkd9Zl6rl3dfxC9D/ysmi
         Y5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=efBjI108FNDgrH81mWfuEW+8lOWoiTSn59YlZxopuqo=;
        b=vsfCU8FcRQodjJsjPPzhKG8iclK1kABNG56fF9A3Bjy7XSysm4xtBsDqo3njG9I8tz
         Ptahlg40+kSANLPrRvoKf3sfGqyRGtbIdLage5gwMEg57clyGHR1PnRzEKWRtNoea6Q7
         o/KBsmD+VlGq1IHGdgMI/v32dWBik2S9vpteharzqHE+uteYCfGdS+gLzV6fPJbl5W57
         jmWSH6EOH6l7gYCXhO78D/kKXwE1RCushXO63gTxtRU8ynDmrqc92ZyPW3Qg7cvyP2v7
         9mKxnbNzv8i36oDFfcyt3DAFW56++YpPnAD0Uz/mT5yXCpxXIGLH7JLzA/Z+tUeO833r
         FQDg==
X-Gm-Message-State: AJIora/3sTg1tRU1iY6DonbvuWbS/LMWIpTRYZEBODuhHw4CIbSkCdg/
	rC6oDd2jLsCbEDL6oUeXoseJDrCzOrQ=
X-Google-Smtp-Source: AGRyM1uIyDCldsts9kc/4nx1k4tXS/V3m+V4ip+typVuJlP8eqpmkGQF2/k95hww38sxRvIAXxI0xg==
X-Received: by 2002:a05:6a00:1818:b0:52a:dabd:a232 with SMTP id y24-20020a056a00181800b0052adabda232mr4646574pfa.70.1657590178596;
        Mon, 11 Jul 2022 18:42:58 -0700 (PDT)
Received: from localhost (193-116-203-247.tpgi.com.au. [193.116.203.247])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902f64c00b0016bf9437766sm5346915plg.261.2022.07.11.18.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 18:42:57 -0700 (PDT)
Date: Tue, 12 Jul 2022 11:42:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc/watchdog: introduce a NMI watchdog's
 factor
To: benh@kernel.crashing.org, haren@linux.vnet.ibm.com, Laurent Dufour
	<ldufour@linux.ibm.com>, linux@roeck-us.net, mpe@ellerman.id.au,
	nathanl@linux.ibm.com, paulus@samba.org, wim@linux-watchdog.org
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
	<20220627135347.32624-4-ldufour@linux.ibm.com>
In-Reply-To: <20220627135347.32624-4-ldufour@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1657589870.vvurapsif3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Dufour's message of June 27, 2022 11:53 pm:
> Introduce a factor which would apply to the NMI watchdog timeout.
>=20
> This factor is a percentage added to the watchdog_tresh value. The value =
is
> set under the watchdog_mutex protection and lockup_detector_reconfigure()
> is called to recompute wd_panic_timeout_tb.
>=20
> Once the factor is set, it remains until it is set back to 0, which means
> no impact.

Looks okay. We could worry about making it more generic or nicer if
another user came along.

Could you make the naming a bit more self documenting?=20
watchdog_nmi_set_timeout_pct(), maybe? Does the wd really care
that it is for LPM in particular?

Variables and parameters could have a _pct suffix too.

Otherwise

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/nmi.h |  2 ++
>  arch/powerpc/kernel/watchdog.c | 21 ++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nm=
i.h
> index ea0e487f87b1..7d6a8d9b0543 100644
> --- a/arch/powerpc/include/asm/nmi.h
> +++ b/arch/powerpc/include/asm/nmi.h
> @@ -5,8 +5,10 @@
>  #ifdef CONFIG_PPC_WATCHDOG
>  extern void arch_touch_nmi_watchdog(void);
>  long soft_nmi_interrupt(struct pt_regs *regs);
> +void watchdog_nmi_set_lpm_factor(u64 factor);
>  #else
>  static inline void arch_touch_nmi_watchdog(void) {}
> +static inline void watchdog_nmi_set_lpm_factor(u64 factor) {}
>  #endif
> =20
>  #ifdef CONFIG_NMI_IPI
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdo=
g.c
> index 7d28b9553654..80851b228f71 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -91,6 +91,10 @@ static cpumask_t wd_smp_cpus_pending;
>  static cpumask_t wd_smp_cpus_stuck;
>  static u64 wd_smp_last_reset_tb;
> =20
> +#ifdef CONFIG_PPC_PSERIES
> +static u64 wd_factor;
> +#endif
> +
>  /*
>   * Try to take the exclusive watchdog action / NMI IPI / printing lock.
>   * wd_smp_lock must be held. If this fails, we should return and wait
> @@ -527,7 +531,13 @@ static int stop_watchdog_on_cpu(unsigned int cpu)
> =20
>  static void watchdog_calc_timeouts(void)
>  {
> -	wd_panic_timeout_tb =3D watchdog_thresh * ppc_tb_freq;
> +	u64 threshold =3D watchdog_thresh;
> +
> +#ifdef CONFIG_PPC_PSERIES
> +	threshold +=3D (READ_ONCE(wd_factor) * threshold) / 100;
> +#endif
> +
> +	wd_panic_timeout_tb =3D threshold * ppc_tb_freq;
> =20
>  	/* Have the SMP detector trigger a bit later */
>  	wd_smp_panic_timeout_tb =3D wd_panic_timeout_tb * 3 / 2;
> @@ -570,3 +580,12 @@ int __init watchdog_nmi_probe(void)
>  	}
>  	return 0;
>  }
> +
> +#ifdef CONFIG_PPC_PSERIES
> +void watchdog_nmi_set_lpm_factor(u64 factor)
> +{
> +	pr_info("Set the NMI watchdog factor to %llu%%\n", factor);
> +	WRITE_ONCE(wd_factor, factor);
> +	lockup_detector_reconfigure();
> +}
> +#endif
> --=20
> 2.36.1
>=20
>=20
