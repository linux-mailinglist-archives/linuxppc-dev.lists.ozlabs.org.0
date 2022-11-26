Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3063952F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6rg2Kszz3fLP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=js4Lx3v1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=js4Lx3v1;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fj6g96z3f4b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:13 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id j12so5946202plj.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjskR2gpAJ6jlYK1rCUuLh/MS2cLeA8vhaR1uI2ScaI=;
        b=js4Lx3v1h0VnRWL8+8pH5UmpfPzqEpJ7NwlA+vAinwIVYrYVge9SCHvcAiRiaWwLrQ
         XQ0KGZ6EDKG9LBO8ypAcGCm9bBbaHWhBmLeRSzR91RxK15b/B/vTjFUelNR5jyftu0XL
         F68laGbMis2Bo3fEbYRORLE3J3VEGeAMJR2WuSwfY5FuoxBRWdP1xTLda5ayn8085XJR
         NI+gHpVnwenXvZ4AYp38Z5hh9vWgJrxS7vZYh/KZcz/d+CadqpX7sTB/aBLxmG9C3btX
         URQ7LbnSWQiosBLVIwEGt4eJGV0J/q8UkUCYIRq5WPxwBbsbT7nWlmokUtGvoo3qZiej
         iBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjskR2gpAJ6jlYK1rCUuLh/MS2cLeA8vhaR1uI2ScaI=;
        b=Xn1jjGjBpJ2lq2HoWeCN1NmQB/hQ7yjAJWqXeJhwksrq1SlTzTqoKZUBbXOzhJu286
         9WdVhuO5bzpZMzKBPV4q3YBtI6jKUJhcikrP2cB8Pgw86KNeQwzIeQxAO4Kb5msAZ2wl
         A34XTrXjKbq1j7Psk89QpCecJ5EcYXFFyzso9QZxR05aFl6PCB1H79/vgJ8ebcycr140
         wfN/BmneW/v+l+joKGScibRmWKzDMECKoRQ39bJAsxBByYBAw9j0PYJqTUqtvqBi37wb
         cVavXAE8Ci7eTns+6N0IOnHYIR2rb+l6aRZM4EZyFPtU3+RrTHFH916SUshxsVZxXIIb
         Ewig==
X-Gm-Message-State: ANoB5plweI90yE2X43iyUHsKI1rQf+7SxUeHo8jM9MzzWmK1P/J8G5Xw
	sFtEzRnjxdZljezDHq+uICM7uWuNtar6DQ==
X-Google-Smtp-Source: AA0mqf4Q1WXDfeLzkqdbTEJpJLBy3Bi0TgT6wx6ZMYcQ82R8fCDa5EhTnvDFyAdoyQcP5+eePoOvNQ==
X-Received: by 2002:a17:90a:7e0d:b0:213:d630:f4af with SMTP id i13-20020a17090a7e0d00b00213d630f4afmr45256354pjl.77.1669456811162;
        Sat, 26 Nov 2022 02:00:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/17] powerpc/qspinlock: allow stealing when head of queue yields
Date: Sat, 26 Nov 2022 19:59:24 +1000
Message-Id: <20221126095932.1234527-10-npiggin@gmail.com>
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

If the head of queue is preventing stealing but it finds the owner vCPU
is preempted, it will yield its cycles to the owner which could cause it
to become preempted. Add an option to re-allow stealers before yielding,
and disallow them again after returning from the yield.

Disable this option by default for now, i.e., no logical change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 59 ++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 838be0bc8705..1aafafc701da 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool maybe_stealers __read_mostly = true;
 static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
@@ -135,6 +136,22 @@ static __always_inline u32 set_mustq(struct qspinlock *lock)
 	return prev;
 }
 
+static __always_inline u32 clear_mustq(struct qspinlock *lock)
+{
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# clear_mustq				\n"
+"	andc	%0,%0,%2						\n"
+"	stwcx.	%0,0,%1							\n"
+"	bne-	1b							\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (_Q_MUST_Q_VAL)
+	: "cr0", "memory");
+
+	return prev;
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = decode_tail_cpu(val);
@@ -159,7 +176,7 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool mustq)
 {
 	int owner;
 	u32 yield_count;
@@ -188,7 +205,11 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	smp_rmb();
 
 	if (READ_ONCE(lock->val) == val) {
+		if (mustq)
+			clear_mustq(lock);
 		yield_to_preempted(owner, yield_count);
+		if (mustq)
+			set_mustq(lock);
 		/* Don't relax if we yielded. Maybe we should? */
 		return;
 	}
@@ -196,6 +217,21 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	cpu_relax();
 }
 
+static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	__yield_to_locked_owner(lock, val, paravirt, false);
+}
+
+static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	bool mustq = false;
+
+	if ((val & _Q_MUST_Q_VAL) && pv_yield_allow_steal)
+		mustq = true;
+
+	__yield_to_locked_owner(lock, val, paravirt, mustq);
+}
+
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
 {
 	int prev_cpu = decode_tail_cpu(val);
@@ -211,7 +247,7 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
-	smp_rmb(); /* See yield_to_locked_owner comment */
+	smp_rmb(); /* See __yield_to_locked_owner comment */
 
 	if (!node->locked) {
 		yield_to_preempted(prev_cpu, yield_count);
@@ -308,7 +344,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		if (!(val & _Q_LOCKED_VAL))
 			break;
 
-		yield_to_locked_owner(lock, val, paravirt);
+		yield_head_to_locked_owner(lock, val, paravirt);
 		if (!maybe_stealers)
 			continue;
 		iters++;
@@ -444,6 +480,22 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
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
@@ -466,6 +518,7 @@ static __init int spinlock_debugfs_init(void)
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 	}
 
-- 
2.37.2

