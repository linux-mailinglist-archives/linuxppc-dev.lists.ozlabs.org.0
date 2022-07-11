Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DC56D340
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh88b2lbdz3fYx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:13:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fgFAZ4a3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fgFAZ4a3;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zr5Sw9z3c1T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:28 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso7040391pjc.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L7MAN4mRWMKVF7KUEsEUoGY4r81MiARcRETbL/y8vEc=;
        b=fgFAZ4a3PQB7uZjlKeK2/hh9rxMm0ip1g8R3RqeIytPW37MzO6fO9jqtwDVpzWUMkE
         yJMEzYKfTISk+qxgxAFYmhm95icH5AhzV18Xa46CIIWjKlOXfec9TioPvMsE4Y61U7qC
         VIHiQUioCZ7axt/77q7T37opavme4nhdgq2Hx0YBnbVlk33BYR58FQ66MhOuSEU7mi4z
         2hAKorfcPywh9XpmodOWVK7JuCp4DsBLS1qdRLSN1HDebdASC9Y090tiBjfnm7M21Ghl
         zZRHxlamw+kM7/T9O/PkkLDeLcxJVnGHb9VJG22GpSgHSNnpkp2igxBB9lWr1WrHDa/E
         WI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L7MAN4mRWMKVF7KUEsEUoGY4r81MiARcRETbL/y8vEc=;
        b=6evJnYXHCZViOo7SfkOyXiLEkw9sUFkjF6mZoJBPKCLmwk89fqubW7udktoeVRwULs
         CkbxCD0XINxCBZ4+iSgE4CexQavdspLjHWgj4pYYgpdP4oRAazDHMhYl1rG1nIOm4EwI
         OiRUMiq/11gGuYOITNy2rHOD0y/yOrJyJ3wCqWMIauiOk4PJsu2Caeza6Fy6J6Vxmo0y
         yCI9LxGLE9/u6sWIwaQI3QO7JqZAuhDTBLXrBC35FzBaV5w3RGmJLS1SIAfTDzCh9lmZ
         cu97MAv04sQ2PYNmGmwh5KrU10Ds3OCMMhzCfgCqUaLVUibAPoXDSn7EFHDpElTgGeiE
         +76Q==
X-Gm-Message-State: AJIora8KrsZnlU4OEc+RTuL0JQf0/UHeTHDicQ0NUSuBJFuQhzGwJTWu
	2hLU9GBeo0wta6hCJPnmJ9SuHMaGT90=
X-Google-Smtp-Source: AGRyM1t+zut1plVylBNllSbrBelRluNWA4pp9vG6GMe/CeeVIwFi9vd8SOVtvgKJ84x0Zgrlkg+k4A==
X-Received: by 2002:a17:90b:1c90:b0:1ee:d804:d2c1 with SMTP id oo16-20020a17090b1c9000b001eed804d2c1mr15303856pjb.92.1657508726861;
        Sun, 10 Jul 2022 20:05:26 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 12/14] powerpc/qspinlock: add ability to prod new queue head CPU
Date: Mon, 11 Jul 2022 13:04:51 +1000
Message-Id: <20220711030453.150644-13-npiggin@gmail.com>
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

After the head of the queue acquires the lock, it releases the
next waiter in the queue to become the new head. Add an option
to prod the new head if its vCPU was preempted. This may only
have an effect if queue waiters are yielding.

Disable this option by default for now, i.e., no logical change.
---
 arch/powerpc/lib/qspinlock.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index c39af19f006e..ce0563c56915 100644
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
 static bool pv_yield_prev __read_mostly = false;
 static bool pv_yield_propagate_owner __read_mostly = false;
+static bool pv_prod_head __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -378,6 +380,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->cpu = smp_processor_id();
 	node->yield_cpu = -1;
 	node->locked = 0;
 
@@ -464,7 +467,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
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
@@ -605,6 +615,22 @@ static int pv_yield_propagate_owner_get(void *data, u64 *val)
 
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
@@ -614,6 +640,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
+		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
 	}
 
 	return 0;
-- 
2.35.1

