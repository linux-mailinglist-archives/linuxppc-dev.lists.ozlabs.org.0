Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5805A4C91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:55:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGVm60S0Qz3f8M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:55:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q/g+BEJN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--elver.bounces.google.com (client-ip=2a00:1450:4864:20::549; helo=mail-ed1-x549.google.com; envelope-from=3n7umywukdfw8fp8laiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--elver.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q/g+BEJN;
	dkim-atps=neutral
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGVbz6cr0z3c71
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:48:31 +1000 (AEST)
Received: by mail-ed1-x549.google.com with SMTP id x21-20020a05640226d500b0044856301c62so2360642edd.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=ALPSUyHQQrXCFAhvO3GrH4UhqRd+C7lu7ougUmdRQTc=;
        b=q/g+BEJNCUTLPiz8396cNH9olRGtWS638cpfrFVFSi612qvfENTt46zL1qFRyM+pmh
         77lwXRIbI2SG1T3iQuzznwog069UNsx7j79yKDYPfEIIE8KOoqaph+6cL7X0YRyM3h7s
         6xH/A55Fw48B8qCpLQA64b/9gVxx62EPmCUmMzOvP63xQUx6KJhIaQb9PuP16K5N6KXh
         UylovVVaoQar0XH8pDPKFHzTrwqH2WLw2bH/7oRlSvsY03DaZYAnipwBLKwKFlYBGloT
         ktV9ihc4nRfEdgpS9AyVL6azxWpeM66rwWpDKYB+yd0l6fDSNiVQsh58ByWWoTPdIfq8
         5uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=ALPSUyHQQrXCFAhvO3GrH4UhqRd+C7lu7ougUmdRQTc=;
        b=gdoBwuUVFeFYVXE4HedXiF6z98VG3bF+3iVZkjIFC+4+OfuDQeH24zizscJf0gMfrc
         I317qhUIAO+HzbFFdNtnf9RBs03cSzKrO6ERQaJzWE7WhtPOgvSP80I2vgJgIsqhk+PH
         UjaydD0YZ/A1GOKfGDGJ9hfl3EdSGYdVf9Q3fte1Vgb90QHNorc5CVIvb3LW9c01+gtO
         Po3DTQIAHVROwEf8Ab7IkSNyucVbfU+PkbdUG9YdKVOUPkh4B3mqW6vllh3RiN7a4vde
         fN+wIRA5ZnOrobcK/mEkpyiT2/J/FQZHFfj89MYtuqvKmFSQhAGhlBj6KF2S+OPp5iK0
         frZw==
X-Gm-Message-State: ACgBeo3A6oqqstwTv2Y78ShOMi/F7I4iCY5GFItKFV1uhZfvX2X4/twz
	G7DEXmtTy13aCctgzT/I3NlpqTd3Ag==
X-Google-Smtp-Source: AA6agR50o74ooBgV57arMCJWxWak0fy/La9f8bONjy2t3gGS6dKZKpdmoPpW1tWOfGyh6NMettd3KBAJhg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:196d:4fc7:fa9c:62e3])
 (user=elver job=sendgmr) by 2002:a05:6402:e94:b0:443:e3fe:7c87 with SMTP id
 h20-20020a0564020e9400b00443e3fe7c87mr16853908eda.144.1661777311215; Mon, 29
 Aug 2022 05:48:31 -0700 (PDT)
Date: Mon, 29 Aug 2022 14:47:17 +0200
In-Reply-To: <20220829124719.675715-1-elver@google.com>
Mime-Version: 1.0
References: <20220829124719.675715-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829124719.675715-13-elver@google.com>
Subject: [PATCH v4 12/14] perf/hw_breakpoint: Introduce bp_slots_histogram
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Factor out the existing `atomic_t count[N]` into its own struct called
'bp_slots_histogram', to generalize and make its intent clearer in
preparation of reusing elsewhere. The basic idea of bucketing "total
uses of N slots" resembles a histogram, so calling it such seems most
intuitive.

No functional change.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Acked-by: Ian Rogers <irogers@google.com>
---
v3:
* Also warn in bp_slots_histogram_add() if count goes below 0.

v2:
* New patch.
---
 kernel/events/hw_breakpoint.c | 96 +++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 229c6f4fae75..03ebecf048c0 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -36,19 +36,27 @@
 #include <linux/slab.h>
 
 /*
- * Constraints data
+ * Datastructure to track the total uses of N slots across tasks or CPUs;
+ * bp_slots_histogram::count[N] is the number of assigned N+1 breakpoint slots.
  */
-struct bp_cpuinfo {
-	/* Number of pinned cpu breakpoints in a cpu */
-	unsigned int	cpu_pinned;
-	/* tsk_pinned[n] is the number of tasks having n+1 breakpoints */
+struct bp_slots_histogram {
 #ifdef hw_breakpoint_slots
-	atomic_t	tsk_pinned[hw_breakpoint_slots(0)];
+	atomic_t count[hw_breakpoint_slots(0)];
 #else
-	atomic_t	*tsk_pinned;
+	atomic_t *count;
 #endif
 };
 
+/*
+ * Per-CPU constraints data.
+ */
+struct bp_cpuinfo {
+	/* Number of pinned CPU breakpoints in a CPU. */
+	unsigned int			cpu_pinned;
+	/* Histogram of pinned task breakpoints in a CPU. */
+	struct bp_slots_histogram	tsk_pinned;
+};
+
 static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
 
 static struct bp_cpuinfo *get_bp_info(int cpu, enum bp_type_idx type)
@@ -159,6 +167,18 @@ static inline int hw_breakpoint_slots_cached(int type)
 	return __nr_bp_slots[type];
 }
 
+static __init bool
+bp_slots_histogram_alloc(struct bp_slots_histogram *hist, enum bp_type_idx type)
+{
+	hist->count = kcalloc(hw_breakpoint_slots_cached(type), sizeof(*hist->count), GFP_KERNEL);
+	return hist->count;
+}
+
+static __init void bp_slots_histogram_free(struct bp_slots_histogram *hist)
+{
+	kfree(hist->count);
+}
+
 static __init int init_breakpoint_slots(void)
 {
 	int i, cpu, err_cpu;
@@ -170,8 +190,7 @@ static __init int init_breakpoint_slots(void)
 		for (i = 0; i < TYPE_MAX; i++) {
 			struct bp_cpuinfo *info = get_bp_info(cpu, i);
 
-			info->tsk_pinned = kcalloc(__nr_bp_slots[i], sizeof(atomic_t), GFP_KERNEL);
-			if (!info->tsk_pinned)
+			if (!bp_slots_histogram_alloc(&info->tsk_pinned, i))
 				goto err;
 		}
 	}
@@ -180,7 +199,7 @@ static __init int init_breakpoint_slots(void)
 err:
 	for_each_possible_cpu(err_cpu) {
 		for (i = 0; i < TYPE_MAX; i++)
-			kfree(get_bp_info(err_cpu, i)->tsk_pinned);
+			bp_slots_histogram_free(&get_bp_info(err_cpu, i)->tsk_pinned);
 		if (err_cpu == cpu)
 			break;
 	}
@@ -189,6 +208,34 @@ static __init int init_breakpoint_slots(void)
 }
 #endif
 
+static inline void
+bp_slots_histogram_add(struct bp_slots_histogram *hist, int old, int val)
+{
+	const int old_idx = old - 1;
+	const int new_idx = old_idx + val;
+
+	if (old_idx >= 0)
+		WARN_ON(atomic_dec_return_relaxed(&hist->count[old_idx]) < 0);
+	if (new_idx >= 0)
+		WARN_ON(atomic_inc_return_relaxed(&hist->count[new_idx]) < 0);
+}
+
+static int
+bp_slots_histogram_max(struct bp_slots_histogram *hist, enum bp_type_idx type)
+{
+	for (int i = hw_breakpoint_slots_cached(type) - 1; i >= 0; i--) {
+		const int count = atomic_read(&hist->count[i]);
+
+		/* Catch unexpected writers; we want a stable snapshot. */
+		ASSERT_EXCLUSIVE_WRITER(hist->count[i]);
+		if (count > 0)
+			return i + 1;
+		WARN(count < 0, "inconsistent breakpoint slots histogram");
+	}
+
+	return 0;
+}
+
 #ifndef hw_breakpoint_weight
 static inline int hw_breakpoint_weight(struct perf_event *bp)
 {
@@ -205,13 +252,11 @@ static inline enum bp_type_idx find_slot_idx(u64 bp_type)
 }
 
 /*
- * Report the maximum number of pinned breakpoints a task
- * have in this cpu
+ * Return the maximum number of pinned breakpoints a task has in this CPU.
  */
 static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
 {
-	atomic_t *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
-	int i;
+	struct bp_slots_histogram *tsk_pinned = &get_bp_info(cpu, type)->tsk_pinned;
 
 	/*
 	 * At this point we want to have acquired the bp_cpuinfo_sem as a
@@ -219,14 +264,7 @@ static unsigned int max_task_bp_pinned(int cpu, enum bp_type_idx type)
 	 * toggle_bp_task_slot() to tsk_pinned, and we get a stable snapshot.
 	 */
 	lockdep_assert_held_write(&bp_cpuinfo_sem);
-
-	for (i = hw_breakpoint_slots_cached(type) - 1; i >= 0; i--) {
-		ASSERT_EXCLUSIVE_WRITER(tsk_pinned[i]); /* Catch unexpected writers. */
-		if (atomic_read(&tsk_pinned[i]) > 0)
-			return i + 1;
-	}
-
-	return 0;
+	return bp_slots_histogram_max(tsk_pinned, type);
 }
 
 /*
@@ -300,8 +338,7 @@ max_bp_pinned_slots(struct perf_event *bp, enum bp_type_idx type)
 static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
 				enum bp_type_idx type, int weight)
 {
-	atomic_t *tsk_pinned = get_bp_info(cpu, type)->tsk_pinned;
-	int old_idx, new_idx;
+	struct bp_slots_histogram *tsk_pinned = &get_bp_info(cpu, type)->tsk_pinned;
 
 	/*
 	 * If bp->hw.target, tsk_pinned is only modified, but not used
@@ -311,14 +348,7 @@ static void toggle_bp_task_slot(struct perf_event *bp, int cpu,
 	 * bp_cpuinfo_sem as a writer to stabilize tsk_pinned's value.
 	 */
 	lockdep_assert_held_read(&bp_cpuinfo_sem);
-
-	old_idx = task_bp_pinned(cpu, bp, type) - 1;
-	new_idx = old_idx + weight;
-
-	if (old_idx >= 0)
-		atomic_dec(&tsk_pinned[old_idx]);
-	if (new_idx >= 0)
-		atomic_inc(&tsk_pinned[new_idx]);
+	bp_slots_histogram_add(tsk_pinned, task_bp_pinned(cpu, bp, type), weight);
 }
 
 /*
@@ -768,7 +798,7 @@ bool hw_breakpoint_is_used(void)
 				return true;
 
 			for (int slot = 0; slot < hw_breakpoint_slots_cached(type); ++slot) {
-				if (atomic_read(&info->tsk_pinned[slot]))
+				if (atomic_read(&info->tsk_pinned.count[slot]))
 					return true;
 			}
 		}
-- 
2.37.2.672.g94769d06f0-goog

