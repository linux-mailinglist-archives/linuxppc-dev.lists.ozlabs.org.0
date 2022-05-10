Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAA521502
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:14:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyH6F1NXhz3cHX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 22:14:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hXbDIpkh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hXbDIpkh; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyH5b5DzWz2xrf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:14:09 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id x18so16570446plg.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4P2EaKGEH+jdcOlX4AfyzB/ukf7xEI4yNHJh/y1RIOk=;
 b=hXbDIpkhGyRok8d2v7bgOpLFS9XYvJYr9I+ID5KHWzxG4BbiZAjIAmNEK87ukmll7n
 7UJKz4lUEfAPthNA9yFFoSyJ1Ai2Z7WmqbDxRs6BvDlJ2HoZfwx/j5SCPo2XuN3NMWIH
 O4+MhBLI/8T0QAi2W8izPKsLZVnwyZYihJ3flz3DahvBjPR+vsZWxi9oXsCEJZoNsRmQ
 hJv3g7QSJpEWU89iflrnveCx/2PXNU7m8MKYR+vjbEkxSivEWUVmLq5CrpE5W62pXTu8
 360wskvzONw3pNMAfBoTnwIN1C9gv8QiAXJs5pw4BI8J2YNaxXpS4++DZ/osnV6pJYSi
 zmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4P2EaKGEH+jdcOlX4AfyzB/ukf7xEI4yNHJh/y1RIOk=;
 b=1ZGpEL8jnnc0TwR/IVtsAVKfEmAYM9X2yEZWBnqKa2gpeFLrJ/Fa3swSVkuMwBQE52
 zRWW0wg7764EcLvWml0A4U+hxhKhZyNUPU+bIfzeBt+74c21MCHmk3qneAJpEuEf0khl
 txbOImqWqP4iYct/fopvyg+ns7FFbSVQrONVlc2gc3sqZZ50uYS2algotDd/mn4oO6FV
 cMyfC7e7SUZMmVAwdQCV3vQk3DF0LrNSQaVOlSgsmyqvm2RKwHXpT1i4TFeePez/Y0rX
 BKmIB6qbhW2zp/YsqvK51+Ehc9QPIQmK6jzUDoWku4+2OBM0We1CHfnvzK4uhcPbj1n5
 51hQ==
X-Gm-Message-State: AOAM532VhNe+YY4FwMp5/X6OMhbmt+W+rFJFaN1FvRPZSIMRAt57k4hE
 Z9qb9EuuOGg/QU7bzRoUwxc=
X-Google-Smtp-Source: ABdhPJzJAToQf1bsuvOx1j/eutoC/7K7S0JvO2rKDs7VCIhTV7yNnNXkOt3ghkj3E+FkIR2Go2yu5A==
X-Received: by 2002:a17:90b:3b4c:b0:1dc:7edf:c92f with SMTP id
 ot12-20020a17090b3b4c00b001dc7edfc92fmr22394368pjb.91.1652184846778; 
 Tue, 10 May 2022 05:14:06 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a056a00150400b0050dc76281a1sm10909855pfu.123.2022.05.10.05.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 05:14:05 -0700 (PDT)
Date: Tue, 10 May 2022 22:14:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 29/29] x86/tsc: Switch to perf-based hardlockup
 detector if TSC become unstable
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, x86@kernel.org
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-30-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20220506000008.30892-30-ricardo.neri-calderon@linux.intel.com>
MIME-Version: 1.0
Message-Id: <1652184158.yhzceh3nwk.astroid@bobo.none>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
> The HPET-based hardlockup detector relies on the TSC to determine if an
> observed NMI interrupt was originated by HPET timer. Hence, this detector
> can no longer be used with an unstable TSC.
>=20
> In such case, permanently stop the HPET-based hardlockup detector and
> start the perf-based detector.
>=20
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Stephane Eranian <eranian@google.com>
> Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
> Changes since v5:
>  * Relocated the delcaration of hardlockup_detector_switch_to_perf() to
>    x86/nmi.h It does not depend on HPET.
>  * Removed function stub. The shim hardlockup detector is always for x86.
>=20
> Changes since v4:
>  * Added a stub version of hardlockup_detector_switch_to_perf() for
>    !CONFIG_HPET_TIMER. (lkp)
>  * Reconfigure the whole lockup detector instead of unconditionally
>    starting the perf-based hardlockup detector.
>=20
> Changes since v3:
>  * None
>=20
> Changes since v2:
>  * Introduced this patch.
>=20
> Changes since v1:
>  * N/A
> ---
>  arch/x86/include/asm/nmi.h     | 6 ++++++
>  arch/x86/kernel/tsc.c          | 2 ++
>  arch/x86/kernel/watchdog_hld.c | 6 ++++++
>  3 files changed, 14 insertions(+)
>=20
> diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
> index 4a0d5b562c91..47752ff67d8b 100644
> --- a/arch/x86/include/asm/nmi.h
> +++ b/arch/x86/include/asm/nmi.h
> @@ -63,4 +63,10 @@ void stop_nmi(void);
>  void restart_nmi(void);
>  void local_touch_nmi(void);
> =20
> +#ifdef CONFIG_X86_HARDLOCKUP_DETECTOR
> +void hardlockup_detector_switch_to_perf(void);
> +#else
> +static inline void hardlockup_detector_switch_to_perf(void) { }
> +#endif
> +
>  #endif /* _ASM_X86_NMI_H */
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index cc1843044d88..74772ffc79d1 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -1176,6 +1176,8 @@ void mark_tsc_unstable(char *reason)
> =20
>  	clocksource_mark_unstable(&clocksource_tsc_early);
>  	clocksource_mark_unstable(&clocksource_tsc);
> +
> +	hardlockup_detector_switch_to_perf();
>  }
> =20
>  EXPORT_SYMBOL_GPL(mark_tsc_unstable);
> diff --git a/arch/x86/kernel/watchdog_hld.c b/arch/x86/kernel/watchdog_hl=
d.c
> index ef11f0af4ef5..7940977c6312 100644
> --- a/arch/x86/kernel/watchdog_hld.c
> +++ b/arch/x86/kernel/watchdog_hld.c
> @@ -83,3 +83,9 @@ void watchdog_nmi_start(void)
>  	if (detector_type =3D=3D X86_HARDLOCKUP_DETECTOR_HPET)
>  		hardlockup_detector_hpet_start();
>  }
> +
> +void hardlockup_detector_switch_to_perf(void)
> +{
> +	detector_type =3D X86_HARDLOCKUP_DETECTOR_PERF;

Another possible problem along the same lines here,
isn't your watchdog still running at this point? And
it uses detector_type in the switch.

> +	lockup_detector_reconfigure();

Actually the detector_type switch is used in some
functions called by lockup_detector_reconfigure()
e.g., watchdog_nmi_stop, so this seems buggy even
without concurrent watchdog.

Is this switching a good idea in general? The admin
has asked for non-standard option because they want
more PMU counterss available and now it eats a
counter potentially causing a problem rather than
detecting one.

I would rather just disable with a warning if it were
up to me. If you *really* wanted to be fancy then
allow admin to re-enable via proc maybe.

Thanks,
Nick

