Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0E62749D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YP61gWHz3cNL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:37:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bEDxlOkp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bEDxlOkp;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHH6d7Zz3cLW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:11 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id s196so9135476pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnHfbjIsxhlF7AVP9pM40xHgiio3lOPgjwAjHTj0Fzs=;
        b=bEDxlOkpW765o+wt0skcWG4MNVl+ajTSiRCzs8maJwvZpgNhZCVasVj8OXvAEbMPSt
         /bol0n8/P8ev5HJIKvxAnUs377r2CM4ZLGzvcjdGHj5B6jLoFut1AYw7t8Puv2Vvt2v0
         waE6NqdRpXyIozKMMn2n8G418ceYpqc8+XCB6QEQIE0Wh+s7kISFu3IFZP7p8DNsI9zZ
         oq9xa3cf7tXWQITZYkH3EAdH/8fVHht37IjPLzt0w/a9RdRAC9cnG5qcT1MnRRUufGvC
         0NVq/xH9eBiZtMCOaft6t5VB7oWxLbQf3k2choAdT+XPXkVr9qAwLaq2t3Zw2vzFy7yF
         v9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnHfbjIsxhlF7AVP9pM40xHgiio3lOPgjwAjHTj0Fzs=;
        b=EVqQN/B2mjzQ+vvZ/bjQoYfvCSBJ8eAXSFyBg4tL/563MSHmRjRi3D9m5L9ob7A25J
         wJlkKt5y91VeO6P3nRZkGYFecZY54dXPjAUB1WVnXvSBbinHOmvywhJ2KCqL+70fglR9
         sdaFt779nPihwvXDu2iswDr4la8CxTd9Wa84K9WSHZcq6RwlRGBRv9OYdS6v6P84p5Qn
         Yq3qfron0Q3S7FM92Rm3fB9HXjmM7xI+I9xdrAvUF/gPMMP/Ho00fCjv+faEuQXtojjQ
         cb3jwk/MgO7AFsk3UfxjTOqu77/Jd26GeMyhlc17jooRtbJqZ4PgfW72bPhzx+/OZnmg
         loFw==
X-Gm-Message-State: ANoB5pnag0TatlJOzX5edDeCJJtVqK6dRgellG4HdmKIORqBTUb0Sjii
	Yk71pV34oguY1sQGPp2ndPwam/2nas0=
X-Google-Smtp-Source: AA0mqf5dxNZyG83brUKvgv0vkxEZkC3tPVRWBEBmJ4k3Sl1nWA4RMHVpjeXc8mB85SqeNzLNIFNPjg==
X-Received: by 2002:a63:4402:0:b0:46a:e819:216c with SMTP id r2-20020a634402000000b0046ae819216cmr10278996pga.155.1668393129073;
        Sun, 13 Nov 2022 18:32:09 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/17] powerpc/qspinlock: convert atomic operations to assembly
Date: Mon, 14 Nov 2022 12:31:24 +1000
Message-Id: <20221114023137.2679627-6-npiggin@gmail.com>
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

This uses more optimal ll/sc style access patterns (rather than
cmpxchg), and also sets the EH=1 lock hint on those operations
which acquire ownership of the lock.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h       | 24 +++++--
 arch/powerpc/include/asm/qspinlock_types.h |  6 +-
 arch/powerpc/lib/qspinlock.c               | 81 +++++++++++++++-------
 3 files changed, 77 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 7bc254c55705..7d300e6883a8 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -2,28 +2,42 @@
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
-	return atomic_cmpxchg_acquire(&lock->val, 0, _Q_LOCKED_VAL) == 0;
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
+	: "r" (&lock->val), "r" (_Q_LOCKED_VAL),
+	  "i" (IS_ENABLED(CONFIG_PPC64))
+	: "cr0", "memory");
+
+	return likely(prev == 0);
 }
 
 void queued_spin_lock_slowpath(struct qspinlock *lock);
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
index f3c3d5128bd5..6c58c24af5a0 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-#include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/compiler.h>
 #include <linux/export.h>
@@ -22,31 +21,56 @@ struct qnodes {
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
-static inline int encode_tail_cpu(int cpu)
+static inline u32 encode_tail_cpu(int cpu)
 {
 	return (cpu + 1) << _Q_TAIL_CPU_OFFSET;
 }
 
-static inline int decode_tail_cpu(int val)
+static inline int decode_tail_cpu(u32 val)
 {
 	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
 }
 
-/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
+/* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void set_locked(struct qspinlock *lock)
 {
-	atomic_or(_Q_LOCKED_VAL, &lock->val);
-	__atomic_acquire_fence();
+	u32 prev, tmp;
+
+	asm volatile(
+"1:	lwarx	%0,0,%2,%4	# set_locked				\n"
+"	or	%1,%0,%3						\n"
+"	stwcx.	%1,0,%2							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+	: "=&r" (prev), "=&r" (tmp)
+	: "r" (&lock->val), "i" (_Q_LOCKED_VAL),
+	  "i" (IS_ENABLED(CONFIG_PPC64))
+	: "cr0", "memory");
+
+	BUG_ON(prev & _Q_LOCKED_VAL);
 }
 
-/* Take lock, clearing tail, cmpxchg with val (which must not be locked) */
-static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int val)
+/* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
+static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
 {
-	int newval = _Q_LOCKED_VAL;
-
-	BUG_ON(val & _Q_LOCKED_VAL);
-
-	return atomic_cmpxchg_acquire(&lock->val, val, newval) == val;
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
+	: "r" (&lock->val), "r"(old), "r" (_Q_LOCKED_VAL),
+	  "i" (IS_ENABLED(CONFIG_PPC64))
+	: "cr0", "memory");
+
+	return likely(prev == old);
 }
 
 /*
@@ -56,20 +80,25 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, int va
  * acquire barrier in get_tail_qnode() when the next CPU finds this tail
  * value.
  */
-static __always_inline int publish_tail_cpu(struct qspinlock *lock, int tail)
+static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
 {
-	for (;;) {
-		int val = atomic_read(&lock->val);
-		int newval = (val & ~_Q_TAIL_CPU_MASK) | tail;
-		int old;
-
-		old = atomic_cmpxchg_release(&lock->val, val, newval);
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
 	int cpu = decode_tail_cpu(val);
 	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
@@ -97,7 +126,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
-	int val, old, tail;
+	u32 val, old, tail;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -144,7 +173,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 	/* We're at the head of the waitqueue, wait for the lock. */
 	for (;;) {
-		val = atomic_read(&lock->val);
+		val = READ_ONCE(lock->val);
 		if (!(val & _Q_LOCKED_VAL))
 			break;
 
-- 
2.37.2

