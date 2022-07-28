Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06A5838DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgx90H88z3fV5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:39:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPU7tY/M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPU7tY/M;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmK5WN8z3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:32:01 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id x10so272224plb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LZBFYH8jWi+s++bu+YPU2yPc+iPjRBjtMc+Z/OdkRFY=;
        b=WPU7tY/MZECpqpUnn31hAxuFkwSp5BMfJsZdUvv9auqTmbTflmfHuxtxmgocJ6hV0m
         SPU4E2YxhrJrpinQM8TRilsHAMDY2BYfZKLPTI3poj2JFH5Rp0byEcdbX+qyXsrw9Esv
         0Z1vTF3WuiVkKUopAsug9LZPmefxMtTYT3QKAV9LOOfC0Vd1DMtz7Yn1zvBcKD/r/ABe
         NknB9vwIYTNnUqHfinxinWg4ew01/NrWzE1onKroIjNjRpjVfVWmGGWT7pjoJrUbPRrI
         nuZTj+8qROOihVRJQzxAuluEI9WIv85R848ArYvxZ8sh/CcgUtDLDbNwRjMD3cqWd2qe
         KNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LZBFYH8jWi+s++bu+YPU2yPc+iPjRBjtMc+Z/OdkRFY=;
        b=5Ta64YfZHq51JRfNr+m54iuOBmLGXYHgtbpQSgoYR+G5BNaBKCbjGcc7MoFlyDlt8O
         o5fDub3hodNvSPicOGNeh8dE2Bj2pL5ucCfBshZmzK4/VmxsmwkifleFhhTy8borZJMA
         DVNwWd3E6Fi4lgk6vHy0TRtGQJqA6mHuYbBHlKrRolxvGtZLh4MvRQQ3UBmbK91cOJn0
         yc/HpVwuv+6/M2C9/t+HZNT0Hd8/2tiC9kfk5t8TdqrVTRw1UbGMMaKUR91PwPmfPUrL
         XeSOn1JqYNHd8DE+BlDA4aWD7rUc+A8TnVfcdxo0xGfBSVNNVJqN5akR+n4AZ2U6YxBH
         C0EQ==
X-Gm-Message-State: AJIora/Da4Evz3proNRs9TLchM7Qxc+30uNJoIXPkytL/7KBgzT+yWvQ
	6GI1xzINot8D6Nh8mbv3dsvpEv1lOGc=
X-Google-Smtp-Source: AGRyM1sUt55K9zbjWL1zcM8Vt3rCH4ABtw7007ekracR7x4d3JktILf5k3oSYxyOIt0hFNhiHTwkOw==
X-Received: by 2002:a17:90b:1a84:b0:1ef:dc5c:3088 with SMTP id ng4-20020a17090b1a8400b001efdc5c3088mr8594857pjb.245.1658989919170;
        Wed, 27 Jul 2022 23:31:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/17] powerpc/qspinlock: add ability to prod new queue head CPU
Date: Thu, 28 Jul 2022 16:31:15 +1000
Message-Id: <20220728063120.2867508-14-npiggin@gmail.com>
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

After the head of the queue acquires the lock, it releases the
next waiter in the queue to become the new head. Add an option
to prod the new head if its vCPU was preempted. This may only
have an effect if queue waiters are yielding.

Disable this option by default for now, i.e., no logical change.
---
 arch/powerpc/lib/qspinlock.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 28c85a2d5635..3b10e31bcf0a 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -12,6 +12,7 @@
 struct qnode {
 	struct qnode	*next;
 	struct qspinlock *lock;
+	int		cpu;
 	int		yield_cpu;
 	u8		locked; /* 1 if lock acquired */
 };
@@ -30,6 +31,7 @@ static bool pv_yield_owner __read_mostly = true;
 static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 static bool pv_yield_propagate_owner __read_mostly = true;
+static bool pv_prod_head __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -392,6 +394,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->cpu = smp_processor_id();
 	node->yield_cpu = -1;
 	node->locked = 0;
 
@@ -483,7 +486,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	 * this store to locked. The corresponding barrier is the smp_rmb()
 	 * acquire barrier for mcs lock, above.
 	 */
-	WRITE_ONCE(next->locked, 1);
+	if (paravirt && pv_prod_head) {
+		int next_cpu = next->cpu;
+		WRITE_ONCE(next->locked, 1);
+		if (vcpu_is_preempted(next_cpu))
+			prod_cpu(next_cpu);
+	} else {
+		WRITE_ONCE(next->locked, 1);
+	}
 
 release:
 	qnodesp->count--; /* release the node */
@@ -622,6 +632,22 @@ static int pv_yield_propagate_owner_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_propagate_owner, pv_yield_propagate_owner_get, pv_yield_propagate_owner_set, "%llu\n");
 
+static int pv_prod_head_set(void *data, u64 val)
+{
+	pv_prod_head = !!val;
+
+	return 0;
+}
+
+static int pv_prod_head_get(void *data, u64 *val)
+{
+	*val = pv_prod_head;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_prod_head, pv_prod_head_get, pv_prod_head_set, "%llu\n");
+
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
@@ -631,6 +657,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
+		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
 	}
 
 	return 0;
-- 
2.35.1

