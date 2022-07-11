Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867456D33E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8764CbJz3fSN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h5GXpzY1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h5GXpzY1;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zm6XJxz3cS8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:24 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id v7so1638311pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AwQ1wrsYWuJZ0vQCidAPq6J1aA8T0687rJ/fusLTP1A=;
        b=h5GXpzY1uxRfskLMYw7M4H9NrxdwSWwDt2QAoyYdg26omsVL0zR1knvI78bwinZv1p
         xpwLG63sgCeIT+CiJzuRkJlktPZOMmZwbVDWH4GrD7uu5rcnOji0QAMS4F5d5wHUI737
         fLaT5TXOcfAay/+dO62t2mXOcB8+wcHrSxIjAhhE4scC2MulInL1EREr1tPUYIyLVquH
         1ieFfIW2oU42ULQ0416fq8n2uy/iBPm31VfWxKuNK5c+mGd2aMJFA8BIjqaLwMH+p44K
         9KrIsTA3BAovnfvvr/8VZMRwcIfSvj7IzkyvXY+qBIdb9uVXHRN//RrEDCfCptyK+Tlr
         SNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AwQ1wrsYWuJZ0vQCidAPq6J1aA8T0687rJ/fusLTP1A=;
        b=R17+fRh/+YSeCJWuPglQDE1mmvvEMV4jxrZO75qmEgiZbZl91ZdHrLNgXhmdmocxsK
         80l+tnwA3ccZKCy8QeV30ox4E4/LaU79oLe9uEPBXLMz06Z1xOJ760zzLMRMQWrdLuZu
         tgzGqSJz37uGjuUF8FwmpVETvvRLb36lsfrv2sUQdWG+WXh4XaMGt06epj3qGVc7pld8
         aXGo8vPqZONmBaNd0AfRETWsDs8o8oPGREXhTpAUb00ZBsXDp7jph5NCFHYvuHWjO3T+
         SmM71LBeMVGt835ZtxS8tR2xcOp9sMVMpXJgsKFOc59pcz2LNgQj0gSddj/QbttE3Uo4
         HoXg==
X-Gm-Message-State: AJIora8OzPLWNiz/S8bb85g7MWzkhwoXWyplmJL75VHOKaiLRMhjNK9J
	AAv+eu7cuvRaL9M4JjAWrguQfkw/xrE=
X-Google-Smtp-Source: AGRyM1tDmIGNBCpKhTVcSQoQYftuMRwA04hOFHDlt2xzrpXRJAXhENs/M2LTH673bDUXWZvPlU9BDg==
X-Received: by 2002:a05:6a00:80d:b0:525:520a:1736 with SMTP id m13-20020a056a00080d00b00525520a1736mr16227733pfk.36.1657508722445;
        Sun, 10 Jul 2022 20:05:22 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 10/14] powerpc/qspinlock: allow stealing when head of queue yields
Date: Mon, 11 Jul 2022 13:04:49 +1000
Message-Id: <20220711030453.150644-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711030453.150644-1-npiggin@gmail.com>
References: <20220711030453.150644-1-npiggin@gmail.com>
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
 arch/powerpc/lib/qspinlock.c | 49 +++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 1a58ed51c060..4f1dc3322485 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly = true;
 static int HEAD_SPINS __read_mostly = (1<<13);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
@@ -163,6 +164,24 @@ static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
 	return prev;
 }
 
+static __always_inline u32 lock_clear_mustq(struct qspinlock *lock)
+{
+	u32 new = _Q_MUST_Q_VAL;
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# queued_spin_set_mustq			\n"
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
+
 static inline struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = get_tail_cpu(val);
@@ -178,7 +197,7 @@ static inline struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
 {
 	int owner;
 	u32 yield_count;
@@ -207,7 +226,11 @@ static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt
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
@@ -253,7 +276,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			break;
 
 		if (val & _Q_LOCKED_VAL) {
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_to_locked_owner(lock, val, paravirt, false);
 			continue;
 		}
 
@@ -317,7 +340,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	if (!MAYBE_STEALERS) {
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_to_locked_owner(lock, val, paravirt, false);
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -337,7 +360,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 				lock_set_mustq(lock);
 				val |= _Q_MUST_Q_VAL;
 			}
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_to_locked_owner(lock, val, paravirt,
+				pv_yield_allow_steal && (iters > HEAD_SPINS));
 		}
 
 		/* If we're the last queued, must clean up the tail. */
@@ -457,6 +481,22 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
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
@@ -479,6 +519,7 @@ static __init int spinlock_debugfs_init(void)
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 	}
 
-- 
2.35.1

