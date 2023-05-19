Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93224709E54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDZz5zBvz3ggd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:38:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a70enhXA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a70enhXA;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDFF68yqz3fWF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:22:57 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-51b33c72686so2403451a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516975; x=1687108975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYXxQ1/HyN04Wnp4N53Q5scLF2D44b2WUzFjxPSR5OI=;
        b=a70enhXAgF3t2Xd1czzveBDJABzkpPkjTw1RNVsKG5pGvBNv6mrUDp9a4oCXJqmSlh
         JJNMY4KENqzEMp2JbRRQgyhslsTvMR1Ge2stM8rf8nVxv3JJRGJ8syIPREoJ/8CRTxrc
         gU1KczXB2Hpcu4A74U3nReGUXgH6lel+BU0Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516975; x=1687108975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYXxQ1/HyN04Wnp4N53Q5scLF2D44b2WUzFjxPSR5OI=;
        b=DX/lk89YIQZRA9B6Iw9o29KCyO3/T/QhowQm9v6RoE0Z71Ov/DI8ZBuIlunORXcVvX
         sIk7WT/LZz1kvjvj6twMbeBDjngtIRGbDQ5jfkcXPygkmgZUPKknlMWTXzf1i4Z49rn0
         s2QDUDFb36c+WRr0RSZGRz09F+2Tkhk4hpIrO6UHA/sUNzunfs671mQkMVibWHk6V1t7
         Ek8baEquDXXMxk2RAg2DyZwjwzlsTlpawYFtAGKs/b/12PEyGS+6HB080V8D2g+90RZd
         1lSoJI0WTpwW1ZeBlXV1AzfyMMdpo9ZWUpc/ZGdEjppojhpAD6iD8iKyjaAkmmUoUYjh
         VqBQ==
X-Gm-Message-State: AC+VfDyEgg9pJ365OW9y+Rtvzh3l7exoU5DuXlFOt63ygQIMFYtTq8QC
	GQvIqVH/SuliMlQL9ODx+Ue/igXFaYG9MrrMTIU=
X-Google-Smtp-Source: ACHHUZ46+Csrh+wrVldaJ8uIxeb/WFJHE27+ztLUoxMt/R/A7r+lRNewf/ouu+MgfKkf4eTNiyyLhA==
X-Received: by 2002:a17:90a:c7d2:b0:250:c118:cb4f with SMTP id gf18-20020a17090ac7d200b00250c118cb4fmr2857912pjb.34.1684516974811;
        Fri, 19 May 2023 10:22:54 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id co2-20020a17090afe8200b0024de3dff70esm1698374pjb.56.2023.05.19.10.22.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 10:22:54 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ae3f74c98bso7795ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:22:54 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c8c:b0:331:8db2:5d13 with SMTP id
 w12-20020a056e021c8c00b003318db25d13mr246620ill.8.1684516953136; Fri, 19 May
 2023 10:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.10.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid> <ZF0NzSCRCapqDbC4@alley>
In-Reply-To: <ZF0NzSCRCapqDbC4@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 10:22:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXn07rgC=OUtHAz5v5h2g2gcrLCc5BYr6LMWFkyNKASw@mail.gmail.com>
Message-ID: <CAD=FV=VXn07rgC=OUtHAz5v5h2g2gcrLCc5BYr6LMWFkyNKASw@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] watchdog/hardlockup: Move perf hardlockup
 watchdog petting to watchdog.c
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, May 11, 2023 at 8:46=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> > @@ -111,6 +125,11 @@ static void watchdog_hardlockup_interrupt_count(vo=
id)
> >
> >  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> >  {
> > +     if (__this_cpu_read(watchdog_hardlockup_touch)) {
> > +             __this_cpu_write(watchdog_hardlockup_touch, false);
> > +             return;
> > +     }
>
> If we clear watchdog_hardlockup_touch() here then
> watchdog_hardlockup_check() won't be called yet another
> watchdog_hrtimer_sample_threshold perior.
>
> It means that any touch will cause ignoring one full period.
> The is_hardlockup() check will be done after full two periods.
>
> It is not ideal, see below.
>
> > +
> >       /*
> >        * Check for a hardlockup by making sure the CPU's timer
> >        * interrupt is incrementing. The timer interrupt should have
> > diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> > index 9be90b2a2ea7..547917ebd5d3 100644
> > --- a/kernel/watchdog_perf.c
> > +++ b/kernel/watchdog_perf.c
> > @@ -112,11 +98,6 @@ static void watchdog_overflow_callback(struct perf_=
event *event,
> >       /* Ensure the watchdog never gets throttled */
> >       event->hw.interrupts =3D 0;
> >
> > -     if (__this_cpu_read(watchdog_nmi_touch) =3D=3D true) {
> > -             __this_cpu_write(watchdog_nmi_touch, false);
> > -             return;
> > -     }
>
> The original code looks wrong. arch_touch_nmi_watchdog() caused
> skipping only one period of the perf event.
>
> I would expect that it caused restarting the period,
> something like:
>
>         if (__this_cpu_read(watchdog_nmi_touch) =3D=3D true) {
>                 /*
>                  * Restart the period after which the interrupt
>                  * counter is checked.
>                  */
>                 __this_cpu_write(nmi_rearmed, 0);
>                 __this_cpu_write(last_timestamp, now);
>                 __this_cpu_write(watchdog_nmi_touch, false);
>                 return;
>         }
>
> By other words, we should restart the period in the very next perf
> event after the watchdog was touched.
>
> That said, the new code looks better than the original.
> IMHO, the original code was prone to false positives.

I had a little bit of a hard time following, but I _think_ the "tl;dr"
of all the above is that my change is fine. If I misunderstood, please
yell.


> Best Regards,
> Petr
>
> PS: It might be worth fixing this problem in a separate patch at the
>     beginning of this patchset. It might be a candidate for stable
>     backports.

Done. It's now its own patch and early in the series.
