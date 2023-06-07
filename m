Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA177273DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 02:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc5Gh5wppz3f5l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:50:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iXTEGvg/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iXTEGvg/;
	dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc5Fn1pb5z3dtG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 10:49:30 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-33d0b7114a9so10644505ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 17:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686185367; x=1688777367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhl3RV14fXn8RdG370rcvuPNBbtc0Bpx0+NmOZMVtZc=;
        b=iXTEGvg/ILHFZ4MmctWZrcsjVwX8MURaCUVKSgPXQ4f9X0AhamZU9vmta1Ned9mTP3
         6D9QPRXrJjgLtL5RxnlXzAhQZ67A8838Hh98Eq4zkBKEmPCImr42n3zz6cZq6DNGLyeD
         uScK4Z7i3X+PqwzuHBypvz+xsyH0yewKYaIE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686185367; x=1688777367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhl3RV14fXn8RdG370rcvuPNBbtc0Bpx0+NmOZMVtZc=;
        b=f1IFqbzqMSGa2jjLMiPpChBIDNAUCVViK4k7Gdlaa9Xd1d/oGP0pOAjydUaiAjx2B8
         s39PdnchX15nsxAKIn7+wzCj5n84Xr/+HJbh/qK9u6QKdswiaaQJfgFaMv9tqH/ulEYs
         ulzmZEef3R3lIlhc0ctuyQtoUOr8pc7GU+VomeN1eVON9cSbexKHPdxRBR29SwJ4w9iV
         01zgbgeULE/gvtbVTTREKxD0Nh4lEmw1SziEsaW4Qm8/nlz98SxB2DltOSZM+BtPbJac
         bw/c015Jrcul2jN2Ih94NkZEzZKuvOYa5s+wo3g04qou/o/BckjqfjxDlMbdZRkd6Qz0
         sMTg==
X-Gm-Message-State: AC+VfDxP3OdHnHmo1dXcHurlaWufjmFVITovMH7rtR8Ljy/pwqHfacSB
	EsTFUnl5zZnivZ2tQE8fkBbcJUF8xiEwAukr180=
X-Google-Smtp-Source: ACHHUZ4tvFx5y62BU7wPGs9dBTsSn42tQnPIsM0nm0HYzeZiV/RPAjy3OcX2zth2Icc60bEZVmnUQw==
X-Received: by 2002:a92:dacb:0:b0:33e:5113:577b with SMTP id o11-20020a92dacb000000b0033e5113577bmr3390765ilq.13.1686185366788;
        Wed, 07 Jun 2023 17:49:26 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id n9-20020aa78a49000000b0065e279c5c2csm4435168pfa.181.2023.06.07.17.49.26
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 17:49:26 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b1b51ec3e9so75005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 17:49:26 -0700 (PDT)
X-Received: by 2002:a92:c54d:0:b0:33e:6b65:6f78 with SMTP id
 a13-20020a92c54d000000b0033e6b656f78mr16489ilj.27.1686181007418; Wed, 07 Jun
 2023 16:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-5-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-5-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:36:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
Message-ID: <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
Subject: Re: [PATCH 4/7] watchdog/hardlockup: Enable HAVE_NMI_WATCHDOG only on sparc64
To: Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jun 7, 2023 at 8:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 13c6e596cf9e..57f15babe188 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -404,10 +404,9 @@ config HAVE_NMI_WATCHDOG
>         depends on HAVE_NMI
>         bool
>         help
> -         The arch provides its own hardlockup detector implementation in=
stead
> +         Sparc64 provides its own hardlockup detector implementation ins=
tead
>           of the generic perf one.

It's a little weird to document generic things with the specifics of
the user. The exception, IMO, is when something is deprecated.
Personally, it would sound less weird to me to say something like:

The arch provides its own hardlockup detector implementation instead
of the generic perf one. This is a deprecated thing to do and kept
around until sparc64 provides a full hardlockup implementation or
moves to generic code.


> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d201f5d3876b..4b4aa0f941f9 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1050,15 +1050,13 @@ config HAVE_HARDLOCKUP_DETECTOR_BUDDY
>  #      sparc64: has a custom implementation which is not using the commo=
n
>  #              hardlockup command line options and sysctl interface.
>  #
> -# Note that HAVE_NMI_WATCHDOG is used to distinguish the sparc64 specifi=
c
> -# implementaion. It is automatically enabled also for other arch-specifi=
c
> -# variants which set HAVE_HARDLOCKUP_DETECTOR_ARCH. It makes the check
> -# of avaialable and supported variants quite tricky.
> +# Note that HAVE_NMI_WATCHDOG is set when the sparc64 specific implement=
ation
> +# is used.
>  #
>  config HARDLOCKUP_DETECTOR
>         bool "Detect Hard Lockups"
> -       depends on DEBUG_KERNEL && !S390
> -       depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DET=
ECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
> +       depends on DEBUG_KERNEL && !S390 && !HAVE_NMI_WATCHDOG
> +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETEC=
TOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH

If you add the "!HAVE_NMI_WATCHDOG" as a dependency to
HAVE_HARDLOCKUP_DETECTOR_BUDDY, as discussed in a previous patch, you
can skip adding it here.


>         imply HARDLOCKUP_DETECTOR_PERF
>         imply HARDLOCKUP_DETECTOR_BUDDY
>         select LOCKUP_DETECTOR
> @@ -1079,7 +1077,7 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
>         bool "Prefer the buddy CPU hardlockup detector"
>         depends on HARDLOCKUP_DETECTOR
>         depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETEC=
TOR_BUDDY
> -       depends on !HAVE_NMI_WATCHDOG
> +       depends on !HAVE_HARLOCKUP_DETECTOR_ARCH

Don't need this. Architectures never are allowed to define
HAVE_HARDLOCKUP_DETECTOR_PERF and HAVE_HARLOCKUP_DETECTOR_ARCH


>         default n
>         help
>           Say Y here to prefer the buddy hardlockup detector over the per=
f one.
> @@ -1096,7 +1094,7 @@ config HARDLOCKUP_DETECTOR_PERF
>         bool
>         depends on HARDLOCKUP_DETECTOR
>         depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_=
PREFER_BUDDY
> -       depends on !HAVE_NMI_WATCHDOG
> +       depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH

Similarly, don't need this.


>         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
>
>  config HARDLOCKUP_DETECTOR_BUDDY
> @@ -1104,7 +1102,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
>         depends on HARDLOCKUP_DETECTOR
>         depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
>         depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_=
PREFER_BUDDY
> -       depends on !HAVE_NMI_WATCHDOG
> +       depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH

Similarly, don't need this.


In general I don't object to splitting out HAVE_NMI_WATCHDOG from
HAVE_HARDLOCKUP_DETECTOR_ARCH.
