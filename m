Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E191062749B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:35:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YM455Djz3f7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:35:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZObpSHoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZObpSHoX;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YH86tc9z2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:04 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id g62so9773018pfb.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIhJaoXuWaovgk4L1YJAy7HFH+S6ZwNNpXO7ndwl8Sg=;
        b=ZObpSHoXE4TFYfxL80z0Q8FbW05RQLkMVa+c2QJnihVo7iZsBmn4RCpgh+UG4mSV26
         90uY9CSbCXg6P/zyWLrVi3e3gV3lbPA1+3ceLMZoUwRZ6FkRBDFeA0+Z4t12NODgfbxk
         vdwC10MjcPStcHHAJBHlcnq8b1yWQ4Qr8TuO9PjuhPurUiB/sVt4hgjehHARbLUT0kC0
         hakpxhRTGYgM2aNAM3PRvgWhUMOrw+Nyj2DlP8yizKWXd4mq9BxNyzLjLLR5YZp7A23x
         Nr/6IPjQEuK4X01p52FeDzRPXcqoebpOu0CaDbilwI0WBinjXpu5daHlX7CF1nK1IEHV
         wRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIhJaoXuWaovgk4L1YJAy7HFH+S6ZwNNpXO7ndwl8Sg=;
        b=27eC4HX+vtb+K+izABgcfvyZIoIvcfcJz6apSAehA23KuQktqIfgWDaej8OefwMn86
         eB/PY9ZZX0+YaBHHTo5LKYYKWo2IGNkaV4gX1rp5LasbVdb4dQh9XKUnKKpCEsEsUah9
         rS7J2+68Z/KsBTajTmM50lx5H5wg5vsVz6+K9HXApv3kj7Gt+qsdFDrOsJJyFxBt0r1t
         Fj02cnNpcXwzTTp7xpuqfhnusc/EbC2IjTR4O6f9l0zBZfFri5FQrO0C785jo5QVnQ5Z
         SANy8hileh4MwnItP0gy6EelHLbbR4MAazHhxq7j0SIVrzpmyd4+MMgSIyNekghPFOVv
         8KtQ==
X-Gm-Message-State: ANoB5pn9VHwJl+cy9TTD/DbFe5+GZmr7v+vi73S2gLeD0ntKaIyIFGDv
	ag9BI/kDckkfPexsCQDp8GN4fthIXj8=
X-Google-Smtp-Source: AA0mqf7zLE7c4x1dHmEgO2eK7eUdL67ttTl+PxXigRIxAdNbYGP8b3b5VM0adSiek75V/ufy3gjaSw==
X-Received: by 2002:a05:6a00:1f13:b0:567:546c:718b with SMTP id be19-20020a056a001f1300b00567546c718bmr12115782pfb.17.1668393121995;
        Sun, 13 Nov 2022 18:32:01 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/17] powerpc/qspinlock: add mcs queueing for contended waiters
Date: Mon, 14 Nov 2022 12:31:22 +1000
Message-Id: <20221114023137.2679627-4-npiggin@gmail.com>
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
 arch/powerpc/include/asm/qspinlock_types.h |  21 +++
 arch/powerpc/lib/qspinlock.c               | 180 ++++++++++++++++++++-
 3 files changed, 205 insertions(+), 6 deletions(-)

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
index 59606bc0c774..9630e714c70d 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -10,4 +10,25 @@ typedef struct qspinlock {
 
 #define	__ARCH_SPIN_LOCK_UNLOCKED	{ .val = ATOMIC_INIT(0) }
 
+/*
+ * Bitfields in the atomic value:
+ *
+ *     0: locked bit
+ * 16-31: tail cpu (+1)
+ */
+#define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
+				      << _Q_ ## type ## _OFFSET)
+#define _Q_LOCKED_OFFSET	0
+#define _Q_LOCKED_BITS		1
+#define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
+#define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
+
+#define _Q_TAIL_CPU_OFFSET	16
+#define _Q_TAIL_CPU_BITS	(32 - _Q_TAIL_CPU_OFFSET)
+#define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)
+
+#if CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS)
+#error "qspinlock does not support such large CONFIG_NR_CPUS"
+#endif
+
 #endif /* _ASM_POWERPC_QSPINLOCK_TYPES_H */
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 1c669b5b4607..f3c3d5128bd5 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -1,12 +1,186 @@
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
+/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
+static __always_inline void set_locked(struct qspinlock *lock)
+{
+	atomic_or(_Q_LOCKED_VAL, &lock->val);
+	__atomic_acquire_fence();
+}
+
+/* Take lock, clearing tail, cmpxchg with val (which must not be locked) */
+static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int val)
+{
+	int newval = _Q_LOCKED_VAL;
+
+	BUG_ON(val & _Q_LOCKED_VAL);
+
+	return atomic_cmpxchg_acquire(&lock->val, val, newval) == val;
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
+	if ((val & _Q_TAIL_CPU_MASK) == tail) {
+		if (trylock_clear_tail_cpu(lock, val))
+			goto release;
+		/* Another waiter must have enqueued */
+	}
+
+	/* We must be the owner, just set the lock bit and acquire */
+	set_locked(lock);
+
+	/* contended path; must wait for next != NULL (MCS protocol) */
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

