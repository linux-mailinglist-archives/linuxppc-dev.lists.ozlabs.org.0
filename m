Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470B762749E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YQH0ZN9z3c7J
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:38:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qmQ9y1B1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qmQ9y1B1;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHM58Bxz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:15 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id p21so8852321plr.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiRMGs/hF879eTYlkCveIAkgMIO1cM/VpPsdSSJjIbY=;
        b=qmQ9y1B1poAn1t1H2NnZV8rpF70d51gSLPCmwvVh5m4cRdcVfRezWKmoNyRQskqeyl
         apewaco5SXUIYhGZtpcn//JCuTlfTU4ap34EBkgcv633rCW73itN1fDGSQX6ghw4K4L3
         kWcCVWIie4Dx6RoJ4IIT2fz01Lqae1jBAk+9Jz9h1rHl4btLXFcF6TGrwGRINgqz38lb
         74RFdFBRDDoRxtO/nIdta1Okl3YrRgw+niyTb+X/+QjvRG6Vt4VJ6ZYMV5D6ql9mvdsP
         7HlZ7l5qq3bnTxmYBrn09qjjLSvsr71/87xVmtQw2yVV5jeVNgi7zn0QrE9Uw+Bl5jln
         4grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiRMGs/hF879eTYlkCveIAkgMIO1cM/VpPsdSSJjIbY=;
        b=o96qwaxN3+1Yobh+tBHyUaydZFcZvWHn7msd23yMfmK05P49mNZm82PyZYdsHuy9Oc
         mi0YPzlA1t1Gndj9iCHJBPfx+1W4hBS6ectR2yB0jNIpyOstrEH2wQnELqHidhW2u8A6
         ggtpXb5gfdbYPMVartAXn4URcF6wapMBbN7Cv58xpsT9mWfFRaXrXauDYPAQuiw6IU6g
         5eLOj48O6J9xTaLseM9/ujxqbW5OyinGXglpYGXplqljCHcESDtW4An6fc/PPHptm4Vv
         QYOGj6aJiiXt4AXLr8aadbRAN9/yGf6knwSpzkvowNEx6LbZ6AVuXtyYAXnOMTzqgdf2
         abvw==
X-Gm-Message-State: ANoB5pn5VqhH9RlBtx2t3LNo7p+epPHDi0Z7d/GQ1OagQrziGhWcvQ76
	GartfNr56xlvZIzZgUp0JdLAXeYSolk=
X-Google-Smtp-Source: AA0mqf42pq7g1QwQviT4LOc2Mw1wAYoV+52j0IteCToMSUdXQrJKk5g7lvcZ4CAnaKciIRKHUv7mNg==
X-Received: by 2002:a17:90b:896:b0:213:df24:ed80 with SMTP id bj22-20020a17090b089600b00213df24ed80mr11673935pjb.186.1668393132758;
        Sun, 13 Nov 2022 18:32:12 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/17] powerpc/qspinlock: allow new waiters to steal the lock before queueing
Date: Mon, 14 Nov 2022 12:31:25 +1000
Message-Id: <20221114023137.2679627-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114023137.2679627-1-npiggin@gmail.com>
References: <20221114023137.2679627-1-npiggin@gmail.com>
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

Allow new waiters a number of spins on the lock word before queueing,
which particularly helps paravirt performance when physical CPUs are
oversubscribed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 159 ++++++++++++++++++++++++++++++-----
 1 file changed, 140 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 6c58c24af5a0..872d4628a44d 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -19,8 +19,17 @@ struct qnodes {
 	struct qnode nodes[MAX_NODES];
 };
 
+/* Tuning parameters */
+static int steal_spins __read_mostly = (1<<5);
+static bool maybe_stealers __read_mostly = true;
+
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
+static __always_inline int get_steal_spins(void)
+{
+	return steal_spins;
+}
+
 static inline u32 encode_tail_cpu(int cpu)
 {
 	return (cpu + 1) << _Q_TAIL_CPU_OFFSET;
@@ -50,15 +59,14 @@ static __always_inline void set_locked(struct qspinlock *lock)
 	BUG_ON(prev & _Q_LOCKED_VAL);
 }
 
-/* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
-static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
+static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u32 new)
 {
 	u32 prev;
 
 	BUG_ON(old & _Q_LOCKED_VAL);
 
 	asm volatile(
-"1:	lwarx	%0,0,%1,%4	# trylock_clear_tail_cpu		\n"
+"1:	lwarx	%0,0,%1,%4	# __trylock_cmpxchg			\n"
 "	cmpw	0,%0,%2							\n"
 "	bne-	2f							\n"
 "	stwcx.	%3,0,%1							\n"
@@ -66,13 +74,27 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 ol
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 "2:									\n"
 	: "=&r" (prev)
-	: "r" (&lock->val), "r"(old), "r" (_Q_LOCKED_VAL),
+	: "r" (&lock->val), "r"(old), "r" (new),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
 	return likely(prev == old);
 }
 
+/* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
+static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 val)
+{
+	return __trylock_cmpxchg(lock, val, _Q_LOCKED_VAL);
+}
+
+/* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
+static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
+{
+	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
+
+	return __trylock_cmpxchg(lock, val, newval);
+}
+
 /*
  * Publish our tail, replacing previous tail. Return previous value.
  *
@@ -122,6 +144,30 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
+static inline bool try_to_steal_lock(struct qspinlock *lock)
+{
+	int iters = 0;
+
+	if (!maybe_stealers)
+		return false;
+
+	/* Attempt to steal the lock */
+	do {
+		u32 val = READ_ONCE(lock->val);
+
+		if (unlikely(!(val & _Q_LOCKED_VAL))) {
+			if (trylock_with_tail_cpu(lock, val))
+				return true;
+		} else {
+			cpu_relax();
+		}
+
+		iters++;
+	} while (iters < get_steal_spins());
+
+	return false;
+}
+
 static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
 	struct qnodes *qnodesp;
@@ -171,25 +217,49 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
-	/* We're at the head of the waitqueue, wait for the lock. */
-	for (;;) {
-		val = READ_ONCE(lock->val);
-		if (!(val & _Q_LOCKED_VAL))
-			break;
+	if (!maybe_stealers) {
+		/* We're at the head of the waitqueue, wait for the lock. */
+		for (;;) {
+			val = READ_ONCE(lock->val);
+			if (!(val & _Q_LOCKED_VAL))
+				break;
 
-		cpu_relax();
-	}
+			cpu_relax();
+		}
+
+		/* If we're the last queued, must clean up the tail. */
+		if ((val & _Q_TAIL_CPU_MASK) == tail) {
+			if (trylock_clear_tail_cpu(lock, val))
+				goto release;
+			/* Another waiter must have enqueued. */
+		}
+
+		/* We must be the owner, just set the lock bit and acquire */
+		set_locked(lock);
+	} else {
+again:
+		/* We're at the head of the waitqueue, wait for the lock. */
+		for (;;) {
+			val = READ_ONCE(lock->val);
+			if (!(val & _Q_LOCKED_VAL))
+				break;
 
-	/* If we're the last queued, must clean up the tail. */
-	if ((val & _Q_TAIL_CPU_MASK) == tail) {
-		if (trylock_clear_tail_cpu(lock, val))
-			goto release;
-		/* Another waiter must have enqueued */
+			cpu_relax();
+		}
+
+		/* If we're the last queued, must clean up the tail. */
+		if ((val & _Q_TAIL_CPU_MASK) == tail) {
+			if (trylock_clear_tail_cpu(lock, val))
+				goto release;
+			/* Another waiter must have enqueued, or lock stolen. */
+		} else {
+			if (trylock_with_tail_cpu(lock, val))
+				goto unlock_next;
+		}
+		goto again;
 	}
 
-	/* We must be the owner, just set the lock bit and acquire */
-	set_locked(lock);
-
+unlock_next:
 	/* contended path; must wait for next != NULL (MCS protocol) */
 	while (!(next = READ_ONCE(node->next)))
 		cpu_relax();
@@ -209,6 +279,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
+	if (try_to_steal_lock(lock))
+		return;
+
 	queued_spin_lock_mcs_queue(lock);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
@@ -218,3 +291,51 @@ void pv_spinlocks_init(void)
 {
 }
 #endif
+
+#include <linux/debugfs.h>
+static int steal_spins_set(void *data, u64 val)
+{
+	static DEFINE_MUTEX(lock);
+
+	/*
+	 * The lock slow path has a !maybe_stealers case that can assume
+	 * the head of queue will not see concurrent waiters. That waiter
+	 * is unsafe in the presence of stealers, so must keep them away
+	 * from one another.
+	 */
+
+	mutex_lock(&lock);
+	if (val && !steal_spins) {
+		maybe_stealers = true;
+		/* wait for queue head waiter to go away */
+		synchronize_rcu();
+		steal_spins = val;
+	} else if (!val && steal_spins) {
+		steal_spins = val;
+		/* wait for all possible stealers to go away */
+		synchronize_rcu();
+		maybe_stealers = false;
+	} else {
+		steal_spins = val;
+	}
+	mutex_unlock(&lock);
+
+	return 0;
+}
+
+static int steal_spins_get(void *data, u64 *val)
+{
+	*val = steal_spins;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
+
+static __init int spinlock_debugfs_init(void)
+{
+	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
+
+	return 0;
+}
+device_initcall(spinlock_debugfs_init);
-- 
2.37.2

