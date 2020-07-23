Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689922AD1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 13:00:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC8W62VGFzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 21:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sdNN0zOh; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC8Qm5wwYzDr6l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 20:56:32 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z3so2812331pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PK02Bh4d4aHWKzfhAQVFjFrAIUZm1v12mLEDk9haWJU=;
 b=sdNN0zOhm9Gaw/QM2lx9n1Pr0hg9JdLwTvF7rVA/RlIIC4ACPK5JO9Cy1Atwckk7+9
 CFejqgp3fBmCEibRCSozYV6PU7J+GgU0Ftq3j0qE6swAoXU/Fy9K7aTJFEUd+0REAs6R
 60ZZKTg/k+AUedcNva3zN2Wk2NvIjc95u/aSaqlZg1JF5mvJz7bN0KXfHD5HWJOLy0cS
 oeFPn3zpBjqZAzako78ANrATkc0M1xwHT4zP7uTkIQUnVTrU+2+CfSp6RjkjaPXGcySF
 HFJi0tb8kVEIXPBKy4EuNIgo6grQl4F2P3uFgDskCjmkimMD7UHkyV7PREwqBfqe2PQg
 Ipbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PK02Bh4d4aHWKzfhAQVFjFrAIUZm1v12mLEDk9haWJU=;
 b=hYvZ0rRXko8ND2kUix5KFZnd+iAbed45+XJ32ipVXgXhF9P0HMXb/hOzX1sDWjeoVK
 topoq4p60oeY8wegTEbS7h0F3pcBixy4I4EwCrch0qxNPGBO5QbEHB6tDtTg5HgR2NuK
 wPyooNyICxD6vEb+vni+uNQwAPr5Nrh9GTFpsoAaakNfj7yQ6ersDSQtUWVu+QJXUKH+
 h+kuhXjJQ8MK+2N/0BAOqs+/RgW5w5Y2bRvnE6NFsFPUtNSp0znIv1uK58SpSPEEzroy
 dpy4+U3PWIxPQlUn6mPxtzWFx3HE7beUsOXXt1p395zEO2mt5hc6picI9em/v4AD9BGh
 VnlQ==
X-Gm-Message-State: AOAM53285+cmvZifLWX4iNQuaTMHy1Z1oJzgPcoTQ1c5J2pYKYnOcTDs
 rp+RVc3PrIVivt9A8+YhPqs=
X-Google-Smtp-Source: ABdhPJymcYwdxtDyk5I5JumOCYmSfFHEpsFhlVU55Xy6fEdzOhOTPKKB1pqhSpPIuB0KuD9bO1C0Uw==
X-Received: by 2002:a62:8ccb:: with SMTP id m194mr3698446pfd.36.1595501790287; 
 Thu, 23 Jul 2020 03:56:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id 204sm2598009pfx.3.2020.07.23.03.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 03:56:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] lockdep: warn on redundant or incorrect irq state changes
Date: Thu, 23 Jul 2020 20:56:15 +1000
Message-Id: <20200723105615.1268126-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200723105615.1268126-1-npiggin@gmail.com>
References: <20200723105615.1268126-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the previous patch, lockdep hardirq state changes should not be
redundant. Softirq state changes already follow that pattern.

So warn on unexpected enable-when-enabled or disable-when-disabled
conditions, to catch possible errors or sloppy patterns that could
lead to similar bad behavior due to NMIs etc.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/locking/lockdep.c           | 80 +++++++++++++-----------------
 kernel/locking/lockdep_internals.h |  4 --
 kernel/locking/lockdep_proc.c      | 10 +---
 3 files changed, 35 insertions(+), 59 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 29a8de4c50b9..138458fb2234 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3649,15 +3649,8 @@ void lockdep_hardirqs_on_prepare(unsigned long ip)
 	if (unlikely(!debug_locks || current->lockdep_recursion))
 		return;
 
-	if (unlikely(current->hardirqs_enabled)) {
-		/*
-		 * Neither irq nor preemption are disabled here
-		 * so this is racy by nature but losing one hit
-		 * in a stat is not a big deal.
-		 */
-		__debug_atomic_inc(redundant_hardirqs_on);
+	if (DEBUG_LOCKS_WARN_ON(current->hardirqs_enabled))
 		return;
-	}
 
 	/*
 	 * We're enabling irqs and according to our state above irqs weren't
@@ -3695,15 +3688,8 @@ void noinstr lockdep_hardirqs_on(unsigned long ip)
 	if (unlikely(!debug_locks || curr->lockdep_recursion))
 		return;
 
-	if (curr->hardirqs_enabled) {
-		/*
-		 * Neither irq nor preemption are disabled here
-		 * so this is racy by nature but losing one hit
-		 * in a stat is not a big deal.
-		 */
-		__debug_atomic_inc(redundant_hardirqs_on);
+	if (DEBUG_LOCKS_WARN_ON(curr->hardirqs_enabled))
 		return;
-	}
 
 	/*
 	 * We're enabling irqs and according to our state above irqs weren't
@@ -3738,6 +3724,9 @@ void noinstr lockdep_hardirqs_off(unsigned long ip)
 	if (unlikely(!debug_locks || curr->lockdep_recursion))
 		return;
 
+	if (DEBUG_LOCKS_WARN_ON(!curr->hardirqs_enabled))
+		return;
+
 	/*
 	 * So we're supposed to get called after you mask local IRQs, but for
 	 * some reason the hardware doesn't quite think you did a proper job.
@@ -3745,17 +3734,13 @@ void noinstr lockdep_hardirqs_off(unsigned long ip)
 	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
 		return;
 
-	if (curr->hardirqs_enabled) {
-		/*
-		 * We have done an ON -> OFF transition:
-		 */
-		curr->hardirqs_enabled = 0;
-		curr->hardirq_disable_ip = ip;
-		curr->hardirq_disable_event = ++curr->irq_events;
-		debug_atomic_inc(hardirqs_off_events);
-	} else {
-		debug_atomic_inc(redundant_hardirqs_off);
-	}
+	/*
+	 * We have done an ON -> OFF transition:
+	 */
+	curr->hardirqs_enabled = 0;
+	curr->hardirq_disable_ip = ip;
+	curr->hardirq_disable_event = ++curr->irq_events;
+	debug_atomic_inc(hardirqs_off_events);
 }
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_off);
 
@@ -3769,6 +3754,9 @@ void lockdep_softirqs_on(unsigned long ip)
 	if (unlikely(!debug_locks || current->lockdep_recursion))
 		return;
 
+	if (DEBUG_LOCKS_WARN_ON(curr->softirqs_enabled))
+		return;
+
 	/*
 	 * We fancy IRQs being disabled here, see softirq.c, avoids
 	 * funny state and nesting things.
@@ -3776,11 +3764,6 @@ void lockdep_softirqs_on(unsigned long ip)
 	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
 		return;
 
-	if (curr->softirqs_enabled) {
-		debug_atomic_inc(redundant_softirqs_on);
-		return;
-	}
-
 	current->lockdep_recursion++;
 	/*
 	 * We'll do an OFF -> ON transition:
@@ -3809,26 +3792,26 @@ void lockdep_softirqs_off(unsigned long ip)
 	if (unlikely(!debug_locks || current->lockdep_recursion))
 		return;
 
+	if (DEBUG_LOCKS_WARN_ON(!curr->softirqs_enabled))
+		return;
+
 	/*
 	 * We fancy IRQs being disabled here, see softirq.c
 	 */
 	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
 		return;
 
-	if (curr->softirqs_enabled) {
-		/*
-		 * We have done an ON -> OFF transition:
-		 */
-		curr->softirqs_enabled = 0;
-		curr->softirq_disable_ip = ip;
-		curr->softirq_disable_event = ++curr->irq_events;
-		debug_atomic_inc(softirqs_off_events);
-		/*
-		 * Whoops, we wanted softirqs off, so why aren't they?
-		 */
-		DEBUG_LOCKS_WARN_ON(!softirq_count());
-	} else
-		debug_atomic_inc(redundant_softirqs_off);
+	/*
+	 * We have done an ON -> OFF transition:
+	 */
+	curr->softirqs_enabled = 0;
+	curr->softirq_disable_ip = ip;
+	curr->softirq_disable_event = ++curr->irq_events;
+	debug_atomic_inc(softirqs_off_events);
+	/*
+	 * Whoops, we wanted softirqs off, so why aren't they?
+	 */
+	DEBUG_LOCKS_WARN_ON(!softirq_count());
 }
 
 static int
@@ -5684,6 +5667,11 @@ void __init lockdep_init(void)
 
 	printk(" per task-struct memory footprint: %zu bytes\n",
 	       sizeof(((struct task_struct *)NULL)->held_locks));
+
+	WARN_ON(irqs_disabled());
+
+	current->hardirqs_enabled = 1;
+	current->softirqs_enabled = 1;
 }
 
 static void
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index baca699b94e9..6dd8b1f06dc4 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -180,12 +180,8 @@ struct lockdep_stats {
 	unsigned int   chain_lookup_misses;
 	unsigned long  hardirqs_on_events;
 	unsigned long  hardirqs_off_events;
-	unsigned long  redundant_hardirqs_on;
-	unsigned long  redundant_hardirqs_off;
 	unsigned long  softirqs_on_events;
 	unsigned long  softirqs_off_events;
-	unsigned long  redundant_softirqs_on;
-	unsigned long  redundant_softirqs_off;
 	int            nr_unused_locks;
 	unsigned int   nr_redundant_checks;
 	unsigned int   nr_redundant;
diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 5525cd3ba0c8..98f204220ed9 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -172,12 +172,8 @@ static void lockdep_stats_debug_show(struct seq_file *m)
 #ifdef CONFIG_DEBUG_LOCKDEP
 	unsigned long long hi1 = debug_atomic_read(hardirqs_on_events),
 			   hi2 = debug_atomic_read(hardirqs_off_events),
-			   hr1 = debug_atomic_read(redundant_hardirqs_on),
-			   hr2 = debug_atomic_read(redundant_hardirqs_off),
 			   si1 = debug_atomic_read(softirqs_on_events),
-			   si2 = debug_atomic_read(softirqs_off_events),
-			   sr1 = debug_atomic_read(redundant_softirqs_on),
-			   sr2 = debug_atomic_read(redundant_softirqs_off);
+			   si2 = debug_atomic_read(softirqs_off_events);
 
 	seq_printf(m, " chain lookup misses:           %11llu\n",
 		debug_atomic_read(chain_lookup_misses));
@@ -196,12 +192,8 @@ static void lockdep_stats_debug_show(struct seq_file *m)
 
 	seq_printf(m, " hardirq on events:             %11llu\n", hi1);
 	seq_printf(m, " hardirq off events:            %11llu\n", hi2);
-	seq_printf(m, " redundant hardirq ons:         %11llu\n", hr1);
-	seq_printf(m, " redundant hardirq offs:        %11llu\n", hr2);
 	seq_printf(m, " softirq on events:             %11llu\n", si1);
 	seq_printf(m, " softirq off events:            %11llu\n", si2);
-	seq_printf(m, " redundant softirq ons:         %11llu\n", sr1);
-	seq_printf(m, " redundant softirq offs:        %11llu\n", sr2);
 #endif
 }
 
-- 
2.23.0

