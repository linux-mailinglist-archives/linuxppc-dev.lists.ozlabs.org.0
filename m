Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB656D33B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:10:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh85g1z29z3fLV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:10:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YP9q5qHt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YP9q5qHt;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zh5c9zz3c1S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:20 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id 70so3713704pfx.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DK0VgMuz0XNDMCQTRnkUinv7v4fb+yrzyA/f87s3QSU=;
        b=YP9q5qHtvJ1ykzEel7epeenEm9HHkB1ixeZ3cMVJAjvyGE6pnDc26R6axhvpikNpS9
         ZHYY9gl/nPzJLGMfrAO+H9PPNH0nXJ/jpeiPcBe16Z4mg0cE9WxyYZGrBbwSNpAN1m/W
         0gk4sTLthrQWb2AavxT8QbKXk/1Zdr2vY9CiivldTyr/Af+NCaLP8hWfwO7sljWu4ngk
         1NXFLuvLYGGg5qH4tpMq84vY6sLnH4nO8fWGWnIld/BK6wzE75zvjr5Ktct350Bfkk7g
         8kxRM873Kk/ftcsu3qxKsZgLdtmpdlTLLYcWnXnGiUD7Z3h/GuVm4mXxg/4cvIsexbRN
         THBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DK0VgMuz0XNDMCQTRnkUinv7v4fb+yrzyA/f87s3QSU=;
        b=rAT19eJra+6/aZi+0KZdNW9r0EYNGI61ylqVBKfLMOL6Zwh0neFjEDLVFS0JBShQet
         8b0WR40yyj0DYQ6XXEshTtr6j1fwrTN0ZFbIPDi4L23L5FKc2wcogq50LQ3C7Ur6C6aG
         Lr1kUJgvVejm7izMG0X17CiLcRO2LQoYDRrLjDGVcR3cOKEqmGJrURhr4EBx56G+mTD5
         UmJpu1ORmWZWb6wGiSmLfC+gAru4wkAPM0fidwP0wBSxwSgiJSIaD9JDIsc9/jDuK/Dg
         tIujkAiYKTY5TUv0PLiltcu3s/7CDsuqHP0HbdM+0lxNAOD4FPDl2aoNaZYFmhjpWuux
         ZiNw==
X-Gm-Message-State: AJIora8Jiz89bhZjihe7fW1TmldHOLfjOm19yfrvsuaGx+JEEbnSSdFo
	mMNehrCLpd0jOsv/HQ6DAiJMczQ5TOM=
X-Google-Smtp-Source: AGRyM1vKCVQQK9MpuKVkaO9K1nwrAS6aq/zXn9ErMaTAhqojH8z1QXtDL2wKJJjv0jDnqZ0beK0kXg==
X-Received: by 2002:a05:6a00:168a:b0:4f7:e161:83cd with SMTP id k10-20020a056a00168a00b004f7e16183cdmr16318361pfc.56.1657508718155;
        Sun, 10 Jul 2022 20:05:18 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 08/14] powerpc/qspinlock: paravirt yield to lock owner
Date: Mon, 11 Jul 2022 13:04:47 +1000
Message-Id: <20220711030453.150644-9-npiggin@gmail.com>
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

Waiters spinning on the lock word should yield to the lock owner if the
vCPU is preempted. This improves performance when the hypervisor has
oversubscribed physical CPUs.
---
 arch/powerpc/lib/qspinlock.c | 93 +++++++++++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 3c6554a02de7..ee85198d5e28 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -5,6 +5,7 @@
 #include <linux/percpu.h>
 #include <linux/smp.h>
 #include <asm/qspinlock.h>
+#include <asm/paravirt.h>
 
 #define MAX_NODES	4
 
@@ -24,6 +25,8 @@ static int STEAL_SPINS __read_mostly = (1<<5);
 static bool MAYBE_STEALERS __read_mostly = true;
 static int HEAD_SPINS __read_mostly = (1<<13);
 
+static bool pv_yield_owner __read_mostly = true;
+
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
 static inline u32 encode_tail_cpu(void)
@@ -36,7 +39,11 @@ static inline int get_tail_cpu(u32 val)
 	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
 }
 
-/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
+static inline int get_owner_cpu(u32 val)
+{
+	return (val & _Q_OWNER_CPU_MASK) >> _Q_OWNER_CPU_OFFSET;
+}
+
 /* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void lock_set_locked(struct qspinlock *lock)
 {
@@ -170,7 +177,45 @@ static inline struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static inline bool try_to_steal_lock(struct qspinlock *lock)
+static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	int owner;
+	u32 yield_count;
+
+	BUG_ON(!(val & _Q_LOCKED_VAL));
+
+	if (!paravirt)
+		goto relax;
+
+	if (!pv_yield_owner)
+		goto relax;
+
+	owner = get_owner_cpu(val);
+	yield_count = yield_count_of(owner);
+
+	if ((yield_count & 1) == 0)
+		goto relax; /* owner vcpu is running */
+
+	/*
+	 * Read the lock word after sampling the yield count. On the other side
+	 * there may a wmb because the yield count update is done by the
+	 * hypervisor preemption and the value update by the OS, however this
+	 * ordering might reduce the chance of out of order accesses and
+	 * improve the heuristic.
+	 */
+	smp_rmb();
+
+	if (READ_ONCE(lock->val) == val) {
+		yield_to_preempted(owner, yield_count);
+		/* Don't relax if we yielded. Maybe we should? */
+		return;
+	}
+relax:
+	cpu_relax();
+}
+
+
+static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
 	int iters;
 
@@ -182,7 +227,7 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 			break;
 
 		if (val & _Q_LOCKED_VAL) {
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 			continue;
 		}
 
@@ -193,7 +238,7 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 	return false;
 }
 
-static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
+static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, bool paravirt)
 {
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
@@ -245,7 +290,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 	if (!MAYBE_STEALERS) {
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -261,9 +306,11 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
-			if (iters++ == HEAD_SPINS)
+			if (iters++ == HEAD_SPINS) {
 				lock_set_mustq(lock);
-			cpu_relax();
+				val |= _Q_MUST_Q_VAL;
+			}
+			yield_to_locked_owner(lock, val, paravirt);
 		}
 
 		/* If we're the last queued, must clean up the tail. */
@@ -298,10 +345,15 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
-	if (try_to_steal_lock(lock))
-		return;
-
-	queued_spin_lock_mcs_queue(lock);
+	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
+		if (try_to_steal_lock(lock, true))
+			return;
+		queued_spin_lock_mcs_queue(lock, true);
+	} else {
+		if (try_to_steal_lock(lock, false))
+			return;
+		queued_spin_lock_mcs_queue(lock, false);
+	}
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
@@ -362,10 +414,29 @@ static int head_spins_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_head_spins, head_spins_get, head_spins_set, "%llu\n");
 
+static int pv_yield_owner_set(void *data, u64 val)
+{
+	pv_yield_owner = !!val;
+
+	return 0;
+}
+
+static int pv_yield_owner_get(void *data, u64 *val)
+{
+	*val = pv_yield_owner;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
+
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
+	if (is_shared_processor()) {
+		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+	}
 
 	return 0;
 }
-- 
2.35.1

