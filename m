Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06D639527
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6pV2Wlkz3fK6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:06:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BZylnu8N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BZylnu8N;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fb74Xxz3cHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:07 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id z17so1311719pff.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgjXNOZxEgp9f/jRgMOUKFdm/MwyXK6QmDuEMKtSEUQ=;
        b=BZylnu8N5B3S2M5gS+OfZNFGQysixb/MGGsW+Gz/9vvumGqKtddZA7CdQDYTcmnaPj
         Tcv/iYTacuZc+W6iGxZmOHSt8iUGl/Dzmh6/WAw+3VuL3O8UMwpQDgUiIJRGrZFW9qrO
         K3gJUXxMXzjkJEeXDl5jUECTuUzVpGKEEuIaFq0UAIAmA8PaxRtkRj33d4Sug3yE9jnu
         TC1gXrP0vLINY1wT0ovzp8NsMTVNLFp0P0dUHaQcMKwVhIrQzaEGuwq7KGP7AL1qXOKt
         NM6Rn9UJdzTF7AC/pfLPy5cXtHjtoywrsYjhBh0kGNMMJ2T9SMGlR9GbHNL99oUitB14
         8+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgjXNOZxEgp9f/jRgMOUKFdm/MwyXK6QmDuEMKtSEUQ=;
        b=eCJ9YrQbkJNeLjY5wi/jpI4MPk1JFNbUKpJgIal3JgadgQYrA+JrRKZJakKsuoAFEp
         /rMxSCzaVcMbDAc0WJJh4bnYqYIXNU3yQbZEVGVyUYcppIPqEPUpvct073WZ2VwD75ks
         xHQaPV4AdedJLMkr9V+pncTN3SN+Qx2caQcAQjEON5abP0GCphJ9UiqU+ShjSVJxyu8r
         unRcwsBZbgDtp/CLw51+Jfio2plGrsfEpyyuTkyl1LkU8j8xbJL9nyXWzMM9WGPYo1jK
         wfK/IbGGxUiBrFpeojUuMSCDIEJDGVUqy4jR3t9p2Q4ciyrVPwj78jRNz3XCLZN7hsOc
         sl+Q==
X-Gm-Message-State: ANoB5pmmP3zTmYfyTFn+ttmN2ERM7XkAYOB67p6XjsC/6YB62autWLDP
	7MdLvRljx9LQ+4vG77rzvilyQVBuDntA5A==
X-Google-Smtp-Source: AA0mqf787L1rS4cS8z0KHYWvFL4PVGkH21r+xVNzcOpV6VcchRT+zskqOah+BfDv0ud6JUr1It8LHA==
X-Received: by 2002:a05:6a00:2193:b0:573:6c4a:dbc8 with SMTP id h19-20020a056a00219300b005736c4adbc8mr21842133pfi.34.1669456805212;
        Sat, 26 Nov 2022 02:00:05 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/17] powerpc/qspinlock: paravirt yield to lock owner
Date: Sat, 26 Nov 2022 19:59:22 +1000
Message-Id: <20221126095932.1234527-8-npiggin@gmail.com>
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

Waiters spinning on the lock word should yield to the lock owner if the
vCPU is preempted. This improves performance when the hypervisor has
oversubscribed physical CPUs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 99 +++++++++++++++++++++++++++++++-----
 1 file changed, 87 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index a5b2c0377cf9..bada773292af 100644
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
 /*
  * Try to acquire the lock if it was not already locked. If the tail matches
  * mytail then clear it, otherwise leave it unchnaged. Return previous value.
@@ -150,7 +158,45 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
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
 
@@ -168,16 +214,16 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 			if (__queued_spin_trylock_steal(lock))
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
@@ -235,12 +281,12 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		if (!(val & _Q_LOCKED_VAL))
 			break;
 
-		cpu_relax();
+		yield_to_locked_owner(lock, val, paravirt);
 		if (!maybe_stealers)
 			continue;
 		iters++;
 
-		if (!mustq && iters >= get_head_spins()) {
+		if (!mustq && iters >= get_head_spins(paravirt)) {
 			mustq = true;
 			set_mustq(lock);
 			val |= _Q_MUST_Q_VAL;
@@ -276,10 +322,20 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 
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
 
@@ -345,10 +401,29 @@ static int head_spins_get(void *data, u64 *val)
 
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

