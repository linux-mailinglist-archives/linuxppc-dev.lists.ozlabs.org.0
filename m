Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742763951E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6lK0Yrtz3fDf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:04:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PQsZ18h/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PQsZ18h/;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fQ74Vgz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 20:59:58 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id mv18so5502694pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 01:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIuyypJS2oehQj26FQVIhC1ehQU+4Vz6HvODwr1U4xM=;
        b=PQsZ18h/1EtxLFqmapDe566egjcluY/V0kKp4NA1Qv9UEdLhJPbmUCvIwCJ2gcrzsl
         u/npuAG/rLEUy3xESd0qU5De9xS8N0hY8DokzlzHsIIKsNS/gKcbJd+aVPXeH/9Jn8U8
         o52TcXuQ7vGASwlIsXqiitaCVbIjKZW9VrF8PhBX2M613FysxhHVZGe+OdUi88TZS2T2
         Tm3GrJbqMz9MdUWuoucUUM3i6k+OVaT+OsWc/OclNz/UbyJmYA572sx+GjOcHzOJ/E72
         hAUQj0GPvqj65YIktFEntF3r98+L/f/Q8XOCNpoPP2pm1ZMRsrkmaOlDIx7Afd4XMLiK
         Q6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIuyypJS2oehQj26FQVIhC1ehQU+4Vz6HvODwr1U4xM=;
        b=Rxt4HttnYTkpjXwpGx9ipqWbYzwsuqdfxSkUFVMrsmDqt5nZmo1n47vqupmKDRaMEQ
         N9aGmVFM6ezUl+qQrNlEmxir09JmcSfbcdfp0xd8gaXklaNFmziIJ4wK4VMxtVsYzNcH
         Ih5NomSaSg3nkxJOsCM9dHVsjZNgJPAzsBCuqO8d/eZ+qdXjPGtXhFs/3PAF8lfCjIfQ
         rQem8dW7BxgkaWW84j296nx8UXmNTzsKz7xVOhY4JPfqV0beAzQvL/YTuRA22DLPGSSP
         0//ayDATl5jqockB3TkrF4passW0YjZs8pOiljr/BgcCGERw0g4dsa32eqvYRYtF5Z1P
         ykQQ==
X-Gm-Message-State: ANoB5pnd0QL3bvbXfi4/E9Q/8M2ZMshBriTJp6ELEi54WAU5Vq5tia6i
	+d2OyI/oUIb0RpP29IJh8cNauCy39Do4fA==
X-Google-Smtp-Source: AA0mqf7HBWSkjpkgo5+/dIfWuiAZgfI0YOBOXuY41jn8jtjm2Hzw4Mx6LpkhmdzrKJ9Z42lIAChYfw==
X-Received: by 2002:a17:90b:2494:b0:211:906a:f8ef with SMTP id nt20-20020a17090b249400b00211906af8efmr44837718pjb.71.1669456796193;
        Sat, 26 Nov 2022 01:59:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:59:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/17] powerpc/qspinlock: allow new waiters to steal the lock before queueing
Date: Sat, 26 Nov 2022 19:59:19 +1000
Message-Id: <20221126095932.1234527-5-npiggin@gmail.com>
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

Allow new waiters to "steal" the lock before queueing. That is, to
acquire it while other CPUs have queued.

This particularly helps paravirt performance when physical CPUs are
oversubscribed, by keeping the lock from becoming a strict FIFO and
vCPU preemption causing queue train wrecks.

The new __queued_spin_trylock_steal() function is put in qspinlock.h
to save having to move it, because it will be used there by a later
change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h |  23 ++++++
 arch/powerpc/lib/qspinlock.c         | 110 ++++++++++++++++++++++++---
 2 files changed, 124 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 7d300e6883a8..2a6f12a2c385 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -40,6 +40,29 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 	return likely(prev == 0);
 }
 
+static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
+{
+	u32 prev, tmp;
+
+	/* Trylock may get ahead of queued nodes if it finds unlocked */
+	asm volatile(
+"1:	lwarx	%0,0,%2,%5	# __queued_spin_trylock_steal		\n"
+"	andc.	%1,%0,%4						\n"
+"	bne-	2f							\n"
+"	and	%1,%0,%4						\n"
+"	or	%1,%1,%3						\n"
+"	stwcx.	%1,0,%2							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"2:									\n"
+	: "=&r" (prev), "=&r" (tmp)
+	: "r" (&lock->val), "r" (_Q_LOCKED_VAL), "r" (_Q_TAIL_CPU_MASK),
+	  "i" (IS_ENABLED(CONFIG_PPC64))
+	: "cr0", "memory");
+
+	return likely(!(prev & ~_Q_TAIL_CPU_MASK));
+}
+
 void queued_spin_lock_slowpath(struct qspinlock *lock);
 
 static __always_inline void queued_spin_lock(struct qspinlock *lock)
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 645d9affacfd..6d67bc38b122 100644
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
@@ -38,33 +47,35 @@ static inline int decode_tail_cpu(u32 val)
  * This is used by the head of the queue to acquire the lock and clean up
  * its tail if it was the last one queued.
  */
-static __always_inline u32 set_locked_clean_tail(struct qspinlock *lock, u32 tail)
+static __always_inline u32 trylock_clean_tail(struct qspinlock *lock, u32 tail)
 {
 	u32 newval = _Q_LOCKED_VAL;
 	u32 prev, tmp;
 
 	asm volatile(
-"1:	lwarx	%0,0,%2,%6	# set_locked_clean_tail			\n"
-	/* Test whether the lock tail == tail */
-"	and	%1,%0,%5						\n"
+"1:	lwarx	%0,0,%2,%7	# trylock_clean_tail			\n"
+	/* This test is necessary if there could be stealers */
+"	andi.	%1,%0,%5						\n"
+"	bne	3f							\n"
+	/* Test whether the lock tail == mytail */
+"	and	%1,%0,%6						\n"
 "	cmpw	0,%1,%3							\n"
 	/* Merge the new locked value */
 "	or	%1,%1,%4						\n"
 "	bne	2f							\n"
 	/* If the lock tail matched, then clear it, otherwise leave it. */
-"	andc	%1,%1,%5						\n"
+"	andc	%1,%1,%6						\n"
 "2:	stwcx.	%1,0,%2							\n"
 "	bne-	1b							\n"
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 "3:									\n"
 	: "=&r" (prev), "=&r" (tmp)
 	: "r" (&lock->val), "r"(tail), "r" (newval),
+	  "i" (_Q_LOCKED_VAL),
 	  "r" (_Q_TAIL_CPU_MASK),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
-	BUG_ON(prev & _Q_LOCKED_VAL);
-
 	return prev;
 }
 
@@ -117,6 +128,30 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
+static inline bool try_to_steal_lock(struct qspinlock *lock)
+{
+	int iters = 0;
+
+	if (!steal_spins)
+		return false;
+
+	/* Attempt to steal the lock */
+	do {
+		u32 val = READ_ONCE(lock->val);
+
+		if (unlikely(!(val & _Q_LOCKED_VAL))) {
+			if (__queued_spin_trylock_steal(lock))
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
@@ -166,6 +201,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
+again:
 	/* We're at the head of the waitqueue, wait for the lock. */
 	for (;;) {
 		val = READ_ONCE(lock->val);
@@ -176,9 +212,14 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 	}
 
 	/* If we're the last queued, must clean up the tail. */
-	old = set_locked_clean_tail(lock, tail);
+	old = trylock_clean_tail(lock, tail);
+	if (unlikely(old & _Q_LOCKED_VAL)) {
+		BUG_ON(!maybe_stealers);
+		goto again; /* Can only be true if maybe_stealers. */
+	}
+
 	if ((old & _Q_TAIL_CPU_MASK) == tail)
-		goto release; /* Another waiter must have enqueued */
+		goto release; /* We were the tail, no next. */
 
 	/* There is a next, must wait for node->next != NULL (MCS protocol) */
 	while (!(next = READ_ONCE(node->next)))
@@ -199,6 +240,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
+	if (try_to_steal_lock(lock))
+		return;
+
 	queued_spin_lock_mcs_queue(lock);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
@@ -208,3 +252,51 @@ void pv_spinlocks_init(void)
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

