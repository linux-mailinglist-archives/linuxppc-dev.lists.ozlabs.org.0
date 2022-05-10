Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57E52136D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 13:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyFr94D0bz3cHh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 21:17:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P3c5o4HP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P3c5o4HP; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyFq24PT2z3c7R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 21:16:29 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id j6so14652522pfe.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 04:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=itXK+rSLc1QihSjSoLaf7Q70y9HboDnIPkUMbBBhjnc=;
 b=P3c5o4HPneI+4Z47/3z0XyAHSGtCqvR/q0W4Nq/bwgtUcYH0Uy0Jd0jWxYk3ghvprP
 M0MmtF9mSteO6SObGM+KeBSRL/Th4Qu4mVxig0ifQZanH/5wImDWSHEoJhwowNlgQztq
 +fdho63/Z8O8Z+lPnO6hj/iRJm5XvhSDG1+J1izpbMQslnk4JvepsnrwPHrDGzxgn5TR
 vcaqxwR/GfEGirCr+I2kPVsku19Q8PppQZVPQfxI8KglDGZCMvJ1WONiiaZUQFmDypie
 o8tTi9z3MKBG9nHO9duRSWery/b9fOyTFXWIIbFoAAf1r0nJxinLTdMxGhUiFTNW8gL+
 06eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=itXK+rSLc1QihSjSoLaf7Q70y9HboDnIPkUMbBBhjnc=;
 b=HOoSB9DqYSV3xuQovDYi4rMuDl3sH4icT71dwcr7U7PuwGJ2dPQVNVyHdMLT5qK+o0
 n2GZk7EHhwfvGcQVVdlgaR/gx599m92eb4GySXZJpr2pEjsEj+8+6e9Xe06FBzUBEEZY
 yJUcMf2yaGe9GSZVeO3HFUCrR/4DuoXR9HuA8gm5gQc9OUQSynLeDPn6oN3F0BJ0PERt
 y1/PsBJhS70uKho5th4AjLPR66QoTHp5CPJOjpqw0uRxUQDfYbA3b/cZS6IJaxgkm+Gu
 FMTRupNEcFpmbrbMdCik8lW2k6uO6TfCiAoejBx8QGJM/JVurP4AmU8wHOlh8Ri8aP4c
 4dTA==
X-Gm-Message-State: AOAM533Mg76GjgYAZ8qIM7mwjQ6gxP3TLC9k7LdqqIljW1X/5Z1bbcan
 +gdqKPczSi+GCdH6IV/WMV8=
X-Google-Smtp-Source: ABdhPJzVsABH4Oig0yRdlWGkgOiTbMOjWkvb+1zdab8hPOxvRkmGZAkmCY+fGQiGE352GRJimRZReg==
X-Received: by 2002:a05:6a00:21c2:b0:4fe:81f:46c7 with SMTP id
 t2-20020a056a0021c200b004fe081f46c7mr19960372pfj.5.1652181387580; 
 Tue, 10 May 2022 04:16:27 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 z29-20020aa79f9d000000b0050dc7628170sm10462375pfr.74.2022.05.10.04.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 04:16:26 -0700 (PDT)
Date: Tue, 10 May 2022 21:16:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 28/29] x86/tsc: Restart NMI watchdog after refining
 tsc_khz
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, x86@kernel.org
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-29-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20220506000008.30892-29-ricardo.neri-calderon@linux.intel.com>
MIME-Version: 1.0
Message-Id: <1652180070.1r874kr0tg.astroid@bobo.none>
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
> The HPET hardlockup detector relies on tsc_khz to estimate the value of
> that the TSC will have when its HPET channel fires. A refined tsc_khz
> helps to estimate better the expected TSC value.
>=20
> Using the early value of tsc_khz may lead to a large error in the expecte=
d
> TSC value. Restarting the NMI watchdog detector has the effect of kicking
> its HPET channel and make use of the refined tsc_khz.
>=20
> When the HPET hardlockup is not in use, restarting the NMI watchdog is
> a noop.
>=20
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Stephane Eranian <eranian@google.com>
> Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
> Changes since v5:
>  * Introduced this patch
>=20
> Changes since v4
>  * N/A
>=20
> Changes since v3
>  * N/A
>=20
> Changes since v2:
>  * N/A
>=20
> Changes since v1:
>  * N/A
> ---
>  arch/x86/kernel/tsc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index cafacb2e58cc..cc1843044d88 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -1386,6 +1386,12 @@ static void tsc_refine_calibration_work(struct wor=
k_struct *work)
>  	/* Inform the TSC deadline clockevent devices about the recalibration *=
/
>  	lapic_update_tsc_freq();
> =20
> +	/*
> +	 * If in use, the HPET hardlockup detector relies on tsc_khz.
> +	 * Reconfigure it to make use of the refined tsc_khz.
> +	 */
> +	lockup_detector_reconfigure();

I don't know if the API is conceptually good.

You change something that the lockup detector is currently using,=20
*while* the detector is running asynchronously, and then reconfigure
it. What happens in the window? If this code is only used for small
adjustments maybe it does not really matter but in principle it's
a bad API to export.

lockup_detector_reconfigure as an internal API is okay because it
reconfigures things while the watchdog is stopped [actually that
looks untrue for soft dog which uses watchdog_thresh in
is_softlockup(), but that should be fixed].

You're the arch so you're allowed to stop the watchdog and configure
it, e.g., hardlockup_detector_perf_stop() is called in arch/.

So you want to disable HPET watchdog if it was enabled, then update
wherever you're using tsc_khz, then re-enable.

Thanks,
Nick
