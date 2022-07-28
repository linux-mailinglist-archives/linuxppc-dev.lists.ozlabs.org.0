Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2AA5838D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgr847Tkz3fKv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gm4vZU3c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gm4vZU3c;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltgm034lFz2xJ0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:44 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id o3so972711ple.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OryU+x6t22MUTdzVROywzVeMPRbtOkwKYQplUbh2bFU=;
        b=Gm4vZU3cvJZJTqPYMz/bU+4+NUgWIud1i1GeLYQBiwaJef3RmQHX0eshMfrEyj2TGu
         MdSYxv1c8QIkXBrdwfLJIByBomMZL5Omi9usjfCqiIJHfxKG/8KJ4zH49OYGbLqQ9jtP
         NRjF0hd+MFmD74MwIBezjIDMia6prysBuFNcHZazy86ex5SDYGTB9pTUig7/DmeQIuzD
         UxL+UktOlGt8HzgyaAkhgADxouPcPNp8ILtyD72cwbCS4Z1sFJfUtk/NPx1OuAjaLCEb
         w/DB6PLLQHrGPBzKOj2gA4hZr1MIbtq+AVTaF3HU9IktJMjqEifGDxBxI8epiz8XCyyg
         NmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OryU+x6t22MUTdzVROywzVeMPRbtOkwKYQplUbh2bFU=;
        b=AzQf0xVfaNxUWkikBPlHxgmhms/aLbzxqaJ2jWXvTrHU3x5hLePUqyfRXAd+j5aIt4
         c94CjjFoN451c6TETP86HHqrkhNoqzMy60zCw6Io1tg+hUapqscdYRI9BVidCoSLF6pW
         xSdXK1QgqKgayKlg9GrmSI4QRhyHlEwydzjWfFAXC1sf+M/3JTSY0QU6b4x9OF3t0Scw
         v5JzlCzd+ZzK/dVbJN6vcfYtEUGOl6h4yuehUiFDhsIX4Ppl9LBJGveeIlgwxHOWhrt7
         12GY4sACpT+wsAgXp+vSie9C2U4w1JgYkGq4y1Trecrp9YiFq/y5gr/hC9XvyRIwx19q
         D85w==
X-Gm-Message-State: AJIora8aXj+ziR+FWCWJn+zNzG5x+Pw9/XeENgLyJysGSDpYkBp2lWZT
	7cn1w5Le6vBoaty/vk2sBvx6pKDEWRs=
X-Google-Smtp-Source: AGRyM1sqzPy6jBS58AZPFofxYCpds3bq/R1HGB5hTfhqVkn/vrHDj6+yYtbYZu2z49bsrCpCh9MQSg==
X-Received: by 2002:a17:90a:1d0:b0:1ec:7066:49b8 with SMTP id 16-20020a17090a01d000b001ec706649b8mr8737540pjd.163.1658989903239;
        Wed, 27 Jul 2022 23:31:43 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/17] powerpc/qspinlock: allow new waiters to steal the lock before queueing
Date: Thu, 28 Jul 2022 16:31:08 +1000
Message-Id: <20220728063120.2867508-7-npiggin@gmail.com>
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

Allow new waiters a number of spins on the lock word before queueing,
which particularly helps paravirt performance when physical CPUs are
oversubscribed.
---
 arch/powerpc/lib/qspinlock.c | 152 ++++++++++++++++++++++++++++++++---
 1 file changed, 141 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 7c71e5e287df..1625cce714b2 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -19,8 +19,17 @@ struct qnodes {
 	struct qnode nodes[MAX_NODES];
 };
 
+/* Tuning parameters */
+static int STEAL_SPINS __read_mostly = (1<<5);
+static bool MAYBE_STEALERS __read_mostly = true;
+
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
+static __always_inline int get_steal_spins(void)
+{
+	return STEAL_SPINS;
+}
+
 static inline u32 encode_tail_cpu(void)
 {
 	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
@@ -76,6 +85,39 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 ol
 	return 0;
 }
 
+static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u32 new)
+{
+	u32 prev;
+
+	BUG_ON(old & _Q_LOCKED_VAL);
+
+	asm volatile(
+"1:	lwarx	%0,0,%1,%4	# queued_spin_trylock_cmpxchg		\n"
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
+	return prev;
+}
+
+/* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
+static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
+{
+	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
+
+	if (__trylock_cmpxchg(lock, val, newval) == val)
+		return 1;
+	else
+		return 0;
+}
+
 /*
  * Publish our tail, replacing previous tail. Return previous value.
  *
@@ -115,6 +157,31 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
+static inline bool try_to_steal_lock(struct qspinlock *lock)
+{
+	int iters;
+
+	/* Attempt to steal the lock */
+	for (;;) {
+		u32 val = READ_ONCE(lock->val);
+
+		if (unlikely(!(val & _Q_LOCKED_VAL))) {
+			if (trylock_with_tail_cpu(lock, val))
+				return true;
+			continue;
+		}
+
+		cpu_relax();
+
+		iters++;
+
+		if (iters >= get_steal_spins())
+			break;
+	}
+
+	return false;
+}
+
 static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
 	struct qnodes *qnodesp;
@@ -164,20 +231,39 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
-	/* We're at the head of the waitqueue, wait for the lock. */
-	while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
-		cpu_relax();
+	if (!MAYBE_STEALERS) {
+		/* We're at the head of the waitqueue, wait for the lock. */
+		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
+			cpu_relax();
 
-	/* If we're the last queued, must clean up the tail. */
-	if ((val & _Q_TAIL_CPU_MASK) == tail) {
-		if (trylock_clear_tail_cpu(lock, val))
-			goto release;
-		/* Another waiter must have enqueued */
-	}
+		/* If we're the last queued, must clean up the tail. */
+		if ((val & _Q_TAIL_CPU_MASK) == tail) {
+			if (trylock_clear_tail_cpu(lock, val))
+				goto release;
+			/* Another waiter must have enqueued. */
+		}
+
+		/* We must be the owner, just set the lock bit and acquire */
+		lock_set_locked(lock);
+	} else {
+again:
+		/* We're at the head of the waitqueue, wait for the lock. */
+		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
+			cpu_relax();
 
-	/* We must be the owner, just set the lock bit and acquire */
-	lock_set_locked(lock);
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
+	}
 
+unlock_next:
 	/* contended path; must wait for next != NULL (MCS protocol) */
 	while (!(next = READ_ONCE(node->next)))
 		cpu_relax();
@@ -197,6 +283,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
+	if (try_to_steal_lock(lock))
+		return;
+
 	queued_spin_lock_mcs_queue(lock);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
@@ -207,3 +296,44 @@ void pv_spinlocks_init(void)
 }
 #endif
 
+#include <linux/debugfs.h>
+static int steal_spins_set(void *data, u64 val)
+{
+	static DEFINE_MUTEX(lock);
+
+	mutex_lock(&lock);
+	if (val && !STEAL_SPINS) {
+		MAYBE_STEALERS = true;
+		/* wait for waiter to go away */
+		synchronize_rcu();
+		STEAL_SPINS = val;
+	} else if (!val && STEAL_SPINS) {
+		STEAL_SPINS = val;
+		/* wait for all possible stealers to go away */
+		synchronize_rcu();
+		MAYBE_STEALERS = false;
+	} else {
+		STEAL_SPINS = val;
+	}
+	mutex_unlock(&lock);
+
+	return 0;
+}
+
+static int steal_spins_get(void *data, u64 *val)
+{
+	*val = STEAL_SPINS;
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
+
-- 
2.35.1

