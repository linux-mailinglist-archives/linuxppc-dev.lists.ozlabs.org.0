Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE46F7B3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:52:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFZy7062z3fDh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 12:52:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ktqHNk5l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ktqHNk5l;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFZ752ksz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 12:51:26 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64115e652eeso16804068b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 19:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683255084; x=1685847084;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVzHKIeVTs5o2uUKP+mQkds3ksDwFVvhqkKafztg4+4=;
        b=ktqHNk5loLtU/KCwR//Z7tYcVQSm8JM7u7EDXu2OxKQQsBws43LRUPjwNVbUHAGJBj
         gc3DxpQtC1/OOyHW26dX3MwFbgdfWwpOVxdtbuQThRVEzgfI1BNUZ5OhrxthomwTTvW9
         KuWgSVznYjqLHRiyHmWJk+LT2L2s0ufFsPGG+IURgPieshXMcNyyDt/Kzo+DCv0xKjZe
         DyDKfQZeNNs/8VMonmfGERnmO5tTqr0eHZh+Y875AJRCzvNs9yxUih9l0rhqWFmBJrRo
         cV/9lUiVQ0pbHb4cFF5mCXAHtl60nbslHtAtfWdEsj03EbDyIlSOcirz6VnmjBK9H4/J
         ow4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255084; x=1685847084;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVzHKIeVTs5o2uUKP+mQkds3ksDwFVvhqkKafztg4+4=;
        b=N+qSUxkyA9PtRbPGjOQliD+sl85yj/Asr8JU5nuFw4lbKHk8s4ffzqqTh/7pnuOFiT
         Z5bhTYmuUCosbqurbm0WZZ5nm5Cb/cb2i3ZhaTHK/R4dXgEePaKP+TmeBMtFaTu9psDe
         jbgnlzXbCJXUB+fQZhLicv+CcfVV8ICCX8kIPdSXY6mTkr3JNd+3Jjr4RGhdjwbkFCbX
         YRBHJ8e0dXIWRBAYZJpqsDpz9U42AJEfY1bqqGR2YSA+LAyF8qZr/QPyYznSE0r4R8at
         UtkJJOc8m0rA0BfgaCHysLeZTVg2NaMcAPnepP9zs0Ann5X13gDRK3CDw9ICHoJrlcUj
         B5fg==
X-Gm-Message-State: AC+VfDxSkGA2gnWnQH3mONvS3PdVTjb+u053ZVKhvH//vnFhzsilZ9Pc
	2YP0oslKhp+ljsXR6LhqRy0=
X-Google-Smtp-Source: ACHHUZ5BRoOs+9WXOczfgGoXbf4YZMUc/Uu5++G5XcOuyogjStZoqiKceepZC/RfSwAcQqdM6F1UUg==
X-Received: by 2002:a17:902:d48e:b0:1a9:68d2:e4ae with SMTP id c14-20020a170902d48e00b001a968d2e4aemr6701878plg.2.1683255083704;
        Thu, 04 May 2023 19:51:23 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902bc4400b001ab29e002fbsm367141plz.17.2023.05.04.19.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 19:51:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 12:51:06 +1000
Message-Id: <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 05/17] watchdog/hardlockup: Rename
 touch_nmi_watchdog() to touch_hardlockup_watchdog()
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
In-Reply-To: <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
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
> In preparation for the buddy hardlockup detector, rename
> touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clear
> that it will touch whatever hardlockup detector is configured. We'll
> add a #define for the old name (touch_nmi_watchdog) so that we don't
> have to touch every piece of code referring to the old name.

Is this really helpful? Now it's got two names Could just leave it.
If you insist then it'd be better just to rename everything in one
go at the end of a merge window IMO. Conflicts would be trivial.

> Ideally this change would also rename the arch_touch_nmi_watchdog(),
> but that is harder since arch_touch_nmi_watchdog() is exported with
> EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
> hopefully alleviate some of the confusion here.

We don't keep ABI fixed upstream.

Thanks,
Nick

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Rename touch_nmi_watchdog() to ...") new for v4.
>
>  include/linux/nmi.h | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 454fe99c4874..35d09d70f394 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -125,18 +125,35 @@ void watchdog_nmi_disable(unsigned int cpu);
>  void lockup_detector_reconfigure(void);
> =20
>  /**
> - * touch_nmi_watchdog - restart NMI watchdog timeout.
> + * touch_hardlockup_watchdog - manually pet the hardlockup watchdog.
>   *
> - * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
> - * may be used to reset the timeout - for code which intentionally
> - * disables interrupts for a long time. This call is stateless.
> + * If we support detecting hardlockups, touch_hardlockup_watchdog() may =
be
> + * used to pet the watchdog (reset the timeout) - for code which
> + * intentionally disables interrupts for a long time. This call is state=
less.
>   */
> -static inline void touch_nmi_watchdog(void)
> +static inline void touch_hardlockup_watchdog(void)
>  {
> +	/*
> +	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
> +	 * the hardlockup detector may not be arch-specific nor using NMIs,
> +	 * but arch_touch_nmi_watchdog() is exported with EXPORT_SYMBOL() and
> +	 * is thus ABI.
> +	 */
>  	arch_touch_nmi_watchdog();
> +
> +	/*
> +	 * Touching the hardlock detector implcitily pets the
> +	 * softlockup detector too
> +	 */
>  	touch_softlockup_watchdog();
>  }
> =20
> +/*
> + * It's encouraged for code to refer to the new name, but allow the old
> + * name as well.
> + */
> +#define touch_nmi_watchdog	touch_hardlockup_watchdog
> +
>  /*
>   * Create trigger_all_cpu_backtrace() out of the arch-provided
>   * base function. Return whether such support was available,
> --=20
> 2.40.1.521.gf1e218fcd8-goog

