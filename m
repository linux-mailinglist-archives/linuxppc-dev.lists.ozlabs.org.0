Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8C5838ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lth001Pmxz3fnM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:42:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R3C6/eIn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R3C6/eIn;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmV3dDVz3cdW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:32:10 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 23so782878pgc.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emiYuN23yjrtKIfrpLVYjF3zz0gV9d4bAYwKu+pKUGA=;
        b=R3C6/eInIN9EyvXwsFhudJ+gkqyfFgN481sJtKjGoAQOz1O7sD/CAMeUC1TGAPr/7j
         ZJNy62RrJJz8hoJx8cseHoSwqIuxNpKRPnApB+W4ahx6oXZQOhmrSUwWTl6qVmTBuOBG
         yH0CG+NNqcOQTh8iJnUIgHkVz40B/+o/chPcfOPpdm5ztrCIviQGunxJ8VN33XP1rE3M
         Qz+wSRprLl/JChpjYr8FVB0HW/xOgkkkr7yK0MfOT4s/pD/4CUSV0ICqXHMTcWyhuyyd
         nLc7XjheesEp8vq4vagKRFzIU/YKjeGSeP+1UVr6/PNvvp3cfm03zcM3Q+rPnymdbWhj
         6CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emiYuN23yjrtKIfrpLVYjF3zz0gV9d4bAYwKu+pKUGA=;
        b=eqC8G2v/b6Mnj7T4+bl4mlPG2Jwz6vgLNBJTGq8C1WQCnU4/t00oMeUnAEgO2eh+o/
         1Azs85nT7KmKrrUFOWrumBaHYhhi/awxkocDr5u8ATxGbdQ1SWhliHms2VG2Ux16zkxb
         3wllRsQXrn4rhzGZz3XPWlNowp+hC59v87Z59XIZc8ucOqkmWPF+MOK75x2YnpnUEgFl
         5/GBG81YSl6tgrftiPVC8WgycnR92bBgP5PMTmlOTJC1CoC9yBkTeqBJUMJkCgYT5SW6
         8fEVqpUB/at5vA+GsgZ84O9jqRfKtEPONSWdwvdXojbTwr0LbJfC/JbCCyxY53nOqLGq
         RpEA==
X-Gm-Message-State: AJIora/6QoQqjfmyTj8Ys7Ndm5GgsLfPe6xRCFHEAJ50dbJcWiQRKhkR
	2OzphkOTbbjXkIgvMnQpk9aWUh4Dz+8=
X-Google-Smtp-Source: AGRyM1t8Ht3QHzRsWOlsKh6d6o4uIgHA3LQmSk3fMGVs9ttQZ/5+kCeLlioEymSfNe5+NeRMYi+MPw==
X-Received: by 2002:a05:6a00:248b:b0:52b:f07b:796c with SMTP id c11-20020a056a00248b00b0052bf07b796cmr19938932pfv.47.1658989928001;
        Wed, 27 Jul 2022 23:32:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:32:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/17] powerpc/qspinlock: allow indefinite spinning on a preempted owner
Date: Thu, 28 Jul 2022 16:31:19 +1000
Message-Id: <20220728063120.2867508-18-npiggin@gmail.com>
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

Provide an option that holds off queueing indefinitely while the lock
owner is preempted. This could reduce queueing latencies for very
overcommitted vcpu situations.

This is disabled by default.
---
 arch/powerpc/lib/qspinlock.c | 91 +++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 24f68bd71e2b..5cfd69931e31 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -35,6 +35,7 @@ static int HEAD_SPINS __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
+static bool pv_spin_on_preempted_owner __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 static bool pv_yield_propagate_owner __read_mostly = true;
 static bool pv_prod_head __read_mostly = false;
@@ -220,13 +221,15 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
+static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
 {
 	int owner;
 	u32 yield_count;
 
 	BUG_ON(!(val & _Q_LOCKED_VAL));
 
+	*preempted = false;
+
 	if (!paravirt)
 		goto relax;
 
@@ -241,6 +244,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 
 	spin_end();
 
+	*preempted = true;
+
 	/*
 	 * Read the lock word after sampling the yield count. On the other side
 	 * there may a wmb because the yield count update is done by the
@@ -265,14 +270,14 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 	spin_cpu_relax();
 }
 
-static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool *preempted)
 {
-	__yield_to_locked_owner(lock, val, paravirt, false);
+	__yield_to_locked_owner(lock, val, paravirt, false, preempted);
 }
 
-static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
+static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
 {
-	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
+	__yield_to_locked_owner(lock, val, paravirt, clear_mustq, preempted);
 }
 
 static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
@@ -364,12 +369,33 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 
 static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
-	int iters;
+	int iters = 0;
+
+	if (!STEAL_SPINS) {
+		if (paravirt && pv_spin_on_preempted_owner) {
+			spin_begin();
+			for (;;) {
+				u32 val = READ_ONCE(lock->val);
+				bool preempted;
+
+				if (val & _Q_MUST_Q_VAL)
+					break;
+				if (!(val & _Q_LOCKED_VAL))
+					break;
+				if (!vcpu_is_preempted(get_owner_cpu(val)))
+					break;
+				yield_to_locked_owner(lock, val, paravirt, &preempted);
+			}
+			spin_end();
+		}
+		return false;
+	}
 
 	/* Attempt to steal the lock */
 	spin_begin();
 	for (;;) {
 		u32 val = READ_ONCE(lock->val);
+		bool preempted;
 
 		if (val & _Q_MUST_Q_VAL)
 			break;
@@ -382,9 +408,22 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 			continue;
 		}
 
-		yield_to_locked_owner(lock, val, paravirt);
-
-		iters++;
+		yield_to_locked_owner(lock, val, paravirt, &preempted);
+
+		if (paravirt && preempted) {
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
 
 		if (iters >= get_steal_spins(paravirt, false))
 			break;
@@ -463,8 +502,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		/* We're at the head of the waitqueue, wait for the lock. */
 		spin_begin();
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
+			bool preempted;
+
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-			yield_head_to_locked_owner(lock, val, paravirt, false);
+			yield_head_to_locked_owner(lock, val, paravirt, false, &preempted);
 		}
 		spin_end();
 
@@ -486,11 +527,20 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		/* We're at the head of the waitqueue, wait for the lock. */
 		spin_begin();
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
+			bool preempted;
+
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt,
-					pv_yield_allow_steal && set_mustq);
+					pv_yield_allow_steal && set_mustq,
+					&preempted);
+
+			if (paravirt && preempted) {
+				if (!pv_spin_on_preempted_owner)
+					iters++;
+			} else {
+				iters++;
+			}
 
-			iters++;
 			if (!set_mustq && iters >= get_head_spins(paravirt)) {
 				set_mustq = true;
 				lock_set_mustq(lock);
@@ -663,6 +713,22 @@ static int pv_yield_allow_steal_get(void *data, u64 *val)
 
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
@@ -719,6 +785,7 @@ static __init int spinlock_debugfs_init(void)
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
+		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
-- 
2.35.1

