Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64263953D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:14:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6yt5N7Jz3fVB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OAlzuPOR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OAlzuPOR;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6g16zZcz3f4q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:29 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id j12so5946678plj.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSDoMsxU/5buSsdmn1gktVtkkU+EzdOmdhTBduOiP/c=;
        b=OAlzuPORnjplAa/NcVzkhGxYuhR1PrEHj/GhupBlmk/Uc182BAGnM9NIwA65Wz16lZ
         C+ARO1pfUg/xY6bQtTCcY9NkN/fD0OSdLoja7IDN/Uno6oRRXTiD6xTGbtxBgqqsUSyE
         VDVkESYdv9VNzvmjeT4Dj6ohl0oBTjd/oGk91MZjU+QFkpZKadaPZTFZ2ZYzElvZU5fN
         6PcHBsbvBlMf3XZGV0AOQZNMl54hAy4PRhl/H6BznzgwxXLK4LxkTPhz/TOYD9zrN+uF
         hS+uF95g9QP2VEdk+Lr+rmk6Avy5f9uLlUo4e8IEYfcR8VpGTdQZpAJID4UwA/4IXka0
         FpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSDoMsxU/5buSsdmn1gktVtkkU+EzdOmdhTBduOiP/c=;
        b=D0UdkUyiIMnc+ayPAYtJ7sQB+9wAPzzOA6rG7hL4f1CVej9sSLZbkvqf6a6LzeDIAt
         N0O4JqD0WYN5i53fQrOe2GhR25szfOcJNmT0QtGi2xl5j9p/jmT3WnPyOVQEk+uHv9e+
         OSULh9Wx0/mPBlMb2NghR6hoyqZppDhGXrmoWbUOOSE66Q9NiE3zXrZG0r1jW+ZuA00E
         63L/fKTaBRlTOBtKR54W9VTRE6mvHAjBHeUVPwlu1PKiDImy2RIvUm1sP3WvxFQMAS9v
         1doEQa8qUMFmrM9KXpbu+0MnhmNhItjjFaMLJ9oaZ2vVqo6BsI2+qmBafv6S4VU/5/96
         FYYA==
X-Gm-Message-State: ANoB5pkAibcd+p69PWJ9qkTB9jd+cQKcPtDx2/u1h/2eUg5boQX/UEJj
	pqDm1YKxEO7zyb3uLH5Cr256KmISu5y4KA==
X-Google-Smtp-Source: AA0mqf6KHw9I5L3GoTriAXjEZkYK2SEs1Td5e4riYlEMK58jsuYvrQoJBb3vOPe459aQIrJIbQ15Gg==
X-Received: by 2002:a17:90a:898e:b0:218:bcab:96c6 with SMTP id v14-20020a17090a898e00b00218bcab96c6mr27426396pjn.46.1669456829025;
        Sat, 26 Nov 2022 02:00:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/17] powerpc/qspinlock: allow indefinite spinning on a preempted owner
Date: Sat, 26 Nov 2022 19:59:30 +1000
Message-Id: <20221126095932.1234527-16-npiggin@gmail.com>
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

Provide an option that holds off queueing indefinitely while the lock
owner is preempted. This could reduce queueing latencies for very
overcommitted vcpu situations.

This is disabled by default.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 77 +++++++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 7f6b41627351..1c9079489b50 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -35,6 +35,7 @@ static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
+static bool pv_spin_on_preempted_owner __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 static bool pv_yield_propagate_owner __read_mostly = true;
 static bool pv_prod_head __read_mostly = false;
@@ -191,11 +192,12 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-/* Called inside spin_begin() */
-static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool mustq)
+/* Called inside spin_begin(). Returns whether or not the vCPU was preempted. */
+static __always_inline bool __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool mustq)
 {
 	int owner;
 	u32 yield_count;
+	bool preempted = false;
 
 	BUG_ON(!(val & _Q_LOCKED_VAL));
 
@@ -213,6 +215,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 
 	spin_end();
 
+	preempted = true;
+
 	/*
 	 * Read the lock word after sampling the yield count. On the other side
 	 * there may a wmb because the yield count update is done by the
@@ -229,29 +233,32 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 		if (mustq)
 			set_mustq(lock);
 		spin_begin();
+
 		/* Don't relax if we yielded. Maybe we should? */
-		return;
+		return preempted;
 	}
 	spin_begin();
 relax:
 	spin_cpu_relax();
+
+	return preempted;
 }
 
-/* Called inside spin_begin() */
-static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+/* Called inside spin_begin(). Returns whether or not the vCPU was preempted. */
+static __always_inline bool yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
 {
-	__yield_to_locked_owner(lock, val, paravirt, false);
+	return __yield_to_locked_owner(lock, val, paravirt, false);
 }
 
-/* Called inside spin_begin() */
-static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+/* Called inside spin_begin(). Returns whether or not the vCPU was preempted. */
+static __always_inline bool yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
 {
 	bool mustq = false;
 
 	if ((val & _Q_MUST_Q_VAL) && pv_yield_allow_steal)
 		mustq = true;
 
-	__yield_to_locked_owner(lock, val, paravirt, mustq);
+	return __yield_to_locked_owner(lock, val, paravirt, mustq);
 }
 
 static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
@@ -361,13 +368,16 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	int iters = 0;
 	u32 val;
 
-	if (!steal_spins)
+	if (!steal_spins) {
+		/* XXX: should spin_on_preempted_owner do anything here? */
 		return false;
+	}
 
 	/* Attempt to steal the lock */
 	spin_begin();
-
 	do {
+		bool preempted = false;
+
 		val = READ_ONCE(lock->val);
 		if (val & _Q_MUST_Q_VAL)
 			break;
@@ -378,10 +388,23 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 				return true;
 			spin_begin();
 		} else {
-			yield_to_locked_owner(lock, val, paravirt);
+			preempted = yield_to_locked_owner(lock, val, paravirt);
 		}
 
-		iters++;
+		if (preempted) {
+			if (!pv_spin_on_preempted_owner)
+				iters++;
+			/*
+			 * pv_spin_on_preempted_owner don't increase iters
+			 * while the owner is preempted -- we won't interfere
+			 * with it by definition. This could introduce some
+			 * latency issue if we continually observe preempted
+			 * owners, but hopefully that's a rare corner case of
+			 * a badly oversubscribed system.
+			 */
+		} else {
+			iters++;
+		}
 	} while (!steal_break(val, iters, paravirt));
 
 	spin_end();
@@ -453,15 +476,22 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	/* We're at the head of the waitqueue, wait for the lock. */
 	spin_begin();
 	for (;;) {
+		bool preempted;
+
 		val = READ_ONCE(lock->val);
 		if (!(val & _Q_LOCKED_VAL))
 			break;
 
 		propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-		yield_head_to_locked_owner(lock, val, paravirt);
+		preempted = yield_head_to_locked_owner(lock, val, paravirt);
 		if (!maybe_stealers)
 			continue;
-		iters++;
+		if (preempted) {
+			if (!pv_spin_on_preempted_owner)
+				iters++;
+		} else {
+			iters++;
+		}
 
 		if (!mustq && iters >= get_head_spins(paravirt)) {
 			mustq = true;
@@ -644,6 +674,22 @@ static int pv_yield_allow_steal_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_allow_steal, pv_yield_allow_steal_get, pv_yield_allow_steal_set, "%llu\n");
 
+static int pv_spin_on_preempted_owner_set(void *data, u64 val)
+{
+	pv_spin_on_preempted_owner = !!val;
+
+	return 0;
+}
+
+static int pv_spin_on_preempted_owner_get(void *data, u64 *val)
+{
+	*val = pv_spin_on_preempted_owner;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_spin_on_preempted_owner, pv_spin_on_preempted_owner_get, pv_spin_on_preempted_owner_set, "%llu\n");
+
 static int pv_yield_prev_set(void *data, u64 val)
 {
 	pv_yield_prev = !!val;
@@ -700,6 +746,7 @@ static __init int spinlock_debugfs_init(void)
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
+		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
-- 
2.37.2

