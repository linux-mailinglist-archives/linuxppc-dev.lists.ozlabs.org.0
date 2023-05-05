Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE36F7B2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFRs3Kyyz3fFY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 12:46:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WY+pVFDr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WY+pVFDr;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFR16fBHz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 12:45:17 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ab0c697c2bso11375355ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 19:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683254715; x=1685846715;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPayZxQXhn5fHUUTNLTNfbsixo+tOxhKRUmk7oh5a/w=;
        b=WY+pVFDrtbMq8x5EimKII2bW9WUx1lTIueOxBuy+296TzJv/lBCs2CVAl95G11oi+6
         OZNsCVJXRYwNOUePuVJ0+7z9G92HLzFZEMU/ej0a0B82cu11Q9UTbuSiZAbzM14CvYQr
         vSBwEP/zedkJKPWlTT86wxJPoMzMwlMsssbc0ETJDwX1uinKmleFDpH+izvPPzVQ2LlX
         GBO/I7GPjSznEYiBLpenS8d5vQj8J9utS5crxpbEVjZ/mmpFvTw1bfgpr3vdS/SdWaXC
         fm0hYT4RrH3rTkpnTHaFTuS8OW6QdYF/oypQk9UEjTZoOxeIHIMj1e8JUXXQYGHF51Uc
         39eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683254715; x=1685846715;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPayZxQXhn5fHUUTNLTNfbsixo+tOxhKRUmk7oh5a/w=;
        b=Kiw4GR77giJm2hNdG1KtcLCvLEV91aR2gZTPHrNfXzn4iARgMLYzngfCWRPQrqVdCM
         Klp/rDpNZpviZcWNOEQepj7riRzAJwd1B0GGwbjXVGSyZlNbj0qu+fxMdKQLauDiWl+n
         n2iciPu55hCYH+qOulaZXA8jT9U8LRnkXwCecZszEeeOvX6zJ3GYaxPly0MrLz7tfruB
         YOW84amHfik5omaIjCRwQ6FJ4KvqUkVj8q9TsvDzM8tYLHf4UCLi8Koh2sTxsTpX8awg
         rsuA8+x2KAz0Mz2p4uQPXI5lsv99ZVj2C+SM7v/Czw1GaUK0m+j4HZ+U1Y1nv+/Q/LmA
         vj1w==
X-Gm-Message-State: AC+VfDx0XzB6dEqEB5OuROgAcrBaAsIRnJaacaoHyrqjhb1pKyPaOcZ8
	jwyqoHo1gMJc0c8NXhKVpO4=
X-Google-Smtp-Source: ACHHUZ7idBWKbQjk10tpmFWDhGOiQRpg+CYPjBMjjCmko/Hu86hwsF4Jk+5iuKMKBjLrW41Iwy8Stg==
X-Received: by 2002:a17:902:d315:b0:1ab:13bd:5f96 with SMTP id b21-20020a170902d31500b001ab13bd5f96mr5830962plc.4.1683254714963;
        Thu, 04 May 2023 19:45:14 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id o5-20020a1709026b0500b001a6cd1e4205sm320934plk.279.2023.05.04.19.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 19:45:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 12:45:00 +1000
Message-Id: <CSDZZQEL28W8.1WE80JHITRBKA@wheely>
Subject: Re: [PATCH v4 03/17] watchdog/hardlockup: change
 watchdog_nmi_enable() to void
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.3.Ic3a19b592eb1ac4c6f6eade44ffd943e8637b6e5@changeid>
In-Reply-To: <20230504151100.v4.3.Ic3a19b592eb1ac4c6f6eade44ffd943e8637b6e5@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> From: Lecopzer Chen <lecopzer.chen@mediatek.com>
>
> Nobody cares about the return value of watchdog_nmi_enable(),
> changing its prototype to void.
>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I yanked this patch from the mailing lists [1] into my series just to
> make it easier to avoid conflicts between my series and the one adding
> the arm64 perf hardlockup detector, in case someone wanted to test
> them both together. This is a nice cleanup and could land together
> with the rest of my series if that makes sense.
>
> I changed the patch prefix to match others in my series.
>
> [1] https://lore.kernel.org/r/20220903093415.15850-3-lecopzer.chen@mediat=
ek.com/
>
> Changes in v4:
> - Pulled ("change watchdog_nmi_enable() to void") into my series for v4.
>
>  arch/sparc/kernel/nmi.c | 8 +++-----
>  include/linux/nmi.h     | 2 +-
>  kernel/watchdog.c       | 3 +--
>  3 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/sparc/kernel/nmi.c b/arch/sparc/kernel/nmi.c
> index 060fff95a305..5dcf31f7e81f 100644
> --- a/arch/sparc/kernel/nmi.c
> +++ b/arch/sparc/kernel/nmi.c
> @@ -282,11 +282,11 @@ __setup("nmi_watchdog=3D", setup_nmi_watchdog);
>   * sparc specific NMI watchdog enable function.
>   * Enables watchdog if it is not enabled already.
>   */
> -int watchdog_nmi_enable(unsigned int cpu)
> +void watchdog_nmi_enable(unsigned int cpu)
>  {
>  	if (atomic_read(&nmi_active) =3D=3D -1) {
>  		pr_warn("NMI watchdog cannot be enabled or disabled\n");
> -		return -1;
> +		return;
>  	}
> =20
>  	/*
> @@ -295,11 +295,9 @@ int watchdog_nmi_enable(unsigned int cpu)
>  	 * process first.
>  	 */
>  	if (!nmi_init_done)
> -		return 0;
> +		return;
> =20
>  	smp_call_function_single(cpu, start_nmi_watchdog, NULL, 1);
> -
> -	return 0;
>  }
>  /*
>   * sparc specific NMI watchdog disable function.
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 771d77b62bc1..454fe99c4874 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -119,7 +119,7 @@ static inline int hardlockup_detector_perf_init(void)=
 { return 0; }
>  void watchdog_nmi_stop(void);
>  void watchdog_nmi_start(void);
>  int watchdog_nmi_probe(void);
> -int watchdog_nmi_enable(unsigned int cpu);
> +void watchdog_nmi_enable(unsigned int cpu);
>  void watchdog_nmi_disable(unsigned int cpu);
> =20
>  void lockup_detector_reconfigure(void);
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 582d572e1379..c705a18b26bf 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -93,10 +93,9 @@ __setup("nmi_watchdog=3D", hardlockup_panic_setup);
>   * softlockup watchdog start and stop. The arch must select the
>   * SOFTLOCKUP_DETECTOR Kconfig.
>   */
> -int __weak watchdog_nmi_enable(unsigned int cpu)
> +void __weak watchdog_nmi_enable(unsigned int cpu)
>  {
>  	hardlockup_detector_perf_enable();
> -	return 0;
>  }
> =20
>  void __weak watchdog_nmi_disable(unsigned int cpu)
> --=20
> 2.40.1.521.gf1e218fcd8-goog

