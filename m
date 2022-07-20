Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883AA57B97F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 17:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnzwq4QMDz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 01:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q/XN4+mo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q/XN4+mo;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnzw81RPMz304x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 01:22:31 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id z13so7035112wro.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10mCB1p9QXZ5hMNLpf9Atm/lE/ONgYcPbZJGAy+BbTE=;
        b=q/XN4+moWU6pS26pJaG9um1OtEqOT7theGT9T2njWXp9STAdsitYpJ5YzAGp+8X285
         vjOcfnmzs6G8P1zgLbACgfOQurgR041A8KRww5yLazluRoQu2p1l3/VL69wLq+VAAJPc
         pWstZagMyvaVg6dKgXTVT9iC8iwgVNHhD5bwjtGjOH/BKZPfIC6wcll9KuNBL+j6uQdB
         YjpkPX2fKO0HPXMHQxcNQMmDSBcvjZ0kPY2gbB+LEb3y6nmPlBJ0Ki/hADZGlHEvnM/V
         sYZXVCx3MbGXBUXvDnWMV9Dpz14gPd/kKVuCZaQ7RSTBO/V/6NKcygwAnzWOMqAmXGuP
         LVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10mCB1p9QXZ5hMNLpf9Atm/lE/ONgYcPbZJGAy+BbTE=;
        b=GLRq8kVFLiE16lkb9zg8dzl6Q8hOwjx7xwzoPNGB3rAnk/Rmiv7JeYvGoVG5bH8Npu
         ErBHcIy1zRrfPRP1+OK1QEZO1MAqZ8UdzbWBxrQarpVMSiOVt9NXRY7/rErrsoWDRODJ
         dPTvAuOujhS4wTcIjR3Kq0kUyCQpFXV4xjT6pkXJICUYLg2f5fmjw5tXOD39bG2+gi/m
         EQ79bTSlXKpD85FE63ZuBOnYa0Y9Oa/wu1HWGEQw50XIMgWM1HSdIo2dhqIh4FJZ8Tuz
         TX/8EOp9AVdvbUoyaE8vmywO5zlCIzOJDHVrup0UkssKSIPhdinX9B76jbnhbQNGjiXr
         2Zwg==
X-Gm-Message-State: AJIora/Pm11qkxsX6qU7sdIX5isBXw9UtGZqXMoDCvCo1UMgINZOWI9M
	mmEaajBTpY2GgthjEtnKy4FvyVTGDhnfmuCTnUa1DQ==
X-Google-Smtp-Source: AGRyM1sZyA+O8GQAnPRNoGyzb+rUrnlyhsCr7vd7kTawL1/xfzhmiL/vjkD/Kiot4p8KNi5XZrNEnQyye57N26vhykc=
X-Received: by 2002:a5d:4d8e:0:b0:21d:68d4:56eb with SMTP id
 b14-20020a5d4d8e000000b0021d68d456ebmr30086604wru.40.1658330541254; Wed, 20
 Jul 2022 08:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-2-elver@google.com>
 <CACT4Y+aA7QkAsufv6EMQ1O8mZaVd-eNOqRrx2a7qvPR4Tt=izA@mail.gmail.com>
In-Reply-To: <CACT4Y+aA7QkAsufv6EMQ1O8mZaVd-eNOqRrx2a7qvPR4Tt=izA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 20 Jul 2022 08:22:08 -0700
Message-ID: <CAP-5=fWKM09_cgOjEyDjLrs5KgvXv1vLbyBgTFAEV0Sr3f_3YA@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 4, 2022 at 8:11 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, 4 Jul 2022 at 17:06, Marco Elver <elver@google.com> wrote:
> >
> > Add KUnit test for hw_breakpoint constraints accounting, with various
> > interesting mixes of breakpoint targets (some care was taken to catch
> > interesting corner cases via bug-injection).
> >
> > The test cannot be built as a module because it requires access to
> > hw_breakpoint_slots(), which is not inlinable or exported on all
> > architectures.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > ---
> > v3:
> > * Don't use raw_smp_processor_id().
> >
> > v2:
> > * New patch.
> > ---
> >  kernel/events/Makefile             |   1 +
> >  kernel/events/hw_breakpoint_test.c | 323 +++++++++++++++++++++++++++++
> >  lib/Kconfig.debug                  |  10 +
> >  3 files changed, 334 insertions(+)
> >  create mode 100644 kernel/events/hw_breakpoint_test.c
> >
> > diff --git a/kernel/events/Makefile b/kernel/events/Makefile
> > index 8591c180b52b..91a62f566743 100644
> > --- a/kernel/events/Makefile
> > +++ b/kernel/events/Makefile
> > @@ -2,4 +2,5 @@
> >  obj-y := core.o ring_buffer.o callchain.o
> >
> >  obj-$(CONFIG_HAVE_HW_BREAKPOINT) += hw_breakpoint.o
> > +obj-$(CONFIG_HW_BREAKPOINT_KUNIT_TEST) += hw_breakpoint_test.o
> >  obj-$(CONFIG_UPROBES) += uprobes.o
> > diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
> > new file mode 100644
> > index 000000000000..433c5c45e2a5
> > --- /dev/null
> > +++ b/kernel/events/hw_breakpoint_test.c
> > @@ -0,0 +1,323 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for hw_breakpoint constraints accounting logic.
> > + *
> > + * Copyright (C) 2022, Google LLC.
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/hw_breakpoint.h>
> > +#include <linux/kthread.h>
> > +#include <linux/perf_event.h>
> > +#include <asm/hw_breakpoint.h>
> > +
> > +#define TEST_REQUIRES_BP_SLOTS(test, slots)                                            \
> > +       do {                                                                            \
> > +               if ((slots) > get_test_bp_slots()) {                                    \
> > +                       kunit_skip((test), "Requires breakpoint slots: %d > %d", slots, \
> > +                                  get_test_bp_slots());                                \
> > +               }                                                                       \
> > +       } while (0)
> > +
> > +#define TEST_EXPECT_NOSPC(expr) KUNIT_EXPECT_EQ(test, -ENOSPC, PTR_ERR(expr))
> > +
> > +#define MAX_TEST_BREAKPOINTS 512
> > +
> > +static char break_vars[MAX_TEST_BREAKPOINTS];
> > +static struct perf_event *test_bps[MAX_TEST_BREAKPOINTS];
> > +static struct task_struct *__other_task;
> > +
> > +static struct perf_event *register_test_bp(int cpu, struct task_struct *tsk, int idx)
> > +{
> > +       struct perf_event_attr attr = {};
> > +
> > +       if (WARN_ON(idx < 0 || idx >= MAX_TEST_BREAKPOINTS))
> > +               return NULL;
> > +
> > +       hw_breakpoint_init(&attr);
> > +       attr.bp_addr = (unsigned long)&break_vars[idx];
> > +       attr.bp_len = HW_BREAKPOINT_LEN_1;
> > +       attr.bp_type = HW_BREAKPOINT_RW;
> > +       return perf_event_create_kernel_counter(&attr, cpu, tsk, NULL, NULL);
> > +}
> > +
> > +static void unregister_test_bp(struct perf_event **bp)
> > +{
> > +       if (WARN_ON(IS_ERR(*bp)))
> > +               return;
> > +       if (WARN_ON(!*bp))
> > +               return;
> > +       unregister_hw_breakpoint(*bp);
> > +       *bp = NULL;
> > +}
> > +
> > +static int get_test_bp_slots(void)
> > +{
> > +       static int slots;
> > +
> > +       if (!slots)
> > +               slots = hw_breakpoint_slots(TYPE_DATA);
> > +
> > +       return slots;
> > +}
> > +
> > +static void fill_one_bp_slot(struct kunit *test, int *id, int cpu, struct task_struct *tsk)
> > +{
> > +       struct perf_event *bp = register_test_bp(cpu, tsk, *id);
> > +
> > +       KUNIT_ASSERT_NOT_NULL(test, bp);
> > +       KUNIT_ASSERT_FALSE(test, IS_ERR(bp));
> > +       KUNIT_ASSERT_NULL(test, test_bps[*id]);
> > +       test_bps[(*id)++] = bp;
> > +}
> > +
> > +/*
> > + * Fills up the given @cpu/@tsk with breakpoints, only leaving @skip slots free.
> > + *
> > + * Returns true if this can be called again, continuing at @id.
> > + */
> > +static bool fill_bp_slots(struct kunit *test, int *id, int cpu, struct task_struct *tsk, int skip)
> > +{
> > +       for (int i = 0; i < get_test_bp_slots() - skip; ++i)
> > +               fill_one_bp_slot(test, id, cpu, tsk);
> > +
> > +       return *id + get_test_bp_slots() <= MAX_TEST_BREAKPOINTS;
> > +}
> > +
> > +static int dummy_kthread(void *arg)
> > +{
> > +       return 0;
> > +}
> > +
> > +static struct task_struct *get_other_task(struct kunit *test)
> > +{
> > +       struct task_struct *tsk;
> > +
> > +       if (__other_task)
> > +               return __other_task;
> > +
> > +       tsk = kthread_create(dummy_kthread, NULL, "hw_breakpoint_dummy_task");
> > +       KUNIT_ASSERT_FALSE(test, IS_ERR(tsk));
> > +       __other_task = tsk;
> > +       return __other_task;
> > +}
> > +
> > +static int get_test_cpu(int num)
> > +{
> > +       int cpu;
> > +
> > +       WARN_ON(num < 0);
> > +
> > +       for_each_online_cpu(cpu) {
> > +               if (num-- <= 0)
> > +                       break;
> > +       }
> > +
> > +       return cpu;
> > +}
> > +
> > +/* ===== Test cases ===== */
> > +
> > +static void test_one_cpu(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       fill_bp_slots(test, &idx, get_test_cpu(0), NULL, 0);
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +}
> > +
> > +static void test_many_cpus(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +       int cpu;
> > +
> > +       /* Test that CPUs are independent. */
> > +       for_each_online_cpu(cpu) {
> > +               bool do_continue = fill_bp_slots(test, &idx, cpu, NULL, 0);
> > +
> > +               TEST_EXPECT_NOSPC(register_test_bp(cpu, NULL, idx));
> > +               if (!do_continue)
> > +                       break;
> > +       }
> > +}
> > +
> > +static void test_one_task_on_all_cpus(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       fill_bp_slots(test, &idx, -1, current, 0);
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +       /* Remove one and adding back CPU-target should work. */
> > +       unregister_test_bp(&test_bps[0]);
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> > +}
> > +
> > +static void test_two_tasks_on_all_cpus(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       /* Test that tasks are independent. */
> > +       fill_bp_slots(test, &idx, -1, current, 0);
> > +       fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
> > +
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), get_other_task(test), idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +       /* Remove one from first task and adding back CPU-target should not work. */
> > +       unregister_test_bp(&test_bps[0]);
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +}
> > +
> > +static void test_one_task_on_one_cpu(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       fill_bp_slots(test, &idx, get_test_cpu(0), current, 0);
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +       /*
> > +        * Remove one and adding back CPU-target should work; this case is
> > +        * special vs. above because the task's constraints are CPU-dependent.
> > +        */
> > +       unregister_test_bp(&test_bps[0]);
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> > +}
> > +
> > +static void test_one_task_mixed(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       TEST_REQUIRES_BP_SLOTS(test, 3);
> > +
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(0), current);
> > +       fill_bp_slots(test, &idx, -1, current, 1);
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +
> > +       /* Transition from CPU-dependent pinned count to CPU-independent. */
> > +       unregister_test_bp(&test_bps[0]);
> > +       unregister_test_bp(&test_bps[1]);
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +}
> > +
> > +static void test_two_tasks_on_one_cpu(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       fill_bp_slots(test, &idx, get_test_cpu(0), current, 0);
> > +       fill_bp_slots(test, &idx, get_test_cpu(0), get_other_task(test), 0);
> > +
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), get_other_task(test), idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +       /* Can still create breakpoints on some other CPU. */
> > +       fill_bp_slots(test, &idx, get_test_cpu(1), NULL, 0);
> > +}
> > +
> > +static void test_two_tasks_on_one_all_cpus(struct kunit *test)
> > +{
> > +       int idx = 0;
> > +
> > +       fill_bp_slots(test, &idx, get_test_cpu(0), current, 0);
> > +       fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
> > +
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), get_other_task(test), idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +       /* Cannot create breakpoints on some other CPU either. */
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(1), NULL, idx));
> > +}
> > +
> > +static void test_task_on_all_and_one_cpu(struct kunit *test)
> > +{
> > +       int tsk_on_cpu_idx, cpu_idx;
> > +       int idx = 0;
> > +
> > +       TEST_REQUIRES_BP_SLOTS(test, 3);
> > +
> > +       fill_bp_slots(test, &idx, -1, current, 2);
> > +       /* Transitioning from only all CPU breakpoints to mixed. */
> > +       tsk_on_cpu_idx = idx;
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(0), current);
> > +       fill_one_bp_slot(test, &idx, -1, current);
> > +
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +
> > +       /* We should still be able to use up another CPU's slots. */
> > +       cpu_idx = idx;
> > +       fill_one_bp_slot(test, &idx, get_test_cpu(1), NULL);
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(1), NULL, idx));
> > +
> > +       /* Transitioning back to task target on all CPUs. */
> > +       unregister_test_bp(&test_bps[tsk_on_cpu_idx]);
> > +       /* Still have a CPU target breakpoint in get_test_cpu(1). */
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       /* Remove it and try again. */
> > +       unregister_test_bp(&test_bps[cpu_idx]);
> > +       fill_one_bp_slot(test, &idx, -1, current);
> > +
> > +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> > +       TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(1), NULL, idx));
> > +}
> > +
> > +static struct kunit_case hw_breakpoint_test_cases[] = {
> > +       KUNIT_CASE(test_one_cpu),
> > +       KUNIT_CASE(test_many_cpus),
> > +       KUNIT_CASE(test_one_task_on_all_cpus),
> > +       KUNIT_CASE(test_two_tasks_on_all_cpus),
> > +       KUNIT_CASE(test_one_task_on_one_cpu),
> > +       KUNIT_CASE(test_one_task_mixed),
> > +       KUNIT_CASE(test_two_tasks_on_one_cpu),
> > +       KUNIT_CASE(test_two_tasks_on_one_all_cpus),
> > +       KUNIT_CASE(test_task_on_all_and_one_cpu),
> > +       {},
> > +};
> > +
> > +static int test_init(struct kunit *test)
> > +{
> > +       /* Most test cases want 2 distinct CPUs. */
> > +       return num_online_cpus() < 2 ? -EINVAL : 0;
> > +}
> > +
> > +static void test_exit(struct kunit *test)
> > +{
> > +       for (int i = 0; i < MAX_TEST_BREAKPOINTS; ++i) {
> > +               if (test_bps[i])
> > +                       unregister_test_bp(&test_bps[i]);
> > +       }
> > +
> > +       if (__other_task) {
> > +               kthread_stop(__other_task);
> > +               __other_task = NULL;
> > +       }
> > +}
> > +
> > +static struct kunit_suite hw_breakpoint_test_suite = {
> > +       .name = "hw_breakpoint",
> > +       .test_cases = hw_breakpoint_test_cases,
> > +       .init = test_init,
> > +       .exit = test_exit,
> > +};
> > +
> > +kunit_test_suites(&hw_breakpoint_test_suite);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Marco Elver <elver@google.com>");
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 2e24db4bff19..4c87a6edf046 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2513,6 +2513,16 @@ config STACKINIT_KUNIT_TEST
> >           CONFIG_GCC_PLUGIN_STRUCTLEAK, CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF,
> >           or CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
> >
> > +config HW_BREAKPOINT_KUNIT_TEST
> > +       bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
> > +       depends on HAVE_HW_BREAKPOINT
> > +       depends on KUNIT=y
> > +       default KUNIT_ALL_TESTS
> > +       help
> > +         Tests for hw_breakpoint constraints accounting.
> > +
> > +         If unsure, say N.
> > +
> >  config TEST_UDELAY
> >         tristate "udelay test driver"
> >         help
> > --
> > 2.37.0.rc0.161.g10f37bed90-goog
> >
