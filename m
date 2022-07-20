Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B257BABF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp0Qs5nDKz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:45:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jMjFel7O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jMjFel7O;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp0QG74M1z2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:45:10 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id id17so4025559wmb.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sTlwsce+j9b/yyK8fo/sWOEwGwuq8KzZalKUeFpjn/4=;
        b=jMjFel7OH8+a1QTV/VTi/P+jv3qILYMbl9KEKOKQfWFGHd3uRmOx9+Ph/ysD4Hh9Jd
         pmUET645hu6aTnl0QomyqzvTny09m3Vxivj5TIoO8ccvaW9ZLHMhadbj1mTVYhR0AmpK
         URVPq9kOVXwz4vl2e1g/OJJVjTLBeC5mauvg8s1kUTQ0ImayNHGyOa0+4hPLcgnfNP/a
         ISpIUselOUiJ3DNyhfrbB8XocmRVvFqUj6h2cBZpQyhngtVPHsWS6jJKhlDYbnjSZfvK
         mUs75wDvUv/FpxpIYEHiGCpQVVT/H7jcQGpF6FnZIhOsMY7yt82hajdfrfnlHU+MesHT
         2Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sTlwsce+j9b/yyK8fo/sWOEwGwuq8KzZalKUeFpjn/4=;
        b=JX1pxTu2nzw3rSz35P3W8Jd8fXX5Q1huzZGHJ8RhFNfiHsqyc/qWEgByTwzxjamSXN
         T+sWlRrRy1+6+/NXqEaxJrmHvjcptG6MWMSnt3oibPKGxhQPEpJUJyYM3ZoOeuDfHYgl
         02GWRbLftdYRs8/rxPg2XZi9ni0TCJXTgTHmIGO3UA0DCAWZ703ZKlFsXLA2XNNRJByb
         uSc0wEhDrTb9LacghaZjN4cUmHuWmgPM9J8kttJdbdUO+zaV54kLeHS0WWib4UijDLt3
         8afaTzIuqj3x/zhV2I5QvzVsOIQujoeQPb8HEi25XFWeijt6U+onuvfT3Uf40Ar8Wg6W
         HX9Q==
X-Gm-Message-State: AJIora+EISEb6q7v9rSIywahuoyy4QpwTaj1zqkntsNyU2vGhcX5bfo7
	xnL3lNDIVGL/ob2Ol8NuGABie9cchfOgBjykdKidHQ==
X-Google-Smtp-Source: AGRyM1t7N4KjVqrQhP8llSbFmsOLSJkqttIgdFIrIsVFBVSOahDzDz8078cv7h4c89M0A24Bx5n9JBa7T60z5jT8eIE=
X-Received: by 2002:a05:600c:2854:b0:3a3:1551:d7d with SMTP id
 r20-20020a05600c285400b003a315510d7dmr4234783wmb.174.1658331906538; Wed, 20
 Jul 2022 08:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-15-elver@google.com>
In-Reply-To: <20220704150514.48816-15-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:44:54 -0700
Message-ID: <CAP-5=fX1ayMVSSny8A3JtF2PELnt2wjCj-LPXXF+-Dji8qUNwg@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] perf/hw_breakpoint: Optimize toggle_bp_slot()
 for CPU-independent task targets
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

On Mon, Jul 4, 2022 at 8:07 AM Marco Elver <elver@google.com> wrote:
>
> We can still see that a majority of the time is spent hashing task pointers:
>
>     ...
>     16.98%  [kernel]       [k] rhashtable_jhash2
>     ...
>
> Doing the bookkeeping in toggle_bp_slots() is currently O(#cpus),
> calling task_bp_pinned() for each CPU, even if task_bp_pinned() is
> CPU-independent. The reason for this is to update the per-CPU
> 'tsk_pinned' histogram.
>
> To optimize the CPU-independent case to O(1), keep a separate
> CPU-independent 'tsk_pinned_all' histogram.
>
> The major source of complexity are transitions between "all
> CPU-independent task breakpoints" and "mixed CPU-independent and
> CPU-dependent task breakpoints". The code comments list all cases that
> require handling.
>
> After this optimization:
>
>  | $> perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 100 threads with 4 breakpoints and 128 parallelism
>  |      Total time: 1.758 [sec]
>  |
>  |       34.336621 usecs/op
>  |     4395.087500 usecs/op/cpu
>
>     38.08%  [kernel]       [k] queued_spin_lock_slowpath
>     10.81%  [kernel]       [k] smp_cfm_core_cond
>      3.01%  [kernel]       [k] update_sg_lb_stats
>      2.58%  [kernel]       [k] osq_lock
>      2.57%  [kernel]       [k] llist_reverse_order
>      1.45%  [kernel]       [k] find_next_bit
>      1.21%  [kernel]       [k] flush_tlb_func_common
>      1.01%  [kernel]       [k] arch_install_hw_breakpoint
>
> Showing that the time spent hashing keys has become insignificant.
>
> With the given benchmark parameters, that's an improvement of 12%
> compared with the old O(#cpus) version.
>
> And finally, using the less aggressive parameters from the preceding
> changes, we now observe:
>
>  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
>  |      Total time: 0.067 [sec]
>  |
>  |       35.292187 usecs/op
>  |     2258.700000 usecs/op/cpu
>
> Which is an improvement of 12% compared to without the histogram
> optimizations (baseline is 40 usecs/op). This is now on par with the
> theoretical ideal (constraints disabled), and only 12% slower than no
> breakpoints at all.
>
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> v3:
> * Fix typo "5 cases" -> "4 cases".
> * Update hw_breakpoint_is_used() to check tsk_pinned_all.
>
> v2:
> * New patch.
> ---
>  kernel/events/hw_breakpoint.c | 155 +++++++++++++++++++++++++++-------
>  1 file changed, 124 insertions(+), 31 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index a489f31fe147..7ef0e98d31e2 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -66,6 +66,8 @@ static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
>
>  /* Number of pinned CPU breakpoints globally. */
>  static struct bp_slots_histogram cpu_pinned[TYPE_MAX];
> +/* Number of pinned CPU-independent task breakpoints. */
> +static struct bp_slots_histogram tsk_pinned_all[TYPE_MAX];
>
>  /* Keep track of the breakpoints attached to tasks */
>  static struct rhltable task_bps_ht;
> @@ -200,6 +202,8 @@ static __init int init_breakpoint_slots(void)
>         for (i = 0; i < TYPE_MAX; i++) {
>                 if (!bp_slots_histogram_alloc(&cpu_pinned[i], i))
>                         goto err;
> +               if (!bp_slots_histogram_alloc(&tsk_pinned_all[i], i))
> +                       goto err;
>         }
>
>         return 0;
> @@ -210,8 +214,10 @@ static __init int init_breakpoint_slots(void)
>                 if (err_cpu == cpu)
>                         break;
>         }
> -       for (i = 0; i < TYPE_MAX; i++)
> +       for (i = 0; i < TYPE_MAX; i++) {
>                 bp_slots_histogram_free(&cpu_pinned[i]);
> +               bp_slots_histogram_free(&tsk_pinned_all[i]);
> +       }
>
>         return -ENOMEM;
>  }
> @@ -245,6 +251,26 @@ bp_slots_histogram_max(struct bp_slots_histogram *hist, enum bp_type_idx type)
>         return 0;
>  }
>
> +static int
> +bp_slots_histogram_max_merge(struct bp_slots_histogram *hist1, struct bp_slots_histogram *hist2,
> +                            enum bp_type_idx type)
> +{
> +       for (int i = hw_breakpoint_slots_cached(type) - 1; i >= 0; i--) {
> +               const int count1 = atomic_read(&hist1->count[i]);
> +               const int count2 = atomic_read(&hist2->count[i]);
> +
> +               /* Catch unexpected writers; we want a stable snapshot. */
> +               ASSERT_EXCLUSIVE_WRITER(hist1->count[i]);
> +               ASSERT_EXCLUSIVE_WRITER(hist2->count[i]);
> +               if (count1 + count2 > 0)
> +                       return i + 1;
> +               WARN(count1 < 0, "inconsistent breakpoint slots histogram");
> +               WARN(count2 < 0, "inconsistent breakpoint slots histogram");
> +       }
> +
> +       return 0;
> +}
> +
>  #ifndef hw_breakpoint_weight
>  static inline int hw_breakpoint_weight(struct perf_event *bp)
>  {
> @@ -273,7 +299,7 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
>          * toggle_bp_task_slot() to tsk_pinned, and we get a stable snapshot.
>          */
>         lockdep_assert_held_write(&bp_cpuinfo_sem);
> -       return bp_slots_histogram_max(tsk_pinned, type);
> +       return bp_slots_histogram_max_merge(tsk_pinned, &tsk_pinned_all[type], type);
>  }
>
>  /*
> @@ -366,40 +392,22 @@ max_bp_pinned_slots(struct perf_event *bp, enum bp_type_idx type)
>         return pinned_slots;
>  }
>
> -/*
> - * Add a pinned breakpoint for the given task in our constraint table
> - */
> -static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
> -                               enum bp_type_idx type, int weight)
> -{
> -       struct bp_slots_histogram *tsk_pinned = &get_bp_info(cpu, type)->tsk_pinned;
> -
> -       /*
> -        * If bp->hw.target, tsk_pinned is only modified, but not used
> -        * otherwise. We can permit concurrent updates as long as there are no
> -        * other uses: having acquired bp_cpuinfo_sem as a reader allows
> -        * concurrent updates here. Uses of tsk_pinned will require acquiring
> -        * bp_cpuinfo_sem as a writer to stabilize tsk_pinned's value.
> -        */
> -       lockdep_assert_held_read(&bp_cpuinfo_sem);
> -       bp_slots_histogram_add(tsk_pinned, task_bp_pinned(cpu, bp, type), weight);
> -}
> -
>  /*
>   * Add/remove the given breakpoint in our constraint table
>   */
>  static int
> -toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> -              int weight)
> +toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type, int weight)
>  {
> -       const struct cpumask *cpumask = cpumask_of_bp(bp);
> -       int cpu;
> +       int cpu, next_tsk_pinned;
>
>         if (!enable)
>                 weight = -weight;
>
> -       /* Pinned counter cpu profiling */
>         if (!bp->hw.target) {
> +               /*
> +                * Update the pinned CPU slots, in per-CPU bp_cpuinfo and in the
> +                * global histogram.
> +                */
>                 struct bp_cpuinfo *info = get_bp_info(bp->cpu, type);
>
>                 lockdep_assert_held_write(&bp_cpuinfo_sem);
> @@ -408,9 +416,91 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
>                 return 0;
>         }
>
> -       /* Pinned counter task profiling */
> -       for_each_cpu(cpu, cpumask)
> -               toggle_bp_task_slot(bp, cpu, type, weight);
> +       /*
> +        * If bp->hw.target, tsk_pinned is only modified, but not used
> +        * otherwise. We can permit concurrent updates as long as there are no
> +        * other uses: having acquired bp_cpuinfo_sem as a reader allows
> +        * concurrent updates here. Uses of tsk_pinned will require acquiring
> +        * bp_cpuinfo_sem as a writer to stabilize tsk_pinned's value.
> +        */
> +       lockdep_assert_held_read(&bp_cpuinfo_sem);
> +
> +       /*
> +        * Update the pinned task slots, in per-CPU bp_cpuinfo and in the global
> +        * histogram. We need to take care of 4 cases:
> +        *
> +        *  1. This breakpoint targets all CPUs (cpu < 0), and there may only
> +        *     exist other task breakpoints targeting all CPUs. In this case we
> +        *     can simply update the global slots histogram.
> +        *
> +        *  2. This breakpoint targets a specific CPU (cpu >= 0), but there may
> +        *     only exist other task breakpoints targeting all CPUs.
> +        *
> +        *     a. On enable: remove the existing breakpoints from the global
> +        *        slots histogram and use the per-CPU histogram.
> +        *
> +        *     b. On disable: re-insert the existing breakpoints into the global
> +        *        slots histogram and remove from per-CPU histogram.
> +        *
> +        *  3. Some other existing task breakpoints target specific CPUs. Only
> +        *     update the per-CPU slots histogram.
> +        */
> +
> +       if (!enable) {
> +               /*
> +                * Remove before updating histograms so we can determine if this
> +                * was the last task breakpoint for a specific CPU.
> +                */
> +               int ret = rhltable_remove(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> +
> +               if (ret)
> +                       return ret;
> +       }
> +       /*
> +        * Note: If !enable, next_tsk_pinned will not count the to-be-removed breakpoint.
> +        */
> +       next_tsk_pinned = task_bp_pinned(-1, bp, type);
> +
> +       if (next_tsk_pinned >= 0) {
> +               if (bp->cpu < 0) { /* Case 1: fast path */
> +                       if (!enable)
> +                               next_tsk_pinned += hw_breakpoint_weight(bp);
> +                       bp_slots_histogram_add(&tsk_pinned_all[type], next_tsk_pinned, weight);
> +               } else if (enable) { /* Case 2.a: slow path */
> +                       /* Add existing to per-CPU histograms. */
> +                       for_each_possible_cpu(cpu) {
> +                               bp_slots_histogram_add(&get_bp_info(cpu, type)->tsk_pinned,
> +                                                      0, next_tsk_pinned);
> +                       }
> +                       /* Add this first CPU-pinned task breakpoint. */
> +                       bp_slots_histogram_add(&get_bp_info(bp->cpu, type)->tsk_pinned,
> +                                              next_tsk_pinned, weight);
> +                       /* Rebalance global task pinned histogram. */
> +                       bp_slots_histogram_add(&tsk_pinned_all[type], next_tsk_pinned,
> +                                              -next_tsk_pinned);
> +               } else { /* Case 2.b: slow path */
> +                       /* Remove this last CPU-pinned task breakpoint. */
> +                       bp_slots_histogram_add(&get_bp_info(bp->cpu, type)->tsk_pinned,
> +                                              next_tsk_pinned + hw_breakpoint_weight(bp), weight);
> +                       /* Remove all from per-CPU histograms. */
> +                       for_each_possible_cpu(cpu) {
> +                               bp_slots_histogram_add(&get_bp_info(cpu, type)->tsk_pinned,
> +                                                      next_tsk_pinned, -next_tsk_pinned);
> +                       }
> +                       /* Rebalance global task pinned histogram. */
> +                       bp_slots_histogram_add(&tsk_pinned_all[type], 0, next_tsk_pinned);
> +               }
> +       } else { /* Case 3: slow path */
> +               const struct cpumask *cpumask = cpumask_of_bp(bp);
> +
> +               for_each_cpu(cpu, cpumask) {
> +                       next_tsk_pinned = task_bp_pinned(cpu, bp, type);
> +                       if (!enable)
> +                               next_tsk_pinned += hw_breakpoint_weight(bp);
> +                       bp_slots_histogram_add(&get_bp_info(cpu, type)->tsk_pinned,
> +                                              next_tsk_pinned, weight);
> +               }
> +       }
>
>         /*
>          * Readers want a stable snapshot of the per-task breakpoint list.
> @@ -419,8 +509,8 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
>
>         if (enable)
>                 return rhltable_insert(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> -       else
> -               return rhltable_remove(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> +
> +       return 0;
>  }
>
>  __weak int arch_reserve_bp_slot(struct perf_event *bp)
> @@ -850,6 +940,9 @@ bool hw_breakpoint_is_used(void)
>                          */
>                         if (WARN_ON(atomic_read(&cpu_pinned[type].count[slot])))
>                                 return true;
> +
> +                       if (atomic_read(&tsk_pinned_all[type].count[slot]))
> +                               return true;
>                 }
>         }
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
