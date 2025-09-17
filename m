Return-Path: <linuxppc-dev+bounces-12298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CDDB7D1EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 14:20:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRRkK0ftBz3bmk;
	Wed, 17 Sep 2025 15:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758086008;
	cv=none; b=KZdRPQz0fREry/tZEBjwufrLmRHJxFta7WvJv7AMIlb/UOn3T7PvFElQKEzkd5uZTV0RRnXAax85K5wbHJ376IlPzsTYcs7mi+odQ1eR6EGKsvKAVQL6NDOLMcQlfxwiFmnMp31N5SeHRjbzpx0X+ecU5RPcfLLX3oTFb43Y4bSKJGlb8SXmELZc2TlqbkCEJNJlR1W4P/GhmVrvbbC5IH5B4YyX1zimQrUh0nIj+c05fpKjvi6kfVyk6uYkrvwxCNifr65T0GE5odU2Af6nqall/KnTw+ddHRpze9dTHc2w7AbR4z70RsA9l9LI/zX4nAmtrtWQGsX3FtVfw9TvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758086008; c=relaxed/relaxed;
	bh=uoIg9TTqRnBquZ+3ui3pLlAxls22Sw5DtDDmxlNkJ5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwqZ3Nfqo325B/ntu034xeh//91jorwfl41N7YXOiOpk7bk3RFK8JnGzcvBNtNUwiMNzGLWwY86APEpQ7XU3mRtylUdbvkbwpRMY5H0PQzcnBKavDPWjw2yrdocG9nYs3aUgNtSlV9QzCvM50BBdy4A2R19GtpOxwGKJ2L3vAtyH1pmocMnZLwBUEj3GoB2sffJEnYgVXaL/ersxB/QCLCJOhU6iGMim/Blo2nStpZ6iTQdMFp4ST0RP89AMhjWUAFwzcaTgRN/nXq3l8eFHZf4B9jXLhbuz9SbNNvXbxD2ggFvUjRdnE39zYnvJ44HtxXlEF6EkAUEF7ZEMSMaCsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cs1fKMsa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cs1fKMsa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRRkH2vs9z30BW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 15:13:27 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2681645b7b6so26135ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 22:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758086005; x=1758690805; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoIg9TTqRnBquZ+3ui3pLlAxls22Sw5DtDDmxlNkJ5U=;
        b=cs1fKMsa3unZLD5fl95n0bLaiyP4amEAy1JBfjJpl/JrL/dYllWlmE15Rph3+WABxW
         ekFDQ9ACWf6KjvyrC1UNeDnSnbnuxnyBDtEXs0lQksqBTu5DB6Ux6TKoQCEtBg+ERfw/
         GlVey+piF+108dwpZAk+tucm+m6/ZwWnN8Nj8PhSSkw1SQZmdkUzNMBeS5KqqUVCqVdc
         Xf7DjZ5W9v/RXmiN7G/Qi6dTa/kqWJ29KwRBTwDTU4jqgJl+JeB0frE9szl0UEmK7imK
         FkwEwOSX3UZJ2Y9sq3WypeVrzw1I0LT9TJz8X3ItxFo67eIfzXJjTET5vHJHfmGas83I
         tbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758086005; x=1758690805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoIg9TTqRnBquZ+3ui3pLlAxls22Sw5DtDDmxlNkJ5U=;
        b=DERK3l5KwS7LmoZ6jmMsRgDZb34yh9i7TICj7QpcjrfTp8dgUFhWrXu6+q3Oufospt
         +1qlFjcAfUL8mJF3GeXgF/s+fM2BnamKe3Q0UVlv6CaCqY/F45UIIpWxqFW2Mt4hRPV3
         el5mZYL1SGWqCUIRbDxsVCKXAeqRAjnn9IRSGRmuvPkWyLhorvx0xwkCdrXKtlzOjISV
         NV7/QpTWtJ/mgAggw0p1YwniCadXv9SVialq0y0QwJxYCEXgasACQhbwkoYNNWE7D5Bt
         AEnO+kw58tVT36M/qfmyCiPnbTEEgsz4IhTKXiZCn6jdyDHCrWIwEoJY/egLSox8I7yI
         YmHA==
X-Forwarded-Encrypted: i=1; AJvYcCXZrV0bAjGJb4eMUuWDmfm6QxXACFc5TlEfNwdrreHCBOcIBWRsiE/SbwJOYpWM+JhR41jp8GGTStiIrU8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwP7+tqoe++JNfQJXIns/st0/hNGV4yTMJPTpjte1kadx4a37ig
	XHwm08IeiqdBYcYOihpZ/kGF/eGfCi4fWYCIeLZHLloNiAZnKrYsyrZLKLW5XvqaW7pXPOfmIIz
	RX+ZzkLDNcsd90JoZB2Zpbi8Ojv+lghYbLY4qk02c
X-Gm-Gg: ASbGncvdm6Wd8L6rM5pvNm0LFH/iwyvgEc8rTnDvJcKMAx7t1d6RVrCsb1EW+GcBzLN
	g3+6XrYXkeBxsmok5mtEbi1yqlKhXeFdhZAbIJWGAG9RzfasGVJ7COVEllmUwETcr22SLX5lTV5
	Nq+stlVWPNnWU2BRn+m0ZnIF+0G55PU4sAW3d6+36+5qf14VUzH8o/dAfzL6uThbjpO+2A5ONHR
	9YRHuzZoHrOSFs=
X-Google-Smtp-Source: AGHT+IGNxZVbaI4mR3cLIJdamcafeaGfX8NnENJDy+H60BTHxRLhLioecnuLCbefKmqsXonQs42B13opmzSN0E5ptwc=
X-Received: by 2002:a17:903:183:b0:267:d7f8:4054 with SMTP id
 d9443c01a7336-26800f68420mr3354455ad.16.1758086004299; Tue, 16 Sep 2025
 22:13:24 -0700 (PDT)
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
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com> <aMoTOXIKBYVTj7PV@mdev>
In-Reply-To: <aMoTOXIKBYVTj7PV@mdev>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Sep 2025 22:13:12 -0700
X-Gm-Features: AS18NWBhgzzO33PJO6FoH_VToOGMfUugu12w9jLvAC2FrKmZUHqi3u0zros6a6g
Message-ID: <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, kees@kernel.org, masahiroy@kernel.org, 
	aliceryhl@google.com, ojeda@kernel.org, thomas.weissschuh@linutronix.de, 
	xur@google.com, ruanjinjie@huawei.com, gshan@redhat.com, maz@kernel.org, 
	suzuki.poulose@arm.com, zhanjie9@hisilicon.com, yangyicong@hisilicon.com, 
	gautam@linux.ibm.com, arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, 
	lihuafei1@huawei.com, coxu@redhat.com, jpoimboe@kernel.org, 
	yaozhenguo1@gmail.com, luogengkun@huaweicloud.com, max.kellermann@ionos.com, 
	tj@kernel.org, yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 6:47=E2=80=AFPM Jinchao Wang <wangjinchao600@gmail.=
com> wrote:
>
> On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > On Tue, Sep 16, 2025 at 7:51=E2=80=AFAM Jinchao Wang <wangjinchao600@gm=
ail.com> wrote:
> > >
> > > Currently, the hard lockup detector is selected at compile time via
> > > Kconfig, which requires a kernel rebuild to switch implementations.
> > > This is inflexible, especially on systems where a perf event may not
> > > be available or may be needed for other tasks.
> > >
> > > This commit refactors the hard lockup detector to replace a rigid
> > > compile-time choice with a flexible build-time and boot-time solution=
.
> > > The patch supports building the kernel with either detector
> > > independently, or with both. When both are built, a new boot paramete=
r
> > > `hardlockup_detector=3D"perf|buddy"` allows the selection at boot tim=
e.
> > > This is a more robust and user-friendly design.
> > >
> > > This patch is a follow-up to the discussion on the kernel mailing lis=
t
> > > regarding the preference and future of the hard lockup detectors. It
> > > implements a flexible solution that addresses the community's need to
> > > select an appropriate detector at boot time.
> > >
> > > The core changes are:
> > > - The `perf` and `buddy` watchdog implementations are separated into
> > >   distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> > > - Global function pointers are introduced (`watchdog_hardlockup_enabl=
e_ptr`)
> > >   to serve as a single API for the entire feature.
> > > - A new `hardlockup_detector=3D` boot parameter is added to allow the
> > >   user to select the desired detector at boot time.
> > > - The Kconfig options are simplified by removing the complex
> > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to b=
e
> > >   built without mutual exclusion.
> > > - The weak stubs are updated to call the new function pointers,
> > >   centralizing the watchdog logic.
> >
> > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
> > enabling and disabling whatever the boot time choice was? I'm not sure
> > why this has to be a boot time option given the ability to configure
> > via /proc/sys/kernel/nmi_watchdog.
> The new hardlockup_detector boot parameter and the existing
> /proc/sys/kernel/nmi_watchdog file serve different purposes.
>
> The boot parameter selects the type of hard lockup detector (perf or budd=
y).
> This choice is made once at boot.
>
>  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a simple on/of=
f
> switch for the currently selected detector. It does not change the detect=
or's
> type.

So the name "nmi_watchdog" for the buddy watchdog is wrong for fairly
obvious naming reasons but also because we can't differentiate when a
perf event has been taken or not - this impacts perf that is choosing
not to group events in metrics because of it, reducing the metric's
accuracy. We need an equivalent "buddy_watchdog" file to the
"nmi_watchdog" file. If we have such a file then if I did "echo 1 >
/proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to be
disabled and the perf event one to be enabled. Similarly, if I did
"echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect the
perf event watchdog to be disabled and the buddy one enabled. If I did
 "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
/proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
enabled. I don't see why choosing the type of watchdog implementation
at boot time is particularly desirable. It seems sensible to default
normal people to using the buddy watchdog (more perf events, power...)
and  CONFIG_DEBUG_KERNEL type people to using the perf event one. As
the "nmi_watchdog" file may be assumed to control the buddy watchdog,
perhaps a compatibility option (where the "nmi_watchdog" file controls
the buddy watchdog) is needed so that user code has time to migrate.

Thanks,
Ian

> >
> > > Link: https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@by=
tedance.com/
> > > Link: https://lore.kernel.org/all/CAD=3DFV=3DWWUiCi6bZCs_gseFpDDWNkuJ=
MoL6XCftEo6W7q6jRCkg@mail.gmail.com/
> > >
> > > Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> > > ---
> > >  .../admin-guide/kernel-parameters.txt         |  7 +++
> > >  include/linux/nmi.h                           |  6 +++
> > >  kernel/watchdog.c                             | 46 +++++++++++++++++=
+-
> > >  kernel/watchdog_buddy.c                       |  7 +--
> > >  kernel/watchdog_perf.c                        | 10 ++--
> > >  lib/Kconfig.debug                             | 37 +++++++--------
> > >  6 files changed, 85 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docume=
ntation/admin-guide/kernel-parameters.txt
> > > index 5a7a83c411e9..0af214ee566c 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -1828,6 +1828,13 @@
> > >                         backtraces on all cpus.
> > >                         Format: 0 | 1
> > >
> > > +       hardlockup_detector=3D
> > > +                       [perf, buddy] Selects the hard lockup detecto=
r to use at
> > > +                       boot time.
> > > +                       Format: <string>
> > > +                       - "perf": Use the perf-based detector.
> > > +                       - "buddy": Use the buddy-based detector.
> > > +
> > >         hash_pointers=3D
> > >                         [KNL,EARLY]
> > >                         By default, when pointers are printed to the =
console
> > > diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> > > index cf3c6ab408aa..9298980ce572 100644
> > > --- a/include/linux/nmi.h
> > > +++ b/include/linux/nmi.h
> > > @@ -100,6 +100,9 @@ void watchdog_hardlockup_check(unsigned int cpu, =
struct pt_regs *regs);
> > >  #endif
> > >
> > >  #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> > > +void watchdog_perf_hardlockup_enable(unsigned int cpu);
> > > +void watchdog_perf_hardlockup_disable(unsigned int cpu);
> > > +extern int watchdog_perf_hardlockup_probe(void);
> > >  extern void hardlockup_detector_perf_stop(void);
> > >  extern void hardlockup_detector_perf_restart(void);
> > >  extern void hardlockup_config_perf_event(const char *str);
> > > @@ -120,6 +123,9 @@ void watchdog_hardlockup_disable(unsigned int cpu=
);
> > >  void lockup_detector_reconfigure(void);
> > >
> > >  #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
> > > +void watchdog_buddy_hardlockup_enable(unsigned int cpu);
> > > +void watchdog_buddy_hardlockup_disable(unsigned int cpu);
> > > +int watchdog_buddy_hardlockup_probe(void);
> > >  void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
> > >  #else
> > >  static inline void watchdog_buddy_check_hardlockup(int hrtimer_inter=
rupts) {}
> > > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > > index 80b56c002c7f..85451d24a77d 100644
> > > --- a/kernel/watchdog.c
> > > +++ b/kernel/watchdog.c
> > > @@ -55,6 +55,37 @@ unsigned long *watchdog_cpumask_bits =3D cpumask_b=
its(&watchdog_cpumask);
> > >
> > >  #ifdef CONFIG_HARDLOCKUP_DETECTOR
> > >
> > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > > +/* The global function pointers */
> > > +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) =3D watchdo=
g_perf_hardlockup_enable;
> > > +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) =3D watchd=
og_perf_hardlockup_disable;
> > > +int (*watchdog_hardlockup_probe_ptr)(void) =3D watchdog_perf_hardloc=
kup_probe;
> > > +#elif defined(CONFIG_HARDLOCKUP_DETECTOR_BUDDY)
> > > +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) =3D watchdo=
g_buddy_hardlockup_enable;
> > > +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) =3D watchd=
og_buddy_hardlockup_disable;
> > > +int (*watchdog_hardlockup_probe_ptr)(void) =3D watchdog_buddy_hardlo=
ckup_probe;
> > > +#endif
> > > +
> > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> > > +static char *hardlockup_detector_type =3D "perf"; /* Default to perf=
 */
> > > +static int __init set_hardlockup_detector_type(char *str)
> > > +{
> > > +       if (!strncmp(str, "perf", 4)) {
> > > +               watchdog_hardlockup_enable_ptr =3D watchdog_perf_hard=
lockup_enable;
> > > +               watchdog_hardlockup_disable_ptr =3D watchdog_perf_har=
dlockup_disable;
> > > +               watchdog_hardlockup_probe_ptr =3D watchdog_perf_hardl=
ockup_probe;
> > > +       } else if (!strncmp(str, "buddy", 5)) {
> > > +               watchdog_hardlockup_enable_ptr =3D watchdog_buddy_har=
dlockup_enable;
> > > +               watchdog_hardlockup_disable_ptr =3D watchdog_buddy_ha=
rdlockup_disable;
> > > +               watchdog_hardlockup_probe_ptr =3D watchdog_buddy_hard=
lockup_probe;
> > > +       }
> > > +       return 1;
> > > +}
> > > +
> > > +__setup("hardlockup_detector=3D", set_hardlockup_detector_type);
> > > +
> > > +#endif
> > > +
> > >  # ifdef CONFIG_SMP
> > >  int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
> > >  # endif /* CONFIG_SMP */
> > > @@ -262,9 +293,17 @@ static inline void watchdog_hardlockup_kick(void=
) { }
> > >   * softlockup watchdog start and stop. The detector must select the
> > >   * SOFTLOCKUP_DETECTOR Kconfig.
> > >   */
> > > -void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
> > > +void __weak watchdog_hardlockup_enable(unsigned int cpu)
> > > +{
> > > +       if (watchdog_hardlockup_enable_ptr)
> > > +               watchdog_hardlockup_enable_ptr(cpu);
> > > +}
> > >
> > > -void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
> > > +void __weak watchdog_hardlockup_disable(unsigned int cpu)
> > > +{
> > > +       if (watchdog_hardlockup_disable_ptr)
> > > +               watchdog_hardlockup_disable_ptr(cpu);
> > > +}
> > >
> > >  /*
> > >   * Watchdog-detector specific API.
> > > @@ -275,6 +314,9 @@ void __weak watchdog_hardlockup_disable(unsigned =
int cpu) { }
> > >   */
> > >  int __weak __init watchdog_hardlockup_probe(void)
> > >  {
> > > +       if (watchdog_hardlockup_probe_ptr)
> > > +               return watchdog_hardlockup_probe_ptr();
> > > +
> > >         return -ENODEV;
> > >  }
> > >
> > > diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
> > > index ee754d767c21..390d89bfcafa 100644
> > > --- a/kernel/watchdog_buddy.c
> > > +++ b/kernel/watchdog_buddy.c
> > > @@ -19,15 +19,16 @@ static unsigned int watchdog_next_cpu(unsigned in=
t cpu)
> > >         return next_cpu;
> > >  }
> > >
> > > -int __init watchdog_hardlockup_probe(void)
> > > +int __init watchdog_buddy_hardlockup_probe(void)
> > >  {
> > >         return 0;
> > >  }
> > >
> > > -void watchdog_hardlockup_enable(unsigned int cpu)
> > > +void watchdog_buddy_hardlockup_enable(unsigned int cpu)
> > >  {
> > >         unsigned int next_cpu;
> > >
> > > +       pr_info("ddddd %s\n", __func__);
> > >         /*
> > >          * The new CPU will be marked online before the hrtimer inter=
rupt
> > >          * gets a chance to run on it. If another CPU tests for a
> > > @@ -58,7 +59,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
> > >         cpumask_set_cpu(cpu, &watchdog_cpus);
> > >  }
> > >
> > > -void watchdog_hardlockup_disable(unsigned int cpu)
> > > +void watchdog_buddy_hardlockup_disable(unsigned int cpu)
> > >  {
> > >         unsigned int next_cpu =3D watchdog_next_cpu(cpu);
> > >
> > > diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> > > index 9c58f5b4381d..270110e58f20 100644
> > > --- a/kernel/watchdog_perf.c
> > > +++ b/kernel/watchdog_perf.c
> > > @@ -153,10 +153,12 @@ static int hardlockup_detector_event_create(voi=
d)
> > >   * watchdog_hardlockup_enable - Enable the local event
> > >   * @cpu: The CPU to enable hard lockup on.
> > >   */
> > > -void watchdog_hardlockup_enable(unsigned int cpu)
> > > +void watchdog_perf_hardlockup_enable(unsigned int cpu)
> > >  {
> > >         WARN_ON_ONCE(cpu !=3D smp_processor_id());
> > >
> > > +       pr_info("ddddd %s\n", __func__);
> > > +
> > >         if (hardlockup_detector_event_create())
> > >                 return;
> > >
> > > @@ -172,7 +174,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
> > >   * watchdog_hardlockup_disable - Disable the local event
> > >   * @cpu: The CPU to enable hard lockup on.
> > >   */
> > > -void watchdog_hardlockup_disable(unsigned int cpu)
> > > +void watchdog_perf_hardlockup_disable(unsigned int cpu)
> > >  {
> > >         struct perf_event *event =3D this_cpu_read(watchdog_ev);
> > >
> > > @@ -257,10 +259,12 @@ bool __weak __init arch_perf_nmi_is_available(v=
oid)
> > >  /**
> > >   * watchdog_hardlockup_probe - Probe whether NMI event is available =
at all
> > >   */
> > > -int __init watchdog_hardlockup_probe(void)
> > > +int __init watchdog_perf_hardlockup_probe(void)
> > >  {
> > >         int ret;
> > >
> > > +       pr_info("ddddd %s\n", __func__);
> > > +
> > >         if (!arch_perf_nmi_is_available())
> > >                 return -ENODEV;
> > >
> > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > index dc0e0c6ed075..443353fad1c1 100644
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -1167,36 +1167,33 @@ config HARDLOCKUP_DETECTOR
> > >  #
> > >  # Note that arch-specific variants are always preferred.
> > >  #
> > > -config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> > > -       bool "Prefer the buddy CPU hardlockup detector"
> > > -       depends on HARDLOCKUP_DETECTOR
> > > -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_D=
ETECTOR_BUDDY
> > > -       depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> > > -       help
> > > -         Say Y here to prefer the buddy hardlockup detector over the=
 perf one.
> > > -
> > > -         With the buddy detector, each CPU uses its softlockup hrtim=
er
> > > -         to check that the next CPU is processing hrtimer interrupts=
 by
> > > -         verifying that a counter is increasing.
> > > -
> > > -         This hardlockup detector is useful on systems that don't ha=
ve
> > > -         an arch-specific hardlockup detector or if resources needed
> > > -         for the hardlockup detector are better used for other thing=
s.
> > > -
> > >  config HARDLOCKUP_DETECTOR_PERF
> > > -       bool
> > > +       bool "Enable perf-based hard lockup detector (preferred)"
> > >         depends on HARDLOCKUP_DETECTOR
> > > -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETEC=
TOR_PREFER_BUDDY
> > > +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF
> > >         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> > >         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > > +       help
> > > +         This detector uses a perf event on the CPU to detect when a=
 CPU
> > > +         has become non-maskable interrupt (NMI) stuck. This is the
> > > +         preferred method on modern systems as it can detect lockups=
 on
> > > +         all CPUs at the same time.
> >
> > I'd say this option should be the default for kernel developers but
> > shouldn't be used by default to free the perf event and due to the
> > extra power overhead.
> >
> > Thanks,
> > Ian
> >
> > >  config HARDLOCKUP_DETECTOR_BUDDY
> > > -       bool
> > > +       bool "Enable buddy-based hard lockup detector"
> > >         depends on HARDLOCKUP_DETECTOR
> > >         depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
> > > -       depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETEC=
TOR_PREFER_BUDDY
> > >         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> > >         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> > > +       help
> > > +         This is an alternative lockup detector that uses a heartbea=
t
> > > +         mechanism between CPUs to detect when one has stopped respo=
nding.
> > > +         It is less precise than the perf-based detector and cannot =
detect
> > > +         all-CPU lockups, but it does not require a perf counter.
> > > +
> > > +config CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> > > +       bool
> > > +       depends on HARDLOCKUP_DETECTOR_PERF && HARDLOCKUP_DETECTOR_BU=
DDY
> > >
> > >  config HARDLOCKUP_DETECTOR_ARCH
> > >         bool
> > > --
> > > 2.43.0
> > >
>
> --
> Jinchao

