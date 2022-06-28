Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9655C001
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 12:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXKp93BCmz3dry
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 20:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VJizrG6i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::64a; helo=mail-ej1-x64a.google.com; envelope-from=35dc6ygukdi4w3dw9y66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VJizrG6i;
	dkim-atps=neutral
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXKn45YtBz3bY6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 19:59:04 +1000 (AEST)
Received: by mail-ej1-x64a.google.com with SMTP id hq41-20020a1709073f2900b00722e5ad076cso3458241ejc.20
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 02:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xK4e9VEyJDIzbUo67C06P/12U8vcat3CTuB5T8upBGY=;
        b=VJizrG6igS1QvOi1vWxFV06nlbE4tHMaom6yclOqCoH294Qzw0Nq/lwE/RvsW+D3xE
         2RZIGdu3zUg0sdV7EbhPqIaT4qZVJoS7gqGbyqsHg5+akvWp0C/tfVZ6Dr2ia7q189sc
         6f6+DshABSGF9xh5AQZ8UHNAATL6eNTdQgFsRL104IoXaMBBQt87XkVkIPKxf0oztEBf
         KsXP5OWtEgTMNAG65hjSJcwzDVv91LQDG5yqmzIJCa+QzOK0RMKNpBphbqctpZoasCUP
         8LAMyeFWPrEqvkRIl/uqyJ7Xg7O72cO7rFDEE9qD0WYJZpTLRY3E6bd1gAvYZhBFvS0B
         Wrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xK4e9VEyJDIzbUo67C06P/12U8vcat3CTuB5T8upBGY=;
        b=N9jKf+FK7q/hQqMyZD/9/1gN7BtArrwbEvlZBOHBMN0+OQcrZzO3t1jtQCmHugdEB9
         3YN+8pLASyCTIMDI0GYQ+YXHnknuFf9wn1iw8FPG9q4f1muXekuhOhEKYey7NRQ4Od4W
         HiAkVxMwDMjheEHI2YiKn+RPzaJ+k+yM16UF1jrRIHEzA7ZBxj609PMc41WvK55peeJr
         AjtW1osATyI8u8D6RuXl3YmOOnvuNVoGLq71nQ2z7Y3anToFkLp5DBNuxEx2svi50M4F
         3elccQSWAxIqOUPtaTl8x/fbSGHxOqDqR1z6hAOR823bRk+88T/mpJrNFBZIc0fPr6tX
         6CKA==
X-Gm-Message-State: AJIora+QkkvnLe7XVH2l2WlwnjJI8gxXTUI0+Mlek0gAr7DrMxTwoqFS
	Eh4hVvawz27TUCdbqgALOePP772ZjQ==
X-Google-Smtp-Source: AGRyM1vhWSPvkTkTqhEMMppReji1dz9jrywuSM4LLzsfTs9HUUVjhJeHgLwASfwiUudRiADurIdNP+qYWw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3496:744e:315a:b41b])
 (user=elver job=sendgmr) by 2002:a17:906:3f09:b0:712:466:e04a with SMTP id
 c9-20020a1709063f0900b007120466e04amr16934750ejj.719.1656410341300; Tue, 28
 Jun 2022 02:59:01 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:58:21 +0200
In-Reply-To: <20220628095833.2579903-1-elver@google.com>
Message-Id: <20220628095833.2579903-2-elver@google.com>
Mime-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 01/13] perf/hw_breakpoint: Add KUnit test for constraints accounting
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add KUnit test for hw_breakpoint constraints accounting, with various
interesting mixes of breakpoint targets (some care was taken to catch
interesting corner cases via bug-injection).

The test cannot be built as a module because it requires access to
hw_breakpoint_slots(), which is not inlinable or exported on all
architectures.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* New patch.
---
 kernel/events/Makefile             |   1 +
 kernel/events/hw_breakpoint_test.c | 321 +++++++++++++++++++++++++++++
 lib/Kconfig.debug                  |  10 +
 3 files changed, 332 insertions(+)
 create mode 100644 kernel/events/hw_breakpoint_test.c

diff --git a/kernel/events/Makefile b/kernel/events/Makefile
index 8591c180b52b..91a62f566743 100644
--- a/kernel/events/Makefile
+++ b/kernel/events/Makefile
@@ -2,4 +2,5 @@
 obj-y := core.o ring_buffer.o callchain.o
 
 obj-$(CONFIG_HAVE_HW_BREAKPOINT) += hw_breakpoint.o
+obj-$(CONFIG_HW_BREAKPOINT_KUNIT_TEST) += hw_breakpoint_test.o
 obj-$(CONFIG_UPROBES) += uprobes.o
diff --git a/kernel/events/hw_breakpoint_test.c b/kernel/events/hw_breakpoint_test.c
new file mode 100644
index 000000000000..747a0249a606
--- /dev/null
+++ b/kernel/events/hw_breakpoint_test.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for hw_breakpoint constraints accounting logic.
+ *
+ * Copyright (C) 2022, Google LLC.
+ */
+
+#include <kunit/test.h>
+#include <linux/cpumask.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/kthread.h>
+#include <linux/perf_event.h>
+#include <asm/hw_breakpoint.h>
+
+#define TEST_REQUIRES_BP_SLOTS(test, slots)						\
+	do {										\
+		if ((slots) > get_test_bp_slots()) {					\
+			kunit_skip((test), "Requires breakpoint slots: %d > %d", slots,	\
+				   get_test_bp_slots());				\
+		}									\
+	} while (0)
+
+#define TEST_EXPECT_NOSPC(expr) KUNIT_EXPECT_EQ(test, -ENOSPC, PTR_ERR(expr))
+
+#define MAX_TEST_BREAKPOINTS 512
+
+static char break_vars[MAX_TEST_BREAKPOINTS];
+static struct perf_event *test_bps[MAX_TEST_BREAKPOINTS];
+static struct task_struct *__other_task;
+
+static struct perf_event *register_test_bp(int cpu, struct task_struct *tsk, int idx)
+{
+	struct perf_event_attr attr = {};
+
+	if (WARN_ON(idx < 0 || idx >= MAX_TEST_BREAKPOINTS))
+		return NULL;
+
+	hw_breakpoint_init(&attr);
+	attr.bp_addr = (unsigned long)&break_vars[idx];
+	attr.bp_len = HW_BREAKPOINT_LEN_1;
+	attr.bp_type = HW_BREAKPOINT_RW;
+	return perf_event_create_kernel_counter(&attr, cpu, tsk, NULL, NULL);
+}
+
+static void unregister_test_bp(struct perf_event **bp)
+{
+	if (WARN_ON(IS_ERR(*bp)))
+		return;
+	if (WARN_ON(!*bp))
+		return;
+	unregister_hw_breakpoint(*bp);
+	*bp = NULL;
+}
+
+static int get_test_bp_slots(void)
+{
+	static int slots;
+
+	if (!slots)
+		slots = hw_breakpoint_slots(TYPE_DATA);
+
+	return slots;
+}
+
+static void fill_one_bp_slot(struct kunit *test, int *id, int cpu, struct task_struct *tsk)
+{
+	struct perf_event *bp = register_test_bp(cpu, tsk, *id);
+
+	KUNIT_ASSERT_NOT_NULL(test, bp);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(bp));
+	KUNIT_ASSERT_NULL(test, test_bps[*id]);
+	test_bps[(*id)++] = bp;
+}
+
+/*
+ * Fills up the given @cpu/@tsk with breakpoints, only leaving @skip slots free.
+ *
+ * Returns true if this can be called again, continuing at @id.
+ */
+static bool fill_bp_slots(struct kunit *test, int *id, int cpu, struct task_struct *tsk, int skip)
+{
+	for (int i = 0; i < get_test_bp_slots() - skip; ++i)
+		fill_one_bp_slot(test, id, cpu, tsk);
+
+	return *id + get_test_bp_slots() <= MAX_TEST_BREAKPOINTS;
+}
+
+static int dummy_kthread(void *arg)
+{
+	return 0;
+}
+
+static struct task_struct *get_other_task(struct kunit *test)
+{
+	struct task_struct *tsk;
+
+	if (__other_task)
+		return __other_task;
+
+	tsk = kthread_create(dummy_kthread, NULL, "hw_breakpoint_dummy_task");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(tsk));
+	__other_task = tsk;
+	return __other_task;
+}
+
+static int get_other_cpu(void)
+{
+	int cpu;
+
+	for_each_online_cpu(cpu) {
+		if (cpu != raw_smp_processor_id())
+			break;
+	}
+
+	return cpu;
+}
+
+/* ===== Test cases ===== */
+
+static void test_one_cpu(struct kunit *test)
+{
+	int idx = 0;
+
+	fill_bp_slots(test, &idx, raw_smp_processor_id(), NULL, 0);
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+}
+
+static void test_many_cpus(struct kunit *test)
+{
+	int idx = 0;
+	int cpu;
+
+	/* Test that CPUs are independent. */
+	for_each_online_cpu(cpu) {
+		bool do_continue = fill_bp_slots(test, &idx, cpu, NULL, 0);
+
+		TEST_EXPECT_NOSPC(register_test_bp(cpu, NULL, idx));
+		if (!do_continue)
+			break;
+	}
+}
+
+static void test_one_task_on_all_cpus(struct kunit *test)
+{
+	int idx = 0;
+
+	fill_bp_slots(test, &idx, -1, current, 0);
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+	/* Remove one and adding back CPU-target should work. */
+	unregister_test_bp(&test_bps[0]);
+	fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
+}
+
+static void test_two_tasks_on_all_cpus(struct kunit *test)
+{
+	int idx = 0;
+
+	/* Test that tasks are independent. */
+	fill_bp_slots(test, &idx, -1, current, 0);
+	fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
+
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), get_other_task(test), idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+	/* Remove one from first task and adding back CPU-target should not work. */
+	unregister_test_bp(&test_bps[0]);
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+}
+
+static void test_one_task_on_one_cpu(struct kunit *test)
+{
+	int idx = 0;
+
+	fill_bp_slots(test, &idx, raw_smp_processor_id(), current, 0);
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+	/*
+	 * Remove one and adding back CPU-target should work; this case is
+	 * special vs. above because the task's constraints are CPU-dependent.
+	 */
+	unregister_test_bp(&test_bps[0]);
+	fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
+}
+
+static void test_one_task_mixed(struct kunit *test)
+{
+	int idx = 0;
+
+	TEST_REQUIRES_BP_SLOTS(test, 3);
+
+	fill_one_bp_slot(test, &idx, raw_smp_processor_id(), current);
+	fill_bp_slots(test, &idx, -1, current, 1);
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+
+	/* Transition from CPU-dependent pinned count to CPU-independent. */
+	unregister_test_bp(&test_bps[0]);
+	unregister_test_bp(&test_bps[1]);
+	fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
+	fill_one_bp_slot(test, &idx, raw_smp_processor_id(), NULL);
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+}
+
+static void test_two_tasks_on_one_cpu(struct kunit *test)
+{
+	int idx = 0;
+
+	fill_bp_slots(test, &idx, raw_smp_processor_id(), current, 0);
+	fill_bp_slots(test, &idx, raw_smp_processor_id(), get_other_task(test), 0);
+
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), get_other_task(test), idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+	/* Can still create breakpoints on some other CPU. */
+	fill_bp_slots(test, &idx, get_other_cpu(), NULL, 0);
+}
+
+static void test_two_tasks_on_one_all_cpus(struct kunit *test)
+{
+	int idx = 0;
+
+	fill_bp_slots(test, &idx, raw_smp_processor_id(), current, 0);
+	fill_bp_slots(test, &idx, -1, get_other_task(test), 0);
+
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(-1, get_other_task(test), idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), get_other_task(test), idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+	/* Cannot create breakpoints on some other CPU either. */
+	TEST_EXPECT_NOSPC(register_test_bp(get_other_cpu(), NULL, idx));
+}
+
+static void test_task_on_all_and_one_cpu(struct kunit *test)
+{
+	int tsk_on_cpu_idx, cpu_idx;
+	int idx = 0;
+
+	TEST_REQUIRES_BP_SLOTS(test, 3);
+
+	fill_bp_slots(test, &idx, -1, current, 2);
+	/* Transitioning from only all CPU breakpoints to mixed. */
+	tsk_on_cpu_idx = idx;
+	fill_one_bp_slot(test, &idx, raw_smp_processor_id(), current);
+	fill_one_bp_slot(test, &idx, -1, current);
+
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+
+	/* We should still be able to use up another CPU's slots. */
+	cpu_idx = idx;
+	fill_one_bp_slot(test, &idx, get_other_cpu(), NULL);
+	TEST_EXPECT_NOSPC(register_test_bp(get_other_cpu(), NULL, idx));
+
+	/* Transitioning back to task target on all CPUs. */
+	unregister_test_bp(&test_bps[tsk_on_cpu_idx]);
+	/* Still have a CPU target breakpoint in get_other_cpu(). */
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	/* Remove it and try again. */
+	unregister_test_bp(&test_bps[cpu_idx]);
+	fill_one_bp_slot(test, &idx, -1, current);
+
+	TEST_EXPECT_NOSPC(register_test_bp(-1, current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), current, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(raw_smp_processor_id(), NULL, idx));
+	TEST_EXPECT_NOSPC(register_test_bp(get_other_cpu(), NULL, idx));
+}
+
+static struct kunit_case hw_breakpoint_test_cases[] = {
+	KUNIT_CASE(test_one_cpu),
+	KUNIT_CASE(test_many_cpus),
+	KUNIT_CASE(test_one_task_on_all_cpus),
+	KUNIT_CASE(test_two_tasks_on_all_cpus),
+	KUNIT_CASE(test_one_task_on_one_cpu),
+	KUNIT_CASE(test_one_task_mixed),
+	KUNIT_CASE(test_two_tasks_on_one_cpu),
+	KUNIT_CASE(test_two_tasks_on_one_all_cpus),
+	KUNIT_CASE(test_task_on_all_and_one_cpu),
+	{},
+};
+
+static int test_init(struct kunit *test)
+{
+	/* Most test cases want 2 distinct CPUs. */
+	return num_online_cpus() < 2 ? -EINVAL : 0;
+}
+
+static void test_exit(struct kunit *test)
+{
+	for (int i = 0; i < MAX_TEST_BREAKPOINTS; ++i) {
+		if (test_bps[i])
+			unregister_test_bp(&test_bps[i]);
+	}
+
+	if (__other_task) {
+		kthread_stop(__other_task);
+		__other_task = NULL;
+	}
+}
+
+static struct kunit_suite hw_breakpoint_test_suite = {
+	.name = "hw_breakpoint",
+	.test_cases = hw_breakpoint_test_cases,
+	.init = test_init,
+	.exit = test_exit,
+};
+
+kunit_test_suites(&hw_breakpoint_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Marco Elver <elver@google.com>");
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2e24db4bff19..4c87a6edf046 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2513,6 +2513,16 @@ config STACKINIT_KUNIT_TEST
 	  CONFIG_GCC_PLUGIN_STRUCTLEAK, CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF,
 	  or CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
 
+config HW_BREAKPOINT_KUNIT_TEST
+	bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
+	depends on HAVE_HW_BREAKPOINT
+	depends on KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Tests for hw_breakpoint constraints accounting.
+
+	  If unsure, say N.
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
-- 
2.37.0.rc0.161.g10f37bed90-goog

