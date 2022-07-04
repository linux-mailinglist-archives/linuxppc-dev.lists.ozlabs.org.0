Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFA56596A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc8Mn60P0z3f3r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:08:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bYGAltsL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::44a; helo=mail-wr1-x44a.google.com; envelope-from=33whdygukdawqx7q3s00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bYGAltsL;
	dkim-atps=neutral
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc8Jf5dW4z3bsW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:06:10 +1000 (AEST)
Received: by mail-wr1-x44a.google.com with SMTP id w12-20020adf8bcc000000b0021d20a5b24fso1472953wra.22
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jul 2022 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3Qgep28qH2mkV9jarBi4ciQq1DboNBSIg9Dd1YIv8wg=;
        b=bYGAltsLhtWI2fWe28qtj9Uk6KZZNXzbdhs3RMBNofpk9La535mZiUCujPRwAFwgB8
         XSv0QAmXCDSSD1lYH0ampJ/Ve6IeiiYQWTHk+QqvV7xMuWKicygT9Fvu2VceANadWwAu
         Q4Xtwm+11FlDP13tTFCNdLxvo0WT0ZIMVk17LJX2QcCEXZqM9lVTOV7A1NsijmGSzE9z
         sKZBEsaiu2UU9D9vCLR6TFMB6fQdCZjtI6eLrmp+i1L0ZWlPtK5m+3g5Q8el+Vq/n3u4
         wVxpNb/6fHXDzbe3AaXR/cmveRIF+l3BaORe9aD8P3Alnr+HnJCjzJxHd4pS3gtS1HvO
         OAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3Qgep28qH2mkV9jarBi4ciQq1DboNBSIg9Dd1YIv8wg=;
        b=jqXC6258k0C4KCHWuekZIETwKuQbXDWcT2riY08hAlkoZlOGbpHDjPHUj8Xb4ZvYgg
         u/Gw5NdSArsuU+hklaxEZcM2DhWI5fwsf5edfhLrowFVbOp3yf7FG6cEcJdUJEsFR/Mj
         8vX8G7dtqmS/voDreY/j0NlL0alnLk79iWfY833opHgbqKkFCG4WnAmGCbpg6UeEpjhR
         JF0DpjGZ6PWe9CNHQZt498kw2wWdW0ovU/gazewtqmGK7lX19cpw3mKTUFLZu09uptI7
         SLyrUDLyonBg8XSAZ81IiZhWf8NqmHBC4S1NTvJM0Wex1Y+KHyyZOceJggD4HJ820n6S
         N+lg==
X-Gm-Message-State: AJIora9UWR8PFeLGks5S72IEZYtaqvQDDj47wJ6WXqqG76OJkUEF/f23
	k9KowXc9nXZts1iw/UZHAjkvjKR6LQ==
X-Google-Smtp-Source: AGRyM1tnkaOKxokSaha0vXIUMohGgDEaGK1jCvICNyM9SoBZWBBE5LM2R4EQ2Hqw7H4fPhJTWdQtOpDKxA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:6edf:e1bc:9a92:4ad0])
 (user=elver job=sendgmr) by 2002:adf:d1ea:0:b0:21b:a6cb:fcf6 with SMTP id
 g10-20020adfd1ea000000b0021ba6cbfcf6mr27579804wrd.477.1656947167004; Mon, 04
 Jul 2022 08:06:07 -0700 (PDT)
Date: Mon,  4 Jul 2022 17:05:04 +0200
In-Reply-To: <20220704150514.48816-1-elver@google.com>
Message-Id: <20220704150514.48816-5-elver@google.com>
Mime-Version: 1.0
References: <20220704150514.48816-1-elver@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v3 04/14] perf/hw_breakpoint: Optimize list of per-task breakpoints
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

On a machine with 256 CPUs, running the recently added perf breakpoint
benchmark results in:

 | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 236.418 [sec]
 |
 |   123134.794271 usecs/op
 |  7880626.833333 usecs/op/cpu

The benchmark tests inherited breakpoint perf events across many
threads.

Looking at a perf profile, we can see that the majority of the time is
spent in various hw_breakpoint.c functions, which execute within the
'nr_bp_mutex' critical sections which then results in contention on that
mutex as well:

    37.27%  [kernel]       [k] osq_lock
    34.92%  [kernel]       [k] mutex_spin_on_owner
    12.15%  [kernel]       [k] toggle_bp_slot
    11.90%  [kernel]       [k] __reserve_bp_slot

The culprit here is task_bp_pinned(), which has a runtime complexity of
O(#tasks) due to storing all task breakpoints in the same list and
iterating through that list looking for a matching task. Clearly, this
does not scale to thousands of tasks.

Instead, make use of the "rhashtable" variant "rhltable" which stores
multiple items with the same key in a list. This results in average
runtime complexity of O(1) for task_bp_pinned().

With the optimization, the benchmark shows:

 | $> perf bench -r 30 breakpoint thread -b 4 -p 64 -t 64
 | # Running 'breakpoint/thread' benchmark:
 | # Created/joined 30 threads with 4 breakpoints and 64 parallelism
 |      Total time: 0.208 [sec]
 |
 |      108.422396 usecs/op
 |     6939.033333 usecs/op/cpu

On this particular setup that's a speedup of ~1135x.

While one option would be to make task_struct a breakpoint list node,
this would only further bloat task_struct for infrequently used data.
Furthermore, after all optimizations in this series, there's no evidence
it would result in better performance: later optimizations make the time
spent looking up entries in the hash table negligible (we'll reach the
theoretical ideal performance i.e. no constraints).

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
---
v2:
* Commit message tweaks.
---
 include/linux/perf_event.h    |  3 +-
 kernel/events/hw_breakpoint.c | 56 ++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 01231f1d976c..e27360436dc6 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -36,6 +36,7 @@ struct perf_guest_info_callbacks {
 };
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
+#include <linux/rhashtable-types.h>
 #include <asm/hw_breakpoint.h>
 #endif
 
@@ -178,7 +179,7 @@ struct hw_perf_event {
 			 * creation and event initalization.
 			 */
 			struct arch_hw_breakpoint	info;
-			struct list_head		bp_list;
+			struct rhlist_head		bp_list;
 		};
 #endif
 		struct { /* amd_iommu */
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 6076c6346291..6d09edc80d19 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -26,10 +26,10 @@
 #include <linux/irqflags.h>
 #include <linux/kdebug.h>
 #include <linux/kernel.h>
-#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/percpu.h>
+#include <linux/rhashtable.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
@@ -54,7 +54,13 @@ static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
 }
 
 /* Keep track of the breakpoints attached to tasks */
-static LIST_HEAD(bp_task_head);
+static struct rhltable task_bps_ht;
+static const struct rhashtable_params task_bps_ht_params = {
+	.head_offset = offsetof(struct hw_perf_event, bp_list),
+	.key_offset = offsetof(struct hw_perf_event, target),
+	.key_len = sizeof_field(struct hw_perf_event, target),
+	.automatic_shrinking = true,
+};
 
 static int constraints_initialized;
 
@@ -103,17 +109,23 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
  */
 static int task_bp_pinned(int cpu, struct perf_event *bp, enum bp_type_idx type)
 {
-	struct task_struct *tsk = bp->hw.target;
+	struct rhlist_head *head, *pos;
 	struct perf_event *iter;
 	int count = 0;
 
-	list_for_each_entry(iter, &bp_task_head, hw.bp_list) {
-		if (iter->hw.target == tsk &&
-		    find_slot_idx(iter->attr.bp_type) == type &&
+	rcu_read_lock();
+	head = rhltable_lookup(&task_bps_ht, &bp->hw.target, task_bps_ht_params);
+	if (!head)
+		goto out;
+
+	rhl_for_each_entry_rcu(iter, pos, head, hw.bp_list) {
+		if (find_slot_idx(iter->attr.bp_type) == type &&
 		    (iter->cpu < 0 || cpu == iter->cpu))
 			count += hw_breakpoint_weight(iter);
 	}
 
+out:
+	rcu_read_unlock();
 	return count;
 }
 
@@ -186,7 +198,7 @@ static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
 /*
  * Add/remove the given breakpoint in our constraint table
  */
-static void
+static int
 toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
 	       int weight)
 {
@@ -199,7 +211,7 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
 	/* Pinned counter cpu profiling */
 	if (!bp->hw.target) {
 		get_bp_info(bp->cpu, type)->cpu_pinned += weight;
-		return;
+		return 0;
 	}
 
 	/* Pinned counter task profiling */
@@ -207,9 +219,9 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
 		toggle_bp_task_slot(bp, cpu, type, weight);
 
 	if (enable)
-		list_add_tail(&bp->hw.bp_list, &bp_task_head);
+		return rhltable_insert(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
 	else
-		list_del(&bp->hw.bp_list);
+		return rhltable_remove(&task_bps_ht, &bp->hw.bp_list, task_bps_ht_params);
 }
 
 __weak int arch_reserve_bp_slot(struct perf_event *bp)
@@ -307,9 +319,7 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
 	if (ret)
 		return ret;
 
-	toggle_bp_slot(bp, true, type, weight);
-
-	return 0;
+	return toggle_bp_slot(bp, true, type, weight);
 }
 
 int reserve_bp_slot(struct perf_event *bp)
@@ -334,7 +344,7 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
 
 	type = find_slot_idx(bp_type);
 	weight = hw_breakpoint_weight(bp);
-	toggle_bp_slot(bp, false, type, weight);
+	WARN_ON(toggle_bp_slot(bp, false, type, weight));
 }
 
 void release_bp_slot(struct perf_event *bp)
@@ -707,7 +717,7 @@ static struct pmu perf_breakpoint = {
 int __init init_hw_breakpoint(void)
 {
 	int cpu, err_cpu;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < TYPE_MAX; i++)
 		nr_slots[i] = hw_breakpoint_slots(i);
@@ -718,18 +728,24 @@ int __init init_hw_breakpoint(void)
 
 			info->tsk_pinned = kcalloc(nr_slots[i], sizeof(int),
 							GFP_KERNEL);
-			if (!info->tsk_pinned)
-				goto err_alloc;
+			if (!info->tsk_pinned) {
+				ret = -ENOMEM;
+				goto err;
+			}
 		}
 	}
 
+	ret = rhltable_init(&task_bps_ht, &task_bps_ht_params);
+	if (ret)
+		goto err;
+
 	constraints_initialized = 1;
 
 	perf_pmu_register(&perf_breakpoint, "breakpoint", PERF_TYPE_BREAKPOINT);
 
 	return register_die_notifier(&hw_breakpoint_exceptions_nb);
 
- err_alloc:
+err:
 	for_each_possible_cpu(err_cpu) {
 		for (i = 0; i < TYPE_MAX; i++)
 			kfree(get_bp_info(err_cpu, i)->tsk_pinned);
@@ -737,7 +753,5 @@ int __init init_hw_breakpoint(void)
 			break;
 	}
 
-	return -ENOMEM;
+	return ret;
 }
-
-
-- 
2.37.0.rc0.161.g10f37bed90-goog

