Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B169057B9BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp07w4vJMz3dqy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:32:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dbCH1rMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dbCH1rMV;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp07L0T99z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:32:13 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id bv24so2769933wrb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOe56Pal9wpMnCknu1sB4FBOOVOLYGu0YQCW9drNE6o=;
        b=dbCH1rMV5uvKG3/vw97dyMMvZdc3PV8XDPVwZ++yndGluvyO9EmAbxXdO52yLjrkVH
         0IFmAWREWuEK/Ks+OhraP8xLf7NkJnlMAyxsYUGw2dSIqMKgZHw6ogtL1li18dyhF95x
         DDCKyWqvH6nko7tLnr2J3FlrKqYCaal70SQMUGHm2wWWQhEXKYtqVxuKVouF5yZsPLqt
         FjBm3jDzJxOH06Aslq49FCUPQq/OvFuG3fDJTPqC+GuvqZ8v3TWAB/kHEQ968a3iTG7w
         ne/c8hXGzdkcAfp1neQgHXPVRH+vCI8cX3KqvLQaeum4SkVIg3k1TX0C+fnBhMQUExBX
         4scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOe56Pal9wpMnCknu1sB4FBOOVOLYGu0YQCW9drNE6o=;
        b=QLOJPRwYwb0zSyTZgdSfBr6gGw1DcuVk/i2ObSXlXvu9g+nO/EAub34LNvYA5n0xyG
         Kn571o26hivi4OaYguOHIxBE1fngfzsZw+MKLo5gGmp0gZKZQJ8iliDDCkBKYlFXgTP9
         olVGVuF64m5n5Jh8BaCnRWggiRgdR/DNASsbhhNsD9ih6m45R5liKyi28uM6PP+ZUt17
         2tqLJ4M6ThS7Wj+KQXZ9VD4zVFK9iFoDatdOHyVhbmagvRcXxF8wD36e1aUg3mXB9Kt0
         G7MIYrCW9DF2dnp6Fgrafc6hg7ZaYMfeBsfTnklkYfeqVqmGKVIWkPxL14XqGF4zfIAa
         kWBA==
X-Gm-Message-State: AJIora9hQNoqgwSA3o7XvcT+0P6zNPXGw1MeGwyfmVFvDYGU8UCKfN6j
	FX+wkc7rCLwotRiB9nC/SQbOFd8nnSPa726tQA6KPg==
X-Google-Smtp-Source: AGRyM1vsvscoHsqY9LtsaCoUZJbQkkNoTAQtU3YueagNPnGNccjfeNSvIVQDHM8FgHiVTJaiUUkRbZgnN0iqM0ZyAHM=
X-Received: by 2002:a05:6000:8e:b0:21d:7e97:67ed with SMTP id
 m14-20020a056000008e00b0021d7e9767edmr30049803wrx.343.1658331129763; Wed, 20
 Jul 2022 08:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-7-elver@google.com>
In-Reply-To: <20220704150514.48816-7-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:31:57 -0700
Message-ID: <CAP-5=fV_maSd0k_WCzxgToN1SYG+XHg0KpTe1m2CTJTT9+KM+w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] perf/hw_breakpoint: Optimize constant number of
 breakpoint slots
To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 4, 2022 at 8:06 AM Marco Elver <elver@google.com> wrote:
>
> Optimize internal hw_breakpoint state if the architecture's number of
> breakpoint slots is constant. This avoids several kmalloc() calls and
> potentially unnecessary failures if the allocations fail, as well as
> subtly improves code generation and cache locality.
>
> The protocol is that if an architecture defines hw_breakpoint_slots via
> the preprocessor, it must be constant and the same for all types.
>
> Signed-off-by: Marco Elver <elver@google.com>
> Acked-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  arch/sh/include/asm/hw_breakpoint.h  |  5 +-
>  arch/x86/include/asm/hw_breakpoint.h |  5 +-
>  kernel/events/hw_breakpoint.c        | 94 ++++++++++++++++++----------
>  3 files changed, 63 insertions(+), 41 deletions(-)
>
> diff --git a/arch/sh/include/asm/hw_breakpoint.h b/arch/sh/include/asm/hw_breakpoint.h
> index 199d17b765f2..361a0f57bdeb 100644
> --- a/arch/sh/include/asm/hw_breakpoint.h
> +++ b/arch/sh/include/asm/hw_breakpoint.h
> @@ -48,10 +48,7 @@ struct pmu;
>  /* Maximum number of UBC channels */
>  #define HBP_NUM                2
>
> -static inline int hw_breakpoint_slots(int type)
> -{
> -       return HBP_NUM;
> -}
> +#define hw_breakpoint_slots(type) (HBP_NUM)
>
>  /* arch/sh/kernel/hw_breakpoint.c */
>  extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
> diff --git a/arch/x86/include/asm/hw_breakpoint.h b/arch/x86/include/asm/hw_breakpoint.h
> index a1f0e90d0818..0bc931cd0698 100644
> --- a/arch/x86/include/asm/hw_breakpoint.h
> +++ b/arch/x86/include/asm/hw_breakpoint.h
> @@ -44,10 +44,7 @@ struct arch_hw_breakpoint {
>  /* Total number of available HW breakpoint registers */
>  #define HBP_NUM 4
>
> -static inline int hw_breakpoint_slots(int type)
> -{
> -       return HBP_NUM;
> -}
> +#define hw_breakpoint_slots(type) (HBP_NUM)
>
>  struct perf_event_attr;
>  struct perf_event;
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index 7df46b276452..9fb66d358d81 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -40,13 +40,16 @@ struct bp_cpuinfo {
>         /* Number of pinned cpu breakpoints in a cpu */
>         unsigned int    cpu_pinned;
>         /* tsk_pinned[n] is the number of tasks having n+1 breakpoints */
> +#ifdef hw_breakpoint_slots
> +       unsigned int    tsk_pinned[hw_breakpoint_slots(0)];
> +#else
>         unsigned int    *tsk_pinned;
> +#endif
>         /* Number of non-pinned cpu/task breakpoints in a cpu */
>         unsigned int    flexible; /* XXX: placeholder, see fetch_this_slot() */
>  };
>
>  static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
> -static int nr_slots[TYPE_MAX] __ro_after_init;
>
>  static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
>  {
> @@ -73,6 +76,54 @@ struct bp_busy_slots {
>  /* Serialize accesses to the above constraints */
>  static DEFINE_MUTEX(nr_bp_mutex);
>
> +#ifdef hw_breakpoint_slots
> +/*
> + * Number of breakpoint slots is constant, and the same for all types.
> + */
> +static_assert(hw_breakpoint_slots(TYPE_INST) == hw_breakpoint_slots(TYPE_DATA));
> +static inline int hw_breakpoint_slots_cached(int type) { return hw_breakpoint_slots(type); }
> +static inline int init_breakpoint_slots(void)          { return 0; }
> +#else
> +/*
> + * Dynamic number of breakpoint slots.
> + */
> +static int __nr_bp_slots[TYPE_MAX] __ro_after_init;
> +
> +static inline int hw_breakpoint_slots_cached(int type)
> +{
> +       return __nr_bp_slots[type];
> +}
> +
> +static __init int init_breakpoint_slots(void)
> +{
> +       int i, cpu, err_cpu;
> +
> +       for (i = 0; i < TYPE_MAX; i++)
> +               __nr_bp_slots[i] = hw_breakpoint_slots(i);
> +
> +       for_each_possible_cpu(cpu) {
> +               for (i = 0; i < TYPE_MAX; i++) {
> +                       struct bp_cpuinfo *info = get_bp_info(cpu, i);
> +
> +                       info->tsk_pinned = kcalloc(__nr_bp_slots[i], sizeof(int), GFP_KERNEL);
> +                       if (!info->tsk_pinned)
> +                               goto err;
> +               }
> +       }
> +
> +       return 0;
> +err:
> +       for_each_possible_cpu(err_cpu) {
> +               for (i = 0; i < TYPE_MAX; i++)
> +                       kfree(get_bp_info(err_cpu, i)->tsk_pinned);
> +               if (err_cpu == cpu)
> +                       break;
> +       }
> +
> +       return -ENOMEM;
> +}
> +#endif
> +
>  __weak int hw_breakpoint_weight(struct perf_event *bp)
>  {
>         return 1;
> @@ -95,7 +146,7 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
>         unsigned int *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
>         int i;
>
> -       for (i = nr_slots[type] - 1; i >= 0; i--) {
> +       for (i = hw_breakpoint_slots_cached(type) - 1; i >= 0; i--) {
>                 if (tsk_pinned[i] > 0)
>                         return i + 1;
>         }
> @@ -312,7 +363,7 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
>         fetch_this_slot(&slots, weight);
>
>         /* Flexible counters need to keep at least one slot */
> -       if (slots.pinned + (!!slots.flexible) > nr_slots[type])
> +       if (slots.pinned + (!!slots.flexible) > hw_breakpoint_slots_cached(type))
>                 return -ENOSPC;
>
>         ret = arch_reserve_bp_slot(bp);
> @@ -632,7 +683,7 @@ bool hw_breakpoint_is_used(void)
>                         if (info->cpu_pinned)
>                                 return true;
>
> -                       for (int slot = 0; slot < nr_slots[type]; ++slot) {
> +                       for (int slot = 0; slot < hw_breakpoint_slots_cached(type); ++slot) {
>                                 if (info->tsk_pinned[slot])
>                                         return true;
>                         }
> @@ -716,42 +767,19 @@ static struct pmu perf_breakpoint = {
>
>  int __init init_hw_breakpoint(void)
>  {
> -       int cpu, err_cpu;
> -       int i, ret;
> -
> -       for (i = 0; i < TYPE_MAX; i++)
> -               nr_slots[i] = hw_breakpoint_slots(i);
> -
> -       for_each_possible_cpu(cpu) {
> -               for (i = 0; i < TYPE_MAX; i++) {
> -                       struct bp_cpuinfo *info = get_bp_info(cpu, i);
> -
> -                       info->tsk_pinned = kcalloc(nr_slots[i], sizeof(int),
> -                                                       GFP_KERNEL);
> -                       if (!info->tsk_pinned) {
> -                               ret = -ENOMEM;
> -                               goto err;
> -                       }
> -               }
> -       }
> +       int ret;
>
>         ret = rhltable_init(&task_bps_ht, &task_bps_ht_params);
>         if (ret)
> -               goto err;
> +               return ret;
> +
> +       ret = init_breakpoint_slots();
> +       if (ret)
> +               return ret;
>
>         constraints_initialized = true;
>
>         perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
>
>         return register_die_notifier(&hw_breakpoint_exceptions_nb);
> -
> -err:
> -       for_each_possible_cpu(err_cpu) {
> -               for (i = 0; i < TYPE_MAX; i++)
> -                       kfree(get_bp_info(err_cpu, i)->tsk_pinned);
> -               if (err_cpu == cpu)
> -                       break;
> -       }
> -
> -       return ret;
>  }
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
