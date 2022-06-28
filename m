Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C355C784
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 14:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXPgB1BlSz3cd8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 22:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=O/eDFTpZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=O/eDFTpZ;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXPfX50hvz3bsW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 22:53:39 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id y32so22093312lfa.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ME9ogYLhPCZuFXLa1q13oIt/WDr6DICnKX+45BprLvQ=;
        b=O/eDFTpZBGvsxiXhm+rdXmX9EjlpV6zoT4RSdiYdgX4BlPP3BJYz1o3Kd7V3x2E9PS
         Ra/Z0HB82bpCEAMAmLMxi3tMC/F5nXeSpcQe4CeRTiuf2zQXeGpjmjQa0RQB8NH7W8q+
         eo5Xo9NN/TYsgx2IJ7+f/Yf1AMjQl6TltVnIKeSd0iWs50w9CTactRY6QDEZPS8hLxco
         rljnl8g+UkEBNOLI6KV5/xhgnPJZJKl2nE4hDC+/BxjhRC6edHmDYy0IJtJ2zN8VLCaw
         AxW9kxxB/xqdKMtw0UCjU8F2B3NysGTTT4fxCGJFf/T1kfJICkQwMi4Y/fEH4GYM+8/W
         JVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ME9ogYLhPCZuFXLa1q13oIt/WDr6DICnKX+45BprLvQ=;
        b=dJU4uoZyXmqwYIifYujld4qKg/QgGxScHOJosA6Oo+JM+4B+q9bxwfmzsA+KtiGM3h
         u4euCSmq8hz+Q+s9kSgGm4xhn53zuqJItpp+pQP+ycMT0fMcRnk3uRjNgy9XHVyJka9V
         tCXh73B/1gv6qMxWdayr+wcVPBTHowVQtvdbSKK+ozaCbqGHGJRvW2o9V1hykybHdu1Y
         iOh79uQDpyoFEsX4VUud2kfbBeZ/aqBEonqKLP6riyvHQ1zQbJW9VPA0F/Izn0qv41fk
         OJfs7EIOgoM6BjxQDpgy3Lw5u2FbKVhnaKHRPv4ychuYbTkzw0gR1XKkxSkLfNFcGipk
         xeNw==
X-Gm-Message-State: AJIora+QwFsf7ix33xeKJzEl3ddgboss7GCsvFL0F1WCLBY1nl3CJYQ5
	iNtLOXmWsrx8GBhqzekU2iW9gpGtXVwciL3m3IxUZw==
X-Google-Smtp-Source: AGRyM1v27CNMnBcn0g2o7zhsJ/MyLQPHQ0FaLWdS99mATqRq3+ORykWe5FcxukL1nQBDPZ/4iExKqLFKk0x5Tp5UDZw=
X-Received: by 2002:a05:6512:10c3:b0:47f:a97e:35c with SMTP id
 k3-20020a05651210c300b0047fa97e035cmr11411428lfg.417.1656420813860; Tue, 28
 Jun 2022 05:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-2-elver@google.com>
In-Reply-To: <20220628095833.2579903-2-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 28 Jun 2022 14:53:22 +0200
Message-ID: <CACT4Y+brMfpe1_T5eaki8YLRVeCsFqJ6WbUCAe2+ALNTT=By0w@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 On Tue, 28 Jun 2022 at 11:59, Marco Elver <elver@google.com> wrote:
>
> Add KUnit test for hw_breakpoint constraints accounting, with various
> interesting mixes of breakpoint targets (some care was taken to catch
> interesting corner cases via bug-injection).
>
> The test cannot be built as a module because it requires access to
> hw_breakpoint_slots(), which is not inlinable or exported on all
> architectures.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * New patch.
> ---
>  kernel/events/Makefile             |   1 +
>  kernel/events/hw_breakpoint_test.c | 321 +++++++++++++++++++++++++++++
>  lib/Kconfig.debug                  |  10 +
>  3 files changed, 332 insertions(+)
>  create mode 100644 kernel/events/hw_breakpoint_test.c
>
> diff --git a/kernel/events/Makefile b/kernel/events/Makefile
> index 8591c180b52b..91a62f566743 100644
> --- a/kernel/events/Makefile
> +++ b/kernel/events/Makefile
> @@ -2,4 +2,5 @@
>  obj-y := core.o ring_buffer.o callchain.o
>
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT) += hw_breakpoint.o
> +obj-$(CONFIG_HW_BREAKPOINT_KUNIT_TEST) += hw_breakpoint_test.o
>  obj-$(CONFIG_UPROBES) += uprobes.o
> diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
> new file mode 100644
> index 000000000000..747a0249a606
> --- /dev/null
> +++ b/kernel/events/hw_breakpoint_test.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for hw_breakpoint constraints accounting logic.
> + *
> + * Copyright (C) 2022, Google LLC.
> + */
> +
> +#include <kunit/test.h>
> +#include <linux/cpumask.h>
> +#include <linux/hw_breakpoint.h>
> +#include <linux/kthread.h>
> +#include <linux/perf_event.h>
> +#include <asm/hw_breakpoint.h>
> +
> +#define TEST_REQUIRES_BP_SLOTS(test, slots)                                            \
> +       do {                                                                            \
> +               if ((slots) > get_test_bp_slots()) {                                    \
> +                       kunit_skip((test), "Requires breakpoint slots: %d > %d", slots, \
> +                                  get_test_bp_slots());                                \
> +               }                                                                       \
> +       } while (0)
> +
> +#define TEST_EXPECT_NOSPC(expr) KUNIT_EXPECT_EQ(test, -ENOSPC, PTR_ERR(expr))
> +
> +#define MAX_TEST_BREAKPOINTS 512
> +
> +static char break_vars[MAX_TEST_BREAKPOINTS];
> +static struct perf_event *test_bps[MAX_TEST_BREAKPOINTS];
> +static struct task_struct *__other_task;
> +
> +static struct perf_event *register_test_bp(int cpu, struct task_struct *tsk, int idx)
> +{
> +       struct perf_event_attr attr = {};
> +
> +       if (WARN_ON(idx < 0 || idx >= MAX_TEST_BREAKPOINTS))
> +               return NULL;
> +
> +       hw_breakpoint_init(&attr);
> +       attr.bp_addr = (unsigned long)&break_vars[idx];
> +       attr.bp_len = HW_BREAKPOINT_LEN_1;
> +       attr.bp_type = HW_BREAKPOINT_RW;
> +       return perf_event_create_kernel_counter(&attr, cpu, tsk, NULL, NULL);
> +}
> +
> +static void unregister_test_bp(struct perf_event **bp)
> +{
> +       if (WARN_ON(IS_ERR(*bp)))
> +               return;
> +       if (WARN_ON(!*bp))
> +               return;
> +       unregister_hw_breakpoint(*bp);
> +       *bp = NULL;
> +}
> +
> +static int get_test_bp_slots(void)
> +{
> +       static int slots;

Why is this function needed? Is hw_breakpoint_slots() very slow?

> +
> +       if (!slots)
> +               slots = hw_breakpoint_slots(TYPE_DATA);
> +
> +       return slots;
> +}
> +
> +static void fill_one_bp_slot(struct kunit *test, int *id, int cpu, struct task_struct *tsk)
> +{
> +       struct perf_event *bp = register_test_bp(cpu, tsk, *id);
> +
> +       KUNIT_ASSERT_NOT_NULL(test, bp);
> +       KUNIT_ASSERT_FALSE(test, IS_ERR(bp));
> +       KUNIT_ASSERT_NULL(test, test_bps[*id]);
> +       test_bps[(*id)++] = bp;
> +}
> +
> +/*
> + * Fills up the given @cpu/@tsk with breakpoints, only leaving @skip slots free.
> + *
> + * Returns true if this can be called again, continuing at @id.
> + */
> +static bool fill_bp_slots(struct kunit *test, int *id, int cpu, struct task_struct *tsk, int skip)
> +{
> +       for (int i = 0; i < get_test_bp_slots() - skip; ++i)
> +               fill_one_bp_slot(test, id, cpu, tsk);
> +
> +       return *id + get_test_bp_slots() <= MAX_TEST_BREAKPOINTS;
> +}
> +
> +static int dummy_kthread(void *arg)
> +{
> +       return 0;
> +}
> +
> +static struct task_struct *get_other_task(struct kunit *test)
> +{
> +       struct task_struct *tsk;
> +
> +       if (__other_task)
> +               return __other_task;
> +
> +       tsk = kthread_create(dummy_kthread, NULL, "hw_breakpoint_dummy_task");
> +       KUNIT_ASSERT_FALSE(test, IS_ERR(tsk));
> +       __other_task = tsk;
> +       return __other_task;
> +}
> +
> +static int get_other_cpu(void)
> +{
> +       int cpu;
> +
> +       for_each_online_cpu(cpu) {
> +               if (cpu != raw_smp_processor_id())

Are we guaranteed to not be rescheduled in the middle of a test?
If not, can't get_other_cpu() return the same CPU that was returned by
raw_smp_processor_id() earlier in the test?

> +                       break;
> +       }
> +
> +       return cpu;
> +}
> +
> +/* ===== Test cases ===== */
> +
> +static void test_one_cpu(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       fill_bp_slots(test, &idx, raw_smp_processor_id(), NULL, 0);
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +}
> +
> +static void test_many_cpus(struct kunit *test)
> +{
> +       int idx = 0;
> +       int cpu;
> +
> +       /* Test that CPUs are independent. */
> +       for_each_online_cpu(cpu) {
> +               bool do_continue = fill_bp_slots(test, &idx, cpu, NULL, 0);
> +
> +               TEST_EXPECT_NOSPC(register_test_bp(cpu, NULL, idx));
> +               if (!do_continue)
> +                       break;
> +       }
> +}
> +
> +static void test_one_task_on_all_cpus(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       fill_bp_slots(test, &idx, -1, current, 0);
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +       /* Remove one and adding back CPU-target should work. */
> +       unregister_test_bp(&test_bps[0]);
> +       fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
> +}
> +
> +static void test_two_tasks_on_all_cpus(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       /* Test that tasks are independent. */
> +       fill_bp_slots(test, &idx, -1, current, 0);
> +       fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
> +
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), get_other_task(test), idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +       /* Remove one from first task and adding back CPU-target should not work. */
> +       unregister_test_bp(&test_bps[0]);
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +}
> +
> +static void test_one_task_on_one_cpu(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       fill_bp_slots(test, &idx, raw_smp_processor_id(), current, 0);
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +       /*
> +        * Remove one and adding back CPU-target should work; this case is
> +        * special vs. above because the task's constraints are CPU-dependent.
> +        */
> +       unregister_test_bp(&test_bps[0]);
> +       fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
> +}
> +
> +static void test_one_task_mixed(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       TEST_REQUIRES_BP_SLOTS(test, 3);
> +
> +       fill_one_bp_slot(test, &idx, raw_smp_processor_id(), current);
> +       fill_bp_slots(test, &idx, -1, current, 1);
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +
> +       /* Transition from CPU-dependent pinned count to CPU-independent. */
> +       unregister_test_bp(&test_bps[0]);
> +       unregister_test_bp(&test_bps[1]);
> +       fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
> +       fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +}
> +
> +static void test_two_tasks_on_one_cpu(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       fill_bp_slots(test, &idx, raw_smp_processor_id(), current, 0);
> +       fill_bp_slots(test, &idx, raw_smp_processor_id(), get_other_task(test), 0);
> +
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), get_other_task(test), idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +       /* Can still create breakpoints on some other CPU. */
> +       fill_bp_slots(test, &idx, get_other_cpu(), NULL, 0);
> +}
> +
> +static void test_two_tasks_on_one_all_cpus(struct kunit *test)
> +{
> +       int idx = 0;
> +
> +       fill_bp_slots(test, &idx, raw_smp_processor_id(), current, 0);
> +       fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
> +
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), get_other_task(test), idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +       /* Cannot create breakpoints on some other CPU either. */
> +       TEST_EXPECT_NOSPC(register_test_bp(get_other_cpu(), NULL, idx));
> +}
> +
> +static void test_task_on_all_and_one_cpu(struct kunit *test)
> +{
> +       int tsk_on_cpu_idx, cpu_idx;
> +       int idx = 0;
> +
> +       TEST_REQUIRES_BP_SLOTS(test, 3);
> +
> +       fill_bp_slots(test, &idx, -1, current, 2);
> +       /* Transitioning from only all CPU breakpoints to mixed. */
> +       tsk_on_cpu_idx = idx;
> +       fill_one_bp_slot(test, &idx, raw_smp_processor_id(), current);
> +       fill_one_bp_slot(test, &idx, -1, current);
> +
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +
> +       /* We should still be able to use up another CPU's slots. */
> +       cpu_idx = idx;
> +       fill_one_bp_slot(test, &idx, get_other_cpu(), NULL);
> +       TEST_EXPECT_NOSPC(register_test_bp(get_other_cpu(), NULL, idx));
> +
> +       /* Transitioning back to task target on all CPUs. */
> +       unregister_test_bp(&test_bps[tsk_on_cpu_idx]);
> +       /* Still have a CPU target breakpoint in get_other_cpu(). */
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       /* Remove it and try again. */
> +       unregister_test_bp(&test_bps[cpu_idx]);
> +       fill_one_bp_slot(test, &idx, -1, current);
> +
> +       TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
> +       TEST_EXPECT_NOSPC(register_test_bp(get_other_cpu(), NULL, idx));
> +}
> +
> +static struct kunit_case hw_breakpoint_test_cases[] = {
> +       KUNIT_CASE(test_one_cpu),
> +       KUNIT_CASE(test_many_cpus),
> +       KUNIT_CASE(test_one_task_on_all_cpus),
> +       KUNIT_CASE(test_two_tasks_on_all_cpus),
> +       KUNIT_CASE(test_one_task_on_one_cpu),
> +       KUNIT_CASE(test_one_task_mixed),
> +       KUNIT_CASE(test_two_tasks_on_one_cpu),
> +       KUNIT_CASE(test_two_tasks_on_one_all_cpus),
> +       KUNIT_CASE(test_task_on_all_and_one_cpu),
> +       {},
> +};
> +
> +static int test_init(struct kunit *test)
> +{
> +       /* Most test cases want 2 distinct CPUs. */
> +       return num_online_cpus() < 2 ? -EINVAL : 0;
> +}
> +
> +static void test_exit(struct kunit *test)
> +{
> +       for (int i = 0; i < MAX_TEST_BREAKPOINTS; ++i) {
> +               if (test_bps[i])
> +                       unregister_test_bp(&test_bps[i]);
> +       }
> +
> +       if (__other_task) {
> +               kthread_stop(__other_task);
> +               __other_task = NULL;
> +       }
> +}
> +
> +static struct kunit_suite hw_breakpoint_test_suite = {
> +       .name = "hw_breakpoint",
> +       .test_cases = hw_breakpoint_test_cases,
> +       .init = test_init,
> +       .exit = test_exit,
> +};
> +
> +kunit_test_suites(&hw_breakpoint_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Marco Elver <elver@google.com>");
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 2e24db4bff19..4c87a6edf046 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2513,6 +2513,16 @@ config STACKINIT_KUNIT_TEST
>           CONFIG_GCC_PLUGIN_STRUCTLEAK, CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF,
>           or CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
>
> +config HW_BREAKPOINT_KUNIT_TEST
> +       bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
> +       depends on HAVE_HW_BREAKPOINT
> +       depends on KUNIT=y
> +       default KUNIT_ALL_TESTS
> +       help
> +         Tests for hw_breakpoint constraints accounting.
> +
> +         If unsure, say N.
> +
>  config TEST_UDELAY
>         tristate "udelay test driver"
>         help
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
