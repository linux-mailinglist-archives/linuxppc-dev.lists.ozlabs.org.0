Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB857BAAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:43:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp0NJ1sW6z3dB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iXpffLiJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iXpffLiJ;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp0Mh4BD1z2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:42:56 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so1544371wmo.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iA6H9FbTpi/aYLA06konbtgAlr2/KT50OkDviEcMLbs=;
        b=iXpffLiJVtdCttiGIiGR476FbgEvncJynZYRRFaKtNnC14Ee9o1jfns2LKphXmangZ
         EWnyeyPG/xn69I0jb4fcDYQ6YQvz4wlMQ4CzzCaEJdcvlwz6pi2mc6h81eG90tgr88lz
         /oPzNIOkMX0oapWfl9thXpEQWQRklgF9vE94O74BEc4lqET8GwMOe5xIspX/SG1G81f/
         7XfOoCBv/Rvt6NXKRXaTE97WV7eUjlcGKl4Nu7YBbXjeSGJaay5eSqAeGCbTSeW5x7YL
         3Gv7tYShmCX8xv9E6zpZgj/gN9gyStIsWLrBGWi1UigHS002MJ7/oglO2c7XTMT4Ur5M
         /s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iA6H9FbTpi/aYLA06konbtgAlr2/KT50OkDviEcMLbs=;
        b=ldcZls9nXTuV5mh3FEKY6d9YwqRlXSm5Ktaw0DTnFyO77kkaYWNEW39pl+VOqk7BVg
         RzF3njuozfe+1bX9SjuMabM1vitE34UwhWpXJniWoe/ZtWhoQgXE7KJbMDgy8birqzJ6
         lmzxxiJEwIEIla5OzNqQNmbfrt7zUxqERKf3WW9NPkOrtDyqt/3ESwlL4g+bNCySQ21t
         tEKZDcZAwf3BWwo67TC3ttpvVNIgyaRTapk5+v5TJ04PuxNc8VGLesI4qFcSvWLLKWcM
         BPUa+oixUjzfELmJofz58muedQYS/7Sjb1FEIMI3BqWELsgN/mEGnE9JNvh0kgcPAz5N
         a6pg==
X-Gm-Message-State: AJIora+pdZHYW11zKp6UaDTrGLY/7HOBz8uOym/qJEWrSmGMmym06vK9
	XVG6oEvJIDDFtZjmZaLdrySzBiv/olve8doyfIM/7g==
X-Google-Smtp-Source: AGRyM1tC/2QEwTNFQazHf5jpM6MANjmu2PBS3k8EZUWqAOG0aiuCYQuwyfqeLE68lKXUayZ2hy32LTejKodIDCILDK0=
X-Received: by 2002:a7b:c8d3:0:b0:3a2:fe0d:ba2e with SMTP id
 f19-20020a7bc8d3000000b003a2fe0dba2emr4552680wml.115.1658331771692; Wed, 20
 Jul 2022 08:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-14-elver@google.com>
In-Reply-To: <20220704150514.48816-14-elver@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:42:39 -0700
Message-ID: <CAP-5=fX3Ba8pOrnyehzJPfDBMEb-qf0ybj40na0nb4k_KyzeQA@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] perf/hw_breakpoint: Optimize max_bp_pinned_slots()
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
> Running the perf benchmark with (note: more aggressive parameters vs.
> preceding changes, but same 256 CPUs host):
>
>  | $> perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 100 threads with 4 breakpoints and 128 parallelism
>  |      Total time: 1.989 [sec]
>  |
>  |       38.854160 usecs/op
>  |     4973.332500 usecs/op/cpu
>
>     20.43%  [kernel]       [k] queued_spin_lock_slowpath
>     18.75%  [kernel]       [k] osq_lock
>     16.98%  [kernel]       [k] rhashtable_jhash2
>      8.34%  [kernel]       [k] task_bp_pinned
>      4.23%  [kernel]       [k] smp_cfm_core_cond
>      3.65%  [kernel]       [k] bcmp
>      2.83%  [kernel]       [k] toggle_bp_slot
>      1.87%  [kernel]       [k] find_next_bit
>      1.49%  [kernel]       [k] __reserve_bp_slot
>
> We can see that a majority of the time is now spent hashing task
> pointers to index into task_bps_ht in task_bp_pinned().
>
> Obtaining the max_bp_pinned_slots() for CPU-independent task targets
> currently is O(#cpus), and calls task_bp_pinned() for each CPU, even if
> the result of task_bp_pinned() is CPU-independent.
>
> The loop in max_bp_pinned_slots() wants to compute the maximum slots
> across all CPUs. If task_bp_pinned() is CPU-independent, we can do so by
> obtaining the max slots across all CPUs and adding task_bp_pinned().
>
> To do so in O(1), use a bp_slots_histogram for CPU-pinned slots.
>
> After this optimization:
>
>  | $> perf bench -r 100 breakpoint thread -b 4 -p 128 -t 512
>  | # Running 'breakpoint/thread' benchmark:
>  | # Created/joined 100 threads with 4 breakpoints and 128 parallelism
>  |      Total time: 1.930 [sec]
>  |
>  |       37.697832 usecs/op
>  |     4825.322500 usecs/op/cpu
>
>     19.13%  [kernel]       [k] queued_spin_lock_slowpath
>     18.21%  [kernel]       [k] rhashtable_jhash2
>     15.46%  [kernel]       [k] osq_lock
>      6.27%  [kernel]       [k] toggle_bp_slot
>      5.91%  [kernel]       [k] task_bp_pinned
>      5.05%  [kernel]       [k] smp_cfm_core_cond
>      1.78%  [kernel]       [k] update_sg_lb_stats
>      1.36%  [kernel]       [k] llist_reverse_order
>      1.34%  [kernel]       [k] find_next_bit
>      1.19%  [kernel]       [k] bcmp
>
> Suggesting that time spent in task_bp_pinned() has been reduced.
> However, we're still hashing too much, which will be addressed in the
> subsequent change.
>
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> v3:
> * Update hw_breakpoint_is_used() to include global cpu_pinned.
>
> v2:
> * New patch.
> ---
>  kernel/events/hw_breakpoint.c | 57 ++++++++++++++++++++++++++++++++---
>  1 file changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> index 03ebecf048c0..a489f31fe147 100644
> --- a/kernel/events/hw_breakpoint.c
> +++ b/kernel/events/hw_breakpoint.c
> @@ -64,6 +64,9 @@ static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
>         return per_cpu_ptr(bp_cpuinfo + type, cpu);
>  }
>
> +/* Number of pinned CPU breakpoints globally. */
> +static struct bp_slots_histogram cpu_pinned[TYPE_MAX];
> +
>  /* Keep track of the breakpoints attached to tasks */
>  static struct rhltable task_bps_ht;
>  static const struct rhashtable_params task_bps_ht_params = {
> @@ -194,6 +197,10 @@ static __init int init_breakpoint_slots(void)
>                                 goto err;
>                 }
>         }
> +       for (i = 0; i < TYPE_MAX; i++) {
> +               if (!bp_slots_histogram_alloc(&cpu_pinned[i], i))
> +                       goto err;
> +       }
>
>         return 0;
>  err:
> @@ -203,6 +210,8 @@ static __init int init_breakpoint_slots(void)
>                 if (err_cpu == cpu)
>                         break;
>         }
> +       for (i = 0; i < TYPE_MAX; i++)
> +               bp_slots_histogram_free(&cpu_pinned[i]);
>
>         return -ENOMEM;
>  }
> @@ -270,6 +279,9 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
>  /*
>   * Count the number of breakpoints of the same type and same task.
>   * The given event must be not on the list.
> + *
> + * If @cpu is -1, but the result of task_bp_pinned() is not CPU-independent,
> + * returns a negative value.
>   */
>  static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
>  {
> @@ -288,9 +300,18 @@ static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
>                 goto out;
>
>         rhl_for_each_entry_rcu(iter, pos, head, hw.bp_list) {
> -               if (find_slot_idx(iter->attr.bp_type) == type &&
> -                   (iter->cpu < 0 || cpu == iter->cpu))
> -                       count += hw_breakpoint_weight(iter);
> +               if (find_slot_idx(iter->attr.bp_type) != type)
> +                       continue;
> +
> +               if (iter->cpu >= 0) {
> +                       if (cpu == -1) {
> +                               count = -1;
> +                               goto out;
> +                       } else if (cpu != iter->cpu)
> +                               continue;
> +               }
> +
> +               count += hw_breakpoint_weight(iter);
>         }
>
>  out:
> @@ -316,6 +337,19 @@ max_bp_pinned_slots(struct perf_event *bp, enum bp_type_idx type)
>         int pinned_slots = 0;
>         int cpu;
>
> +       if (bp->hw.target && bp->cpu < 0) {
> +               int max_pinned = task_bp_pinned(-1, bp, type);
> +
> +               if (max_pinned >= 0) {
> +                       /*
> +                        * Fast path: task_bp_pinned() is CPU-independent and
> +                        * returns the same value for any CPU.
> +                        */
> +                       max_pinned += bp_slots_histogram_max(&cpu_pinned[type], type);
> +                       return max_pinned;
> +               }
> +       }
> +
>         for_each_cpu(cpu, cpumask) {
>                 struct bp_cpuinfo *info = get_bp_info(cpu, type);
>                 int nr;
> @@ -366,8 +400,11 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
>
>         /* Pinned counter cpu profiling */
>         if (!bp->hw.target) {
> +               struct bp_cpuinfo *info = get_bp_info(bp->cpu, type);
> +
>                 lockdep_assert_held_write(&bp_cpuinfo_sem);
> -               get_bp_info(bp->cpu, type)->cpu_pinned += weight;
> +               bp_slots_histogram_add(&cpu_pinned[type], info->cpu_pinned, weight);
> +               info->cpu_pinned += weight;
>                 return 0;
>         }
>
> @@ -804,6 +841,18 @@ bool hw_breakpoint_is_used(void)
>                 }
>         }
>
> +       for (int type = 0; type < TYPE_MAX; ++type) {
> +               for (int slot = 0; slot < hw_breakpoint_slots_cached(type); ++slot) {
> +                       /*
> +                        * Warn, because if there are CPU pinned counters,
> +                        * should never get here; bp_cpuinfo::cpu_pinned should
> +                        * be consistent with the global cpu_pinned histogram.
> +                        */
> +                       if (WARN_ON(atomic_read(&cpu_pinned[type].count[slot])))
> +                               return true;
> +               }
> +       }
> +
>         return false;
>  }
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
