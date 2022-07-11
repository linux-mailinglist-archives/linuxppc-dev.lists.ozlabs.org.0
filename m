Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368256D336
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh83f34Dnz3fB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:08:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pnVQMq0w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pnVQMq0w;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zZ3n17z3bsf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:14 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id c13so3348335pla.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ro2Y1lzmOoBreukK8lR2Me+tjUvCAWszXf9DWX+bUCQ=;
        b=pnVQMq0wilk0FDqO/ca9Di3vT478K02np6X8dB/Te3nKn6D/ktCFl96Btf/7gfJpni
         e2X7XRAa/80r9AhEpoSyUaYcqnUaPSrpZ1r0nUndqlB7qnqGzPERIFrrnTJYc1aplK+3
         Y1TKQTz9ADpBuolBYm5qOnhBg6dvT+7mppCcOKDRLYfQ0SoakpdvjXTLSxxxd5CsO5RM
         lf6QP7SpTcxGJe6pPNp/HkcYTRfd9kB6IJdI8moK5mgamrSTHs2jTwBRplbUQJ00enA1
         LnqrBoMx1cvy0UYJmF+wgx9w0MMrX33ZsXFBJGDCmi+QMSctaGqBsEDg8l+s9Ytp/LJm
         dJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ro2Y1lzmOoBreukK8lR2Me+tjUvCAWszXf9DWX+bUCQ=;
        b=2pnBxHNbhzShmOTFT9OsnNk22tHxcSV0vVRFXC14JGV1hpM4wjU35x+UUqWSxxYvHK
         a7F23LP3wg4Fkg/We1NVPlkuWaAQqh2J1TG8mvpId2aZcsNJIsaG5c2e81zZg6CqQhhD
         Jm/USWJ0vyMWwCRGVLMHRttwKmSBpiqFZAsUT5U/pMobxZQ7OTqK8nx01PiC1xNzMoBX
         r/XIOtP++e9pOQvH12GfmJOHDWa5EFlZU2sIXT3hJnTQ9J4OBpTGyZQqwaPedZYPP5o5
         FzKB8GUalm9Yp/yU1C7ae9fUeOoSDHAPWJ1KfK/Rgh9FO0p6GSzr8wP6JuX17E46raF6
         FZyQ==
X-Gm-Message-State: AJIora8a4uecoY5pGvB3XqsdJkvpxu17XzmfEcdZyFBLYMZ3iYgkiyCD
	kuP+DczcK4XMhJNAGyCFD1skiMrsikU=
X-Google-Smtp-Source: AGRyM1s88pzQzU/Wp5+dbM5q/CfCpUw3Tw9WSuyi7afOd0MoFwBdfFRDDdZnj97hnhsPhKFji6AQPA==
X-Received: by 2002:a17:90b:3e8a:b0:1f0:4157:daf8 with SMTP id rj10-20020a17090b3e8a00b001f04157daf8mr1948161pjb.222.1657508711798;
        Sun, 10 Jul 2022 20:05:11 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 05/14] powerpc/qspinlock: allow new waiters to steal the lock before queueing
Date: Mon, 11 Jul 2022 13:04:44 +1000
Message-Id: <20220711030453.150644-6-npiggin@gmail.com>
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

Allow new waiters a number of spins on the lock word before queueing,
which particularly helps paravirt performance when physical CPUs are
oversubscribed.
---
 arch/powerpc/lib/qspinlock.c | 143 ++++++++++++++++++++++++++++++++---
 1 file changed, 132 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 76dca922ba71..cb87991602ff 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -19,6 +19,10 @@ struct qnodes {
 	struct qnode nodes[MAX_NODES];
 };
 
+/* Tuning parameters */
+static int STEAL_SPINS __read_mostly = (1<<5);
+static bool MAYBE_STEALERS __read_mostly = true;
+
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
 static inline u32 encode_tail_cpu(void)
@@ -76,6 +80,39 @@ static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 ol
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
@@ -115,6 +152,26 @@ static inline struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
+static inline bool try_to_steal_lock(struct qspinlock *lock)
+{
+	int iters;
+
+	/* Attempt to steal the lock */
+	for (iters = 0; iters < STEAL_SPINS; iters++) {
+		u32 val = READ_ONCE(lock->val);
+
+		if (val & _Q_LOCKED_VAL) {
+			cpu_relax();
+			continue;
+		}
+
+		if (trylock_with_tail_cpu(lock, val))
+			return true;
+	}
+
+	return false;
+}
+
 static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 {
 	struct qnodes *qnodesp;
@@ -164,20 +221,39 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
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
@@ -197,6 +273,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
+	if (try_to_steal_lock(lock))
+		return;
+
 	queued_spin_lock_mcs_queue(lock);
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
@@ -204,6 +283,48 @@ EXPORT_SYMBOL(queued_spin_lock_slowpath);
 #ifdef CONFIG_PARAVIRT_SPINLOCKS
 void pv_spinlocks_init(void)
 {
+	STEAL_SPINS = (1<<15);
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

