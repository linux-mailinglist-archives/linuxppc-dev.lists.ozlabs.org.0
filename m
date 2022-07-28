Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2535838D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:34:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgqX65Rkz3dwn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:34:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PvqbmFrc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PvqbmFrc;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltgm00G7zz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:43 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so1232086pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y3X8CmgX0hPeD0HtI0fFwRVX59AyqW+gnOv8PNn3abE=;
        b=PvqbmFrc5k0jOlkxI95Lobic7tvuv0yvaMr4aV8xAUvls1blncvrYKRvTstQ5o7Dag
         ihd/O2WefE4vF+5PLAslojxtdH/ilXikWC9bPFO4cO5FXjtoGKfbb5Ra8IvJCCGNvM5O
         0QoYXTSAMlxer2+Kx8WJ+IufykEk3bu1LD4vgB9zwDBmrAqbrCExZfiUpzS0O8LY0ue3
         jM0N2w4NZpGPSPiIMoxP+FuofbrlOsSg+gNjW11Iorth8tEakB/bqBEu/INJDLPJ4k/v
         o2OqBI/ePGGa2SIeXkHAWfhG2U09JnCkZDkrsjyzW/aiAhzyzdgj6evTlcaq2peigHlf
         OSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y3X8CmgX0hPeD0HtI0fFwRVX59AyqW+gnOv8PNn3abE=;
        b=DftlB9+MP/O8YYptjOpd9divwB0WQ8i5QGlMf1m3jiLNgM5PCWBrDLiCZ+wyK0+cKv
         eZODJ8BXHCwFKO+4EGGIZhrkP95yfzJhLMCysZgV3lMTw1NzAawglVjQCKcy2AmXz+tY
         1LIQN9UJlV9p0daPA9EWmQf51npPuD9TFrtYA4Nwj+QcVF24P4r/fetR4z9Y2oCs41pU
         L4cBXMpp97TeJx/PBcr1kZbdmULdxSk6lft9jF0ZxR+aAEnjrXB42SpPnIB2aMKwN9wG
         OLXqqXnoFdiZmDrSSFvafKg1LX0wcZZB8Iw2BBGmAeHvyt1jONS8usL9hYp37eaCUkt9
         62/w==
X-Gm-Message-State: AJIora+jMC2D4ia0/0puAaIdNA4sdoysh1VHlcVz9Wi0wT2o0PhSW3VF
	2XSd91F7aFFX4G5Xb1EmZbExF/J/evo=
X-Google-Smtp-Source: AGRyM1taqjr9EZOc4U1ZX8xiPBwUhWqHfPYYrkWtK5fxdjtE6yB6k2DkQvbIMraxQ/Q0rorSmu0iag==
X-Received: by 2002:a17:902:ea06:b0:16d:5c8c:4167 with SMTP id s6-20020a170902ea0600b0016d5c8c4167mr22559193plg.57.1658989900985;
        Wed, 27 Jul 2022 23:31:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/17] powerpc/qspinlock: convert atomic operations to assembly
Date: Thu, 28 Jul 2022 16:31:07 +1000
Message-Id: <20220728063120.2867508-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220728063120.2867508-1-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
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

This uses more optimal ll/sc style access patterns (rather than
cmpxchg), and also sets the EH=1 lock hint on those operations
which acquire ownership of the lock.
---
 arch/powerpc/include/asm/qspinlock.h       | 25 +++++--
 arch/powerpc/include/asm/qspinlock_types.h |  6 +-
 arch/powerpc/lib/qspinlock.c               | 81 +++++++++++++++-------
 3 files changed, 79 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 79a1936fb68d..3ab354159e5e 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -2,28 +2,43 @@
 #ifndef _ASM_POWERPC_QSPINLOCK_H
 #define _ASM_POWERPC_QSPINLOCK_H
 
-#include <linux/atomic.h>
 #include <linux/compiler.h>
 #include <asm/qspinlock_types.h>
 
 static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 {
-	return atomic_read(&lock->val);
+	return READ_ONCE(lock->val);
 }
 
 static __always_inline int queued_spin_value_unlocked(struct qspinlock lock)
 {
-	return !atomic_read(&lock.val);
+	return !lock.val;
 }
 
 static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
 {
-	return !!(atomic_read(&lock->val) & _Q_TAIL_CPU_MASK);
+	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
 }
 
 static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
-	if (atomic_cmpxchg_acquire(&lock->val, 0, _Q_LOCKED_VAL) == 0)
+	u32 new = _Q_LOCKED_VAL;
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
+"	cmpwi	0,%0,0							\n"
+"	bne-	2f							\n"
+"	stwcx.	%2,0,%1							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"2:									\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (new),
+	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
+	: "cr0", "memory");
+
+	if (likely(prev == 0))
 		return 1;
 	return 0;
 }
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 3425dab42576..210adf05b235 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -7,7 +7,7 @@
 
 typedef struct qspinlock {
 	union {
-		atomic_t val;
+		u32 val;
 
 #ifdef __LITTLE_ENDIAN
 		struct {
@@ -23,10 +23,10 @@ typedef struct qspinlock {
 	};
 } arch_spinlock_t;
 
-#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
+#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = 0 } }
 
 /*
- * Bitfields in the atomic value:
+ * Bitfields in the lock word:
  *
  *     0: locked bit
  * 16-31: tail cpu (+1)
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 5ebb88d95636..7c71e5e287df 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-#include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/compiler.h>
 #include <linux/export.h>
@@ -22,32 +21,59 @@ struct qnodes {
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
-static inline int encode_tail_cpu(void)
+static inline u32 encode_tail_cpu(void)
 {
 	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
 }
 
-static inline int get_tail_cpu(int val)
+static inline int get_tail_cpu(u32 val)
 {
 	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
 }
 
 /* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
+/* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void lock_set_locked(struct qspinlock *lock)
 {
-	atomic_or(_Q_LOCKED_VAL, &lock->val);
-	__atomic_acquire_fence();
+	u32 new = _Q_LOCKED_VAL;
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1,%3	# lock_set_locked			\n"
+"	or	%0,%0,%2						\n"
+"	stwcx.	%0,0,%1							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (new),
+	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
+	: "cr0", "memory");
 }
 
-/* Take lock, clearing tail, cmpxchg with val (which must not be locked) */
-static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int val)
+/* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
+static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
 {
-	int newval = _Q_LOCKED_VAL;
-
-	if (atomic_cmpxchg_acquire(&lock->val, val, newval) == val)
+	u32 new = _Q_LOCKED_VAL;
+	u32 prev;
+
+	BUG_ON(old & _Q_LOCKED_VAL);
+
+	asm volatile(
+"1:	lwarx	%0,0,%1,%4	# trylock_clear_tail_cpu		\n"
+"	cmpw	0,%0,%2							\n"
+"	bne-	2f							\n"
+"	stwcx.	%3,0,%1							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"2:									\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r"(old), "r" (new),
+	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
+	: "cr0", "memory");
+
+	if (likely(prev == old))
 		return 1;
-	else
-		return 0;
+	return 0;
 }
 
 /*
@@ -56,20 +82,25 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int va
  * This provides a release barrier for publishing node, and an acquire barrier
  * for getting the old node.
  */
-static __always_inline int publish_tail_cpu(struct qspinlock *lock, int tail)
+static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
 {
-	for (;;) {
-		int val = atomic_read(&lock->val);
-		int newval = (val & ~_Q_TAIL_CPU_MASK) | tail;
-		int old;
-
-		old = atomic_cmpxchg(&lock->val, val, newval);
-		if (old == val)
-			return old;
-	}
+	u32 prev, tmp;
+
+	asm volatile(
+"\t"	PPC_RELEASE_BARRIER "						\n"
+"1:	lwarx	%0,0,%2		# publish_tail_cpu			\n"
+"	andc	%1,%0,%4						\n"
+"	or	%1,%1,%3						\n"
+"	stwcx.	%1,0,%2							\n"
+"	bne-	1b							\n"
+	: "=&r" (prev), "=&r"(tmp)
+	: "r" (&lock->val), "r" (tail), "r"(_Q_TAIL_CPU_MASK)
+	: "cr0", "memory");
+
+	return prev;
 }
 
-static struct qnode *get_tail_qnode(struct qspinlock *lock, int val)
+static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = get_tail_cpu(val);
 	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
@@ -88,7 +119,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
-	int val, old, tail;
+	u32 val, old, tail;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -134,7 +165,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 	}
 
 	/* We're at the head of the waitqueue, wait for the lock. */
-	while ((val = atomic_read(&lock->val)) & _Q_LOCKED_VAL)
+	while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
 		cpu_relax();
 
 	/* If we're the last queued, must clean up the tail. */
-- 
2.35.1

