Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05A5838DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:39:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgwS416gz3dsD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:39:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MdrbTQIC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MdrbTQIC;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmJ0yk7z3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:59 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id x10so272154plb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pligVbWIodDyvggbQbMoh9iE693CYGLedt/tYi9U3Tg=;
        b=MdrbTQICFsbYRZteYuQa3s/w0Iuo/pCm0xPwx2W2atGrxEPMz08wasGthv51OaqhmS
         5DBu3r45ftuvKJAsLCrgkn5t/OKifyGBUAbzoMGBf+73bEKhYDtNhclrVH0rMuhEchZP
         Jkw1rm7SP732LoBykMj8SKpuM6P9iJALbB24n/MojYKN242FbmdRLbErP2eUtmI/i2AZ
         Y81WssjWgfwyi9TFhvirLoZ5f0J9trxLg7nNCgyenT1OulhmaQroXTvIebAAhhIk5v8f
         8MPksDNtNgwsZdagP8b9T+UcI9bi9AeuwTq99jbwaAefQiAopFxTA4LmllknqFfrA3/2
         6AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pligVbWIodDyvggbQbMoh9iE693CYGLedt/tYi9U3Tg=;
        b=q7IF4nQZme0gWMegBbHMEm5NXIbUz9koa/XIDIsYcO2HzSpAExMEdzTf4JCmPKDA8a
         begehRrj1/QHVLFdeoj5MylWM+FXP2EOoHl7LAk+I5B4rVIEeT1n8kRu+s0d4zSk1CrG
         8QV5SqERiKOwUVVg6Ygw7Ne2j43banbQ2I50XgvsWjU/NDCaTE4mW8Xt+qenT6HmeqQV
         /PHr2tsu3Vw8TxIAVYYQGa0L0f2P2pR1Sr7Oq2KGiSOuCjtBvtAxPEnRt8kUR/2/q5Ya
         PXQk+vmSc9a3se/4XbI6yc78nMNQcuHEUNU5Izd4f8rmbnIjOWrHDVXki84W9X9VLlvU
         QQig==
X-Gm-Message-State: AJIora94rI7G5OmG9aKXQDDpK7/CYg2OPBQn+SGzlY4JDI9zsA86u9gU
	k5Eiwa+e4OUOsaJ/90yERjwxaloJ/98=
X-Google-Smtp-Source: AGRyM1vgWv9QCHEkCSC/tTNxhsv2AilGdF7f6xZ5IKl9hzdPpEyVXSz9ziUQ7hBs3eQ59yuotTbJAg==
X-Received: by 2002:a17:90b:4a12:b0:1ef:fd9e:a02e with SMTP id kk18-20020a17090b4a1200b001effd9ea02emr8798141pjb.216.1658989916929;
        Wed, 27 Jul 2022 23:31:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/17] powerpc/qspinlock: allow propagation of yield CPU down the queue
Date: Thu, 28 Jul 2022 16:31:14 +1000
Message-Id: <20220728063120.2867508-13-npiggin@gmail.com>
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
 arch/powerpc/lib/qspinlock.c | 85 +++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 94f007f66942..28c85a2d5635 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -12,6 +12,7 @@
 struct qnode {
 	struct qnode	*next;
 	struct qspinlock *lock;
+	int		yield_cpu;
 	u8		locked; /* 1 if lock acquired */
 };
 
@@ -28,6 +29,7 @@ static int HEAD_SPINS __read_mostly = (1<<8);
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
+static bool pv_yield_propagate_owner __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -257,13 +259,66 @@ static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u
 	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
 }
 
+static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
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
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
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
 
@@ -337,6 +392,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->yield_cpu = -1;
 	node->locked = 0;
 
 	tail = encode_tail_cpu();
@@ -358,13 +414,21 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
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
+		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
+			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt, false);
+		}
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -376,12 +440,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		/* We must be the owner, just set the lock bit and acquire */
 		lock_set_locked(lock);
 	} else {
+		int set_yield_cpu = -1;
 		int iters = 0;
 		bool set_mustq = false;
 
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
+			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt,
 					pv_yield_allow_steal && set_mustq);
 
@@ -540,6 +606,22 @@ static int pv_yield_prev_get(void *data, u64 *val)
 
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
@@ -548,6 +630,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
+		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 	}
 
 	return 0;
-- 
2.35.1

