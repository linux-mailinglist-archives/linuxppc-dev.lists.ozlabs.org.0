Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B654270FEB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 21:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRMBJ5DrGz3fFv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 05:46:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U1KdoKVB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U1KdoKVB;
	dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRM9T5ZFqz3c9S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 05:45:31 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-5ed99ebe076so1308346d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 12:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684957526; x=1687549526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIB0HReKptcGBTosdBXg1PO+NrPRx+I4udNpoc6AMN0=;
        b=U1KdoKVBW2Xvw1DfdpK3A6YJkUefWZXGU0g8vvNdWIL2Ehdz8ViQWlZo4iL5+tE5LN
         hbXUSmG31UMAUZxbfTXxT6y8c5f6W6ShSlpxlIzXUD67C1+95CMIWZ+X2u/B5PGJaO4F
         Kh/5JgQfVUbZZlTUh+8ht2Tq81NDj9u9U8JAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957526; x=1687549526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIB0HReKptcGBTosdBXg1PO+NrPRx+I4udNpoc6AMN0=;
        b=QiVPWVdzYvsegt9PvfqBJhyjbb5JcpmX43HVxxDbmFSZIBd/ahEzlnQKvqNOgxd765
         QI6OMk+AVZnXfMYE65lMg/DdaIPMVLA6SjasdcxDMK1/HpkWwQAHjt99y4hGNBE9YALg
         IMlvoJff+46b7pKf1gx8J+i1EmeL1yjANuhFT5MUaRsMNWDogSm/HOdfV6OteNz3l2PZ
         TN8GUYOtrFGPiCvZT5jMEDk/+uto4//ieE7gRRRg4qvd80mKD0yNulk5GAfjw99b+F7K
         EXiJ8nh/pMTl7on4AjkPcFsGPWnCP4VZTT/PcLOdcsWBiwQ4tmQUROzEUfOerUQ8XD7Z
         flgw==
X-Gm-Message-State: AC+VfDy+KhNsQdjY0sH9JdMAcdowZk5ub9aixkqO1CxiA8XIwjzIU9vO
	qJmdu/4jA7/Xd7RNXQoJrAiOZumV/uWz1Zhywxk=
X-Google-Smtp-Source: ACHHUZ5In7IxdOUbbCRpJxI/hWPAALgRBjV/lA9tcwkWEmxxBhL/tajpDFaQQr1dxt8TQ4Q3yT0LFQ==
X-Received: by 2002:a05:6214:1d2a:b0:625:801c:5ea1 with SMTP id f10-20020a0562141d2a00b00625801c5ea1mr18797670qvd.14.1684957525681;
        Wed, 24 May 2023 12:45:25 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id mz9-20020a0562142d0900b006238b37fb05sm3772509qvb.119.2023.05.24.12.45.25
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:45:25 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3f51ea3a062so3051cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 12:45:25 -0700 (PDT)
X-Received: by 2002:a05:6e02:194e:b0:331:d42:d06e with SMTP id
 x14-20020a056e02194e00b003310d42d06emr33974ilu.17.1684957143210; Wed, 24 May
 2023 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid> <ZG4YMyifGLOBJxLo@alley>
In-Reply-To: <ZG4YMyifGLOBJxLo@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 12:38:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+LEcSrArV+w35MX4oP1sC9KoRM0puJLT1RFmyS84Hxw@mail.gmail.com>
Message-ID: <CAD=FV=X+LEcSrArV+w35MX4oP1sC9KoRM0puJLT1RFmyS84Hxw@mail.gmail.com>
Subject: Re: [PATCH v5 13/18] watchdog/hardlockup: Have the perf hardlockup
 use __weak functions more cleanly
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

On Wed, May 24, 2023 at 6:59=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2023-05-19 10:18:37, Douglas Anderson wrote:
> > The fact that there watchdog_hardlockup_enable(),
> > watchdog_hardlockup_disable(), and watchdog_hardlockup_probe() are
> > declared __weak means that the configured hardlockup detector can
> > define non-weak versions of those functions if it needs to. Instead of
> > doing this, the perf hardlockup detector hooked itself into the
> > default __weak implementation, which was a bit awkward. Clean this up.
> >
> > >From comments, it looks as if the original design was done because the
> > __weak function were expected to implemented by the architecture and
> > not by the configured hardlockup detector. This got awkward when we
> > tried to add the buddy lockup detector which was not arch-specific but
> > wanted to hook into those same functions.
> >
> > This is not expected to have any functional impact.
> >
> > @@ -187,27 +187,33 @@ static inline void watchdog_hardlockup_kick(void)=
 { }
> >  #endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
> >
> >  /*
> > - * These functions can be overridden if an architecture implements its
> > - * own hardlockup detector.
> > + * These functions can be overridden based on the configured hardlockd=
up detector.
> >   *
> >   * watchdog_hardlockup_enable/disable can be implemented to start and =
stop when
> > - * softlockup watchdog start and stop. The arch must select the
> > + * softlockup watchdog start and stop. The detector must select the
> >   * SOFTLOCKUP_DETECTOR Kconfig.
> >   */
> > -void __weak watchdog_hardlockup_enable(unsigned int cpu)
> > -{
> > -     hardlockup_detector_perf_enable();
> > -}
> > +void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
> >
> > -void __weak watchdog_hardlockup_disable(unsigned int cpu)
> > -{
> > -     hardlockup_detector_perf_disable();
> > -}
> > +void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
> >
> >  /* Return 0, if a hardlockup watchdog is available. Error code otherwi=
se */
> >  int __weak __init watchdog_hardlockup_probe(void)
> >  {
> > -     return hardlockup_detector_perf_init();
> > +     /*
> > +      * If CONFIG_HAVE_NMI_WATCHDOG is defined then an architecture
> > +      * is assumed to have the hard watchdog available and we return 0=
.
> > +      */
> > +     if (IS_ENABLED(CONFIG_HAVE_NMI_WATCHDOG))
> > +             return 0;
> > +
> > +     /*
> > +      * Hardlockup detectors other than those using CONFIG_HAVE_NMI_WA=
TCHDOG
> > +      * are required to implement a non-weak version of this probe fun=
ction
> > +      * to tell whether they are available. If they don't override the=
n
> > +      * we'll return -ENODEV.
> > +      */
> > +     return -ENODEV;
> >  }
>
> When thinking more about it. It is weird that we need to handle
> CONFIG_HAVE_NMI_WATCHDOG in this default week function.
>
> It should be handled in watchdog_hardlockup_probe() implemented
> in kernel/watchdog_perf.c.
>
> IMHO, the default __weak function could always return -ENODEV;
>
> Would it make sense, please?

I don't quite understand. I'd agree that the special case for
CONFIG_HAVE_NMI_WATCHDOG is ugly, but it was also ugly before. IMO
it's actually a little less ugly / easier to understand after my
patch. ...but let me walk through how I think this special case works
and maybe you can tell me where I'm confused.

The first thing to understand is that CONFIG_HARDLOCKUP_DETECTOR_PERF
and CONFIG_HAVE_NMI_WATCHDOG are mutually exclusive from each other.
This was true before any of my patches and is still true after them.
Specifically, if CONFIG_HAVE_NMI_WATCHDOG is defined then an
architecture implements arch_touch_nmi_watchdog() (as documented in
the Kconfig docs for HAVE_NMI_WATCHDOG). Looking at the tree before my
series you can see that the perf hardlockup detector also implemented
arch_touch_nmi_watchdog(). This would have caused a conflict. The
mutual exclusion was presumably enforced by an architecture not
defining both HAVE_NMI_WATCHDOG and HAVE_HARDLOCKUP_DETECTOR_PERF.

The second thing to understand is that an architecture that defines
CONFIG_HAVE_NMI_WATCHDOG is _not_ required to implement
watchdog_hardlockup_probe() (used to be called watchdog_nmi_probe()).
Maybe this should change, but at the very least it appears that
SPARC64 defines HAVE_NMI_WATCHDOG but doesn't define
watchdog_hardlockup_probe() AKA watchdog_nmi_probe(). Anyone who
defines CONFIG_HAVE_NMI_WATCHDOG and doesn't implement
watchdog_hardlockup_probe() is claiming that their watchdog needs no
probing and is always available.

So with that context:

1. We can't handle any special cases for CONFIG_HAVE_NMI_WATCHDOG in
"kernel/watchdog_perf.c". The special cases that we need to handle are
all for the cases where CONFIG_HARDLOCKUP_DETECTOR_PERF isn't defined
and that means "kernel/watchdog_perf.c" isn't included.

2. We can't have the default __weak function return -ENODEV because
CONFIG_HAVE_NMI_WATCHDOG doesn't require an arch to implement
watchdog_hardlockup_probe(), but we want watchdog_hardlockup_probe()
to return "no error" in that case so that
"watchdog_hardlockup_available" gets set to true.

Does that sound right?

I'd agree that a future improvement saying that
CONFIG_HAVE_NMI_WATCHDOG means you _must_ implement
watchdog_hardlockup_probe() would make sense and that would allow us
to get rid of the special case. IMO, though, that's a separate patch.
I'd be happy to review that patch if you wanted to post it up. :-)

If we want to add that requirement, I _think_ the only thing you'd
need to do is to add watchdog_hardlockup_probe() to sparc64 and have
it return 0 and put that definition in the same file containing
arch_touch_nmi_watchdog(). powerpc also gets CONFIG_HAVE_NMI_WATCHDOG
as a side effect of selecting CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH but
it looks like they implement watchdog_hardlockup_probe() already. Oh,
but maybe this will fix a preexisting (existed before my patches)
minor bug... Unless I'm missing something (entirely possible!) on
powerpc today I guess if you turn off CONFIG_PPC_WATCHDOG then
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH and CONFIG_HAVE_NMI_WATCHDOG
would still be defined and we'd end up returning 0 (no error) from
watchdog_hardlockup_probe(). That means that on powerpc today if you
turn off CONFIG_PPC_WATCHDOG that '/proc/sys/kernel/nmi_watchdog' will
still think the watchdog is enabled?


-Doug
