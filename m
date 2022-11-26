Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D98863951C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:03:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6kJ2fxtz3fC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:03:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kULUuir2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kULUuir2;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fN1VHYz3f2q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 20:59:55 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id a16so5705930pfg.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 01:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ehrC4Nm6UZtrpvBU9PaHVj1Z37drtTfQ5iMySnIvfg=;
        b=kULUuir2XssMRRKl6AxabFzAD+CFklybKi74/QxkSsRGXvUioINF5rtACJFTmCBsK2
         zbtPXCC5JHxxf3AgTxr0Tb5AUFbx8uwIgJc4Sr6fL/y6J5dFcLf15W9G4tm1fIBoyKVC
         /6z4Lcor9N7V/kn2su0bgD/RjFRsAUYh5B684qck6G77DlLuXK1bJzKbEEWMoDxBlLwJ
         xre1/ZiEqX8AH91KOsrXHYR3n15pdhOatmvEhPnWBJpuEVVaX4WJK/IfqdNvFIM3nRM4
         Zx+EnNqmXxEjJhLna/IsuxwnuzzGRhcNn+C2MyA8NQtU3OJLlYydKOpvBMOUVElnlo/G
         X57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ehrC4Nm6UZtrpvBU9PaHVj1Z37drtTfQ5iMySnIvfg=;
        b=ae1LpDznsRXIz/DnE0TX1A7oMvmyHQXZf48FNe8tfd9fRVmTZ4XJhWy8HOqx4+HD7b
         YlGBT8IRvHRmApOFsQqQWaJ26fNDjLbJmk/ONtPzWcmYHk9/yMIx0bD+o52QePbNUhIc
         ea7HGZe13EneKKJfU9/rfJ5lbMDvAF7MY8MRtPQ2+Ca19ZcID+5pVED+2+wtcj+j5pYS
         swKJNXvIdsxeJztneXo+72YvzO+Egknsmbj5c6opqFY89Ttj9H4f7zkjkTA0ffueF3Jc
         s6btrj5rzawFoHFUtFkZdkbewO18S3VmiwLAJL0u5ib6uKGbfdnN5vsvCXcsMJDGla89
         jIEA==
X-Gm-Message-State: ANoB5plvlbBgFRiE1ia0GOPjLCpJ/IJZBbMJekRqHQuL+u10fC/8Vkru
	zjPRZxPW70gcHy0campJZ5TjqT4UU88JEw==
X-Google-Smtp-Source: AA0mqf4NxLdOo5HQ2nhFX4kG03O4UAZWTtihfiS96zsxQ0J8gERnlQkhhFEEAJqAFymeYqYwOKWzUw==
X-Received: by 2002:a63:560f:0:b0:476:ed2a:621a with SMTP id k15-20020a63560f000000b00476ed2a621amr19750535pgb.557.1669456793234;
        Sat, 26 Nov 2022 01:59:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:59:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/17] powerpc/qspinlock: convert atomic operations to assembly
Date: Sat, 26 Nov 2022 19:59:18 +1000
Message-Id: <20221126095932.1234527-4-npiggin@gmail.com>
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

This uses more optimal ll/sc style access patterns (rather than
cmpxchg), and also sets the EH=1 lock hint on those operations
which acquire ownership of the lock.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h       | 24 +++++--
 arch/powerpc/include/asm/qspinlock_types.h |  4 +-
 arch/powerpc/lib/qspinlock.c               | 82 +++++++++++++---------
 3 files changed, 68 insertions(+), 42 deletions(-)

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
index fe87181c59e5..b9a5a52fa670 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -7,7 +7,7 @@
 
 typedef struct qspinlock {
 	union {
-		atomic_t val;
+		u32 val;
 
 #ifdef __LITTLE_ENDIAN
 		struct {
@@ -23,7 +23,7 @@ typedef struct qspinlock {
 	};
 } arch_spinlock_t;
 
-#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
+#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = 0 } }
 
 /*
  * Bitfields in the lock word:
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 86504628501e..645d9affacfd 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-#include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/compiler.h>
 #include <linux/export.h>
@@ -22,12 +21,12 @@ struct qnodes {
 
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
@@ -39,26 +38,34 @@ static inline int decode_tail_cpu(int val)
  * This is used by the head of the queue to acquire the lock and clean up
  * its tail if it was the last one queued.
  */
-static __always_inline int set_locked_clean_tail(struct qspinlock *lock, int tail)
+static __always_inline u32 set_locked_clean_tail(struct qspinlock *lock, u32 tail)
 {
-	int val = atomic_read(&lock->val);
-
-	BUG_ON(val & _Q_LOCKED_VAL);
-
-	/* If we're the last queued, must clean up the tail. */
-	if ((val & _Q_TAIL_CPU_MASK) == tail) {
-		if (atomic_cmpxchg_acquire(&lock->val, val, _Q_LOCKED_VAL) == val)
-			return val;
-		/* Another waiter must have enqueued */
-		val = atomic_read(&lock->val);
-		BUG_ON(val & _Q_LOCKED_VAL);
-	}
-
-	/* We must be the owner, just set the lock bit and acquire */
-	atomic_or(_Q_LOCKED_VAL, &lock->val);
-	__atomic_acquire_fence();
-
-	return val;
+	u32 newval = _Q_LOCKED_VAL;
+	u32 prev, tmp;
+
+	asm volatile(
+"1:	lwarx	%0,0,%2,%6	# set_locked_clean_tail			\n"
+	/* Test whether the lock tail == tail */
+"	and	%1,%0,%5						\n"
+"	cmpw	0,%1,%3							\n"
+	/* Merge the new locked value */
+"	or	%1,%1,%4						\n"
+"	bne	2f							\n"
+	/* If the lock tail matched, then clear it, otherwise leave it. */
+"	andc	%1,%1,%5						\n"
+"2:	stwcx.	%1,0,%2							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"3:									\n"
+	: "=&r" (prev), "=&r" (tmp)
+	: "r" (&lock->val), "r"(tail), "r" (newval),
+	  "r" (_Q_TAIL_CPU_MASK),
+	  "i" (IS_ENABLED(CONFIG_PPC64))
+	: "cr0", "memory");
+
+	BUG_ON(prev & _Q_LOCKED_VAL);
+
+	return prev;
 }
 
 /*
@@ -68,20 +75,25 @@ static __always_inline int set_locked_clean_tail(struct qspinlock *lock, int tai
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
@@ -109,7 +121,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
-	int val, old, tail;
+	u32 val, old, tail;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -156,7 +168,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 	/* We're at the head of the waitqueue, wait for the lock. */
 	for (;;) {
-		val = atomic_read(&lock->val);
+		val = READ_ONCE(lock->val);
 		if (!(val & _Q_LOCKED_VAL))
 			break;
 
-- 
2.37.2

