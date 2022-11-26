Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53F639535
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:12:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6ws3Pvnz3fLd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:12:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nukK7K/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nukK7K/b;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fx5RRCz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:25 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id q71so5755459pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JiYM0dGwyhprcvukkjNkJqEwAgSn5XCubo9AuVi2lw=;
        b=nukK7K/bb5NlCuXxY07NT1z9Qd97agpyi3mZgzLtWeewlI6ONoCcRGtjdbIzeNK6b2
         dy5SYP3J1JSCYfvZOTaNLypBcN3zLLY3ecHkCGriIMhFjtg2cb2tj0XfvMeG+wtdA/qI
         ifNA9sd2rckMhKofg28PwD56gS+lTHf5igqGtCxr2DbrTTsZo2NWgYFn6lQuiZY69aS+
         keFE9FdsT5sJfXRlskpL5qwhXBcvRk5RDCd+qatJs9ZjWorrm74zcwOWAj+xPKn1h43Z
         aU9rsy6N887Xi/tZIjpqggzpJOv+FYNuk2xoVo4LmoDgE+RyoDX61ofIJuQ+sgynurM4
         oa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JiYM0dGwyhprcvukkjNkJqEwAgSn5XCubo9AuVi2lw=;
        b=viGEMIfOm4L16CvM/n4NM1euEn7EWyQHd1GKplsCA0msyAi5asFosMn4OZCV2vlile
         0R/eJow5eWslBpb+LIerGy08ziQ4BEJjGFx/2GpleeHBFLPhWLhvil+r+9mWF7qvwYD0
         yBze/hSaqc9hHU3aVZL9KIOri4+k7NPyJN365RW2M5QJ+R96VZ3nBljHJgn5wYTr0LRR
         lyg08VfGKD/s8Qfr1XswT6vN5QjzcznifB5bhVETshJwpsguV7wyAo8B4s6B/464PMBK
         6KcPfRuBI+3gIq9vmTK/rDRNyNUHwkzL363Dcm877f4KozwZ0TtNVKr9KEU0xf+MJsbQ
         dAWQ==
X-Gm-Message-State: ANoB5plKpquPinb8M3T5OdUIimrSwKwn4xgeAdNFrY/WuH97nUPb68TI
	QBxdQCZDLze1xaphE47ZPXP+YJ1vAWBdmg==
X-Google-Smtp-Source: AA0mqf5KjIbB37LUM9MaysacVM77I4pUUcpz/INwzU3Hw08obYt7qiA0dQoAyjBg1s1C3ki1vGZUxw==
X-Received: by 2002:a63:2c8:0:b0:457:4863:2e85 with SMTP id 191-20020a6302c8000000b0045748632e85mr21000013pgc.6.1669456823073;
        Sat, 26 Nov 2022 02:00:23 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/17] powerpc/qspinlock: use spin_begin/end API
Date: Sat, 26 Nov 2022 19:59:28 +1000
Message-Id: <20221126095932.1234527-14-npiggin@gmail.com>
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

Use the spin_begin/spin_cpu_relax/spin_end APIs in qspinlock, which helps
to prevent threads issuing a lot of expensive priority nops which may not
have much effect due to immediately executing low then medium priority.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 39 ++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 1cb47a6478a0..70f924296b36 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -184,6 +184,7 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
+/* Called inside spin_begin() */
 static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool mustq)
 {
 	int owner;
@@ -203,6 +204,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
+	spin_end();
+
 	/*
 	 * Read the lock word after sampling the yield count. On the other side
 	 * there may a wmb because the yield count update is done by the
@@ -218,18 +221,22 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
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
@@ -267,6 +274,7 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 	}
 }
 
+/* Called inside spin_begin() */
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
 {
 	int prev_cpu = decode_tail_cpu(val);
@@ -291,14 +299,18 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
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
@@ -308,15 +320,19 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
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
 
 
@@ -328,6 +344,8 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		return false;
 
 	/* Attempt to steal the lock */
+	spin_begin();
+
 	do {
 		u32 val = READ_ONCE(lock->val);
 
@@ -335,8 +353,10 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			break;
 
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
+			spin_end();
 			if (__queued_spin_trylock_steal(lock))
 				return true;
+			spin_begin();
 		} else {
 			yield_to_locked_owner(lock, val, paravirt);
 		}
@@ -344,6 +364,8 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		iters++;
 	} while (iters < get_steal_spins(paravirt));
 
+	spin_end();
+
 	return false;
 }
 
@@ -395,8 +417,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		WRITE_ONCE(prev->next, node);
 
 		/* Wait for mcs node lock to be released */
+		spin_begin();
 		while (!node->locked)
 			yield_to_prev(lock, node, old, paravirt);
+		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
 		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
@@ -407,6 +431,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 again:
 	/* We're at the head of the waitqueue, wait for the lock. */
+	spin_begin();
 	for (;;) {
 		val = READ_ONCE(lock->val);
 		if (!(val & _Q_LOCKED_VAL))
@@ -424,6 +449,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			val |= _Q_MUST_Q_VAL;
 		}
 	}
+	spin_end();
 
 	/* If we're the last queued, must clean up the tail. */
 	old = trylock_clean_tail(lock, tail);
@@ -436,8 +462,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		goto release; /* We were the tail, no next. */
 
 	/* There is a next, must wait for node->next != NULL (MCS protocol) */
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

