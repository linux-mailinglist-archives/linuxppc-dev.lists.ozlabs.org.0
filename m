Return-Path: <linuxppc-dev+bounces-12358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3DB83049
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 07:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS49T4NWtz2yGM;
	Thu, 18 Sep 2025 15:35:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758073674;
	cv=none; b=FVII3KvvIz0Z6BRtTUN/k7lVzQOP+ycxATkl8tzRtcAhJSb9Vw9qotF7Fi79rtTUKioGjPJc6YTxhZj1jXgK9UjmIF8B1syyWQ4dhvfh9LIwmegq3EZadjJvNlPrrUp9QX3h2ZrVJW34ttpF16SdtIibBMOFSD1H3bOwoMauMYJ8rbS5ix2Ajb2e+VTDxOC94zdFKd6Qw/0+TlEnkjfTbvxPI2FFPQIQ1cEUDVyMjaAR/TyUPzdbkr9LH6NVX9kvjTxeyHF+RryQnRSNyAmKU3ElQrnamYpzf2FhsN3lLYIXkAINljjgscCcniSvCNeuw5quntJWLl4QaLpfkppX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758073674; c=relaxed/relaxed;
	bh=jpedYE8ayX2D4JB3BwcSHfmcAawrf2rx80Q6iy0Jnqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOuFo9LJ0N8gsoEDhj4wDtAM0BEocr9aTaN6hEvfJUrFx0Vxs/gU7rY4aC2ESjycoyEoAtND/c1W3qae7k4P0RQujp1W/Ax3ytG7mMLfegTL2qNz9ZMw2vgDUjmawy1E/7zRMudwd6notB7PPYklupSQCIJqeIQwm6g/TjTe0b0NqNS8Eg+Ni8QFl8vY8MXORqUuwJJtpb2gwnD+SjdyKv3Ih7aiIcdA5Hq7Bvb+/gCllUaJGbn9TldbPVjJ30Dl2KtA0qLd0jgFJPjIPvWFYDc8dPQ/JpLRTu8oW2PgDEUmMmEsqEaXEF9Fuc+nA6X2lwkFZS+shnMYVoSW5Pgwaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kLU9MPha; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kLU9MPha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=wangjinchao600@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRM9428R1z30D3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 11:47:51 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-244582738b5so51329545ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758073669; x=1758678469; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpedYE8ayX2D4JB3BwcSHfmcAawrf2rx80Q6iy0Jnqk=;
        b=kLU9MPhaZGQLDAVtcSssT+rmqc8/wtE6KibDBIPa5uJanIAkPT3IxC2uSq20CGirma
         naE7FAhDLlRH7fL6G6DyDgLkl1TSNtvU/KpJFrpIyhuUQ2htrna8Qx6dBQSFAfLFSwey
         35M4s7s7X2LG6ekRKxkQF46NnnRaxquiCyBcDBN1KZ5ZjZx38ZbT4t7jktHkQ5MM4sKd
         chvyr97+nJJ+cIuux/ubuTzD32gL3u27nv5rcXGka+bIMH9IZbpDDeSyaa7zr7+Jagua
         nT/4NUgpyyxAczLyDWgwPQbij2F9N0TxlSbkLuKH67YgbSMI7dv1FGl9p5hSkMzdnbKl
         0hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758073669; x=1758678469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpedYE8ayX2D4JB3BwcSHfmcAawrf2rx80Q6iy0Jnqk=;
        b=TTvc689goJANIEdClWF8OA0CiIxT5uWdl8wAj/YtwilrPUEUbjoGTLmaPHEMzmTN8B
         Suf+jYkewz+lOzrdR6ECsJsyQAaPvlr9ZOXUGA7fpkcgiQ2295wBv7AIkcoDYrXdUny2
         FaaC9iggrt4LSgNY1cErsX3njvWsBkf7Ucq8dJlFnRPYzqAoRhFPsorIdnkyogFlmUOI
         IiRPnJa5H0rzrDfJMptxHlKn18asKbMfUZBvD4RToCzNxHC3v64usABgI6pJBwmA8u1N
         9kS87aX9v/CHxgy7IlaN8A3I/VxCrJHkGuY4cpPxWHqpeM4ABx9q5UsK28se5nBNNCws
         B7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5yC2C6Dtiaar6ixQvw/XuM5fnJWuvpWI2jnTI71l/iDs9L4dhVjklncV0h85b0h/RbQJ+kCytexaFzQM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSc28hyRPNcH2uUaJSN0PW2LbAYHVtEBPvOIeDmLb0EbjbieJt
	KkuPt6JI6N4eRhyEMIyQsUdCjZNlJwBlwsY4BTXNfcgbtGB6grZV/cK5
X-Gm-Gg: ASbGnct25KD4wyRrRfw4y7151hRPclEsd0i4g3Q/5On8jv20enG9+VGftl1I9We11Ir
	oayqMifC2t/RaLpqnPlfsAa2AVCncdSgMeS3zvMbfa+odXb8OGIyN9JLOkTz4tfZSFYLHzVy1G6
	lSAqbsxoXWbaXTvzrwrWsN96JKuhbKtd+3nSI8EIcvRcNmsOUcMZPgNeaCkflAzUhBlDUYRIVGt
	AlOUoaJHE89ROn0CkKZwidrd+DIwA2S/dkDSsw2YApRKnvo1ClL42ad47gp61eh5RJNyCmAqCcf
	L1+qZxnGCjFyTMEJkJkD5Wy+hXxthQ1ZgKDRrhoyHkKelYVuHxiQ4q3hfZNns/+frtjG/2ITqYG
	24Q4cxkZKYRvpb3Hp2s40r5Mxjjczn9am9Ww=
X-Google-Smtp-Source: AGHT+IGqMIWzNWO6R5Qy2orWOF1UJ217t1FWDRL4LXVp47m16T87eefffE+Z4xzLoGiJ6LF7MR5mXQ==
X-Received: by 2002:a17:902:d487:b0:248:79d4:93c0 with SMTP id d9443c01a7336-26813efef03mr4774235ad.56.1758073668329;
        Tue, 16 Sep 2025 18:47:48 -0700 (PDT)
Received: from localhost ([45.90.208.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-260cf673181sm114910675ad.99.2025.09.16.18.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:47:47 -0700 (PDT)
Date: Wed, 17 Sep 2025 09:47:37 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
	akpm@linux-foundation.org, catalin.marinas@arm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, kan.liang@linux.intel.com, kees@kernel.org,
	masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
	thomas.weissschuh@linutronix.de, xur@google.com,
	ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org,
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com, gautam@linux.ibm.com, arnd@arndb.de,
	zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com,
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com,
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org,
	yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup
 detector
Message-ID: <aMoTOXIKBYVTj7PV@mdev>
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> On Tue, Sep 16, 2025 at 7:51 AM Jinchao Wang <wangjinchao600@gmail.com> wrote:
> >
> > Currently, the hard lockup detector is selected at compile time via
> > Kconfig, which requires a kernel rebuild to switch implementations.
> > This is inflexible, especially on systems where a perf event may not
> > be available or may be needed for other tasks.
> >
> > This commit refactors the hard lockup detector to replace a rigid
> > compile-time choice with a flexible build-time and boot-time solution.
> > The patch supports building the kernel with either detector
> > independently, or with both. When both are built, a new boot parameter
> > `hardlockup_detector="perf|buddy"` allows the selection at boot time.
> > This is a more robust and user-friendly design.
> >
> > This patch is a follow-up to the discussion on the kernel mailing list
> > regarding the preference and future of the hard lockup detectors. It
> > implements a flexible solution that addresses the community's need to
> > select an appropriate detector at boot time.
> >
> > The core changes are:
> > - The `perf` and `buddy` watchdog implementations are separated into
> >   distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> > - Global function pointers are introduced (`watchdog_hardlockup_enable_ptr`)
> >   to serve as a single API for the entire feature.
> > - A new `hardlockup_detector=` boot parameter is added to allow the
> >   user to select the desired detector at boot time.
> > - The Kconfig options are simplified by removing the complex
> >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to be
> >   built without mutual exclusion.
> > - The weak stubs are updated to call the new function pointers,
> >   centralizing the watchdog logic.
> 
> What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
> enabling and disabling whatever the boot time choice was? I'm not sure
> why this has to be a boot time option given the ability to configure
> via /proc/sys/kernel/nmi_watchdog.
The new hardlockup_detector boot parameter and the existing
/proc/sys/kernel/nmi_watchdog file serve different purposes.

The boot parameter selects the type of hard lockup detector (perf or buddy).
This choice is made once at boot.

 /proc/sys/kernel/nmi_watchdog, on the other hand, is only a simple on/off
switch for the currently selected detector. It does not change the detector's
type.
> 
> > Link: https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@bytedance.com/
> > Link: https://lore.kernel.org/all/CAD=FV=WWUiCi6bZCs_gseFpDDWNkuJMoL6XCftEo6W7q6jRCkg@mail.gmail.com/
> >
> > Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> > ---
> >  .../admin-guide/kernel-parameters.txt         |  7 +++
> >  include/linux/nmi.h                           |  6 +++
> >  kernel/watchdog.c                             | 46 ++++++++++++++++++-
> >  kernel/watchdog_buddy.c                       |  7 +--
> >  kernel/watchdog_perf.c                        | 10 ++--
> >  lib/Kconfig.debug                             | 37 +++++++--------
> >  6 files changed, 85 insertions(+), 28 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 5a7a83c411e9..0af214ee566c 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1828,6 +1828,13 @@
> >                         backtraces on all cpus.
> >                         Format: 0 | 1
> >
> > +       hardlockup_detector=
> > +                       [perf, buddy] Selects the hard lockup detector to use at
> > +                       boot time.
> > +                       Format: <string>
> > +                       - "perf": Use the perf-based detector.
> > +                       - "buddy": Use the buddy-based detector.
> > +
> >         hash_pointers=
> >                         [KNL,EARLY]
> >                         By default, when pointers are printed to the console
> > diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> > index cf3c6ab408aa..9298980ce572 100644
> > --- a/include/linux/nmi.h
> > +++ b/include/linux/nmi.h
> > @@ -100,6 +100,9 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
> >  #endif
> >
> >  #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> > +void watchdog_perf_hardlockup_enable(unsigned int cpu);
> > +void watchdog_perf_hardlockup_disable(unsigned int cpu);
> > +extern int watchdog_perf_hardlockup_probe(void);
> >  extern void hardlockup_detector_perf_stop(void);
> >  extern void hardlockup_detector_perf_restart(void);
> >  extern void hardlockup_config_perf_event(const char *str);
> > @@ -120,6 +123,9 @@ void watchdog_hardlockup_disable(unsigned int cpu);
> >  void lockup_detector_reconfigure(void);
> >
> >  #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
> > +void watchdog_buddy_hardlockup_enable(unsigned int cpu);
> > +void watchdog_buddy_hardlockup_disable(unsigned int cpu);
> > +int watchdog_buddy_hardlockup_probe(void);
> >  void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
> >  #else
> >  static inline void watchdog_buddy_check_hardlockup(int hrtimer_interrupts) {}
> > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > index 80b56c002c7f..85451d24a77d 100644
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -55,6 +55,37 @@ unsigned long *watchdog_cpumask_bits = cpumask_bits(&watchdog_cpumask);
> >
> >  #ifdef CONFIG_HARDLOCKUP_DETECTOR
> >
> > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > +/* The global function pointers */
> > +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) = watchdog_perf_hardlockup_enable;
> > +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) = watchdog_perf_hardlockup_disable;
> > +int (*watchdog_hardlockup_probe_ptr)(void) = watchdog_perf_hardlockup_probe;
> > +#elif defined(CONFIG_HARDLOCKUP_DETECTOR_BUDDY)
> > +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) = watchdog_buddy_hardlockup_enable;
> > +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) = watchdog_buddy_hardlockup_disable;
> > +int (*watchdog_hardlockup_probe_ptr)(void) = watchdog_buddy_hardlockup_probe;
> > +#endif
> > +
> > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> > +static char *hardlockup_detector_type = "perf"; /* Default to perf */
> > +static int __init set_hardlockup_detector_type(char *str)
> > +{
> > +       if (!strncmp(str, "perf", 4)) {
> > +               watchdog_hardlockup_enable_ptr = watchdog_perf_hardlockup_enable;
> > +               watchdog_hardlockup_disable_ptr = watchdog_perf_hardlockup_disable;
> > +               watchdog_hardlockup_probe_ptr = watchdog_perf_hardlockup_probe;
> > +       } else if (!strncmp(str, "buddy", 5)) {
> > +               watchdog_hardlockup_enable_ptr = watchdog_buddy_hardlockup_enable;
> > +               watchdog_hardlockup_disable_ptr = watchdog_buddy_hardlockup_disable;
> > +               watchdog_hardlockup_probe_ptr = watchdog_buddy_hardlockup_probe;
> > +       }
> > +       return 1;
> > +}
> > +
> > +__setup("hardlockup_detector=", set_hardlockup_detector_type);
> > +
> > +#endif
> > +
> >  # ifdef CONFIG_SMP
> >  int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
> >  # endif /* CONFIG_SMP */
> > @@ -262,9 +293,17 @@ static inline void watchdog_hardlockup_kick(void) { }
> >   * softlockup watchdog start and stop. The detector must select the
> >   * SOFTLOCKUP_DETECTOR Kconfig.
> >   */
> > -void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
> > +void __weak watchdog_hardlockup_enable(unsigned int cpu)
> > +{
> > +       if (watchdog_hardlockup_enable_ptr)
> > +               watchdog_hardlockup_enable_ptr(cpu);
> > +}
> >
> > -void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
> > +void __weak watchdog_hardlockup_disable(unsigned int cpu)
> > +{
> > +       if (watchdog_hardlockup_disable_ptr)
> > +               watchdog_hardlockup_disable_ptr(cpu);
> > +}
> >
> >  /*
> >   * Watchdog-detector specific API.
> > @@ -275,6 +314,9 @@ void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
> >   */
> >  int __weak __init watchdog_hardlockup_probe(void)
> >  {
> > +       if (watchdog_hardlockup_probe_ptr)
> > +               return watchdog_hardlockup_probe_ptr();
> > +
> >         return -ENODEV;
> >  }
> >
> > diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
> > index ee754d767c21..390d89bfcafa 100644
> > --- a/kernel/watchdog_buddy.c
> > +++ b/kernel/watchdog_buddy.c
> > @@ -19,15 +19,16 @@ static unsigned int watchdog_next_cpu(unsigned int cpu)
> >         return next_cpu;
> >  }
> >
> > -int __init watchdog_hardlockup_probe(void)
> > +int __init watchdog_buddy_hardlockup_probe(void)
> >  {
> >         return 0;
> >  }
> >
> > -void watchdog_hardlockup_enable(unsigned int cpu)
> > +void watchdog_buddy_hardlockup_enable(unsigned int cpu)
> >  {
> >         unsigned int next_cpu;
> >
> > +       pr_info("ddddd %s\n", __func__);
> >         /*
> >          * The new CPU will be marked online before the hrtimer interrupt
> >          * gets a chance to run on it. If another CPU tests for a
> > @@ -58,7 +59,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
> >         cpumask_set_cpu(cpu, &watchdog_cpus);
> >  }
> >
> > -void watchdog_hardlockup_disable(unsigned int cpu)
> > +void watchdog_buddy_hardlockup_disable(unsigned int cpu)
> >  {
> >         unsigned int next_cpu = watchdog_next_cpu(cpu);
> >
> > diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> > index 9c58f5b4381d..270110e58f20 100644
> > --- a/kernel/watchdog_perf.c
> > +++ b/kernel/watchdog_perf.c
> > @@ -153,10 +153,12 @@ static int hardlockup_detector_event_create(void)
> >   * watchdog_hardlockup_enable - Enable the local event
> >   * @cpu: The CPU to enable hard lockup on.
> >   */
> > -void watchdog_hardlockup_enable(unsigned int cpu)
> > +void watchdog_perf_hardlockup_enable(unsigned int cpu)
> >  {
> >         WARN_ON_ONCE(cpu != smp_processor_id());
> >
> > +       pr_info("ddddd %s\n", __func__);
> > +
> >         if (hardlockup_detector_event_create())
> >                 return;
> >
> > @@ -172,7 +174,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
> >   * watchdog_hardlockup_disable - Disable the local event
> >   * @cpu: The CPU to enable hard lockup on.
> >   */
> > -void watchdog_hardlockup_disable(unsigned int cpu)
> > +void watchdog_perf_hardlockup_disable(unsigned int cpu)
> >  {
> >         struct perf_event *event = this_cpu_read(watchdog_ev);
> >
> > @@ -257,10 +259,12 @@ bool __weak __init arch_perf_nmi_is_available(void)
> >  /**
> >   * watchdog_hardlockup_probe - Probe whether NMI event is available at all
> >   */
> > -int __init watchdog_hardlockup_probe(void)
> > +int __init watchdog_perf_hardlockup_probe(void)
> >  {
> >         int ret;
> >
> > +       pr_info("ddddd %s\n", __func__);
> > +
> >         if (!arch_perf_nmi_is_available())
> >                 return -ENODEV;
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index dc0e0c6ed075..443353fad1c1 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -1167,36 +1167,33 @@ config HARDLOCKUP_DETECTOR
> >  #
> >  # Note that arch-specific variants are always preferred.
> >  #
> > -config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > -       bool "Prefer the buddy CPU hardlockup detector"
> > -       depends on HARDLOCKUP_DETECTOR
> > -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETECTOR_BUDDY
> > -       depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> > -       help
> > -         Say Y here to prefer the buddy hardlockup detector over the perf one.
> > -
> > -         With the buddy detector, each CPU uses its softlockup hrtimer
> > -         to check that the next CPU is processing hrtimer interrupts by
> > -         verifying that a counter is increasing.
> > -
> > -         This hardlockup detector is useful on systems that don't have
> > -         an arch-specific hardlockup detector or if resources needed
> > -         for the hardlockup detector are better used for other things.
> > -
> >  config HARDLOCKUP_DETECTOR_PERF
> > -       bool
> > +       bool "Enable perf-based hard lockup detector (preferred)"
> >         depends on HARDLOCKUP_DETECTOR
> > -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF
> >         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> >         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > +       help
> > +         This detector uses a perf event on the CPU to detect when a CPU
> > +         has become non-maskable interrupt (NMI) stuck. This is the
> > +         preferred method on modern systems as it can detect lockups on
> > +         all CPUs at the same time.
> 
> I'd say this option should be the default for kernel developers but
> shouldn't be used by default to free the perf event and due to the
> extra power overhead.
> 
> Thanks,
> Ian
> 
> >  config HARDLOCKUP_DETECTOR_BUDDY
> > -       bool
> > +       bool "Enable buddy-based hard lockup detector"
> >         depends on HARDLOCKUP_DETECTOR
> >         depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
> > -       depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
> >         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> >         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > +       help
> > +         This is an alternative lockup detector that uses a heartbeat
> > +         mechanism between CPUs to detect when one has stopped responding.
> > +         It is less precise than the perf-based detector and cannot detect
> > +         all-CPU lockups, but it does not require a perf counter.
> > +
> > +config CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> > +       bool
> > +       depends on HARDLOCKUP_DETECTOR_PERF && HARDLOCKUP_DETECTOR_BUDDY
> >
> >  config HARDLOCKUP_DETECTOR_ARCH
> >         bool
> > --
> > 2.43.0
> >

-- 
Jinchao

