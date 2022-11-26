Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7E639532
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:09:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6sg70Ptz3fFp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:09:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tqf6MSjs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tqf6MSjs;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fm38WRz3f3Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:16 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so9662084pjc.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zzhIbvAzayb4yaRNKEO4qu4RYhZtzziiOxDt3X2n6s=;
        b=Tqf6MSjsI51hO6oK28KywrfoFpC6ISeMB5p6WkMYglA4QsQ3GarFeUpM7lk2lnZvcb
         YDLe37zHcvBw7JxekmBtD98xUivyTTNEhg6Unw+8AKk55iq8EfxRtPdDv0zmmgI8Lv7k
         ulCIulfwoqqyhaIKw5CeR87YCOJ0gmuiT21Bm6oUX6uDJuvPydaVMwe618X5AZEZG30p
         BDuQhTsF/mz2GqY0pluAEqxCjdRnFA0J2uBMlFRz3WqULVxMnXz68yLbWM6hnwT0S2DK
         mAY+Si7mA4CTfHpUERirwJApsDmANNmOgSkzStABTqF6Qh0euZWCPHk5mj4qYCUj2ApS
         rzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zzhIbvAzayb4yaRNKEO4qu4RYhZtzziiOxDt3X2n6s=;
        b=Dz0BHHBmNvZmhg9/GBMYK9ZawvoyXIYFhfPKdJGTd4BddFlLj5Y+wbTl0dZCWsWOE/
         x3dhIZ6z6WVnGMgX4doVShFJYpI0CzDsGcSOyN0rBj1veH4ckYa7rDxmhR9P9J3ubh4u
         WDhjIYX2mEfnOcD/vkTj4tDvsc/6HGYHOzL39BD92ObvNI6Nv2xjb68B3tXoC4CuYeo8
         kVVI+EXnHDhsNc8WWubjjFWN7IQS1rx+N8WHh/vugHbkm/3xk6hsVSs2axHGEXzmG0Dj
         GPrrx58LnpO41wDQ6DtlmB4DFmLCfU80u+r334xIgUAe/LqaH9Az70vJRK/M3NcWtkWj
         xdvA==
X-Gm-Message-State: ANoB5pmTbp7NKoF9+x0XFVRZcUa7zhKbzQhFzDIWziKMO/d57qJN8dA/
	hSE8e0G58V9dGT1wuN3hiyLrE06xUvKjcQ==
X-Google-Smtp-Source: AA0mqf4tCC90iYXsW5Ey6icR47Frf3/nphkgh7rGMIJlMe9BStQOvf01333DgFvTYTEMrUESliiKGQ==
X-Received: by 2002:a17:90b:358a:b0:218:c490:33f6 with SMTP id mm10-20020a17090b358a00b00218c49033f6mr25932131pjb.83.1669456814163;
        Sat, 26 Nov 2022 02:00:14 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/17] powerpc/qspinlock: allow propagation of yield CPU down the queue
Date: Sat, 26 Nov 2022 19:59:25 +1000
Message-Id: <20221126095932.1234527-11-npiggin@gmail.com>
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

Having all CPUs poll the lock word for the owner CPU that should be
yielded to defeats most of the purpose of using MCS queueing for
scalability. Yet it may be desirable for queued waiters to to yield
to a preempted owner.

With this change, queue waiters never sample the owner CPU directly
from the lock word. The queue head (which is spinning on the lock)
propagates the owner CPU back to the next waiter if it finds the owner
has been preempted. That waiter then propagates the owner CPU back to
the next waiter, and so on.

s390 addreses this problem differenty, by having queued waiters sample
the lock word to find the owner at a low frequency. That has the
advantage of being simpler, the advantage of propagation is that the
lock word never has to be accesed by queued waiters, and the transfer
of cache lines to transmit the owner data is only required when lock
holder vCPU preemption occurs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 1aafafc701da..b044760a05e9 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -12,6 +12,7 @@
 struct qnode {
 	struct qnode	*next;
 	struct qspinlock *lock;
+	int		yield_cpu;
 	u8		locked; /* 1 if lock acquired */
 };
 
@@ -28,6 +29,7 @@ static int head_spins __read_mostly = (1<<8);
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
+static bool pv_yield_propagate_owner __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -232,14 +234,67 @@ static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u
 	__yield_to_locked_owner(lock, val, paravirt, mustq);
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
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
 {
 	int prev_cpu = decode_tail_cpu(val);
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
 
@@ -293,6 +348,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	u32 val, old, tail;
 	bool mustq = false;
 	int idx;
+	int set_yield_cpu = -1;
 	int iters = 0;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -314,6 +370,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->yield_cpu = -1;
 	node->locked = 0;
 
 	tail = encode_tail_cpu(smp_processor_id());
@@ -334,6 +391,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		while (!node->locked)
 			yield_to_prev(lock, node, old, paravirt);
 
+		/* Clear out stale propagated yield_cpu */
+		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
+			node->yield_cpu = -1;
+
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
@@ -344,6 +405,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		if (!(val & _Q_LOCKED_VAL))
 			break;
 
+		propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 		yield_head_to_locked_owner(lock, val, paravirt);
 		if (!maybe_stealers)
 			continue;
@@ -512,6 +574,22 @@ static int pv_yield_prev_get(void *data, u64 *val)
 
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
@@ -520,6 +598,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
+		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 	}
 
 	return 0;
-- 
2.37.2

