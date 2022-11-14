Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CB6274B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9Yft1KrRz3fWS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:49:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FJdIuUm2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FJdIuUm2;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YJB5NfNz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:58 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id q9so9785542pfg.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26jftw046NIpGN8HtAXLwE20A5xp/EJwP7MS7N5sDXc=;
        b=FJdIuUm2Tknb8xDw3L/VMLrCf2Exrf3E0gGrVxsH1rUcCKWLrXQAbOL8w/PJg5eLdX
         Pyx8mNTBKOn9SykpJfCYED+CcoQ4IytYujf2xslMC7kfZh5Ueq4AlURPlDMhpEpUPyGm
         RFiNo+nZDSPRwTbpeUkscT+MSTeNR9ThU2caIYksYF5FRvXhDJ4mVwxHVRoAqRC1F2h9
         UaXCHrX0oLlfD4y9MQvyW0npTj4X52514rq5yi9Sgf+ysdPMUf2/J6JK9pX3VnR4xb/0
         7RmoGZERPD/ofgD8qoP+AxTdfhB5KP7BXBiw+vMonJhfoyMY76GJ1DjbePJ1hLpM61eT
         shyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26jftw046NIpGN8HtAXLwE20A5xp/EJwP7MS7N5sDXc=;
        b=AqqkfsueZZ+S1yhHJ9wEHBBB0D6pY4cBdmibuw4b8G7WOinehxO0aDHJd4BMBfwTT+
         fXXC+lF2DUqSiSU0RA1yLU6ISKcsMU98PlQL5KBfl0jdmcVQcfUhR6+eaq8mbC7m8idp
         hEhHKgdvtItY62aqCZ9wRUgM0cLoqHpFZXjOnixoaEg3WZqiZcgDp79jELqV1cAKI+Am
         8AIsEyu255hPmvtXRxWVaBjplbW68CTmEComXwKIs4455LadIs9+T5AxkTV4FLCPJW0+
         oHfF1PYRgdKhx20mjg0m6v4PXE6TF5KuDEkLqfMrp2vmR3OOgfAcIAq/iHeo/pBXpMRX
         9PIA==
X-Gm-Message-State: ANoB5pli+S7/yF6o/0sxfUnC7ih1S4os46tjLpxrO2gb/9wPnhW7Iw4b
	gCYXxa/nAc4KzskxuwykRPtboB17204=
X-Google-Smtp-Source: AA0mqf4ZLdjdvAUkuMbv+t8waHCW+sa8wmHjE1JTFKSQ1hXbcuAF0/A5CWlH8jHYE/jI9IV4MCOIjQ==
X-Received: by 2002:a05:6a00:a13:b0:56c:14a5:2245 with SMTP id p19-20020a056a000a1300b0056c14a52245mr12171715pfh.12.1668393175247;
        Sun, 13 Nov 2022 18:32:55 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 17/17] powerpc/qspinlock: provide accounting and options for sleepy locks
Date: Mon, 14 Nov 2022 12:31:37 +1000
Message-Id: <20221114023137.2679627-19-npiggin@gmail.com>
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

Finding the owner or a queued waiter on a lock with a preempted vcpu
is indicative of an oversubscribed guest causing the lock to get into
trouble. Provide some options to detect this situation and have new
CPUs avoid queueing for a longer time (more steal iterations) to
minimise the problems caused by vcpu preemption on the queue.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock_types.h |   7 +-
 arch/powerpc/lib/qspinlock.c               | 244 +++++++++++++++++++--
 2 files changed, 232 insertions(+), 19 deletions(-)

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
index 7e6ab1f30d50..36afdfde41aa 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -5,6 +5,7 @@
 #include <linux/percpu.h>
 #include <linux/smp.h>
 #include <linux/topology.h>
+#include <linux/sched/clock.h>
 #include <asm/qspinlock.h>
 #include <asm/paravirt.h>
 
@@ -36,25 +37,56 @@ static int head_spins __read_mostly = (1<<8);
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
 
-static __always_inline int get_steal_spins(bool paravirt)
+static __always_inline bool recently_sleepy(void)
 {
-	return steal_spins;
+	/* pv_sleepy_lock is true when this is called */
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
 }
 
-static __always_inline int get_remote_steal_spins(bool paravirt)
+static __always_inline int get_steal_spins(bool paravirt, bool sleepy)
 {
-	return remote_steal_spins;
+	if (paravirt && sleepy)
+		return steal_spins * pv_sleepy_lock_factor;
+	else
+		return steal_spins;
 }
 
-static __always_inline int get_head_spins(bool paravirt)
+static __always_inline int get_remote_steal_spins(bool paravirt, bool sleepy)
 {
-	return head_spins;
+	if (paravirt && sleepy)
+		return remote_steal_spins * pv_sleepy_lock_factor;
+	else
+		return remote_steal_spins;
+}
+
+static __always_inline int get_head_spins(bool paravirt, bool sleepy)
+{
+	if (paravirt && sleepy)
+		return head_spins * pv_sleepy_lock_factor;
+	else
+		return head_spins;
 }
 
 static inline u32 encode_tail_cpu(int cpu)
@@ -187,6 +219,56 @@ static __always_inline u32 clear_mustq(struct qspinlock *lock)
 	return prev;
 }
 
+static __always_inline bool try_set_sleepy(struct qspinlock *lock, u32 old)
+{
+	u32 prev;
+	u32 new = old | _Q_SLEEPY_VAL;
+
+	BUG_ON(!(old & _Q_LOCKED_VAL));
+	BUG_ON(old & _Q_SLEEPY_VAL);
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# try_set_sleepy			\n"
+"	cmpw	0,%0,%2							\n"
+"	bne-	2f							\n"
+"	stwcx.	%3,0,%1							\n"
+"	bne-	1b							\n"
+"2:									\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r"(old), "r" (new)
+	: "cr0", "memory");
+
+	return likely(prev == old);
+}
+
+static __always_inline void seen_sleepy_owner(struct qspinlock *lock, u32 val)
+{
+	if (pv_sleepy_lock) {
+		if (pv_sleepy_lock_interval_ns)
+			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
+		if (!(val & _Q_SLEEPY_VAL))
+			try_set_sleepy(lock, val);
+	}
+}
+
+static __always_inline void seen_sleepy_lock(void)
+{
+	if (pv_sleepy_lock && pv_sleepy_lock_interval_ns)
+		this_cpu_write(sleepy_lock_seen_clock, sched_clock());
+}
+
+static __always_inline void seen_sleepy_node(struct qspinlock *lock, u32 val)
+{
+	if (pv_sleepy_lock) {
+		if (pv_sleepy_lock_interval_ns)
+			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
+		if (val & _Q_LOCKED_VAL) {
+			if (!(val & _Q_SLEEPY_VAL))
+				try_set_sleepy(lock, val);
+		}
+	}
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = decode_tail_cpu(val);
@@ -234,6 +316,7 @@ static __always_inline bool __yield_to_locked_owner(struct qspinlock *lock, u32
 
 	spin_end();
 
+	seen_sleepy_owner(lock, val);
 	preempted = true;
 
 	/*
@@ -308,11 +391,12 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 }
 
 /* Called inside spin_begin() */
-static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
+static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
 {
 	int prev_cpu = decode_tail_cpu(val);
 	u32 yield_count;
 	int yield_cpu;
+	bool preempted = false;
 
 	if (!paravirt)
 		goto relax;
@@ -334,6 +418,9 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 
 	spin_end();
 
+	preempted = true;
+	seen_sleepy_node(lock, val);
+
 	smp_rmb();
 
 	if (yield_cpu == node->yield_cpu) {
@@ -341,7 +428,7 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 			node->next->yield_cpu = yield_cpu;
 		yield_to_preempted(yield_cpu, yield_count);
 		spin_begin();
-		return;
+		return preempted;
 	}
 	spin_begin();
 
@@ -355,26 +442,31 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 
 	spin_end();
 
+	preempted = true;
+	seen_sleepy_node(lock, val);
+
 	smp_rmb(); /* See __yield_to_locked_owner comment */
 
 	if (!node->locked) {
 		yield_to_preempted(prev_cpu, yield_count);
 		spin_begin();
-		return;
+		return preempted;
 	}
 	spin_begin();
 
 relax:
 	spin_cpu_relax();
+
+	return preempted;
 }
 
-static __always_inline bool steal_break(u32 val, int iters, bool paravirt)
+static __always_inline bool steal_break(u32 val, int iters, bool paravirt, bool sleepy)
 {
-	if (iters >= get_steal_spins(paravirt))
+	if (iters >= get_steal_spins(paravirt, sleepy))
 		return true;
 
 	if (IS_ENABLED(CONFIG_NUMA) &&
-			(iters >= get_remote_steal_spins(paravirt))) {
+			(iters >= get_remote_steal_spins(paravirt, sleepy))) {
 		int cpu = get_owner_cpu(val);
 		if (numa_node_id() != cpu_to_node(cpu))
 			return true;
@@ -384,6 +476,8 @@ static __always_inline bool steal_break(u32 val, int iters, bool paravirt)
 
 static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
+	bool seen_preempted = false;
+	bool sleepy = false;
 	int iters = 0;
 	u32 val;
 
@@ -410,7 +504,25 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			preempted = yield_to_locked_owner(lock, val, paravirt);
 		}
 
+		if (paravirt && pv_sleepy_lock) {
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
+				if (try_set_sleepy(lock, val))
+					val |= _Q_SLEEPY_VAL;
+			}
+		}
+
 		if (preempted) {
+			seen_preempted = true;
+			sleepy = true;
 			if (!pv_spin_on_preempted_owner)
 				iters++;
 			/*
@@ -424,7 +536,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		} else {
 			iters++;
 		}
-	} while (!steal_break(val, iters, paravirt));
+	} while (!steal_break(val, iters, paravirt, sleepy));
 
 	spin_end();
 
@@ -436,6 +548,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
 	u32 val, old, tail;
+	bool seen_preempted = false;
 	int idx;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -477,8 +590,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 		/* Wait for mcs node lock to be released */
 		spin_begin();
-		while (!node->locked)
-			yield_to_prev(lock, node, old, paravirt);
+		while (!node->locked) {
+			if (yield_to_prev(lock, node, old, paravirt))
+				seen_preempted = true;
+		}
 		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
@@ -499,7 +614,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 				break;
 
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-			yield_head_to_locked_owner(lock, val, paravirt);
+			if (yield_head_to_locked_owner(lock, val, paravirt))
+				seen_preempted = true;
 		}
 		spin_end();
 
@@ -515,7 +631,9 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	} else {
 		int set_yield_cpu = -1;
 		int iters = 0;
+		bool sleepy = false;
 		bool mustq = false;
+		bool preempted;
 
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
@@ -525,15 +643,37 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
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
+					if (try_set_sleepy(lock, val))
+						val |= _Q_SLEEPY_VAL;
+				}
+			}
+
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-			if (yield_head_to_locked_owner(lock, val, paravirt)) {
+			preempted = yield_head_to_locked_owner(lock, val, paravirt);
+			if (preempted)
+				seen_preempted = true;
+
+			if (paravirt && preempted) {
+				sleepy = true;
+
 				if (!pv_spin_on_preempted_owner)
 					iters++;
 			} else {
 				iters++;
 			}
 
-			if (!mustq && iters >= get_head_spins(paravirt)) {
+			if (!mustq && iters >= get_head_spins(paravirt, sleepy)) {
 				mustq = true;
 				set_mustq(lock);
 				val |= _Q_MUST_Q_VAL;
@@ -733,6 +873,70 @@ static int pv_spin_on_preempted_owner_get(void *data, u64 *val)
 
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
@@ -790,6 +994,10 @@ static __init int spinlock_debugfs_init(void)
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
2.37.2

