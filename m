Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 594076274B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9Yds1mnYz3fMZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:48:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JpU77Xmy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JpU77Xmy;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YJ62PJlz3dvk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:54 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id z26so9807950pff.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiLPUfBsTeXHutdkrj2F8sriNTR5yL64ZGAMnwHkXeg=;
        b=JpU77Xmy/ykcKlY+DR7clpDhtW6PWmX4/4xrIQ7PwGQ9Ik/2sy9YRbNSc06ORACOoF
         zvDG1saBBsK0dNfjWQoSnq8KJEChgWu88oKrfWR3ilgPPzY+12BZp60Y71mJef/bwWPV
         xBTtko8Y8z9BmTlN3zQHq7/p2hjAdiPhCV8UpmVRYLd5xQRaYVdzCwAOAOvOXKGvfs5w
         czJKanxhp8D9EoQNW/zfXEcaHg12dPyE5acqY/N1CSuniCSgRXXj3Z6NG9P24JfaPvmj
         6VRv6lSi7rIE0A5dUHU5sZZWSWNmkOOpuqCpZnDD55kJWCfnIMGVmhNlnTD9BCpx9+dQ
         KCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiLPUfBsTeXHutdkrj2F8sriNTR5yL64ZGAMnwHkXeg=;
        b=NI6qrv+IrbxmMscLoR9ezcOXFdi77AQ+BItJ/ozS1opJfGaT9n7sLE7FHTa3qgBkE3
         0jPijFDBtcfo5eE0Q++IgUWNTX1ywLesJiq0wUgUOo9G86EG0EDha4pBirw/Pg99j0tp
         l053Om4Q0mEvTfVjlymPVV/RSbWBUz9EbVeyQatlfkIQ+yPNJv/iltzvp0LqzUNZcw48
         Vby/fOmDiwojazWbTEN8aOKRitWLNBmQ/9i0HAv1JQiv0MZlkaRAlRM96pVQy0/TGuY2
         1pa3nY4jVk7w/EfxqghM1WU+6VNvqf95xB7gVC+XR1mJGdl0fJ1lJRRRi2Iq/KXtqpg9
         WfmA==
X-Gm-Message-State: ANoB5pk8xsj8wFXuHUjnuVK4CqbkWbCwhI05cKQWySb4pQDRlnbPgKKq
	QHSbwNN3cFWIu86UA1AS4xt1XZb8jmY=
X-Google-Smtp-Source: AA0mqf4BmrOkmcShiXHd0dTlm080k+WXiurao04gCpuixVaecSsWS2bMEfAlyk+B9SL0GG20LS30VA==
X-Received: by 2002:a05:6a00:1799:b0:558:991a:6671 with SMTP id s25-20020a056a00179900b00558991a6671mr12267220pfg.58.1668393171752;
        Sun, 13 Nov 2022 18:32:51 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/17] powerpc/qspinlock: allow indefinite spinning on a preempted owner
Date: Mon, 14 Nov 2022 12:31:36 +1000
Message-Id: <20221114023137.2679627-18-npiggin@gmail.com>
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

Provide an option that holds off queueing indefinitely while the lock
owner is preempted. This could reduce queueing latencies for very
overcommitted vcpu situations.

This is disabled by default.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 74 ++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index a1c832a52d26..7e6ab1f30d50 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -35,6 +35,7 @@ static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
+static bool pv_spin_on_preempted_owner __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 static bool pv_yield_propagate_owner __read_mostly = true;
 static bool pv_prod_head __read_mostly = false;
@@ -210,11 +211,12 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
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
 
@@ -232,6 +234,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
 
 	spin_end();
 
+	preempted = true;
+
 	/*
 	 * Read the lock word after sampling the yield count. On the other side
 	 * there may a wmb because the yield count update is done by the
@@ -248,29 +252,32 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
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
@@ -380,13 +387,16 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	int iters = 0;
 	u32 val;
 
-	if (!maybe_stealers)
+	if (!maybe_stealers) {
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
@@ -397,10 +407,23 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
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
@@ -503,9 +526,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 				break;
 
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-			yield_head_to_locked_owner(lock, val, paravirt);
+			if (yield_head_to_locked_owner(lock, val, paravirt)) {
+				if (!pv_spin_on_preempted_owner)
+					iters++;
+			} else {
+				iters++;
+			}
 
-			iters++;
 			if (!mustq && iters >= get_head_spins(paravirt)) {
 				mustq = true;
 				set_mustq(lock);
@@ -690,6 +717,22 @@ static int pv_yield_allow_steal_get(void *data, u64 *val)
 
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
@@ -746,6 +789,7 @@ static __init int spinlock_debugfs_init(void)
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
+		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
 		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
-- 
2.37.2

