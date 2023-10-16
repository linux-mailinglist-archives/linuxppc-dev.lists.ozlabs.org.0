Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AAB7CA853
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:46:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l/yjKNgs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8H141dycz3vhJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l/yjKNgs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Gyd3jGdz3cDS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:44:25 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6bd73395bceso954830b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460262; x=1698065062; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UupOmSkZAxcmy+M8Pv7epk4VfkElc+gXtgy2XI98HsA=;
        b=l/yjKNgsjVmWQhNepMpzcoAOevu5htIh6dqx4ZClKu4qGL2Vf/kFlVv2FAQ8de+m0X
         EjacaM49BpWRD0prjUsREFEOnod9RGOhnDPh4w7uOKXxXVfy7pQc9JaQ1cOnxfGW2QEc
         TeBoLuim1sWoG04P8b8vMFYZ1SrDJ0czG+bI7pm88YsHvRaYMZl3hb3kZ+ukpcN5xA2y
         BDa+DLQ1BZ8ARHyYv0VcLwvJcnW05u78ZDU2Brk3HNya+bMfQrQqgDCY720551iGmBkW
         iwCY9chPehYU/qfcX7pEo4EGXOPM4ivvR++kQasSsw09CixWC7CqZqiwdfV9SGngm/o7
         iHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460262; x=1698065062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UupOmSkZAxcmy+M8Pv7epk4VfkElc+gXtgy2XI98HsA=;
        b=Vx5XSctMPuHIIvkOipFfy4DapYetbL1s2pGbKhUr1h6gGxVO7M04T2t/eC2MX/+jcO
         iFTyjxRM2sOu/tkn3wfPnWLlmVeU1zt0GVKGzWDPLqwla7BknNvYAM5fJU3ymviA+2KV
         DXINHc3rSqP9ulwzPR3Qa77VwFI4i1+HuIzoTMdZnthuVx51hNTnikxHysxu+u1xXLew
         IzRE8uL/A3xcWHVZGz8YIFCJ/QgKdTPfm3BsLfQ8nonMIYXefq3+Y77sdYkIKoMrzokL
         hCQJ4cEayj1v/d2ySSA33wmRskYqKB0mBPft88rwgOCLqLb0LMLgycRGvbfrAZWmSD9j
         yptQ==
X-Gm-Message-State: AOJu0YzuJbvq8bQ9WAXxoiFZ0+ymiAoRb4FH5aBy4rSXZvZdMwfyHhPT
	kf86X/CwcLgiF3RsAnFOXVpYPraSA58=
X-Google-Smtp-Source: AGHT+IEHcz830r6swNYvqq/XSGCUiGUkS2DyHW6Vl6PCIBiAW2rqe0GsFzat2nZHMFWjJGXft/DLwg==
X-Received: by 2002:a05:6a00:1516:b0:68f:b015:ea99 with SMTP id q22-20020a056a00151600b0068fb015ea99mr11295141pfu.10.1697460262529;
        Mon, 16 Oct 2023 05:44:22 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:44:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/qspinlock: propagate owner preemptedness rather than CPU number
Date: Mon, 16 Oct 2023 22:43:02 +1000
Message-ID: <20231016124305.139923-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than propagating the CPU number of the preempted lock owner,
just propagate whether the owner was preempted. Waiters must read the
lock value when yielding to it to prevent races anyway, so might as
well always load the owner CPU from the lock.

To further simplify the code, also don't propagate the -1 (or
sleepy=false in the new scheme) down the queue. Instead, have the
waiters clear it themselves when finding the lock owner is not
preempted.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 80 ++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 75608ced14c2..0932d24a6b07 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -16,7 +16,8 @@ struct qnode {
 	struct qnode	*next;
 	struct qspinlock *lock;
 	int		cpu;
-	int		yield_cpu;
+	u8		sleepy; /* 1 if the previous vCPU was preempted or
+				 * if the previous node was sleepy */
 	u8		locked; /* 1 if lock acquired */
 };
 
@@ -349,7 +350,7 @@ static __always_inline bool yield_head_to_locked_owner(struct qspinlock *lock, u
 	return __yield_to_locked_owner(lock, val, paravirt, mustq);
 }
 
-static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
+static __always_inline void propagate_sleepy(struct qnode *node, u32 val, bool *set_sleepy, bool paravirt)
 {
 	struct qnode *next;
 	int owner;
@@ -358,21 +359,17 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 		return;
 	if (!pv_yield_propagate_owner)
 		return;
-
-	owner = get_owner_cpu(val);
-	if (*set_yield_cpu == owner)
+	if (*set_sleepy)
 		return;
 
 	next = READ_ONCE(node->next);
 	if (!next)
 		return;
 
+	owner = get_owner_cpu(val);
 	if (vcpu_is_preempted(owner)) {
-		next->yield_cpu = owner;
-		*set_yield_cpu = owner;
-	} else if (*set_yield_cpu != -1) {
-		next->yield_cpu = owner;
-		*set_yield_cpu = owner;
+		next->sleepy = 1;
+		*set_sleepy = true;
 	}
 }
 
@@ -380,7 +377,6 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
 {
 	u32 yield_count;
-	int yield_cpu;
 	bool preempted = false;
 
 	if (!paravirt)
@@ -389,36 +385,32 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	if (!pv_yield_propagate_owner)
 		goto yield_prev;
 
-	yield_cpu = READ_ONCE(node->yield_cpu);
-	if (yield_cpu == -1) {
-		/* Propagate back the -1 CPU */
-		if (node->next && node->next->yield_cpu != -1)
-			node->next->yield_cpu = yield_cpu;
+	if (!READ_ONCE(node->sleepy)) {
+		/* Propagate back sleepy==false */
+		if (node->next && node->next->sleepy)
+			node->next->sleepy = 0;
 		goto yield_prev;
-	}
-
-	yield_count = yield_count_of(yield_cpu);
-	if ((yield_count & 1) == 0)
-		goto yield_prev; /* owner vcpu is running */
-
-	if (get_owner_cpu(READ_ONCE(lock->val)) != yield_cpu)
-		goto yield_prev; /* re-sample lock owner */
-
-	spin_end();
-
-	preempted = true;
-	seen_sleepy_node();
-
-	smp_rmb();
+	} else {
+		u32 val = READ_ONCE(lock->val);
+
+		if (val & _Q_LOCKED_VAL) {
+			if (node->next && !node->next->sleepy) {
+				/*
+				 * Propagate sleepy to next waiter. Only if
+				 * owner is preempted, which allows the queue
+				 * to become "non-sleepy" if vCPU preemption
+				 * ceases to occur, even if the lock remains
+				 * highly contended.
+				 */
+				if (vcpu_is_preempted(get_owner_cpu(val)))
+					node->next->sleepy = 1;
+			}
 
-	if (yield_cpu == node->yield_cpu) {
-		if (node->next && node->next->yield_cpu != yield_cpu)
-			node->next->yield_cpu = yield_cpu;
-		yield_to_preempted(yield_cpu, yield_count);
-		spin_begin();
-		return preempted;
+			preempted = yield_to_locked_owner(lock, val, paravirt);
+			if (preempted)
+				return preempted;
+		}
 	}
-	spin_begin();
 
 yield_prev:
 	if (!pv_yield_prev)
@@ -541,7 +533,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	bool sleepy = false;
 	bool mustq = false;
 	int idx;
-	int set_yield_cpu = -1;
+	bool set_sleepy = false;
 	int iters = 0;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -565,7 +557,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node->next = NULL;
 	node->lock = lock;
 	node->cpu = smp_processor_id();
-	node->yield_cpu = -1;
+	node->sleepy = 0;
 	node->locked = 0;
 
 	tail = encode_tail_cpu(node->cpu);
@@ -599,9 +591,9 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		spec_barrier();
 		spin_end();
 
-		/* Clear out stale propagated yield_cpu */
-		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
-			node->yield_cpu = -1;
+		/* Clear out stale propagated sleepy */
+		if (paravirt && pv_yield_propagate_owner && node->sleepy)
+			node->sleepy = 0;
 
 		smp_rmb(); /* acquire barrier for the mcs lock */
 
@@ -644,7 +636,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			}
 		}
 
-		propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
+		propagate_sleepy(node, val, &set_sleepy, paravirt);
 		preempted = yield_head_to_locked_owner(lock, val, paravirt);
 		if (!maybe_stealers)
 			continue;
-- 
2.42.0

