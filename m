Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBBB56D33F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh87w4p5fz3fWT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZT5DoGnl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZT5DoGnl;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zq1WFHz3cdl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:26 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so7041651pjr.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IE8MQEsQ355Hs7Q4bU0ECDFtQ5VB9dWEJo0U5GfufEQ=;
        b=ZT5DoGnlL+jxedt+pb3QhEkvXWywZF6Ioi24nUuzfrnw3+pv1hcuboGi7vcZXdVm/E
         Zh2Scb3z8AqWHf8yh7firXLKAjeeYG54s76MLEWiwi2boDFPH4RyjTCafRjeXf/jQ3fy
         fgFSuriZoB/Ah66dSfvexnLqqZuM8osxEyPAcqEIICEWTbHT9nyeUjle/67EAlAuuBXs
         PwjOP7vyMS4aBOYH1J9EXhedqLnNnlsWfcwne9VbyTijyyBoRvMesKurDGaLj5FZXOPe
         wQatZGVIJXQiUZEq+wkJR9LakhGETf0fj9PmD5A/k+ER2ScxpbvFvEnwuZndahReKVnB
         wNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IE8MQEsQ355Hs7Q4bU0ECDFtQ5VB9dWEJo0U5GfufEQ=;
        b=I4TpF+3fPGafQXgJaTh0nM4BezXr63ZO8i6N+uzMvgaF4bo+WF0zCim2/btRmB40Ls
         ZZsxw8CArpgbHlIoB2i5z6ZceZeSynfF7gdHBIPDGG5Onxzgw3bdM2GljwNWxdnXikIL
         f/PQZRDGEItxBfVFZqEXT/6pA++E7iQJEjKUy035MIXfVlgAtmj6+Nr4nT8LAVSf5U3z
         Ie7kXRMkyZtzauHgatC3k19qNh73WkgrD0FquGzmWKqMsFecAbt1HVYtZN6jI5dXbFgy
         3Yu3dPsnK3gPqf1jwmPwlqjo+6N3Q/bDlJjBlsCPKtPkVF+Gd+KBEquFuVAZuDjO+oDF
         VaPw==
X-Gm-Message-State: AJIora/HWtRwYUZISb8T6h9OQwd9Nlgfvgfzg1TJGXg4Lf8N0pmjn5qG
	haXQ5MA5tExIbtU4Fx6uOKoLN+Jk974=
X-Google-Smtp-Source: AGRyM1vv+EdkZwrfHFXk351DOzZS4FqZfWqJvD77K6tsIyTkueCcxMYC40wajuPpqI5zWaYQJUE6kA==
X-Received: by 2002:a17:902:e84f:b0:16b:8a74:d572 with SMTP id t15-20020a170902e84f00b0016b8a74d572mr16401951plg.146.1657508724688;
        Sun, 10 Jul 2022 20:05:24 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 11/14] powerpc/qspinlock: allow propagation of yield CPU down the queue
Date: Mon, 11 Jul 2022 13:04:50 +1000
Message-Id: <20220711030453.150644-12-npiggin@gmail.com>
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

Having all CPUs poll the lock word for the owner CPU that should be
yielded to defeats most of the purpose of using MCS queueing for
scalability. Yet it may be desirable for queued waiters to to yield
to a preempted owner.

s390 addreses this problem by having queued waiters sample the lock
word to find the owner much less frequently. In this approach, the
waiters never sample it directly, but the queue head propagates the
owner CPU back to the next waiter if it ever finds the owner has
been preempted. Queued waiters then subsequently propagate the owner
CPU back to the next waiter, and so on.

Disable this option by default for now, i.e., no logical change.
---
 arch/powerpc/lib/qspinlock.c | 103 +++++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 4f1dc3322485..c39af19f006e 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -12,6 +12,7 @@
 struct qnode {
 	struct qnode	*next;
 	struct qspinlock *lock;
+	int		yield_cpu;
 	u8		locked; /* 1 if lock acquired */
 };
 
@@ -28,6 +29,7 @@ static int HEAD_SPINS __read_mostly = (1<<13);
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = false;
+static bool pv_yield_propagate_owner __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -197,7 +199,7 @@ static inline struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
+static void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
 {
 	int owner;
 	u32 yield_count;
@@ -238,13 +240,76 @@ static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt
 	cpu_relax();
 }
 
+static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	__yield_to_locked_owner(lock, val, paravirt, false);
+}
+
+static void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
+{
+	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
+}
+
+static void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
+{
+	struct qnode *next;
+	int owner;
+
+	if (!paravirt)
+		return;
+	if (!pv_yield_propagate_owner)
+		return;
+
+	owner = get_owner_cpu(val);
+	if (*set_yield_cpu == owner)
+		return;
+
+	next = READ_ONCE(node->next);
+	if (!next)
+		return;
+
+	if (vcpu_is_preempted(owner)) {
+		next->yield_cpu = owner;
+		*set_yield_cpu = owner;
+	} else if (*set_yield_cpu != -1) {
+		next->yield_cpu = owner;
+		*set_yield_cpu = owner;
+	}
+}
+
 static void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
 {
 	u32 yield_count;
+	int yield_cpu;
 
 	if (!paravirt)
 		goto relax;
 
+	if (!pv_yield_propagate_owner)
+		goto yield_prev;
+
+	yield_cpu = READ_ONCE(node->yield_cpu);
+	if (yield_cpu == -1) {
+		/* Propagate back the -1 CPU */
+		if (node->next && node->next->yield_cpu != -1)
+			node->next->yield_cpu = yield_cpu;
+		goto yield_prev;
+	}
+
+	yield_count = yield_count_of(yield_cpu);
+	if ((yield_count & 1) == 0)
+		goto yield_prev; /* owner vcpu is running */
+
+	smp_rmb();
+
+	if (yield_cpu == node->yield_cpu) {
+		if (node->next && node->next->yield_cpu != yield_cpu)
+			node->next->yield_cpu = yield_cpu;
+		yield_to_preempted(yield_cpu, yield_count);
+		return;
+	}
+
+yield_prev:
 	if (!pv_yield_prev)
 		goto relax;
 
@@ -276,7 +341,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			break;
 
 		if (val & _Q_LOCKED_VAL) {
-			yield_to_locked_owner(lock, val, paravirt, false);
+			yield_to_locked_owner(lock, val, paravirt);
 			continue;
 		}
 
@@ -313,6 +378,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->yield_cpu = -1;
 	node->locked = 0;
 
 	tail = encode_tail_cpu();
@@ -334,13 +400,21 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		while (!node->locked)
 			yield_to_prev(lock, node, prev_cpu, paravirt);
 
+		/* Clear out stale propagated yield_cpu */
+		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
+			node->yield_cpu = -1;
+
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
 	if (!MAYBE_STEALERS) {
+		int set_yield_cpu = -1;
+
 		/* We're at the head of the waitqueue, wait for the lock. */
-		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
-			yield_to_locked_owner(lock, val, paravirt, false);
+		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
+			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
+			yield_head_to_locked_owner(lock, val, paravirt, false);
+		}
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -352,6 +426,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		/* We must be the owner, just set the lock bit and acquire */
 		lock_set_locked(lock);
 	} else {
+		int set_yield_cpu = -1;
 		int iters = 0;
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
@@ -360,7 +435,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 				lock_set_mustq(lock);
 				val |= _Q_MUST_Q_VAL;
 			}
-			yield_to_locked_owner(lock, val, paravirt,
+			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
+			yield_head_to_locked_owner(lock, val, paravirt,
 				pv_yield_allow_steal && (iters > HEAD_SPINS));
 		}
 
@@ -513,6 +589,22 @@ static int pv_yield_prev_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_prev, pv_yield_prev_get, pv_yield_prev_set, "%llu\n");
 
+static int pv_yield_propagate_owner_set(void *data, u64 val)
+{
+	pv_yield_propagate_owner = !!val;
+
+	return 0;
+}
+
+static int pv_yield_propagate_owner_get(void *data, u64 *val)
+{
+	*val = pv_yield_propagate_owner;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_propagate_owner, pv_yield_propagate_owner_get, pv_yield_propagate_owner_set, "%llu\n");
+
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
@@ -521,6 +613,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
+		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 	}
 
 	return 0;
-- 
2.35.1

