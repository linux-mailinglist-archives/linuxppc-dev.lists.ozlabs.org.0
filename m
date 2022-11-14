Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B46274A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YTS5QRDz3f4s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=avZzpUaa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=avZzpUaa;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHX5GPtz3cMK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:24 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id g62so9773517pfb.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VFKeV/LgpiRuyALCe3LPQB58m40bJVCcJtuPUhA1R4=;
        b=avZzpUaa90FsfsqCToWgSq8dieLaX7q1YnmrVegBWGEHoy+8SIGhxt1rT38mAz1V60
         RzjCvkqRuaUUUrgP7QJKd0SLVV1LARM1FFVfi7wMGaqLo5Lh8lQcdP0VBakvsEgmdR5m
         kkPAV8QAqDiX26RgKlGOs3z1yyrxDOtPjZcg6UhhC6lU7chRrBj+svsfyPlJDnRfaGnU
         xq98me5XX74858pVXK3gfX8SkJd2tsWq6Bej2QhhyAos5Rf0ldvMdWvO6OnB1HCaRW8D
         7fiHXBfVgnameXq0NJiIeusI2hZBpYk4DkPFu0//b3sP2/6TPRr9MwYbJK0EmK8b9Rye
         VKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VFKeV/LgpiRuyALCe3LPQB58m40bJVCcJtuPUhA1R4=;
        b=V2bOKPgO/vdKHWsMdcUOzmagxQ5xghi3z5Rg2YH0w9FRhpxAMRI4O8H81sIqcrvAP1
         LBDjx76xMlM4AwsoXS2mScr2NCnBaRJQ3Pe6P3bb56bUPPstXFwP7xPDYs0yE5R/FLf7
         eaJt5lDav4h19OEQt0ikSnyuKpcYtNn3jPikdMWlz3Hvhsr3+3YMz7WoHPk4rjTk0Xe5
         2HVQmQAx8G9wYkEBrjgsBeu0PEzBmEgEeGnlwgG/nw8KPLQeVBG4PAsWUOpQhStKGTPl
         46rzRAMsLCgg0of2SSgArrZ7bzTa/JYK6GpGavBDncV4CNzMBAxUBg0+1wLKiJ198cK4
         4Tmg==
X-Gm-Message-State: ANoB5pniCsT5ze2DKwzKZwDn05r9k4TiWLALVMdskaZuEXGzx2TISgsp
	FtRmuicMygZvF4fEt4ttilX7W3I8eBM=
X-Google-Smtp-Source: AA0mqf6Ilj0kyL4Y4HNP+mTz0H6endp/00bKyKtN/uwjvKpqFCkLiTEzg1RkJRS0++caYxTM40D2gw==
X-Received: by 2002:a05:6a00:26f7:b0:572:149c:e1ba with SMTP id p55-20020a056a0026f700b00572149ce1bamr3114729pfw.19.1668393143770;
        Sun, 13 Nov 2022 18:32:23 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/17] powerpc/qspinlock: paravirt yield to lock owner
Date: Mon, 14 Nov 2022 12:31:28 +1000
Message-Id: <20221114023137.2679627-10-npiggin@gmail.com>
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

Waiters spinning on the lock word should yield to the lock owner if the
vCPU is preempted. This improves performance when the hypervisor has
oversubscribed physical CPUs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 101 ++++++++++++++++++++++++++++++-----
 1 file changed, 88 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index b25a52251cb3..d81d72125034 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -5,6 +5,7 @@
 #include <linux/percpu.h>
 #include <linux/smp.h>
 #include <asm/qspinlock.h>
+#include <asm/paravirt.h>
 
 #define MAX_NODES	4
 
@@ -24,14 +25,16 @@ static int steal_spins __read_mostly = (1<<5);
 static bool maybe_stealers __read_mostly = true;
 static int head_spins __read_mostly = (1<<8);
 
+static bool pv_yield_owner __read_mostly = true;
+
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
-static __always_inline int get_steal_spins(void)
+static __always_inline int get_steal_spins(bool paravirt)
 {
 	return steal_spins;
 }
 
-static __always_inline int get_head_spins(void)
+static __always_inline int get_head_spins(bool paravirt)
 {
 	return head_spins;
 }
@@ -46,6 +49,11 @@ static inline int decode_tail_cpu(u32 val)
 	return (val >> _Q_TAIL_CPU_OFFSET) - 1;
 }
 
+static inline int get_owner_cpu(u32 val)
+{
+	return (val & _Q_OWNER_CPU_MASK) >> _Q_OWNER_CPU_OFFSET;
+}
+
 /* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void set_locked(struct qspinlock *lock)
 {
@@ -169,7 +177,45 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
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
 	int iters = 0;
 
@@ -187,16 +233,16 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 			if (trylock_with_tail_cpu(lock, val))
 				return true;
 		} else {
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 		}
 
 		iters++;
-	} while (iters < get_steal_spins());
+	} while (iters < get_steal_spins(paravirt));
 
 	return false;
 }
 
-static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
+static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, bool paravirt)
 {
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
@@ -252,7 +298,7 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 		}
 
 		/* If we're the last queued, must clean up the tail. */
@@ -275,10 +321,10 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
-			cpu_relax();
+			yield_to_locked_owner(lock, val, paravirt);
 
 			iters++;
-			if (!mustq && iters >= get_head_spins()) {
+			if (!mustq && iters >= get_head_spins(paravirt)) {
 				mustq = true;
 				set_mustq(lock);
 				val |= _Q_MUST_Q_VAL;
@@ -317,10 +363,20 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
 void queued_spin_lock_slowpath(struct qspinlock *lock)
 {
-	if (try_to_steal_lock(lock))
-		return;
-
-	queued_spin_lock_mcs_queue(lock);
+	/*
+	 * This looks funny, but it induces the compiler to inline both
+	 * sides of the branch rather than share code as when the condition
+	 * is passed as the paravirt argument to the functions.
+	 */
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
 
@@ -386,10 +442,29 @@ static int head_spins_get(void *data, u64 *val)
 
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
2.37.2

