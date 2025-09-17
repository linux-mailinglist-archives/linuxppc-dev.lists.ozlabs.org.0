Return-Path: <linuxppc-dev+bounces-12297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA5B7EC73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 15:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRJsL33Z0z30Ff;
	Wed, 17 Sep 2025 10:04:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758067446;
	cv=none; b=AeWiten9amsPB7E/nN3voTBS5FdInd0/nTCO31bETD88nIP9CnofrQ0Q6J2OGt98VgfR7hRUVntc0rf9/0m9t54QsKpWRyPbe8C0atEdavJnGFeNtTQF3hJPZ60/0HH+dEjR9RV3BWe5Gik9xZgMGHD8+x8IE3sIY/dxQWgFtgfli9zr7AFCqQnrx/QZGsKtPYh9VvzBvOGafagT3qezzmCCCdmuf6Nqx24I9gKfWyxM2zKLwS/VPcQu5vqmpxonl6WbPXqAoNMf9Nje6E7BfJG1yt2ysdN7bXto1m5+yQs7cACV4NwlEJffBwN+r3ZhOECp4C49QN2Fim3vDDmnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758067446; c=relaxed/relaxed;
	bh=b1ozF3Ihz3SbIh1//+stJwcJhcq5G5PVLjQUIa2BLC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2AhZkzMRMh3Wz5M5bCrI7w/FQrxA1tq0X/z8hJn+oO+wpvP8ndP5jN96UUJguOUx+6BBMt2E7Q3b6PoA3esoFvy/ryHeLY2ykE+fYaKgKDV2p1dyreYjmrDklyrRXWgeYkUc3BxBd0PAPHvO0XrYNJjsEqhDd+BfZ9MQQZ+nUXtQXzpz2X+VDalZNgoDPRunv6JHeX/YABKe/ckeaS2PQKiM3Y/ZukN3g+RCnRID6a16p/N0sTOemnB3i2NdAIl/urNiD3RvpzNUsXSrCt8cEqdS1zCGYmDNeUPPQDyfigsA7L2VSkSYAN754j/ja+CwXPwcQb4NVUXAvR8r4SrDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FnX8VQPY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FnX8VQPY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRJsJ6FCRz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 10:04:04 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2637b6e9149so65935ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 17:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758067441; x=1758672241; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ozF3Ihz3SbIh1//+stJwcJhcq5G5PVLjQUIa2BLC4=;
        b=FnX8VQPYAsYD6XTO6MrSvH7EJaEi6DyCltb392AwpjPzYfooMOZHDW0uxbkiy7Gnd7
         2SeHnI8s5sbpCcKUFL8oUHsdc+SAZYkiw8PaBJCUj8CKO7M0mDYzsQjmaRp7KfecAEhg
         KajaqQQL6wDsONkAfZh/mRJRa9xQj2jw3QlitsDtgBGenygKuAOkijE5dChjl6hzWvM9
         bRnLtCkvqKoVKPLWYOm/UGOe9yI9RmwhJiYtsxNu9Yc2IzaLoLPbB17MSathtE0hpr6z
         qh+2JPF7+VIQ7IzeWE5BfARJ6zusxS0q6/g/ixyMhXu9lnf234+wnvISa3ImI4FX7403
         /r2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758067441; x=1758672241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1ozF3Ihz3SbIh1//+stJwcJhcq5G5PVLjQUIa2BLC4=;
        b=eYCtgO3FpK65PqJ7tpZJ8dGr+QFqiw/SySLMCit3OBJ1THygj368yp9APAdKYo33ys
         BWlUHFr2kH6EWGLfddNoalbqlDrsLI9CUpKX3jgf+yEXGR9Em8frD7QeCR6//8Q56U3d
         u98jTC1dp0yddc6zoyWIfkSNzSyPPJtfbU4fcGWjKXExbhGAYj2EXJZ7K+vWcvpVwFak
         B1LnVAH4qW9BDAoMLGKlpec5tHN2SdXpyyVMY6SIJ28TxTxs7pM7HQ+dbO8Eq8An182S
         FMjps0MTpDv8mwMlUIzfC/t0nvztFqSyheaOdQcAMbXrc5tdTFPo9Uqf6TSI9BOhCtF/
         k7LA==
X-Forwarded-Encrypted: i=1; AJvYcCW8zskvexUiSfzG0yqm2nhWBPTBeIL9fymRyRi/xEgpOAj6gE4VM+rGwUCLks6pD3Pn/iLy893Awa8CEhg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJYKnXrHOCovfWHowe2A3EY8+98s/eN5weWjx4id1wiQhgYRJV
	RWBc6Gc5ITaU+eK+fEnZLycOZeDFF/89uBvURm97B8NUyClYcRs5nN+xSucdUcJp96pIXkPCZ/X
	Xb+RmK/gdNNgd1mLchkW4a0qWTfm48/yVFMo8qKan
X-Gm-Gg: ASbGncuB2iAy3qQDOYNftMRcMoGmI/4pqJ5OlK17Nhibosx44bNTwKGOA2LxARRHemN
	eQmuJw8Nqx86jC/IRwnTB0le3AyAmJlyHmtRljqN75xQeG1jsWcnhLHizqQHnvVQiydepXlb7Gv
	2g/F70B5F7sYbeZj3FT6DoxQLRSdvRI8wDuufXH/VrelNcDHO0YUxgPqle+ZVBW+fA8Dm3XPrAz
	LJcT+paNAJPu+8=
X-Google-Smtp-Source: AGHT+IF44M/njGETFfGx7puarW8zSab4Yqo7efyATMKMqVa8CxtmvwDhuCwTG6EiL4xJDWFLbqy6XjX3gMcWgISoAJY=
X-Received: by 2002:a17:902:eccf:b0:25b:d970:fe45 with SMTP id
 d9443c01a7336-26808a2bb47mr1492825ad.1.1758067440819; Tue, 16 Sep 2025
 17:04:00 -0700 (PDT)
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
In-Reply-To: <20250916145122.416128-1-wangjinchao600@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Sep 2025 17:03:48 -0700
X-Gm-Features: AS18NWDR12QpAvWDnz7Kij5exh3KDDcZnCHjW3U3Ew-QC-j5MDeFbQz2osglKGQ
Message-ID: <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
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

On Tue, Sep 16, 2025 at 7:51=E2=80=AFAM Jinchao Wang <wangjinchao600@gmail.=
com> wrote:
>
> Currently, the hard lockup detector is selected at compile time via
> Kconfig, which requires a kernel rebuild to switch implementations.
> This is inflexible, especially on systems where a perf event may not
> be available or may be needed for other tasks.
>
> This commit refactors the hard lockup detector to replace a rigid
> compile-time choice with a flexible build-time and boot-time solution.
> The patch supports building the kernel with either detector
> independently, or with both. When both are built, a new boot parameter
> `hardlockup_detector=3D"perf|buddy"` allows the selection at boot time.
> This is a more robust and user-friendly design.
>
> This patch is a follow-up to the discussion on the kernel mailing list
> regarding the preference and future of the hard lockup detectors. It
> implements a flexible solution that addresses the community's need to
> select an appropriate detector at boot time.
>
> The core changes are:
> - The `perf` and `buddy` watchdog implementations are separated into
>   distinct functions (e.g., `watchdog_perf_hardlockup_enable`).
> - Global function pointers are introduced (`watchdog_hardlockup_enable_pt=
r`)
>   to serve as a single API for the entire feature.
> - A new `hardlockup_detector=3D` boot parameter is added to allow the
>   user to select the desired detector at boot time.
> - The Kconfig options are simplified by removing the complex
>   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both detectors to be
>   built without mutual exclusion.
> - The weak stubs are updated to call the new function pointers,
>   centralizing the watchdog logic.

What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is that
enabling and disabling whatever the boot time choice was? I'm not sure
why this has to be a boot time option given the ability to configure
via /proc/sys/kernel/nmi_watchdog.

> Link: https://lore.kernel.org/all/20250915035355.10846-1-cuiyunhui@byteda=
nce.com/
> Link: https://lore.kernel.org/all/CAD=3DFV=3DWWUiCi6bZCs_gseFpDDWNkuJMoL6=
XCftEo6W7q6jRCkg@mail.gmail.com/
>
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  7 +++
>  include/linux/nmi.h                           |  6 +++
>  kernel/watchdog.c                             | 46 ++++++++++++++++++-
>  kernel/watchdog_buddy.c                       |  7 +--
>  kernel/watchdog_perf.c                        | 10 ++--
>  lib/Kconfig.debug                             | 37 +++++++--------
>  6 files changed, 85 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 5a7a83c411e9..0af214ee566c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1828,6 +1828,13 @@
>                         backtraces on all cpus.
>                         Format: 0 | 1
>
> +       hardlockup_detector=3D
> +                       [perf, buddy] Selects the hard lockup detector to=
 use at
> +                       boot time.
> +                       Format: <string>
> +                       - "perf": Use the perf-based detector.
> +                       - "buddy": Use the buddy-based detector.
> +
>         hash_pointers=3D
>                         [KNL,EARLY]
>                         By default, when pointers are printed to the cons=
ole
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index cf3c6ab408aa..9298980ce572 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -100,6 +100,9 @@ void watchdog_hardlockup_check(unsigned int cpu, stru=
ct pt_regs *regs);
>  #endif
>
>  #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> +void watchdog_perf_hardlockup_enable(unsigned int cpu);
> +void watchdog_perf_hardlockup_disable(unsigned int cpu);
> +extern int watchdog_perf_hardlockup_probe(void);
>  extern void hardlockup_detector_perf_stop(void);
>  extern void hardlockup_detector_perf_restart(void);
>  extern void hardlockup_config_perf_event(const char *str);
> @@ -120,6 +123,9 @@ void watchdog_hardlockup_disable(unsigned int cpu);
>  void lockup_detector_reconfigure(void);
>
>  #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
> +void watchdog_buddy_hardlockup_enable(unsigned int cpu);
> +void watchdog_buddy_hardlockup_disable(unsigned int cpu);
> +int watchdog_buddy_hardlockup_probe(void);
>  void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
>  #else
>  static inline void watchdog_buddy_check_hardlockup(int hrtimer_interrupt=
s) {}
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 80b56c002c7f..85451d24a77d 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -55,6 +55,37 @@ unsigned long *watchdog_cpumask_bits =3D cpumask_bits(=
&watchdog_cpumask);
>
>  #ifdef CONFIG_HARDLOCKUP_DETECTOR
>
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> +/* The global function pointers */
> +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) =3D watchdog_pe=
rf_hardlockup_enable;
> +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) =3D watchdog_p=
erf_hardlockup_disable;
> +int (*watchdog_hardlockup_probe_ptr)(void) =3D watchdog_perf_hardlockup_=
probe;
> +#elif defined(CONFIG_HARDLOCKUP_DETECTOR_BUDDY)
> +void (*watchdog_hardlockup_enable_ptr)(unsigned int cpu) =3D watchdog_bu=
ddy_hardlockup_enable;
> +void (*watchdog_hardlockup_disable_ptr)(unsigned int cpu) =3D watchdog_b=
uddy_hardlockup_disable;
> +int (*watchdog_hardlockup_probe_ptr)(void) =3D watchdog_buddy_hardlockup=
_probe;
> +#endif
> +
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> +static char *hardlockup_detector_type =3D "perf"; /* Default to perf */
> +static int __init set_hardlockup_detector_type(char *str)
> +{
> +       if (!strncmp(str, "perf", 4)) {
> +               watchdog_hardlockup_enable_ptr =3D watchdog_perf_hardlock=
up_enable;
> +               watchdog_hardlockup_disable_ptr =3D watchdog_perf_hardloc=
kup_disable;
> +               watchdog_hardlockup_probe_ptr =3D watchdog_perf_hardlocku=
p_probe;
> +       } else if (!strncmp(str, "buddy", 5)) {
> +               watchdog_hardlockup_enable_ptr =3D watchdog_buddy_hardloc=
kup_enable;
> +               watchdog_hardlockup_disable_ptr =3D watchdog_buddy_hardlo=
ckup_disable;
> +               watchdog_hardlockup_probe_ptr =3D watchdog_buddy_hardlock=
up_probe;
> +       }
> +       return 1;
> +}
> +
> +__setup("hardlockup_detector=3D", set_hardlockup_detector_type);
> +
> +#endif
> +
>  # ifdef CONFIG_SMP
>  int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
>  # endif /* CONFIG_SMP */
> @@ -262,9 +293,17 @@ static inline void watchdog_hardlockup_kick(void) { =
}
>   * softlockup watchdog start and stop. The detector must select the
>   * SOFTLOCKUP_DETECTOR Kconfig.
>   */
> -void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
> +void __weak watchdog_hardlockup_enable(unsigned int cpu)
> +{
> +       if (watchdog_hardlockup_enable_ptr)
> +               watchdog_hardlockup_enable_ptr(cpu);
> +}
>
> -void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
> +void __weak watchdog_hardlockup_disable(unsigned int cpu)
> +{
> +       if (watchdog_hardlockup_disable_ptr)
> +               watchdog_hardlockup_disable_ptr(cpu);
> +}
>
>  /*
>   * Watchdog-detector specific API.
> @@ -275,6 +314,9 @@ void __weak watchdog_hardlockup_disable(unsigned int =
cpu) { }
>   */
>  int __weak __init watchdog_hardlockup_probe(void)
>  {
> +       if (watchdog_hardlockup_probe_ptr)
> +               return watchdog_hardlockup_probe_ptr();
> +
>         return -ENODEV;
>  }
>
> diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
> index ee754d767c21..390d89bfcafa 100644
> --- a/kernel/watchdog_buddy.c
> +++ b/kernel/watchdog_buddy.c
> @@ -19,15 +19,16 @@ static unsigned int watchdog_next_cpu(unsigned int cp=
u)
>         return next_cpu;
>  }
>
> -int __init watchdog_hardlockup_probe(void)
> +int __init watchdog_buddy_hardlockup_probe(void)
>  {
>         return 0;
>  }
>
> -void watchdog_hardlockup_enable(unsigned int cpu)
> +void watchdog_buddy_hardlockup_enable(unsigned int cpu)
>  {
>         unsigned int next_cpu;
>
> +       pr_info("ddddd %s\n", __func__);
>         /*
>          * The new CPU will be marked online before the hrtimer interrupt
>          * gets a chance to run on it. If another CPU tests for a
> @@ -58,7 +59,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
>         cpumask_set_cpu(cpu, &watchdog_cpus);
>  }
>
> -void watchdog_hardlockup_disable(unsigned int cpu)
> +void watchdog_buddy_hardlockup_disable(unsigned int cpu)
>  {
>         unsigned int next_cpu =3D watchdog_next_cpu(cpu);
>
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index 9c58f5b4381d..270110e58f20 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -153,10 +153,12 @@ static int hardlockup_detector_event_create(void)
>   * watchdog_hardlockup_enable - Enable the local event
>   * @cpu: The CPU to enable hard lockup on.
>   */
> -void watchdog_hardlockup_enable(unsigned int cpu)
> +void watchdog_perf_hardlockup_enable(unsigned int cpu)
>  {
>         WARN_ON_ONCE(cpu !=3D smp_processor_id());
>
> +       pr_info("ddddd %s\n", __func__);
> +
>         if (hardlockup_detector_event_create())
>                 return;
>
> @@ -172,7 +174,7 @@ void watchdog_hardlockup_enable(unsigned int cpu)
>   * watchdog_hardlockup_disable - Disable the local event
>   * @cpu: The CPU to enable hard lockup on.
>   */
> -void watchdog_hardlockup_disable(unsigned int cpu)
> +void watchdog_perf_hardlockup_disable(unsigned int cpu)
>  {
>         struct perf_event *event =3D this_cpu_read(watchdog_ev);
>
> @@ -257,10 +259,12 @@ bool __weak __init arch_perf_nmi_is_available(void)
>  /**
>   * watchdog_hardlockup_probe - Probe whether NMI event is available at a=
ll
>   */
> -int __init watchdog_hardlockup_probe(void)
> +int __init watchdog_perf_hardlockup_probe(void)
>  {
>         int ret;
>
> +       pr_info("ddddd %s\n", __func__);
> +
>         if (!arch_perf_nmi_is_available())
>                 return -ENODEV;
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index dc0e0c6ed075..443353fad1c1 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1167,36 +1167,33 @@ config HARDLOCKUP_DETECTOR
>  #
>  # Note that arch-specific variants are always preferred.
>  #
> -config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> -       bool "Prefer the buddy CPU hardlockup detector"
> -       depends on HARDLOCKUP_DETECTOR
> -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && HAVE_HARDLOCKUP_DETEC=
TOR_BUDDY
> -       depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> -       help
> -         Say Y here to prefer the buddy hardlockup detector over the per=
f one.
> -
> -         With the buddy detector, each CPU uses its softlockup hrtimer
> -         to check that the next CPU is processing hrtimer interrupts by
> -         verifying that a counter is increasing.
> -
> -         This hardlockup detector is useful on systems that don't have
> -         an arch-specific hardlockup detector or if resources needed
> -         for the hardlockup detector are better used for other things.
> -
>  config HARDLOCKUP_DETECTOR_PERF
> -       bool
> +       bool "Enable perf-based hard lockup detector (preferred)"
>         depends on HARDLOCKUP_DETECTOR
> -       depends on HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_=
PREFER_BUDDY
> +       depends on HAVE_HARDLOCKUP_DETECTOR_PERF
>         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
>         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> +       help
> +         This detector uses a perf event on the CPU to detect when a CPU
> +         has become non-maskable interrupt (NMI) stuck. This is the
> +         preferred method on modern systems as it can detect lockups on
> +         all CPUs at the same time.

I'd say this option should be the default for kernel developers but
shouldn't be used by default to free the perf event and due to the
extra power overhead.

Thanks,
Ian

>  config HARDLOCKUP_DETECTOR_BUDDY
> -       bool
> +       bool "Enable buddy-based hard lockup detector"
>         depends on HARDLOCKUP_DETECTOR
>         depends on HAVE_HARDLOCKUP_DETECTOR_BUDDY
> -       depends on !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_=
PREFER_BUDDY
>         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
>         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> +       help
> +         This is an alternative lockup detector that uses a heartbeat
> +         mechanism between CPUs to detect when one has stopped respondin=
g.
> +         It is less precise than the perf-based detector and cannot dete=
ct
> +         all-CPU lockups, but it does not require a perf counter.
> +
> +config CONFIG_HARDLOCKUP_DETECTOR_MULTIPLE
> +       bool
> +       depends on HARDLOCKUP_DETECTOR_PERF && HARDLOCKUP_DETECTOR_BUDDY
>
>  config HARDLOCKUP_DETECTOR_ARCH
>         bool
> --
> 2.43.0
>

