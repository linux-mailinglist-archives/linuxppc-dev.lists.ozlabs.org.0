Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 762636274A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YXf2b6Mz3fHH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:43:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gnn4CJw/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gnn4CJw/;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHm6bDCz3cMM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:36 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id o7so9168370pjj.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x26+trCXBaWEOJg1x5+z1SBGuB50i/8pVdmP1HjVa5A=;
        b=Gnn4CJw/uZ2Y0Y+n29ftK3utksoVXq+Fwx/PYWFPbRsoAPBQ4TvjRR5+WRY35CyuqW
         sHtxIT6KTPBehno9S0Ln2n1qI95EKYrFAmmlOpk507xpG1RmeUqedv4eFfYAsSKVpM7I
         tswJO8cgixNbnRTWudLMwuDLDLqfb6vmQurQ4jcdcZX41TP5Z3mIXQucmeIr729RSig3
         nB6pGRDcnkK0DtS/BLkOnwFwvgmEyazrMOEDhb6n5d1qBNfoik5+Dq/wv1hwB6WlZsRJ
         U+4pmjyBUlMbMnaPXut5ez74LzHHDEnsyVYSASX6l4yZRF6CB4HJSEf6q6jmluTG6ONi
         H9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x26+trCXBaWEOJg1x5+z1SBGuB50i/8pVdmP1HjVa5A=;
        b=PjNdUJZc5gbTrPP1Y9nJxfOH+Wg4c5MSU8coaiIIznvle4x/VZwbS53ku9NRDtpv4a
         D3UcI42B7O+ZtJmK5atMC5MBu8k1x14aSFXHFyxovJkV3TnQhdozeBiUIwWMS9zVwWZC
         tULKQYvrLyYrgj4gLcAhxNe1Bu93VCg7xCe+SZrGJcUWfYq40iIZLmyL9qUPr4LeIFEE
         CtxMAfpzwsImuCDWlG0rD1a9ipl9eO/ukzt38zluae0J3Vravk2J2QjHm/Qy383nJw5n
         PZ7v2XQ3sX1HlK6Bsd0/HjCoKfW23rAdyVMToTeSanR0R6b7ljD1qNiuRCDddTugNMVv
         7yQg==
X-Gm-Message-State: ANoB5pnjWH70QeQGdnR2eSJhukSbwGljHe10DBvEtNKnW9zQ7JZVWbaa
	AaX/d+/ozQDQkQv2WTdVTcrCXMHF1cc=
X-Google-Smtp-Source: AA0mqf5VW4cUe93amcdWfHY//kuO/QpwJ0Bh1tbHDpe2dVO8fuCqwnmaBjLOMeIxp++N5Vyt+rjkIg==
X-Received: by 2002:a17:90a:c396:b0:205:ff5b:d27a with SMTP id h22-20020a17090ac39600b00205ff5bd27amr11460351pjt.225.1668393154403;
        Sun, 13 Nov 2022 18:32:34 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/17] powerpc/qspinlock: allow propagation of yield CPU down the queue
Date: Mon, 14 Nov 2022 12:31:31 +1000
Message-Id: <20221114023137.2679627-13-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 6b54b4628991..f07843b4c497 100644
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
 
@@ -251,14 +253,67 @@ static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u
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
 
@@ -331,6 +386,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->yield_cpu = -1;
 	node->locked = 0;
 
 	tail = encode_tail_cpu(smp_processor_id());
@@ -351,16 +407,23 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		while (!node->locked)
 			yield_to_prev(lock, node, old, paravirt);
 
+		/* Clear out stale propagated yield_cpu */
+		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
+			node->yield_cpu = -1;
+
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
 	if (!maybe_stealers) {
+		int set_yield_cpu = -1;
+
 		/* We're at the head of the waitqueue, wait for the lock. */
 		for (;;) {
 			val = READ_ONCE(lock->val);
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
+			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt);
 		}
 
@@ -374,6 +437,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		/* We must be the owner, just set the lock bit and acquire */
 		set_locked(lock);
 	} else {
+		int set_yield_cpu = -1;
 		int iters = 0;
 		bool mustq = false;
 
@@ -384,6 +448,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
+			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt);
 
 			iters++;
@@ -553,6 +618,22 @@ static int pv_yield_prev_get(void *data, u64 *val)
 
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
@@ -561,6 +642,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
+		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 	}
 
 	return 0;
-- 
2.37.2

