Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF2557D16D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 18:23:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpdCq2T0fz3d9j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 02:23:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpdCP1qSNz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 02:22:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F57B13D5;
	Thu, 21 Jul 2022 09:22:19 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.34.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAA2A3F766;
	Thu, 21 Jul 2022 09:22:16 -0700 (PDT)
Date: Thu, 21 Jul 2022 17:22:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v3 01/14] perf/hw_breakpoint: Add KUnit test for
 constraints accounting
Message-ID: <Ytl9L0Zn1PVuL1cB@FVFF77S0Q05N.cambridge.arm.com>
References: <20220704150514.48816-1-elver@google.com>
 <20220704150514.48816-2-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704150514.48816-2-elver@google.com>
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
Cc: Will Deacon <will@kernel.org>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Marco,

[adding Will]

On Mon, Jul 04, 2022 at 05:05:01PM +0200, Marco Elver wrote:
> Add KUnit test for hw_breakpoint constraints accounting, with various
> interesting mixes of breakpoint targets (some care was taken to catch
> interesting corner cases via bug-injection).
> 
> The test cannot be built as a module because it requires access to
> hw_breakpoint_slots(), which is not inlinable or exported on all
> architectures.
> 
> Signed-off-by: Marco Elver <elver@google.com>

As mentioned on IRC, I'm seeing these tests fail on arm64 when applied atop
v5.19-rc7:

| TAP version 14
| 1..1
|     # Subtest: hw_breakpoint
|     1..9
|     ok 1 - test_one_cpu
|     ok 2 - test_many_cpus
|     # test_one_task_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 3 - test_one_task_on_all_cpus
|     # test_two_tasks_on_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 4 - test_two_tasks_on_all_cpus
|     # test_one_task_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 5 - test_one_task_on_one_cpu
|     # test_one_task_mixed: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 6 - test_one_task_mixed
|     # test_two_tasks_on_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 7 - test_two_tasks_on_one_cpu
|     # test_two_tasks_on_one_all_cpus: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 8 - test_two_tasks_on_one_all_cpus
|     # test_task_on_all_and_one_cpu: ASSERTION FAILED at kernel/events/hw_breakpoint_test.c:70
|     Expected IS_ERR(bp) to be false, but is true
|     not ok 9 - test_task_on_all_and_one_cpu
| # hw_breakpoint: pass:2 fail:7 skip:0 total:9
| # Totals: pass:2 fail:7 skip:0 total:9

... which seems to be becasue arm64 currently forbids per-task
breakpoints/watchpoints in hw_breakpoint_arch_parse(), where we have:

        /*
         * Disallow per-task kernel breakpoints since these would
         * complicate the stepping code.
         */
        if (hw->ctrl.privilege == AARCH64_BREAKPOINT_EL1 && bp->hw.target)
                return -EINVAL;

... which has been the case since day one in commit:

  478fcb2cdb2351dc ("arm64: Debugging support")

I'm not immediately sure what would be necessary to support per-task kernel
breakpoints, but given a lot of that state is currently per-cpu, I imagine it's
invasive.

Mark.

> ---
> v3:
> * Don't use raw_smp_processor_id().
> 
> v2:
> * New patch.
> ---
>  kernel/events/Makefile             |   1 +
>  kernel/events/hw_breakpoint_test.c | 323 +++++++++++++++++++++++++++++
>  lib/Kconfig.debug                  |  10 +
>  3 files changed, 334 insertions(+)
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
> index 000000000000..433c5c45e2a5
> --- /dev/null
> +++ b/kernel/events/hw_breakpoint_test.c
> @@ -0,0 +1,323 @@
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
> +#define TEST_REQUIRES_BP_SLOTS(test, slots)						\
> +	do {										\
> +		if ((slots) > get_test_bp_slots()) {					\
> +			kunit_skip((test), "Requires breakpoint slots: %d > %d", slots,	\
> +				   get_test_bp_slots());				\
> +		}									\
> +	} while (0)
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
> +	struct perf_event_attr attr = {};
> +
> +	if (WARN_ON(idx < 0 || idx >= MAX_TEST_BREAKPOINTS))
> +		return NULL;
> +
> +	hw_breakpoint_init(&attr);
> +	attr.bp_addr = (unsigned long)&break_vars[idx];
> +	attr.bp_len = HW_BREAKPOINT_LEN_1;
> +	attr.bp_type = HW_BREAKPOINT_RW;
> +	return perf_event_create_kernel_counter(&attr, cpu, tsk, NULL, NULL);
> +}
> +
> +static void unregister_test_bp(struct perf_event **bp)
> +{
> +	if (WARN_ON(IS_ERR(*bp)))
> +		return;
> +	if (WARN_ON(!*bp))
> +		return;
> +	unregister_hw_breakpoint(*bp);
> +	*bp = NULL;
> +}
> +
> +static int get_test_bp_slots(void)
> +{
> +	static int slots;
> +
> +	if (!slots)
> +		slots = hw_breakpoint_slots(TYPE_DATA);
> +
> +	return slots;
> +}
> +
> +static void fill_one_bp_slot(struct kunit *test, int *id, int cpu, struct task_struct *tsk)
> +{
> +	struct perf_event *bp = register_test_bp(cpu, tsk, *id);
> +
> +	KUNIT_ASSERT_NOT_NULL(test, bp);
> +	KUNIT_ASSERT_FALSE(test, IS_ERR(bp));
> +	KUNIT_ASSERT_NULL(test, test_bps[*id]);
> +	test_bps[(*id)++] = bp;
> +}
> +
> +/*
> + * Fills up the given @cpu/@tsk with breakpoints, only leaving @skip slots free.
> + *
> + * Returns true if this can be called again, continuing at @id.
> + */
> +static bool fill_bp_slots(struct kunit *test, int *id, int cpu, struct task_struct *tsk, int skip)
> +{
> +	for (int i = 0; i < get_test_bp_slots() - skip; ++i)
> +		fill_one_bp_slot(test, id, cpu, tsk);
> +
> +	return *id + get_test_bp_slots() <= MAX_TEST_BREAKPOINTS;
> +}
> +
> +static int dummy_kthread(void *arg)
> +{
> +	return 0;
> +}
> +
> +static struct task_struct *get_other_task(struct kunit *test)
> +{
> +	struct task_struct *tsk;
> +
> +	if (__other_task)
> +		return __other_task;
> +
> +	tsk = kthread_create(dummy_kthread, NULL, "hw_breakpoint_dummy_task");
> +	KUNIT_ASSERT_FALSE(test, IS_ERR(tsk));
> +	__other_task = tsk;
> +	return __other_task;
> +}
> +
> +static int get_test_cpu(int num)
> +{
> +	int cpu;
> +
> +	WARN_ON(num < 0);
> +
> +	for_each_online_cpu(cpu) {
> +		if (num-- <= 0)
> +			break;
> +	}
> +
> +	return cpu;
> +}
> +
> +/* ===== Test cases ===== */
> +
> +static void test_one_cpu(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	fill_bp_slots(test, &idx, get_test_cpu(0), NULL, 0);
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +}
> +
> +static void test_many_cpus(struct kunit *test)
> +{
> +	int idx = 0;
> +	int cpu;
> +
> +	/* Test that CPUs are independent. */
> +	for_each_online_cpu(cpu) {
> +		bool do_continue = fill_bp_slots(test, &idx, cpu, NULL, 0);
> +
> +		TEST_EXPECT_NOSPC(register_test_bp(cpu, NULL, idx));
> +		if (!do_continue)
> +			break;
> +	}
> +}
> +
> +static void test_one_task_on_all_cpus(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	fill_bp_slots(test, &idx, -1, current, 0);
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +	/* Remove one and adding back CPU-target should work. */
> +	unregister_test_bp(&test_bps[0]);
> +	fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> +}
> +
> +static void test_two_tasks_on_all_cpus(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	/* Test that tasks are independent. */
> +	fill_bp_slots(test, &idx, -1, current, 0);
> +	fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
> +
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), get_other_task(test), idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +	/* Remove one from first task and adding back CPU-target should not work. */
> +	unregister_test_bp(&test_bps[0]);
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +}
> +
> +static void test_one_task_on_one_cpu(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	fill_bp_slots(test, &idx, get_test_cpu(0), current, 0);
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +	/*
> +	 * Remove one and adding back CPU-target should work; this case is
> +	 * special vs. above because the task's constraints are CPU-dependent.
> +	 */
> +	unregister_test_bp(&test_bps[0]);
> +	fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> +}
> +
> +static void test_one_task_mixed(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	TEST_REQUIRES_BP_SLOTS(test, 3);
> +
> +	fill_one_bp_slot(test, &idx, get_test_cpu(0), current);
> +	fill_bp_slots(test, &idx, -1, current, 1);
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +
> +	/* Transition from CPU-dependent pinned count to CPU-independent. */
> +	unregister_test_bp(&test_bps[0]);
> +	unregister_test_bp(&test_bps[1]);
> +	fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> +	fill_one_bp_slot(test, &idx, get_test_cpu(0), NULL);
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +}
> +
> +static void test_two_tasks_on_one_cpu(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	fill_bp_slots(test, &idx, get_test_cpu(0), current, 0);
> +	fill_bp_slots(test, &idx, get_test_cpu(0), get_other_task(test), 0);
> +
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), get_other_task(test), idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +	/* Can still create breakpoints on some other CPU. */
> +	fill_bp_slots(test, &idx, get_test_cpu(1), NULL, 0);
> +}
> +
> +static void test_two_tasks_on_one_all_cpus(struct kunit *test)
> +{
> +	int idx = 0;
> +
> +	fill_bp_slots(test, &idx, get_test_cpu(0), current, 0);
> +	fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
> +
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), get_other_task(test), idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +	/* Cannot create breakpoints on some other CPU either. */
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(1), NULL, idx));
> +}
> +
> +static void test_task_on_all_and_one_cpu(struct kunit *test)
> +{
> +	int tsk_on_cpu_idx, cpu_idx;
> +	int idx = 0;
> +
> +	TEST_REQUIRES_BP_SLOTS(test, 3);
> +
> +	fill_bp_slots(test, &idx, -1, current, 2);
> +	/* Transitioning from only all CPU breakpoints to mixed. */
> +	tsk_on_cpu_idx = idx;
> +	fill_one_bp_slot(test, &idx, get_test_cpu(0), current);
> +	fill_one_bp_slot(test, &idx, -1, current);
> +
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +
> +	/* We should still be able to use up another CPU's slots. */
> +	cpu_idx = idx;
> +	fill_one_bp_slot(test, &idx, get_test_cpu(1), NULL);
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(1), NULL, idx));
> +
> +	/* Transitioning back to task target on all CPUs. */
> +	unregister_test_bp(&test_bps[tsk_on_cpu_idx]);
> +	/* Still have a CPU target breakpoint in get_test_cpu(1). */
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	/* Remove it and try again. */
> +	unregister_test_bp(&test_bps[cpu_idx]);
> +	fill_one_bp_slot(test, &idx, -1, current);
> +
> +	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), current, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(0), NULL, idx));
> +	TEST_EXPECT_NOSPC(register_test_bp(get_test_cpu(1), NULL, idx));
> +}
> +
> +static struct kunit_case hw_breakpoint_test_cases[] = {
> +	KUNIT_CASE(test_one_cpu),
> +	KUNIT_CASE(test_many_cpus),
> +	KUNIT_CASE(test_one_task_on_all_cpus),
> +	KUNIT_CASE(test_two_tasks_on_all_cpus),
> +	KUNIT_CASE(test_one_task_on_one_cpu),
> +	KUNIT_CASE(test_one_task_mixed),
> +	KUNIT_CASE(test_two_tasks_on_one_cpu),
> +	KUNIT_CASE(test_two_tasks_on_one_all_cpus),
> +	KUNIT_CASE(test_task_on_all_and_one_cpu),
> +	{},
> +};
> +
> +static int test_init(struct kunit *test)
> +{
> +	/* Most test cases want 2 distinct CPUs. */
> +	return num_online_cpus() < 2 ? -EINVAL : 0;
> +}
> +
> +static void test_exit(struct kunit *test)
> +{
> +	for (int i = 0; i < MAX_TEST_BREAKPOINTS; ++i) {
> +		if (test_bps[i])
> +			unregister_test_bp(&test_bps[i]);
> +	}
> +
> +	if (__other_task) {
> +		kthread_stop(__other_task);
> +		__other_task = NULL;
> +	}
> +}
> +
> +static struct kunit_suite hw_breakpoint_test_suite = {
> +	.name = "hw_breakpoint",
> +	.test_cases = hw_breakpoint_test_cases,
> +	.init = test_init,
> +	.exit = test_exit,
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
>  	  CONFIG_GCC_PLUGIN_STRUCTLEAK, CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF,
>  	  or CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
>  
> +config HW_BREAKPOINT_KUNIT_TEST
> +	bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
> +	depends on HAVE_HW_BREAKPOINT
> +	depends on KUNIT=y
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Tests for hw_breakpoint constraints accounting.
> +
> +	  If unsure, say N.
> +
>  config TEST_UDELAY
>  	tristate "udelay test driver"
>  	help
> -- 
> 2.37.0.rc0.161.g10f37bed90-goog
> 
