Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5732A70E1D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 18:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQg0x1k99z3fBw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 02:35:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XB0zNCRt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XB0zNCRt;
	dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQg036sLrz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 02:34:57 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7747df5b674so104823839f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684859692; x=1687451692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BQXLdFOI2CGu/rfEBqigmE78qgmnNYZiqsFoyv3xq0=;
        b=XB0zNCRtPezuOYX4hgEYE/2eghE5ysDd5WO6Y+xxYIz9F0qrgrv7HO2axXs0ODW99B
         b6TYTh+Sy7eK4og+7nbcG/hXH3GtBewy7/1LFJRLrrVs++kUb0dniiQ1hSvSQxMEVP2q
         x7m3j2pE5usNnTTeogLIzlhXsrxmk+ICPJ4Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684859692; x=1687451692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BQXLdFOI2CGu/rfEBqigmE78qgmnNYZiqsFoyv3xq0=;
        b=LTwmdWS/9E8hr+cAYVE177jbAW0Wa4cKt078vpWVmdZVggasMQwv8E+rIjGT8RONS+
         eyE3q9fTcVy7SEdKxm73qYynoYR80AeBEvz9i4xKhN4m2vxsn8+ht8jDR86v4KpaIPBh
         Knp0dhXsfcRp9Q2vFA6AlqUl8i/ZFf8H8/esEoWtiIpFg4s31vpOLPhWxjlGiSEvotJY
         Xzb49USME6cz1VTi0iUVg7Q5/DSmMpxPlrhCDlsB67dbsaqMkVRU0yovb22umw9Em1+Q
         YFDtMLGInXvIEMTvFaimUNJCCIclsDl8e5oCecB5FBMQxFChKTwSoJdebQ92GWk1x2U8
         Lx5w==
X-Gm-Message-State: AC+VfDxiih5FNSy25REud62d/A5chpc6HMYL+xKpPdtP7EYp+Bvwa5RQ
	4DSMtAxlECS8pwU1YlIaYnEouVybaEZJODuUu1E=
X-Google-Smtp-Source: ACHHUZ6GMio+j+uQYcllUlmf9ptXqjQi1K1mft+/Efvoz2/S1qcNTwJ+97mS1E5V5jeAZTfgSYQUzw==
X-Received: by 2002:a6b:fd11:0:b0:76c:6938:a0fb with SMTP id c17-20020a6bfd11000000b0076c6938a0fbmr10469201ioi.7.1684859691784;
        Tue, 23 May 2023 09:34:51 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id v17-20020a5ec111000000b0074ca5ac5037sm2735606iol.26.2023.05.23.09.34.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 09:34:50 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-33828a86ee2so202735ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 09:34:49 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a42:b0:32a:642d:2a13 with SMTP id
 u2-20020a056e021a4200b0032a642d2a13mr379303ilv.6.1684859689295; Tue, 23 May
 2023 09:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid> <ZGzjm9h85fpYZJMc@alley>
In-Reply-To: <ZGzjm9h85fpYZJMc@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 May 2023 09:34:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VeGKTvw2=qhSqkSEtYwVrXGLNzNbgBAwrmn2CWWfJckQ@mail.gmail.com>
Message-ID: <CAD=FV=VeGKTvw2=qhSqkSEtYwVrXGLNzNbgBAwrmn2CWWfJckQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/18] watchdog/hardlockup: Add a "cpu" param to watchdog_hardlockup_check()
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozl
 abs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, May 23, 2023 at 9:02=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2023-05-19 10:18:34, Douglas Anderson wrote:
> > In preparation for the buddy hardlockup detector where the CPU
> > checking for lockup might not be the currently running CPU, add a
> > "cpu" parameter to watchdog_hardlockup_check().
> >
> > As part of this change, make hrtimer_interrupts an atomic_t since now
> > the CPU incrementing the value and the CPU reading the value might be
> > different. Technially this could also be done with just READ_ONCE and
> > WRITE_ONCE, but atomic_t feels a little cleaner in this case.
> >
> > While hrtimer_interrupts is made atomic_t, we change
> > hrtimer_interrupts_saved from "unsigned long" to "int". The "int" is
> > needed to match the data type backing atomic_t for hrtimer_interrupts.
> > Even if this changes us from 64-bits to 32-bits (which I don't think
> > is true for most compilers), it doesn't really matter. All we ever do
> > is increment it every few seconds and compare it to an old value so
> > 32-bits is fine (even 16-bits would be). The "signed" vs "unsigned"
> > also doesn't matter for simple equality comparisons.
> >
> > hrtimer_interrupts_saved is _not_ switched to atomic_t nor even
> > accessed with READ_ONCE / WRITE_ONCE. The hrtimer_interrupts_saved is
> > always consistently accessed with the same CPU. NOTE: with the
> > upcoming "buddy" detector there is one special case. When a CPU goes
> > offline/online then we can change which CPU is the one to consistently
> > access a given instance of hrtimer_interrupts_saved. We still can't
> > end up with a partially updated hrtimer_interrupts_saved, however,
> > because we end up petting all affected CPUs to make sure the new and
> > old CPU can't end up somehow read/write hrtimer_interrupts_saved at
> > the same time.
> >
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -87,29 +87,34 @@ __setup("nmi_watchdog=3D", hardlockup_panic_setup);
> >
> >  #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> >
> > -static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
> > -static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
> > +static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
> > +static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
> >  static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
> >  static unsigned long watchdog_hardlockup_all_cpu_dumped;
> >
> > -static bool is_hardlockup(void)
> > +static bool is_hardlockup(unsigned int cpu)
> >  {
> > -     unsigned long hrint =3D __this_cpu_read(hrtimer_interrupts);
> > +     int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> >
> > -     if (__this_cpu_read(hrtimer_interrupts_saved) =3D=3D hrint)
> > +     if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint)
> >               return true;
> >
> > -     __this_cpu_write(hrtimer_interrupts_saved, hrint);
> > +     /*
> > +      * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
> > +      * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
> > +      * written/read by a single CPU.
> > +      */
> > +     per_cpu(hrtimer_interrupts_saved, cpu) =3D hrint;
> >
> >       return false;
> >  }
> >
> >  static void watchdog_hardlockup_kick(void)
> >  {
> > -     __this_cpu_inc(hrtimer_interrupts);
> > +     atomic_inc(raw_cpu_ptr(&hrtimer_interrupts));
>
> Is there any particular reason why raw_*() is needed, please?
>
> My expectation is that the raw_ API should be used only when
> there is a good reason for it. Where a good reason might be
> when the checks might fail but the consistency is guaranteed
> another way.
>
> IMHO, we should use:
>
>         atomic_inc(this_cpu_ptr(&hrtimer_interrupts));
>
> To be honest, I am a bit lost in the per_cpu API definitions.
>
> But this_cpu_ptr() seems to be implemented the same way as
> per_cpu_ptr() when CONFIG_DEBUG_PREEMPT is enabled.
> And we use per_cpu_ptr() in is_hardlockup().
>
> Also this_cpu_ptr() is used more commonly:
>
> $> git grep this_cpu_ptr | wc -l
> 1385
> $> git grep raw_cpu_ptr | wc -l
> 114

Hmmm, I think maybe I confused myself. The old code purposely used the
double-underscore prefixed version of this_cpu_inc(). I couldn't find
a double-underscore version of this_cpu_ptr() and I somehow convinced
myself that the raw() version was the right equivalent version.

You're right that this_cpu_ptr() is a better choice here and I don't
see any reason why we'd need the raw version.

> >  }
> >
> > -void watchdog_hardlockup_check(struct pt_regs *regs)
> > +void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> >  {
> >       /*
> >        * Check for a hardlockup by making sure the CPU's timer
> > @@ -117,35 +122,42 @@ void watchdog_hardlockup_check(struct pt_regs *re=
gs)
> >        * fired multiple times before we overflow'd. If it hasn't
> >        * then this is a good indication the cpu is stuck
> >        */
> > -     if (is_hardlockup()) {
> > +     if (is_hardlockup(cpu)) {
> >               unsigned int this_cpu =3D smp_processor_id();
> > +             struct cpumask backtrace_mask =3D *cpu_online_mask;
>
> Does this work, please?
>
> IMHO, we should use cpumask_copy().

Ah, good call, thanks!


> >               /* Only print hardlockups once. */
> > -             if (__this_cpu_read(watchdog_hardlockup_warned))
> > +             if (per_cpu(watchdog_hardlockup_warned, cpu))
> >                       return;
> >
>
> Otherwise, it looks good to me.

Neither change seems urgent though both are important to fix, I'll
wait a day or two to see if you have feedback on any of the other
patches and I'll send a fixup series.

-Doug
