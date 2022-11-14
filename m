Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF63A6274A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:46:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9Ybg5Xk3z3fRH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:46:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M8+88ofT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M8+88ofT;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHz2fF1z3dvf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:47 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id b21so8845248plc.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjpE3jVVn946ihSc1RuQRXSXhPe2XHAfeGF4cz4ifk8=;
        b=M8+88ofTGx4Z/sg6rbw0avEH+akdSAQdCN9evENO4RPy7/cPq/+e4G0VA1xwhEgVvu
         YN0/egmJhNx8S5e9ACklfNLWINL3cA3mdlx2iW0oLywa4vGG149GAmDV6xPnC0ddTAox
         ibH+L/FfZOXE1vn1v6oBZUr8sZsP8iPSrtCAIsOJzIr01dGtv6+ctXI12GN0PYUQM4bD
         DVZZyBI5JB6ba5M2PAIwfLnll+sbKdS8SCIVxccn0R7G5ARWHFk427sNedJKWN1UDHGx
         wfxWxjhVzDcVQyuPwxJBIY4BmG5NnBmWp6SfdazHM+te5f0U/85nj5EXT2LI8MMMTJfi
         A25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjpE3jVVn946ihSc1RuQRXSXhPe2XHAfeGF4cz4ifk8=;
        b=vj+v2kmTYtwoolHXyNIrmA9XciiSoBDvJ30uRtf334xGTioFNRZpB12lDMFH8ajocH
         KK6vKCmjX9thGRJoD0fkLU5psHa1n1lN+s9+Ui3YqfJUcXLg9UEJXckRkWocsAXzRcqS
         57oUScnm/xy0K/NcoItnpdGMMfbu9BJhGmS2cg9bHcNWkwUwrE9chQNIM/4l2MMI8sF/
         nL7Da8Pji8OV4y0yS+/INSfcAT7o5/Omht4RjLCeVSrfosr86pqxq7M2JDu3AXXzwpcr
         K83e5ZzScFxZLwnN3nVtI3OhnR0swKiJyZc4oCZ0UsTP/FaiEgohV0XRtclNz20R44cf
         LVlw==
X-Gm-Message-State: ANoB5pl00YEOuLiLpXhpLY+PuXGq1ypl0i1V9uKca+Ph6iC/hq76dImP
	tTLE+ohLYP5hbTaAJsmwYQcIfFXpbN0=
X-Google-Smtp-Source: AA0mqf6S3Vm6nq766rWXsZRNCLgnMPCLIrEuNQOnqbERoMBNXNPuSyas0BcOliwEsyZc/wdPe/26zw==
X-Received: by 2002:a17:902:f64d:b0:186:9cce:c59 with SMTP id m13-20020a170902f64d00b001869cce0c59mr11751652plg.120.1668393164675;
        Sun, 13 Nov 2022 18:32:44 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/17] powerpc/qspinlock: use spin_begin/end API
Date: Mon, 14 Nov 2022 12:31:34 +1000
Message-Id: <20221114023137.2679627-16-npiggin@gmail.com>
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

Use the spin_begin/spin_cpu_relax/spin_end APIs in qspinlock, which helps
to prevent threads issuing a lot of expensive priority nops which may not
have much effect due to immediately executing low then medium priority.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 41 ++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 830a90a66f5f..ea8886e2922b 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -203,6 +203,7 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
+/* Called inside spin_begin() */
 static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool mustq)
 {
 	int owner;
@@ -222,6 +223,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
+	spin_end();
+
 	/*
 	 * Read the lock word after sampling the yield count. On the other side
 	 * there may a wmb because the yield count update is done by the
@@ -237,18 +240,22 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 		yield_to_preempted(owner, yield_count);
 		if (mustq)
 			set_mustq(lock);
+		spin_begin();
 		/* Don't relax if we yielded. Maybe we should? */
 		return;
 	}
+	spin_begin();
 relax:
-	cpu_relax();
+	spin_cpu_relax();
 }
 
+/* Called inside spin_begin() */
 static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
 {
 	__yield_to_locked_owner(lock, val, paravirt, false);
 }
 
+/* Called inside spin_begin() */
 static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
 {
 	bool mustq = false;
@@ -286,6 +293,7 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 	}
 }
 
+/* Called inside spin_begin() */
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
 {
 	int prev_cpu = decode_tail_cpu(val);
@@ -310,14 +318,18 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 	if ((yield_count & 1) == 0)
 		goto yield_prev; /* owner vcpu is running */
 
+	spin_end();
+
 	smp_rmb();
 
 	if (yield_cpu == node->yield_cpu) {
 		if (node->next && node->next->yield_cpu != yield_cpu)
 			node->next->yield_cpu = yield_cpu;
 		yield_to_preempted(yield_cpu, yield_count);
+		spin_begin();
 		return;
 	}
+	spin_begin();
 
 yield_prev:
 	if (!pv_yield_prev)
@@ -327,15 +339,19 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
+	spin_end();
+
 	smp_rmb(); /* See __yield_to_locked_owner comment */
 
 	if (!node->locked) {
 		yield_to_preempted(prev_cpu, yield_count);
+		spin_begin();
 		return;
 	}
+	spin_begin();
 
 relax:
-	cpu_relax();
+	spin_cpu_relax();
 }
 
 
@@ -347,6 +363,8 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		return false;
 
 	/* Attempt to steal the lock */
+	spin_begin();
+
 	do {
 		u32 val = READ_ONCE(lock->val);
 
@@ -354,8 +372,10 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			break;
 
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
+			spin_end();
 			if (trylock_with_tail_cpu(lock, val))
 				return true;
+			spin_begin();
 		} else {
 			yield_to_locked_owner(lock, val, paravirt);
 		}
@@ -363,6 +383,8 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		iters++;
 	} while (iters < get_steal_spins(paravirt));
 
+	spin_end();
+
 	return false;
 }
 
@@ -411,8 +433,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		WRITE_ONCE(prev->next, node);
 
 		/* Wait for mcs node lock to be released */
+		spin_begin();
 		while (!node->locked)
 			yield_to_prev(lock, node, old, paravirt);
+		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
 		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
@@ -425,6 +449,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		int set_yield_cpu = -1;
 
 		/* We're at the head of the waitqueue, wait for the lock. */
+		spin_begin();
 		for (;;) {
 			val = READ_ONCE(lock->val);
 			if (!(val & _Q_LOCKED_VAL))
@@ -433,6 +458,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt);
 		}
+		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -450,6 +476,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
+		spin_begin();
 		for (;;) {
 			val = READ_ONCE(lock->val);
 			if (!(val & _Q_LOCKED_VAL))
@@ -465,6 +492,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 				val |= _Q_MUST_Q_VAL;
 			}
 		}
+		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -480,8 +508,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 unlock_next:
 	/* contended path; must wait for next != NULL (MCS protocol) */
-	while (!(next = READ_ONCE(node->next)))
-		cpu_relax();
+	next = READ_ONCE(node->next);
+	if (!next) {
+		spin_begin();
+		while (!(next = READ_ONCE(node->next)))
+			cpu_relax();
+		spin_end();
+	}
 
 	/*
 	 * Unlock the next mcs waiter node. Release barrier is not required
-- 
2.37.2

