Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF4639517
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6h745vSz3f7b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:01:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UHVGmCRI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UHVGmCRI;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fG3Nbmz3bhv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 20:59:50 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d3so960169plr.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 01:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGP73fdJuAg75ShdZDLVnvxLeN8f2eEzloqDQZRSINA=;
        b=UHVGmCRIgVmZyoKEYg/6Q7AnxZu1vRfqK9+dBOPHaFrjWQUMBeXt516jE+2AOWfezp
         E6P8Wh6gxYOm9HaUUWyy2+UKJzN0R2Yr81snsguZw6/4SBE7synOC4WslbuzTmnyLVz7
         YY4tVY/OoU9XSJ4/598iURSVM9TqmFREpGumniovLdNoZtdxbbUASkPwaSI1oaYWO601
         UQzR2nRPuqgXZCDyuYFkfHRG5GoRr90jBfNyui+L6iXPaaUMhSpTQAgMPgqI845IBTqJ
         0m54trTLJNgs+jJ1z0PRpKolz8wdy6tmXzO37nJyhjhdgtNLjc+AKmvT01UsaxMoC81D
         H/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGP73fdJuAg75ShdZDLVnvxLeN8f2eEzloqDQZRSINA=;
        b=IUfYpfPP8nwRTn8v1mdnHPi5pdB1WzmdjSUrtH47aPPsIab7ngjfjrbaUTisX1q5y/
         YZprT89KvZSXZB1e8fdGE7UbYtBUXtxzhHXGYfkiazQ5qLA2gSWhAIAdYOdiFCT6num+
         pcx7a/5jf9ID0FaohYEPhpwrvkbV3yQSqsTaEHnumORsU2QR2vOze97Qi8ViqSzgugjk
         VquwSbuZL+jjOsyZL+ZIcpn4xFE2/3M4s5Bh3tLq/3AtSJaeUcivWCETr2sMdqnjxYkv
         i2aQr7EN7Cv5pKOHYVBt2Mtv84FNj8V9ujkTkgZHnQbpGaYV+mh37GGOyAOOL47k9sDy
         HScw==
X-Gm-Message-State: ANoB5pliQm2vkh47mQ//DjPfcgW8oWzW2BC4IF4owDj9AYOYnZhn6/Ix
	d2XRWYu/JLRZtYqEDionbG3Cp/qqWBJd5A==
X-Google-Smtp-Source: AA0mqf7/o+RPdLSZRJYN8NnVGoG+VTb16fLQVLLt8oZudGhGKNhiCRljRw9JqD0i90OxOZSkuZ4Ckw==
X-Received: by 2002:a17:90a:dc06:b0:218:9196:1cd1 with SMTP id i6-20020a17090adc0600b0021891961cd1mr37969572pjv.230.1669456787319;
        Sat, 26 Nov 2022 01:59:47 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:59:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/17] powerpc/qspinlock: add mcs queueing for contended waiters
Date: Sat, 26 Nov 2022 19:59:16 +1000
Message-Id: <20221126095932.1234527-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
References: <20221126095932.1234527-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This forms the basis of the qspinlock slow path.

Like generic qspinlocks and unlike the vanilla MCS algorithm, the lock
owner does not participate in the queue, only waiters. The first waiter
spins on the lock word, then when the lock is released it takes
ownership and unqueues the next waiter. This is how qspinlocks can be
implemented with the spinlock API -- lock owners don't need a node, only
waiters do.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h       |  10 +-
 arch/powerpc/include/asm/qspinlock_types.h |  23 +++
 arch/powerpc/lib/qspinlock.c               | 187 ++++++++++++++++++++-
 3 files changed, 214 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index b1443aab2145..300c7d2ebe2e 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -18,12 +18,12 @@ static __always_inline int queued_spin_value_unlocked(struct qspinlock lock)
 
 static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
 {
-	return 0;
+	return !!(atomic_read(&lock->val) & _Q_TAIL_CPU_MASK);
 }
 
 static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
-	return atomic_cmpxchg_acquire(&lock->val, 0, 1) == 0;
+	return atomic_cmpxchg_acquire(&lock->val, 0, _Q_LOCKED_VAL) == 0;
 }
 
 void queued_spin_lock_slowpath(struct qspinlock *lock);
@@ -36,7 +36,11 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
-	atomic_set_release(&lock->val, 0);
+	for (;;) {
+		int val = atomic_read(&lock->val);
+		if (atomic_cmpxchg_release(&lock->val, val, val & ~_Q_LOCKED_VAL) == val)
+			return;
+	}
 }
 
 #define arch_spin_is_locked(l)		queued_spin_is_locked(l)
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 59606bc0c774..20a36dfb14e2 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -10,4 +10,27 @@ typedef struct qspinlock {
 
 #define	__ARCH_SPIN_LOCK_UNLOCKED	{ .val = ATOMIC_INIT(0) }
 
+/*
+ * Bitfields in the lock word:
+ *
+ *     0: locked bit
+ *  1-16: unused bits
+ * 17-31: tail cpu (+1)
+ */
+#define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
+				      << _Q_ ## type ## _OFFSET)
+/* 0x00000001 */
+#define _Q_LOCKED_OFFSET	0
+#define _Q_LOCKED_BITS		1
+#define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
+
+/* 0xfffe0000 */
+#define _Q_TAIL_CPU_OFFSET	17
+#define _Q_TAIL_CPU_BITS	15
+#define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)
+
+#if CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS)
+#error "qspinlock does not support such large CONFIG_NR_CPUS"
+#endif
+
 #endif /* _ASM_POWERPC_QSPINLOCK_TYPES_H */
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 1c669b5b4607..86504628501e 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -1,12 +1,193 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/atomic.h>
+#include <linux/bug.h>
+#include <linux/compiler.h>
 #include <linux/export.h>
-#include <linux/processor.h>
+#include <linux/percpu.h>
+#include <linux/smp.h>
 #include <asm/qspinlock.h>
 
-void queued_spin_lock_slowpath(struct qspinlock *lock)
+#define MAX_NODES	4
+
+struct qnode {
+	struct qnode	*next;
+	struct qspinlock *lock;
+	u8		locked; /* 1 if lock acquired */
+};
+
+struct qnodes {
+	int		count;
+	struct qnode nodes[MAX_NODES];
+};
+
+static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
+
+static inline int encode_tail_cpu(int cpu)
+{
+	return (cpu + 1) << _Q_TAIL_CPU_OFFSET;
+}
+
+static inline int decode_tail_cpu(int val)
+{
+	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
+}
+
+/*
+ * Try to acquire the lock if it was not already locked. If the tail matches
+ * mytail then clear it, otherwise leave it unchnaged. Return previous value.
+ *
+ * This is used by the head of the queue to acquire the lock and clean up
+ * its tail if it was the last one queued.
+ */
+static __always_inline int set_locked_clean_tail(struct qspinlock *lock, int tail)
+{
+	int val = atomic_read(&lock->val);
+
+	BUG_ON(val & _Q_LOCKED_VAL);
+
+	/* If we're the last queued, must clean up the tail. */
+	if ((val & _Q_TAIL_CPU_MASK) == tail) {
+		if (atomic_cmpxchg_acquire(&lock->val, val, _Q_LOCKED_VAL) == val)
+			return val;
+		/* Another waiter must have enqueued */
+		val = atomic_read(&lock->val);
+		BUG_ON(val & _Q_LOCKED_VAL);
+	}
+
+	/* We must be the owner, just set the lock bit and acquire */
+	atomic_or(_Q_LOCKED_VAL, &lock->val);
+	__atomic_acquire_fence();
+
+	return val;
+}
+
+/*
+ * Publish our tail, replacing previous tail. Return previous value.
+ *
+ * This provides a release barrier for publishing node, this pairs with the
+ * acquire barrier in get_tail_qnode() when the next CPU finds this tail
+ * value.
+ */
+static __always_inline int publish_tail_cpu(struct qspinlock *lock, int tail)
+{
+	for (;;) {
+		int val = atomic_read(&lock->val);
+		int newval = (val & ~_Q_TAIL_CPU_MASK) | tail;
+		int old;
+
+		old = atomic_cmpxchg_release(&lock->val, val, newval);
+		if (old == val)
+			return old;
+	}
+}
+
+static struct qnode *get_tail_qnode(struct qspinlock *lock, int val)
+{
+	int cpu = decode_tail_cpu(val);
+	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
+	int idx;
+
+	/*
+	 * After publishing the new tail and finding a previous tail in the
+	 * previous val (which is the control dependency), this barrier
+	 * orders the release barrier in publish_tail_cpu performed by the
+	 * last CPU, with subsequently looking at its qnode structures
+	 * after the barrier.
+	 */
+	smp_acquire__after_ctrl_dep();
+
+	for (idx = 0; idx < MAX_NODES; idx++) {
+		struct qnode *qnode = &qnodesp->nodes[idx];
+		if (qnode->lock == lock)
+			return qnode;
+	}
+
+	BUG();
+}
+
+static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
-	while (!queued_spin_trylock(lock))
+	struct qnodes *qnodesp;
+	struct qnode *next, *node;
+	int val, old, tail;
+	int idx;
+
+	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
+
+	qnodesp = this_cpu_ptr(&qnodes);
+	if (unlikely(qnodesp->count >= MAX_NODES)) {
+		while (!queued_spin_trylock(lock))
+			cpu_relax();
+		return;
+	}
+
+	idx = qnodesp->count++;
+	/*
+	 * Ensure that we increment the head node->count before initialising
+	 * the actual node. If the compiler is kind enough to reorder these
+	 * stores, then an IRQ could overwrite our assignments.
+	 */
+	barrier();
+	node = &qnodesp->nodes[idx];
+	node->next = NULL;
+	node->lock = lock;
+	node->locked = 0;
+
+	tail = encode_tail_cpu(smp_processor_id());
+
+	old = publish_tail_cpu(lock, tail);
+
+	/*
+	 * If there was a previous node; link it and wait until reaching the
+	 * head of the waitqueue.
+	 */
+	if (old & _Q_TAIL_CPU_MASK) {
+		struct qnode *prev = get_tail_qnode(lock, old);
+
+		/* Link @node into the waitqueue. */
+		WRITE_ONCE(prev->next, node);
+
+		/* Wait for mcs node lock to be released */
+		while (!node->locked)
+			cpu_relax();
+
+		smp_rmb(); /* acquire barrier for the mcs lock */
+	}
+
+	/* We're at the head of the waitqueue, wait for the lock. */
+	for (;;) {
+		val = atomic_read(&lock->val);
+		if (!(val & _Q_LOCKED_VAL))
+			break;
+
+		cpu_relax();
+	}
+
+	/* If we're the last queued, must clean up the tail. */
+	old = set_locked_clean_tail(lock, tail);
+	if ((old & _Q_TAIL_CPU_MASK) == tail)
+		goto release; /* Another waiter must have enqueued */
+
+	/* There is a next, must wait for node->next != NULL (MCS protocol) */
+	while (!(next = READ_ONCE(node->next)))
 		cpu_relax();
+
+	/*
+	 * Unlock the next mcs waiter node. Release barrier is not required
+	 * here because the acquirer is only accessing the lock word, and
+	 * the acquire barrier we took the lock with orders that update vs
+	 * this store to locked. The corresponding barrier is the smp_rmb()
+	 * acquire barrier for mcs lock, above.
+	 */
+	WRITE_ONCE(next->locked, 1);
+
+release:
+	qnodesp->count--; /* release the node */
+}
+
+void queued_spin_lock_slowpath(struct qspinlock *lock)
+{
+	queued_spin_lock_mcs_queue(lock);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
-- 
2.37.2

