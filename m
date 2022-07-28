Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B995838EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lth0j6k15z3fSb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X0Wuk7jC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X0Wuk7jC;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmX6qpqz3cBj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:32:12 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id b22so959597plz.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Uk3cUuEFyqVVX7CBdGmDsxKBk0oPQH/xAQqlGqzV3I=;
        b=X0Wuk7jCq2hYGuULfOP5DLHYXyGfofOVX1BTq0FDpHoP/9M/Gy0RjugcVbHv/t0v4i
         J7Rww2iEBDNnQDYUr5kerQlSafLtXN/oj0xS6n8ypH+8XO1rv6hHQrBf57htdYblb0FM
         LYaVjn0HPQNbr/3up2OaZIxZd+FGR/9IP0Kjgo/ouGlqot/jlgg9Y1SRgZ3D9UgCeQoQ
         JOTgACUbLMlbOX6PFrTSBZ2ws2Ov/lOluCV7WtOx7ZJou8BZFpmK+fSmrGmyqsbmY2pL
         4jnBdhN50RUr8MD6Rf/5Ec3xOWQPS5evgHq1BQJVt+28ghMG2Bt/6Z9NxJOsx+V7Etfx
         Qj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Uk3cUuEFyqVVX7CBdGmDsxKBk0oPQH/xAQqlGqzV3I=;
        b=qLBLE+hNM62SqP2Rk1LGkNDXkVBcnbGPwXi2PFOoelTreVpY9ocg/SFp/T+y5qHorq
         4KWfk8d7sTTlIKwMiLdsdvW0fL77TUHdSdcyzzfN1MyD7f7EJqm4MRif6Ea640PUNVPG
         f5lnwsuKfDyr/iPrLqweXvjlvA/rrp3oroBo6KGjWvm7vByp9zVRfUv3x6YtMCXND/X7
         oZRl9BW4ImutUtXmGIXObBceyzU9heranI9eYResXbl32Mf3p2Td2PdNGI5BX4K7ddd8
         r30lYujB5M1lyRREXtuCO+CjwMrqQBFKR33cWeKoU+8/JxCu58LGCKsiFN1FHZIORM/u
         CMkg==
X-Gm-Message-State: AJIora9onPPuAVw3OQmFba0H2TcrX2RagTqcPwJE1zVzE/pTGq0EkT15
	NphI25b2pom904bq6VhI4RXmRQ5sPqo=
X-Google-Smtp-Source: AGRyM1uUmjgc1l1yPLmWYIMB+P2s609hnzKlQkAyM6uDvkTY2z8Mnrx/6nSe/DffNn5QVwvKk/v+sQ==
X-Received: by 2002:a17:902:f608:b0:16d:20a0:5339 with SMTP id n8-20020a170902f60800b0016d20a05339mr24494604plg.133.1658989930304;
        Wed, 27 Jul 2022 23:32:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:32:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/17] powerpc/qspinlock: provide accounting and options for sleepy locks
Date: Thu, 28 Jul 2022 16:31:20 +1000
Message-Id: <20220728063120.2867508-19-npiggin@gmail.com>
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

Finding the owner or a queued waiter on a lock with a preempted vcpu
is indicative of an oversubscribed guest causing the lock to get into
trouble. Provide some options to detect this situation and have new
CPUs avoid queueing for a longer time (more steal iterations) to
minimise the problems caused by vcpu preemption on the queue.
---
 arch/powerpc/include/asm/qspinlock_types.h |   7 +-
 arch/powerpc/lib/qspinlock.c               | 240 +++++++++++++++++++--
 2 files changed, 232 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 35f9525381e6..4fbcc8a4230b 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -30,7 +30,7 @@ typedef struct qspinlock {
  *
  *     0: locked bit
  *  1-14: lock holder cpu
- *    15: unused bit
+ *    15: lock owner or queuer vcpus observed to be preempted bit
  *    16: must queue bit
  * 17-31: tail cpu (+1)
  */
@@ -49,6 +49,11 @@ typedef struct qspinlock {
 #error "qspinlock does not support such large CONFIG_NR_CPUS"
 #endif
 
+#define _Q_SLEEPY_OFFSET	15
+#define _Q_SLEEPY_BITS		1
+#define _Q_SLEEPY_MASK		_Q_SET_MASK(SLEEPY_OWNER)
+#define _Q_SLEEPY_VAL		(1U << _Q_SLEEPY_OFFSET)
+
 #define _Q_MUST_Q_OFFSET	16
 #define _Q_MUST_Q_BITS		1
 #define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 5cfd69931e31..c18133c01450 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -5,6 +5,7 @@
 #include <linux/percpu.h>
 #include <linux/smp.h>
 #include <linux/topology.h>
+#include <linux/sched/clock.h>
 #include <asm/qspinlock.h>
 #include <asm/paravirt.h>
 
@@ -36,24 +37,54 @@ static int HEAD_SPINS __read_mostly = (1<<8);
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_spin_on_preempted_owner __read_mostly = false;
+static bool pv_sleepy_lock __read_mostly = true;
+static bool pv_sleepy_lock_sticky __read_mostly = false;
+static u64 pv_sleepy_lock_interval_ns __read_mostly = 0;
+static int pv_sleepy_lock_factor __read_mostly = 256;
 static bool pv_yield_prev __read_mostly = true;
 static bool pv_yield_propagate_owner __read_mostly = true;
 static bool pv_prod_head __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
+static DEFINE_PER_CPU_ALIGNED(u64, sleepy_lock_seen_clock);
 
-static __always_inline int get_steal_spins(bool paravirt, bool remote)
+static __always_inline bool recently_sleepy(void)
+{
+	if (pv_sleepy_lock_interval_ns) {
+		u64 seen = this_cpu_read(sleepy_lock_seen_clock);
+
+		if (seen) {
+			u64 delta = sched_clock() - seen;
+			if (delta < pv_sleepy_lock_interval_ns)
+				return true;
+			this_cpu_write(sleepy_lock_seen_clock, 0);
+		}
+	}
+
+	return false;
+}
+
+static __always_inline int get_steal_spins(bool paravirt, bool remote, bool sleepy)
 {
 	if (remote) {
-		return REMOTE_STEAL_SPINS;
+		if (paravirt && sleepy)
+			return REMOTE_STEAL_SPINS * pv_sleepy_lock_factor;
+		else
+			return REMOTE_STEAL_SPINS;
 	} else {
-		return STEAL_SPINS;
+		if (paravirt && sleepy)
+			return STEAL_SPINS * pv_sleepy_lock_factor;
+		else
+			return STEAL_SPINS;
 	}
 }
 
-static __always_inline int get_head_spins(bool paravirt)
+static __always_inline int get_head_spins(bool paravirt, bool sleepy)
 {
-	return HEAD_SPINS;
+	if (paravirt && sleepy)
+		return HEAD_SPINS * pv_sleepy_lock_factor;
+	else
+		return HEAD_SPINS;
 }
 
 static inline u32 encode_tail_cpu(void)
@@ -206,6 +237,60 @@ static __always_inline u32 lock_clear_mustq(struct qspinlock *lock)
 	return prev;
 }
 
+static __always_inline bool lock_try_set_sleepy(struct qspinlock *lock, u32 old)
+{
+	u32 prev;
+	u32 new = old | _Q_SLEEPY_VAL;
+
+	BUG_ON(!(old & _Q_LOCKED_VAL));
+	BUG_ON(old & _Q_SLEEPY_VAL);
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# lock_try_set_sleepy			\n"
+"	cmpw	0,%0,%2							\n"
+"	bne-	2f							\n"
+"	stwcx.	%3,0,%1							\n"
+"	bne-	1b							\n"
+"2:									\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r"(old), "r" (new)
+	: "cr0", "memory");
+
+	if (prev == old)
+		return true;
+	return false;
+}
+
+static __always_inline void seen_sleepy_owner(struct qspinlock *lock, u32 val)
+{
+	if (pv_sleepy_lock) {
+		if (pv_sleepy_lock_interval_ns)
+			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
+		if (!(val & _Q_SLEEPY_VAL))
+			lock_try_set_sleepy(lock, val);
+	}
+}
+
+static __always_inline void seen_sleepy_lock(void)
+{
+	if (pv_sleepy_lock && pv_sleepy_lock_interval_ns)
+		this_cpu_write(sleepy_lock_seen_clock, sched_clock());
+}
+
+static __always_inline void seen_sleepy_node(struct qspinlock *lock)
+{
+	if (pv_sleepy_lock) {
+		u32 val = READ_ONCE(lock->val);
+
+		if (pv_sleepy_lock_interval_ns)
+			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
+		if (val & _Q_LOCKED_VAL) {
+			if (!(val & _Q_SLEEPY_VAL))
+				lock_try_set_sleepy(lock, val);
+		}
+	}
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = get_tail_cpu(val);
@@ -244,6 +329,7 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 
 	spin_end();
 
+	seen_sleepy_owner(lock, val);
 	*preempted = true;
 
 	/*
@@ -307,11 +393,13 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 	}
 }
 
-static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
+static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt, bool *preempted)
 {
 	u32 yield_count;
 	int yield_cpu;
 
+	*preempted = false;
+
 	if (!paravirt)
 		goto relax;
 
@@ -332,6 +420,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 
 	spin_end();
 
+	*preempted = true;
+	seen_sleepy_node(lock);
+
 	smp_rmb();
 
 	if (yield_cpu == node->yield_cpu) {
@@ -353,6 +444,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 
 	spin_end();
 
+	*preempted = true;
+	seen_sleepy_node(lock);
+
 	smp_rmb(); /* See yield_to_locked_owner comment */
 
 	if (!node->locked) {
@@ -369,6 +463,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 
 static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
+	bool preempted;
+	bool seen_preempted = false;
+	bool sleepy = false;
 	int iters = 0;
 
 	if (!STEAL_SPINS) {
@@ -376,7 +473,6 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			spin_begin();
 			for (;;) {
 				u32 val = READ_ONCE(lock->val);
-				bool preempted;
 
 				if (val & _Q_MUST_Q_VAL)
 					break;
@@ -395,7 +491,6 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	spin_begin();
 	for (;;) {
 		u32 val = READ_ONCE(lock->val);
-		bool preempted;
 
 		if (val & _Q_MUST_Q_VAL)
 			break;
@@ -408,9 +503,29 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			continue;
 		}
 
+		if (paravirt && pv_sleepy_lock && !sleepy) {
+			if (!sleepy) {
+				if (val & _Q_SLEEPY_VAL) {
+					seen_sleepy_lock();
+					sleepy = true;
+				} else if (recently_sleepy()) {
+					sleepy = true;
+				}
+			}
+			if (pv_sleepy_lock_sticky && seen_preempted &&
+					!(val & _Q_SLEEPY_VAL)) {
+				if (lock_try_set_sleepy(lock, val))
+					val |= _Q_SLEEPY_VAL;
+			}
+		}
+
 		yield_to_locked_owner(lock, val, paravirt, &preempted);
+		if (preempted)
+			seen_preempted = true;
 
 		if (paravirt && preempted) {
+			sleepy = true;
+
 			if (!pv_spin_on_preempted_owner)
 				iters++;
 			/*
@@ -425,14 +540,15 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			iters++;
 		}
 
-		if (iters >= get_steal_spins(paravirt, false))
+		if (iters >= get_steal_spins(paravirt, false, sleepy))
 			break;
-		if (iters >= get_steal_spins(paravirt, true)) {
+		if (iters >= get_steal_spins(paravirt, true, sleepy)) {
 			int cpu = get_owner_cpu(val);
 			if (numa_node_id() != cpu_to_node(cpu))
 				break;
 		}
 	}
+
 	spin_end();
 
 	return false;
@@ -443,6 +559,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
 	u32 val, old, tail;
+	bool seen_preempted = false;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -485,8 +602,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 		/* Wait for mcs node lock to be released */
 		spin_begin();
-		while (!node->locked)
-			yield_to_prev(lock, node, prev_cpu, paravirt);
+		while (!node->locked) {
+			bool preempted;
+
+			yield_to_prev(lock, node, prev_cpu, paravirt, &preempted);
+			if (preempted)
+				seen_preempted = true;
+		}
 		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
@@ -506,6 +628,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt, false, &preempted);
+			if (preempted)
+				seen_preempted = true;
 		}
 		spin_end();
 
@@ -521,27 +645,47 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	} else {
 		int set_yield_cpu = -1;
 		int iters = 0;
+		bool sleepy = false;
 		bool set_mustq = false;
+		bool preempted;
 
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
 		spin_begin();
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
-			bool preempted;
+			if (paravirt && pv_sleepy_lock) {
+				if (!sleepy) {
+					if (val & _Q_SLEEPY_VAL) {
+						seen_sleepy_lock();
+						sleepy = true;
+					} else if (recently_sleepy()) {
+						sleepy = true;
+					}
+				}
+				if (pv_sleepy_lock_sticky && seen_preempted &&
+						!(val & _Q_SLEEPY_VAL)) {
+					if (lock_try_set_sleepy(lock, val))
+						val |= _Q_SLEEPY_VAL;
+				}
+			}
 
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt,
 					pv_yield_allow_steal && set_mustq,
 					&preempted);
+			if (preempted)
+				seen_preempted = true;
 
 			if (paravirt && preempted) {
+				sleepy = true;
+
 				if (!pv_spin_on_preempted_owner)
 					iters++;
 			} else {
 				iters++;
 			}
 
-			if (!set_mustq && iters >= get_head_spins(paravirt)) {
+			if (!set_mustq && iters >= get_head_spins(paravirt, sleepy)) {
 				set_mustq = true;
 				lock_set_mustq(lock);
 				val |= _Q_MUST_Q_VAL;
@@ -729,6 +873,70 @@ static int pv_spin_on_preempted_owner_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_spin_on_preempted_owner, pv_spin_on_preempted_owner_get, pv_spin_on_preempted_owner_set, "%llu\n");
 
+static int pv_sleepy_lock_set(void *data, u64 val)
+{
+	pv_sleepy_lock = !!val;
+
+	return 0;
+}
+
+static int pv_sleepy_lock_get(void *data, u64 *val)
+{
+	*val = pv_sleepy_lock;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock, pv_sleepy_lock_get, pv_sleepy_lock_set, "%llu\n");
+
+static int pv_sleepy_lock_sticky_set(void *data, u64 val)
+{
+	pv_sleepy_lock_sticky = !!val;
+
+	return 0;
+}
+
+static int pv_sleepy_lock_sticky_get(void *data, u64 *val)
+{
+	*val = pv_sleepy_lock_sticky;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock_sticky, pv_sleepy_lock_sticky_get, pv_sleepy_lock_sticky_set, "%llu\n");
+
+static int pv_sleepy_lock_interval_ns_set(void *data, u64 val)
+{
+	pv_sleepy_lock_interval_ns = val;
+
+	return 0;
+}
+
+static int pv_sleepy_lock_interval_ns_get(void *data, u64 *val)
+{
+	*val = pv_sleepy_lock_interval_ns;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock_interval_ns, pv_sleepy_lock_interval_ns_get, pv_sleepy_lock_interval_ns_set, "%llu\n");
+
+static int pv_sleepy_lock_factor_set(void *data, u64 val)
+{
+	pv_sleepy_lock_factor = val;
+
+	return 0;
+}
+
+static int pv_sleepy_lock_factor_get(void *data, u64 *val)
+{
+	*val = pv_sleepy_lock_factor;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_sleepy_lock_factor, pv_sleepy_lock_factor_get, pv_sleepy_lock_factor_set, "%llu\n");
+
 static int pv_yield_prev_set(void *data, u64 val)
 {
 	pv_yield_prev = !!val;
@@ -786,6 +994,10 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
+		debugfs_create_file("qspl_pv_sleepy_lock", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock);
+		debugfs_create_file("qspl_pv_sleepy_lock_sticky", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_sticky);
+		debugfs_create_file("qspl_pv_sleepy_lock_interval_ns", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_interval_ns);
+		debugfs_create_file("qspl_pv_sleepy_lock_factor", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_factor);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
-- 
2.35.1

