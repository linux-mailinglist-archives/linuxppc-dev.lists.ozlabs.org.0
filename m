Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF36284CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:16:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9vYn6RL0z3f3W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:15:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PwkTK6Vy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PwkTK6Vy;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9vSx66J5z3cLC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:11:45 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id v28so11412343pfi.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZGBrKdRsGyUTA5xkITQ1xeRBZZEgNSXBjqGlOM+4LY=;
        b=PwkTK6Vya2lwSyoOTTazwZQUeaSSIweVLQXNsRbFrQrX9bXDuYy+Mb6UWL2WM1+4qI
         Q7f5FqDzYcW6kQAcSgBOjwanAIaeY6tePBFTFfklnoqi3Wg7xcCk4XKL4BNzvMsFK8e8
         NlEnl2Mrpwu3OKRoDynry9L++tUURLVnDkjpjZQnq13erKWH9n30EDAn3P1B4DusKhQt
         k8D9OJK9Y8VCD+ntWPh1RAU986v1IFlNyJXo+a0Nn2hrTH/bXfX6Dlfd0DuvKGF4bdrf
         7Gmtjchdyk2IJ0mWaWyaBDoAteeN4s/ssENzrcAv3VEWeic89MBrwktIQXcFfNRlziyH
         tNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZGBrKdRsGyUTA5xkITQ1xeRBZZEgNSXBjqGlOM+4LY=;
        b=GsquRaymMu37RoQtG+bCoplcK4eH0+zycFqFoA1bvr5ij8hRGPaKfJMhQJxWntUobF
         wCMMwEwm0zNjMkKORZZclh8ukgItD/9hUg1ubrIFotxGnz5HRFU0pGFkYa8WYvy+DS9V
         RGMMYENTabWmOAYi4dvsQzRBvT3dnQ9dUIrv5/GzFadjz1OgJ7iFolRFBMcromGQg//z
         OxJZJlj9L7hxiU/hrCd8hY9gA7ZyWkthFVoTOZyIvRAvyZKDwpbvf+xf202h5LbPaq4E
         NZr1lpfPXhA/Otu3KbLS2PfHIDT6OzLlzvk6dDG0poRVjW19RKBE+H05fq247QfG52kO
         xwJA==
X-Gm-Message-State: ANoB5pmLoPRTgtaGCt677Hxz7votKxB4U+0tb5wVVlvyYy30Bv+FF3Mr
	yrj/Hdc3cyAp6ILw0FtoKpVctnFbk3Dfkw==
X-Google-Smtp-Source: AA0mqf5YBsBn4azGG8nxqCGy3rejIBWhVoEMbfA6ib5RAwwgElgqg+neDoKBSCDo0uUN8x7NfIK1Ag==
X-Received: by 2002:a63:560e:0:b0:476:837c:e0a with SMTP id k14-20020a63560e000000b00476837c0e0amr4652585pgb.411.1668442303379;
        Mon, 14 Nov 2022 08:11:43 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-22-7.tpgi.com.au. [27.32.22.7])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b00186e2b3e12fsm7635883pld.261.2022.11.14.08.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 08:11:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/4] powerpc/qspinlock: add compile-time tuning adjustments
Date: Tue, 15 Nov 2022 02:11:19 +1000
Message-Id: <20221114161119.2883620-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114161119.2883620-1-npiggin@gmail.com>
References: <20221114161119.2883620-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds compile-time options that allow the EH lock hint bit to be
enabled or disabled, and adds some new options that may or may not
help matters. To help with experimentation and tuning.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h | 61 ++++++++++++++++++++++++++--
 arch/powerpc/lib/qspinlock.c         | 39 ++++++++++++++++--
 2 files changed, 94 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 56638175e49b..5efd66aeb907 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -5,15 +5,68 @@
 #include <linux/compiler.h>
 #include <asm/qspinlock_types.h>
 
+#ifdef CONFIG_PPC64
+/*
+ * Use the EH=1 hint for accesses that result in the lock being acquired.
+ * The hardware is supposed to optimise this pattern by holding the lock
+ * cacheline longer, and releasing when a store to the same memory (the
+ * unlock) is performed.
+ */
+#define _Q_SPIN_EH_HINT 1
+#else
+#define _Q_SPIN_EH_HINT 0
+#endif
+
 /*
  * The trylock itself may steal. This makes trylocks slightly stronger, and
- * might make spin locks slightly more efficient when stealing.
+ * makes locks slightly more efficient when stealing.
  *
  * This is compile-time, so if true then there may always be stealers, so the
  * nosteal paths become unused.
  */
 #define _Q_SPIN_TRY_LOCK_STEAL 1
 
+/*
+ * Put a speculation barrier after testing the lock/node and finding it
+ * busy. Try to prevent pointless speculation in slow paths.
+ *
+ * Slows down the lockstorm microbenchmark with no stealing, where locking
+ * is purely FIFO through the queue. May have more benefit in real workload
+ * where speculating into the wrong place could have a greater cost.
+ */
+#define _Q_SPIN_SPEC_BARRIER 0
+
+#ifdef CONFIG_PPC64
+/*
+ * Execute a miso instruction after passing the MCS lock ownership to the
+ * queue head. Miso is intended to make stores visible to other CPUs sooner.
+ *
+ * This seems to make the lockstorm microbenchmark nospin test go slightly
+ * faster on POWER10, but disable for now.
+ */
+#define _Q_SPIN_MISO 0
+#else
+#define _Q_SPIN_MISO 0
+#endif
+
+#ifdef CONFIG_PPC64
+/*
+ * This executes miso after an unlock of the lock word, having ownership
+ * pass to the next CPU sooner. This will slow the uncontended path to some
+ * degree. Not evidence it helps yet.
+ */
+#define _Q_SPIN_MISO_UNLOCK 0
+#else
+#define _Q_SPIN_MISO_UNLOCK 0
+#endif
+
+/*
+ * Seems to slow down lockstorm microbenchmark, suspect queue node just
+ * has to become shared again right afterwards when its waiter spins on
+ * the lock field.
+ */
+#define _Q_SPIN_PREFETCH_NEXT 0
+
 static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 {
 	return READ_ONCE(lock->val);
@@ -51,7 +104,7 @@ static __always_inline int __queued_spin_trylock_nosteal(struct qspinlock *lock)
 "2:									\n"
 	: "=&r" (prev)
 	: "r" (&lock->val), "r" (new),
-	  "i" (IS_ENABLED(CONFIG_PPC64))
+	  "i" (_Q_SPIN_EH_HINT)
 	: "cr0", "memory");
 
 	return likely(prev == 0);
@@ -75,7 +128,7 @@ static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
 "2:									\n"
 	: "=&r" (prev), "=&r" (tmp)
 	: "r" (&lock->val), "r" (new), "r" (_Q_TAIL_CPU_MASK),
-	  "i" (IS_ENABLED(CONFIG_PPC64))
+	  "i" (_Q_SPIN_EH_HINT)
 	: "cr0", "memory");
 
 	return likely(!(prev & ~_Q_TAIL_CPU_MASK));
@@ -100,6 +153,8 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
 	smp_store_release(&lock->locked, 0);
+	if (_Q_SPIN_MISO_UNLOCK)
+		asm volatile("miso" ::: "memory");
 }
 
 #define arch_spin_is_locked(l)		queued_spin_is_locked(l)
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 457e748b0078..01fbb4209367 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -48,6 +48,12 @@ static bool pv_prod_head __read_mostly = false;
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 static DEFINE_PER_CPU_ALIGNED(u64, sleepy_lock_seen_clock);
 
+#if _Q_SPIN_SPEC_BARRIER == 1
+#define spec_barrier() do { asm volatile("ori 31,31,0" ::: "memory"); } while (0)
+#else
+#define spec_barrier() do { } while (0)
+#endif
+
 static __always_inline bool recently_sleepy(void)
 {
 	/* pv_sleepy_lock is true when this is called */
@@ -130,7 +136,7 @@ static __always_inline u32 trylock_clear_my_tail(struct qspinlock *lock, u32 myt
 	: "r" (&lock->val), "r"(mytail), "r" (newval),
 	  "i" (_Q_LOCKED_VAL),
 	  "r" (_Q_TAIL_CPU_MASK),
-	  "i" (IS_ENABLED(CONFIG_PPC64))
+	  "i" (_Q_SPIN_EH_HINT)
 	: "cr0", "memory");
 
 	return prev;
@@ -468,6 +474,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		val = READ_ONCE(lock->val);
 		if (val & _Q_MUST_Q_VAL)
 			break;
+		spec_barrier();
 
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
 			spin_end();
@@ -533,6 +540,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 	qnodesp = this_cpu_ptr(&qnodes);
 	if (unlikely(qnodesp->count >= MAX_NODES)) {
+		spec_barrier();
 		while (!queued_spin_trylock(lock))
 			cpu_relax();
 		return;
@@ -569,9 +577,12 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		/* Wait for mcs node lock to be released */
 		spin_begin();
 		while (!node->locked) {
+			spec_barrier();
+
 			if (yield_to_prev(lock, node, old, paravirt))
 				seen_preempted = true;
 		}
+		spec_barrier();
 		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
@@ -579,6 +590,17 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			node->yield_cpu = -1;
 
 		smp_rmb(); /* acquire barrier for the mcs lock */
+
+		/*
+		 * Generic qspinlocks have this prefetch here, but it seems
+		 * like it could cause additional line transitions because
+		 * the waiter will keep loading from it.
+		 */
+		if (_Q_SPIN_PREFETCH_NEXT) {
+			next = READ_ONCE(node->next);
+			if (next)
+				prefetchw(next);
+		}
 	}
 
 	/* We're at the head of the waitqueue, wait for the lock. */
@@ -590,6 +612,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		val = READ_ONCE(lock->val);
 		if (!(val & _Q_LOCKED_VAL))
 			break;
+		spec_barrier();
 
 		if (paravirt && pv_sleepy_lock && maybe_stealers) {
 			if (!sleepy) {
@@ -630,6 +653,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			val |= _Q_MUST_Q_VAL;
 		}
 	}
+	spec_barrier();
 	spin_end();
 
 	/* If we're the last queued, must clean up the tail. */
@@ -650,6 +674,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			cpu_relax();
 		spin_end();
 	}
+	spec_barrier();
 
 	/*
 	 * Unlock the next mcs waiter node. Release barrier is not required
@@ -661,10 +686,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	if (paravirt && pv_prod_head) {
 		int next_cpu = next->cpu;
 		WRITE_ONCE(next->locked, 1);
+		if (_Q_SPIN_MISO)
+			asm volatile("miso" ::: "memory");
 		if (vcpu_is_preempted(next_cpu))
 			prod_cpu(next_cpu);
 	} else {
 		WRITE_ONCE(next->locked, 1);
+		if (_Q_SPIN_MISO)
+			asm volatile("miso" ::: "memory");
 	}
 
 release:
@@ -679,12 +708,16 @@ void queued_spin_lock_slowpath(struct qspinlock *lock)
 	 * is passed as the paravirt argument to the functions.
 	 */
 	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
-		if (try_to_steal_lock(lock, true))
+		if (try_to_steal_lock(lock, true)) {
+			spec_barrier();
 			return;
+		}
 		queued_spin_lock_mcs_queue(lock, true);
 	} else {
-		if (try_to_steal_lock(lock, false))
+		if (try_to_steal_lock(lock, false)) {
+			spec_barrier();
 			return;
+		}
 		queued_spin_lock_mcs_queue(lock, false);
 	}
 }
-- 
2.37.2

