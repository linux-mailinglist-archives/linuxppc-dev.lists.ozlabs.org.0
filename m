Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E90ED56D333
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:06:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh81W5zQBz3f0S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:06:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XuwK9ZCM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XuwK9ZCM;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zR1HTmz3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:07 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id b9so3681928pfp.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lSou1iY8NAwrGFoX+ejzklzdAJG+1HYgkHfIjoYr2Jo=;
        b=XuwK9ZCMnPPFmy5mZ1agOWvmD/xBkYY45RvPF3GB6QsKoImE/iAduBfhEmdDkh/AdE
         zbdSNnV8IUaYi6blr7Px4qnlyokKEjlfnDAOgsZXrxMLbh1dXxz17uvmlGBb0VgjdPyl
         tp+NN6P5MooeGqYd7sfPB7mfQD6ipK65GKy1EXRx0dEfTS9RD6ZDK109nHZ+B+2AslhQ
         Njog9xj1Th+5DmkePa7jBjU6iPJ15kNycixDSWzMtSHSX1AtnNXvKWtKgflH77P49kcL
         EtNKj8MarVlsgMXgjK7Rv+n78Qhk92oqaCtOsS1e0g0oDyjxrigQ47qnv4MEjoDUU5Vs
         NIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lSou1iY8NAwrGFoX+ejzklzdAJG+1HYgkHfIjoYr2Jo=;
        b=p+zoXahnMZYN3yhiRBqsNMymK/HqG/wx+f4jFiJZudYsFkvtSdbrAUcTOTkPgbK3GL
         uzI4079cRckDHgDWPjgHuY/RZ4r0G7/ghyRWBgRjym/K2F0beKvcyZ/+uscsZCIS+3QX
         VFL8pZog1Q8/NhKRlWNrYYKOayYNfkIgCxmp7BqJ4CG30KC0GWMDkjWQrEAoBECRtlug
         JlPMRt5RGHXAPKeliX+mSPZld9eeC5c2KlteB9+B/yXyXh+DnkAdk+N3TcdI8QlLPfyg
         VWJy/GZ264b2g4yrPqhy2H41jh9ypxUaG8aQrQQZWTqSnVHfCcBohRELEr8M9PGpRWah
         D4Sg==
X-Gm-Message-State: AJIora/5Afjiha2Fop8cR6PztqNU4eiy9G7iMkmBojU5+ipKZAtDCl4g
	LNYKb9RkEGkm5J/rOkNI7fu2rj2mZzQ=
X-Google-Smtp-Source: AGRyM1su6piqagYVg+WwinCJbEwNy5ztxNEL4tPJICfy1E7gs2qo7qGXjcFqFjSBxfdq56U8iYUPpQ==
X-Received: by 2002:a63:5441:0:b0:412:64de:5f35 with SMTP id e1-20020a635441000000b0041264de5f35mr14084406pgm.321.1657508705234;
        Sun, 10 Jul 2022 20:05:05 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 02/14] powerpc/qspinlock: add mcs queueing for contended waiters
Date: Mon, 11 Jul 2022 13:04:41 +1000
Message-Id: <20220711030453.150644-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711030453.150644-1-npiggin@gmail.com>
References: <20220711030453.150644-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This forms the basis of the qspinlock slow path.

Like generic qspinlocks and unlike the vanilla MCS algorithm, the lock
owner does not participate in the queue, only waiters. The first waiter
spins on the lock word, then when the lock is released it takes
ownership and unqueues the next waiter. This is how qspinlocks can be
implemented with the spinlock API -- lock owners don't need a node, only
waiters do.
---
 arch/powerpc/include/asm/qspinlock.h       |  10 +-
 arch/powerpc/include/asm/qspinlock_types.h |  21 +++
 arch/powerpc/lib/qspinlock.c               | 166 ++++++++++++++++++++-
 3 files changed, 191 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index cb2b4f91e976..f06117aa60e1 100644
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
-	if (atomic_cmpxchg_acquire(&lock->val, 0, 1) == 0)
+	if (atomic_cmpxchg_acquire(&lock->val, 0, _Q_LOCKED_VAL) == 0)
 		return 1;
 	return 0;
 }
@@ -38,7 +38,11 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 
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
index 8dbce99a373c..c65f7719a188 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -1,12 +1,172 @@
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
+static inline int encode_tail_cpu(void)
+{
+	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
+}
+
+static inline int get_tail_cpu(int val)
+{
+	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
+}
+
+/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
+static __always_inline void lock_set_locked(struct qspinlock *lock)
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
+	if (atomic_cmpxchg_acquire(&lock->val, val, newval) == val)
+		return 1;
+	else
+		return 0;
+}
+
+/*
+ * Publish our tail, replacing previous tail. Return previous value.
+ *
+ * This provides a release barrier for publishing node, and an acquire barrier
+ * for getting the old node.
+ */
+static __always_inline int publish_tail_cpu(struct qspinlock *lock, int tail)
 {
-	while (!queued_spin_trylock(lock))
+	for (;;) {
+		int val = atomic_read(&lock->val);
+		int newval = (val & ~_Q_TAIL_CPU_MASK) | tail;
+		int old;
+
+		old = atomic_cmpxchg(&lock->val, val, newval);
+		if (old == val)
+			return old;
+	}
+}
+
+static inline struct qnode *get_tail_qnode(struct qspinlock *lock, int val)
+{
+	int cpu = get_tail_cpu(val);
+	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
+	int idx;
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
+{
+	struct qnodes *qnodesp;
+	struct qnode *next, *node;
+	int val, old, tail;
+	int idx;
+
+	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
+
+	qnodesp = this_cpu_ptr(&qnodes);
+	if (unlikely(qnodesp->count == MAX_NODES)) {
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
+	tail = encode_tail_cpu();
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
+	while ((val = atomic_read(&lock->val)) & _Q_LOCKED_VAL)
+		cpu_relax();
+
+	/* If we're the last queued, must clean up the tail. */
+	if ((val & _Q_TAIL_CPU_MASK) == tail) {
+		if (trylock_clear_tail_cpu(lock, val))
+			goto release;
+		/* Another waiter must have enqueued */
+	}
+
+	/* We must be the owner, just set the lock bit and acquire */
+	lock_set_locked(lock);
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
2.35.1

