Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB465838D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgtH2bv4z3cBt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZL6sUW54;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZL6sUW54;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltgm908qbz2xJM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:52 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id b133so1107395pfb.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jTyCVshAolfl76VZXMcEMuCE9WwzqwJRBWXyHbfT1MA=;
        b=ZL6sUW548bmQoM9lHA6GZ+StVdFlpHmSbeWGgFP1SpfrtXLdzvA1ha85hC04awjGJH
         FEwmu0HWOo/OXcztXjaRNW2Bw5CwAdUMFGL8Fq0lg5J51sCJnVlzrypxlfsXMdYDoLyt
         RXNXhzWo6pAgL5x4GLrvK8rfAoQk27wM4SH/SaH9deYjJA1wDsDoiVuv25NEEJQ7j4Ti
         NG5aDi4AWYt3/0FKchfzebAXgnTA+yHY4fBLYbirsqI7DyJmvTJXo6lN6bO5mk3kgCN2
         dVqH7TYD51aPSrknTCaAjGLCB5kWsiRG+EIqAWLloX2QBj7lAuM7WicHj69IrpVwJtAq
         vjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jTyCVshAolfl76VZXMcEMuCE9WwzqwJRBWXyHbfT1MA=;
        b=gtAIqXMQMBaLxE/kH3crwE3kp4UIE1fNRmW+rKC3AMhmdppnxfeJsK1jBk8aW0xFG/
         YZIWlO8FvPEYIIDz2PXR/2EGGNPAAytMweC/GeNcJvjuMw5HX9Loy4G9CZVQDKSVI56z
         oPn9T7gEYpPtdMeOi5vtGL87sMeGu8oK6+7KCZDsHvIeemPZJ5HitFqlPpCIz8LMVowE
         BUavr2JHireHdS4S/Uu37jxeZp8i006hbigppRMbXvLwOeK0CXe7GVDWGsxB1QpPwO7D
         jLzuNGMsC3+fSI8hxSsHIC0Jk6heAshW/0ztn6fpxYWJwtF0dcDcY6VO7WtGthiy32wF
         wPEw==
X-Gm-Message-State: AJIora/mtZdSs6j/q6T9fEIa/0ZLdnTcdrZx73h6sVf4zy+788cggrDM
	2SW821xBm41hGadXwrcbw2rE194gTDo=
X-Google-Smtp-Source: AGRyM1vftZvkFA/X0PdNixX8Eg87EUftFincyjMohHuKgO9B99VRCtvmvEfRJEOKK/u6SsLXbbAo3Q==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id l13-20020a056a00140d00b0052ad561d991mr25700695pfu.46.1658989910178;
        Wed, 27 Jul 2022 23:31:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/17] powerpc/qspinlock: paravirt yield to lock owner
Date: Thu, 28 Jul 2022 16:31:11 +1000
Message-Id: <20220728063120.2867508-10-npiggin@gmail.com>
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

Waiters spinning on the lock word should yield to the lock owner if the
vCPU is preempted. This improves performance when the hypervisor has
oversubscribed physical CPUs.
---
 arch/powerpc/lib/qspinlock.c | 97 ++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index aa26cfe21f18..55286ac91da5 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -5,6 +5,7 @@
 #include <linux/percpu.h>
 #include <linux/smp.h>
 #include <asm/qspinlock.h>
+#include <asm/paravirt.h>
 
 #define MAX_NODES	4
 
@@ -24,14 +25,16 @@ static int STEAL_SPINS __read_mostly = (1<<5);
 static bool MAYBE_STEALERS __read_mostly = true;
 static int HEAD_SPINS __read_mostly = (1<<8);
 
+static bool pv_yield_owner __read_mostly = true;
+
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
-static __always_inline int get_steal_spins(void)
+static __always_inline int get_steal_spins(bool paravirt)
 {
 	return STEAL_SPINS;
 }
 
-static __always_inline int get_head_spins(void)
+static __always_inline int get_head_spins(bool paravirt)
 {
 	return HEAD_SPINS;
 }
@@ -46,7 +49,11 @@ static inline int get_tail_cpu(u32 val)
 	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
 }
 
-/* Take the lock by setting the bit, no other CPUs may concurrently lock it. */
+static inline int get_owner_cpu(u32 val)
+{
+	return (val & _Q_OWNER_CPU_MASK) >> _Q_OWNER_CPU_OFFSET;
+}
+
 /* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void lock_set_locked(struct qspinlock *lock)
 {
@@ -180,7 +187,45 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static inline bool try_to_steal_lock(struct qspinlock *lock)
+static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	int owner;
+	u32 yield_count;
+
+	BUG_ON(!(val & _Q_LOCKED_VAL));
+
+	if (!paravirt)
+		goto relax;
+
+	if (!pv_yield_owner)
+		goto relax;
+
+	owner = get_owner_cpu(val);
+	yield_count = yield_count_of(owner);
+
+	if ((yield_count & 1) == 0)
+		goto relax; /* owner vcpu is running */
+
+	/*
+	 * Read the lock word after sampling the yield count. On the other side
+	 * there may a wmb because the yield count update is done by the
+	 * hypervisor preemption and the value update by the OS, however this
+	 * ordering might reduce the chance of out of order accesses and
+	 * improve the heuristic.
+	 */
+	smp_rmb();
+
+	if (READ_ONCE(lock->val) == val) {
+		yield_to_preempted(owner, yield_count);
+		/* Don't relax if we yielded. Maybe we should? */
+		return;
+	}
+relax:
+	cpu_relax();
+}
+
+
+static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
 	int iters;
 
@@ -197,18 +242,18 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 			continue;
 		}
 
-		cpu_relax();
+		yield_to_locked_owner(lock, val, paravirt);
 
 		iters++;
 
-		if (iters >= get_steal_spins())
+		if (iters >= get_steal_spins(paravirt))
 			break;
 	}
 
 	return false;
 }
 
-static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
+static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, bool paravirt)
 {
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
@@ -260,7 +305,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 	if (!MAYBE_STEALERS) {
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -278,10 +323,10 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 
 			iters++;
-			if (!set_mustq && iters >= get_head_spins()) {
+			if (!set_mustq && iters >= get_head_spins(paravirt)) {
 				set_mustq = true;
 				lock_set_mustq(lock);
 				val |= _Q_MUST_Q_VAL;
@@ -320,10 +365,15 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
-	if (try_to_steal_lock(lock))
-		return;
-
-	queued_spin_lock_mcs_queue(lock);
+	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
+		if (try_to_steal_lock(lock, true))
+			return;
+		queued_spin_lock_mcs_queue(lock, true);
+	} else {
+		if (try_to_steal_lock(lock, false))
+			return;
+		queued_spin_lock_mcs_queue(lock, false);
+	}
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
@@ -382,10 +432,29 @@ static int head_spins_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_head_spins, head_spins_get, head_spins_set, "%llu\n");
 
+static int pv_yield_owner_set(void *data, u64 val)
+{
+	pv_yield_owner = !!val;
+
+	return 0;
+}
+
+static int pv_yield_owner_get(void *data, u64 *val)
+{
+	*val = pv_yield_owner;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
+
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
+	if (is_shared_processor()) {
+		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+	}
 
 	return 0;
 }
-- 
2.35.1

