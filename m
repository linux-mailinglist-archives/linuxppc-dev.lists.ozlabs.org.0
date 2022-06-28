Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2824055E58C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSL40RSWz3f1R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hr+LOJOC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hr+LOJOC;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSKQ3jbQz3c1b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:54:02 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id v185so13119455ybe.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vsLZ4itLb8yCme9zL9SXTWJXCTaMaHUvxCRr4pVmzPo=;
        b=hr+LOJOCejSbhs13LtB4ad2iVHUb+RAG9UvlGywImgCuWnbv9Uz0CuXpr7kdL2EXyM
         Zl3qZVecs/jCPbL36y5mfL0HhG/kKAAg5CMELOsO8zieEy+pumtY6i3i9lUzK6EDUaJc
         ij34SuQoLj/NiOxDwRIPbpShAuux9rUl4DMeRDPsX6BzEAEbfgiBkZR8fpdCYwEniTFB
         rUqH8uIe91EnJHMjEePoJ34++jQzFYkaVhwsw6SpYElF68QAdJJOFJ35ZmrerpdmqSoc
         KvqV3wMzW9sxWtFKFxX5f0P0Jvv4ZBX10XEVhIHB536OA3Q6fXumnmTBqPHUsHo1ZiVe
         4+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vsLZ4itLb8yCme9zL9SXTWJXCTaMaHUvxCRr4pVmzPo=;
        b=hEAWQ3tvVA9aTUKKeExsbF1iq7ncR7H+TQ9xrFG13umYbNnRZ8psu6hEBa+MamvAVN
         7y6LYD/eJX6YFcTlTtbBlHtZOOXpGOlohmC+2ihuUl0Y0gvkb1AQ3uIfRjRUSNdii8Ev
         Yl9A6cHT2Lt5q2EP04mVl5GiaNUBxMeeyJMpQwtfSHhX4bHy4veK03MNgbUYfNa2sM01
         PQTo4uEN7QYfw/eBtvTCV28xSw+rnbbnogNo/jcP8/XdtzkLNO3TBPN/L/kkzGTEOawa
         QIpp5wxEh5mkgOmmYSMiC2Zl3JFkC+YAz4B/Ky0VCAa8UpXuqOI5nLIbzhlED8k5pOML
         ZM8Q==
X-Gm-Message-State: AJIora8YPH4NNQM69er5Et4M8398kwx0RGbv7q7aOqE08W+jnmivOu6q
	1SbTKCYYLgkYvVxdEN5JlcM3lzUaDkRSn5IcNCNyxw==
X-Google-Smtp-Source: AGRyM1vqDPdKqBHAN5BWgtuoqgS2YkXMiHwIjI7rhq0LUMqvW//SUblW3opNkhuDW9IWNxEP1SI0g+pLXiP+fSqQZuA=
X-Received: by 2002:a5b:74e:0:b0:66c:df8d:12f6 with SMTP id
 s14-20020a5b074e000000b0066cdf8d12f6mr9546552ybq.609.1656428038960; Tue, 28
 Jun 2022 07:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-4-elver@google.com>
 <CACT4Y+bh06ZF5s4Mfq+CJ8RJ+Fm41NeXt=C8Kkx11t9hgABpYQ@mail.gmail.com>
In-Reply-To: <CACT4Y+bh06ZF5s4Mfq+CJ8RJ+Fm41NeXt=C8Kkx11t9hgABpYQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 28 Jun 2022 16:53:22 +0200
Message-ID: <CANpmjNOT=npm9Bu9QGNO=SgCJVB2fr8ojO4-u-Ffgw4gmRuSfw@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] perf/hw_breakpoint: Optimize list of per-task breakpoints
To: Dmitry Vyukov <dvyukov@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 15:08, Dmitry Vyukov <dvyukov@google.com> wrote:
>
>  On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
> >
> > On a machine with 256 CPUs, running the recently added perf breakpoint
> > benchmark results in:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  | # Running 'breakpoint/thread' benchmark:
> >  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
> >  |      Total time: 236.418 [sec]
> >  |
> >  |   123134.794271 usecs/op
> >  |  7880626.833333 usecs/op/cpu
> >
> > The benchmark tests inherited breakpoint perf events across many
> > threads.
> >
> > Looking at a perf profile, we can see that the majority of the time is
> > spent in various hw_breakpoint.c functions, which execute within the
> > 'nr_bp_mutex' critical sections which then results in contention on that
> > mutex as well:
> >
> >     37.27%  [kernel]       [k] osq_lock
> >     34.92%  [kernel]       [k] mutex_spin_on_owner
> >     12.15%  [kernel]       [k] toggle_bp_slot
> >     11.90%  [kernel]       [k] __reserve_bp_slot
> >
> > The culprit here is task_bp_pinned(), which has a runtime complexity of
> > O(#tasks) due to storing all task breakpoints in the same list and
> > iterating through that list looking for a matching task. Clearly, this
> > does not scale to thousands of tasks.
> >
> > Instead, make use of the "rhashtable" variant "rhltable" which stores
> > multiple items with the same key in a list. This results in average
> > runtime complexity of O(1) for task_bp_pinned().
> >
> > With the optimization, the benchmark shows:
> >
> >  | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
> >  | # Running 'breakpoint/thread' benchmark:
> >  | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
> >  |      Total time: 0.208 [sec]
> >  |
> >  |      108.422396 usecs/op
> >  |     6939.033333 usecs/op/cpu
> >
> > On this particular setup that's a speedup of ~1135x.
> >
> > While one option would be to make task_struct a breakpoint list node,
> > this would only further bloat task_struct for infrequently used data.
> > Furthermore, after all optimizations in this series, there's no evidence
> > it would result in better performance: later optimizations make the time
> > spent looking up entries in the hash table negligible (we'll reach the
> > theoretical ideal performance i.e. no constraints).
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Commit message tweaks.
> > ---
> >  include/linux/perf_event.h    |  3 +-
> >  kernel/events/hw_breakpoint.c | 56 ++++++++++++++++++++++-------------
> >  2 files changed, 37 insertions(+), 22 deletions(-)
> >
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 01231f1d976c..e27360436dc6 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -36,6 +36,7 @@ struct perf_guest_info_callbacks {
> >  };
> >
> >  #ifdef CONFIG_HAVE_HW_BREAKPOINT
> > +#include <linux/rhashtable-types.h>
> >  #include <asm/hw_breakpoint.h>
> >  #endif
> >
> > @@ -178,7 +179,7 @@ struct hw_perf_event {
> >                          * creation and event initalization.
> >                          */
> >                         struct arch_hw_breakpoint       info;
> > -                       struct list_head                bp_list;
> > +                       struct rhlist_head              bp_list;
> >                 };
> >  #endif
> >                 struct { /* amd_iommu */
> > diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> > index 1b013968b395..add1b9c59631 100644
> > --- a/kernel/events/hw_breakpoint.c
> > +++ b/kernel/events/hw_breakpoint.c
> > @@ -26,10 +26,10 @@
> >  #include <linux/irqflags.h>
> >  #include <linux/kdebug.h>
> >  #include <linux/kernel.h>
> > -#include <linux/list.h>
> >  #include <linux/mutex.h>
> >  #include <linux/notifier.h>
> >  #include <linux/percpu.h>
> > +#include <linux/rhashtable.h>
> >  #include <linux/sched.h>
> >  #include <linux/slab.h>
> >
> > @@ -54,7 +54,13 @@ static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
> >  }
> >
> >  /* Keep track of the breakpoints attached to tasks */
> > -static LIST_HEAD(bp_task_head);
> > +static struct rhltable task_bps_ht;
> > +static const struct rhashtable_params task_bps_ht_params = {
> > +       .head_offset = offsetof(struct hw_perf_event, bp_list),
> > +       .key_offset = offsetof(struct hw_perf_event, target),
> > +       .key_len = sizeof_field(struct hw_perf_event, target),
> > +       .automatic_shrinking = true,
> > +};
> >
> >  static int constraints_initialized;
> >
> > @@ -103,17 +109,23 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
> >   */
> >  static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
> >  {
> > -       struct task_struct *tsk = bp->hw.target;
> > +       struct rhlist_head *head, *pos;
> >         struct perf_event *iter;
> >         int count = 0;
> >
> > -       list_for_each_entry(iter, &bp_task_head, hw.bp_list) {
> > -               if (iter->hw.target == tsk &&
> > -                   find_slot_idx(iter->attr.bp_type) == type &&
> > +       rcu_read_lock();
> > +       head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
> > +       if (!head)
> > +               goto out;
> > +
> > +       rhl_for_each_entry_rcu(iter, pos, head, hw.bp_list) {
> > +               if (find_slot_idx(iter->attr.bp_type) == type &&
> >                     (iter->cpu < 0 || cpu == iter->cpu))
> >                         count += hw_breakpoint_weight(iter);
> >         }
> >
> > +out:
> > +       rcu_read_unlock();
> >         return count;
> >  }
> >
> > @@ -186,7 +198,7 @@ static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
> >  /*
> >   * Add/remove the given breakpoint in our constraint table
> >   */
> > -static void
> > +static int
> >  toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> >                int weight)
> >  {
> > @@ -199,7 +211,7 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> >         /* Pinned counter cpu profiling */
> >         if (!bp->hw.target) {
> >                 get_bp_info(bp->cpu, type)->cpu_pinned += weight;
> > -               return;
> > +               return 0;
> >         }
> >
> >         /* Pinned counter task profiling */
> > @@ -207,9 +219,9 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
> >                 toggle_bp_task_slot(bp, cpu, type, weight);
> >
> >         if (enable)
> > -               list_add_tail(&bp->hw.bp_list, &bp_task_head);
> > +               return rhltable_insert(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> >         else
> > -               list_del(&bp->hw.bp_list);
> > +               return rhltable_remove(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
> >  }
> >
> >  __weak int arch_reserve_bp_slot(struct perf_event *bp)
> > @@ -307,9 +319,7 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
> >         if (ret)
> >                 return ret;
> >
> > -       toggle_bp_slot(bp, true, type, weight);
> > -
> > -       return 0;
> > +       return toggle_bp_slot(bp, true, type, weight);
> >  }
> >
> >  int reserve_bp_slot(struct perf_event *bp)
> > @@ -334,7 +344,7 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
> >
> >         type = find_slot_idx(bp_type);
> >         weight = hw_breakpoint_weight(bp);
> > -       toggle_bp_slot(bp, false, type, weight);
> > +       WARN_ON(toggle_bp_slot(bp, false, type, weight));
> >  }
> >
> >  void release_bp_slot(struct perf_event *bp)
> > @@ -678,7 +688,7 @@ static struct pmu perf_breakpoint = {
> >  int __init init_hw_breakpoint(void)
> >  {
> >         int cpu, err_cpu;
> > -       int i;
> > +       int i, ret;
> >
> >         for (i = 0; i < TYPE_MAX; i++)
> >                 nr_slots[i] = hw_breakpoint_slots(i);
> > @@ -689,18 +699,24 @@ int __init init_hw_breakpoint(void)
> >
> >                         info->tsk_pinned = kcalloc(nr_slots[i], sizeof(int),
> >                                                         GFP_KERNEL);
> > -                       if (!info->tsk_pinned)
> > -                               goto err_alloc;
> > +                       if (!info->tsk_pinned) {
> > +                               ret = -ENOMEM;
> > +                               goto err;
> > +                       }
> >                 }
> >         }
> >
> > +       ret = rhltable_init(&task_bps_ht, &task_bps_ht_params);
> > +       if (ret)
> > +               goto err;
> > +
> >         constraints_initialized = 1;
> >
> >         perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
> >
> >         return register_die_notifier(&hw_breakpoint_exceptions_nb);
>
> It seems there is a latent bug here:
> if register_die_notifier() fails we also need to execute the err: label code.

I think we should ignore it, because it's just a notifier when the
kernel dies. I'd rather have working breakpoints (which we have if we
made it to this point) when the kernel is live, and sacrifice some bad
behaviour when the kernel dies.

> Otherwise the patch looks good.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Thanks,
-- Marco
