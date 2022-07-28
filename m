Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6F5838E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgyT5m8Fz3fjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XD329lfM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XD329lfM;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmN2mtnz2xKq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:32:04 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so1176244pjf.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQYmlMIafG40nFETQkzDdbcTDYPAqV5QWAHrYoRV5EQ=;
        b=XD329lfMD9ARiY3elxmai/s2tyh/vz9yyfAAMIwUK8YFe0aFYhKOhUCrDOtBgOx9Tc
         mKov89Hs0G283C6Bd+olSh56Kw+u6ljbcqlb9QtKWuRJcBULuZjw2MWlqdA2z/0LFqPE
         Kzadt6RCm6pq0K82b45nsJ/4GWgOwxVJjLF6LNpVxy0iBOe2qe0zcy3EUHvtDW2ciNoR
         Bj8JMqvuds1P8mY4C7Z35X45f6ljsUHhf8Ghbefi9eNRCbrxasZlMRHdH+SK5K/YwIlD
         S9+scnuVd4mLW1RdX1mfrlnC61CgHnclF/nrxdSsSrIStMAWk2hYtpFgAStsJyfMU692
         CD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQYmlMIafG40nFETQkzDdbcTDYPAqV5QWAHrYoRV5EQ=;
        b=uejkHpD2Aqsz20IAd+DTb9bZ46WJd5U5G/QWIYL2Oc3gMtGrg5TlhzfZg+Ljcqe7Pt
         J/+R20YM0oh8bQ/TLdgAUmbKXGFTCi3HXOt8IBs6mwnRblhD+l+1sPmWvbF6qxQIRLHe
         dbWvpIjCihZj9FIthL8Nqow08vx7FSMIkRX3Vyw5E/HCjOp0CR24L+hoMYxvvsMljPk6
         7U7ECMOT3SdRdjL0EXzbT40aymY+h0KUh2dCnQWhhV5in3Fi+c1ZGaRnfsfw8eD7JaiH
         rjMv89TmuR0E96YyLp02ydPYaQLsgUQYcBECP1/PEC5LpRt9LvQRFV7OT4DExkVkzomJ
         DyJA==
X-Gm-Message-State: AJIora+sTL49Ij5FbWKBtMB/R74fnKprZ8qmJ5+pK96UYK4U2KkXXoeC
	8BV9kTNU7h7KA6fDfLZY/8YnH/Rncwg=
X-Google-Smtp-Source: AGRyM1uVxOviWfpM+1MM2xvYp/SyzLLgkWZC8DutI6DT6NFlqKO04u85hwR7TFAtqccJIZuyq2R/kg==
X-Received: by 2002:a17:90b:38c3:b0:1f2:e229:41fd with SMTP id nn3-20020a17090b38c300b001f2e22941fdmr8427054pjb.201.1658989923566;
        Wed, 27 Jul 2022 23:32:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:32:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/17] powerpc/qspinlock: use spin_begin/end API
Date: Thu, 28 Jul 2022 16:31:17 +1000
Message-Id: <20220728063120.2867508-16-npiggin@gmail.com>
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

Use the spin_begin/spin_cpu_relax/spin_end APIs in qspinlock, which helps
to prevent threads issuing a lot of expensive priority nops which may not
have much effect due to immediately executing low then medium priority.
---
 arch/powerpc/lib/qspinlock.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 277aef1fab0a..d4594c701f7d 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -233,6 +233,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
+	spin_end();
+
 	/*
 	 * Read the lock word after sampling the yield count. On the other side
 	 * there may a wmb because the yield count update is done by the
@@ -248,11 +250,13 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 		yield_to_preempted(owner, yield_count);
 		if (clear_mustq)
 			lock_set_mustq(lock);
+		spin_begin();
 		/* Don't relax if we yielded. Maybe we should? */
 		return;
 	}
+	spin_begin();
 relax:
-	cpu_relax();
+	spin_cpu_relax();
 }
 
 static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
@@ -315,14 +319,18 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
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
@@ -332,15 +340,19 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
+	spin_end();
+
 	smp_rmb(); /* See yield_to_locked_owner comment */
 
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
 
 
@@ -349,6 +361,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	int iters;
 
 	/* Attempt to steal the lock */
+	spin_begin();
 	for (;;) {
 		u32 val = READ_ONCE(lock->val);
 
@@ -356,8 +369,10 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			break;
 
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
+			spin_end();
 			if (trylock_with_tail_cpu(lock, val))
 				return true;
+			spin_begin();
 			continue;
 		}
 
@@ -368,6 +383,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		if (iters >= get_steal_spins(paravirt))
 			break;
 	}
+	spin_end();
 
 	return false;
 }
@@ -418,8 +434,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		WRITE_ONCE(prev->next, node);
 
 		/* Wait for mcs node lock to be released */
+		spin_begin();
 		while (!node->locked)
 			yield_to_prev(lock, node, prev_cpu, paravirt);
+		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
 		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
@@ -432,10 +450,12 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		int set_yield_cpu = -1;
 
 		/* We're at the head of the waitqueue, wait for the lock. */
+		spin_begin();
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt, false);
 		}
+		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -453,6 +473,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
+		spin_begin();
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt,
@@ -465,6 +486,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 				val |= _Q_MUST_Q_VAL;
 			}
 		}
+		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -480,8 +502,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
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
2.35.1

