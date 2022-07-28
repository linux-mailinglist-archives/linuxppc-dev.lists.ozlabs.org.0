Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1A5838DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgvf5gtbz3fMR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:38:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jVZBHahO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jVZBHahO;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmD5kJQz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:56 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id iw1so971942plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UklV4S1yn2EzT29TU7wEjjAviLqVXybleQh7Zs8pWU8=;
        b=jVZBHahOkxfFbEua4bGzeNw1vv5QvAhZbaxlNqJWO1mi2rZyPdO9e7T3Fk2BIQNNwk
         Jk56xp+/sXqPfeD/ZlBQmeIMCJUYJa7VzA1W2mBPc8sEyaYjsNt8J9Xv1YWKwVaCozqL
         RkAufj+fCgWXwF/QNXo3CU6bwU5Bzg1I4rukolJH7+/AR8cprLx+tti8S2VgoDPKLayI
         GoevAYzjURCaNT4rtjrk0gGQe9Ddn7M6zim7yWRRfDEJoTJjcDezSbU9j9MiJPdv6vFV
         NqDLxFn4NjWSQ561ef03dwBDOE72AgYtwwyH87H4eSCWMVblb6OXSNO7F+S8Yx3Onq+e
         qhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UklV4S1yn2EzT29TU7wEjjAviLqVXybleQh7Zs8pWU8=;
        b=mO8M01CG4M218iAe/OqrgE0iuYwn0merJIqGoWuXCfsxEQ5DS8EncFFIKyN3kHhwmc
         94zSTdOJqv8dRed+pt0wHntjBqGTuIIObvbUJFi1sDWm6jV6rxIpYxdtR0L0SIqUKnOB
         zMcGK7jDrdGQMa+gOnzkEgtPwIaJ1kA0ReXCOULzdwCYKEDHMKpLWOOL37qQQ2k7Vx/m
         5+8lCEnDCmV7NaF+f700H6D40iCmrvn9aKrUyYQr2+etwTRORBPnv3BbrlSPUaOkq5CV
         z1Te1IGOt478CoPDsxBRcGn/7cFMOrSNUlGlpMm/o58ELjmTZo2QdRLXCu1oVGB9R4Tc
         x+Fg==
X-Gm-Message-State: AJIora8IB+lnfT8LqR/Bxsr+PI/4AZXKxnjHQaM4uTbG08+MFf251X3P
	pQ0DsG4lYy24TxpiUvbxAWMB3Dk9JpM=
X-Google-Smtp-Source: AGRyM1sZtGOyk/bwuSs7tB/eTn1zH/nvke6BRozVCvvJxkHWlYIauhdqxg92Nq7qjZ1rNW8dEj5hwA==
X-Received: by 2002:a17:90b:1b52:b0:1f2:9722:fe31 with SMTP id nv18-20020a17090b1b5200b001f29722fe31mr8934056pjb.52.1658989914587;
        Wed, 27 Jul 2022 23:31:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/17] powerpc/qspinlock: allow stealing when head of queue yields
Date: Thu, 28 Jul 2022 16:31:13 +1000
Message-Id: <20220728063120.2867508-12-npiggin@gmail.com>
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

If the head of queue is preventing stealing but it finds the owner vCPU
is preempted, it will yield its cycles to the owner which could cause it
to become preempted. Add an option to re-allow stealers before yielding,
and disallow them again after returning from the yield.

Disable this option by default for now, i.e., no logical change.
---
 arch/powerpc/lib/qspinlock.c | 56 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index b39f8c5b329c..94f007f66942 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly = true;
 static int HEAD_SPINS __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
@@ -173,6 +174,23 @@ static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
 	return prev;
 }
 
+static __always_inline u32 lock_clear_mustq(struct qspinlock *lock)
+{
+	u32 new = _Q_MUST_Q_VAL;
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# lock_clear_mustq			\n"
+"	andc	%0,%0,%2						\n"
+"	stwcx.	%0,0,%1							\n"
+"	bne-	1b							\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (new)
+	: "cr0", "memory");
+
+	return prev;
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = get_tail_cpu(val);
@@ -188,7 +206,7 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
 {
 	int owner;
 	u32 yield_count;
@@ -217,7 +235,11 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	smp_rmb();
 
 	if (READ_ONCE(lock->val) == val) {
+		if (clear_mustq)
+			lock_clear_mustq(lock);
 		yield_to_preempted(owner, yield_count);
+		if (clear_mustq)
+			lock_set_mustq(lock);
 		/* Don't relax if we yielded. Maybe we should? */
 		return;
 	}
@@ -225,6 +247,16 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	cpu_relax();
 }
 
+static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	__yield_to_locked_owner(lock, val, paravirt, false);
+}
+
+static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
+{
+	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
+}
+
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
 {
 	u32 yield_count;
@@ -332,7 +364,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	if (!MAYBE_STEALERS) {
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_head_to_locked_owner(lock, val, paravirt, false);
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -350,7 +382,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_head_to_locked_owner(lock, val, paravirt,
+					pv_yield_allow_steal && set_mustq);
 
 			iters++;
 			if (!set_mustq && iters >= get_head_spins(paravirt)) {
@@ -475,6 +508,22 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
 
+static int pv_yield_allow_steal_set(void *data, u64 val)
+{
+	pv_yield_allow_steal = !!val;
+
+	return 0;
+}
+
+static int pv_yield_allow_steal_get(void *data, u64 *val)
+{
+	*val = pv_yield_allow_steal;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_allow_steal, pv_yield_allow_steal_get, pv_yield_allow_steal_set, "%llu\n");
+
 static int pv_yield_prev_set(void *data, u64 val)
 {
 	pv_yield_prev = !!val;
@@ -497,6 +546,7 @@ static __init int spinlock_debugfs_init(void)
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 	}
 
-- 
2.35.1

