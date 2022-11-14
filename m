Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0086274A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:44:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YYf6Vvgz3fNb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:44:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BLmIHG3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BLmIHG3x;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHq5d6Cz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:39 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id y4so8873953plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPvVAbxtafvGVHXmryCF6pKJZoEVQIoaHGDq1e3+zz8=;
        b=BLmIHG3x1wW1EAUaQ4rfo50EME5kOrVHPPTOITLwLiaaGUGCsVhIuPdvt2tuPeAiZt
         VoQEKQRGrdvXzKboaPrado0Z7MS/4HIRr8W859RxWOsYyLfvBkEyyoyeAGr+KuNATbjy
         2Z79pWogSHrATuX1Tngb6npkKT4mjZslruPyZEjTDLJ3yXNp4U3zmDEYIQLTG4PdKkQy
         E3qho8NK87hd2T/At0OWy/h5fvYbSQORDm6ddqxCoHaPyu742WskSkhXYY8YUiGADoh0
         Gw0zEOQYbJSDzprjf/hS7PRwjoeMEAMAlgiy9NRuDWavzUyvAl2BlTOdOXhKUEvG7wTp
         Z9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPvVAbxtafvGVHXmryCF6pKJZoEVQIoaHGDq1e3+zz8=;
        b=T1xBruEoSa0a76J5IQMKgsJdLV1a+kqlnG54orfFhxlK/stTjEi9GMhayseh7slMI/
         iEKnnS/9MKNiZJ71kfLUt6TshMPUanmLWggwa2nVBiw/J85tYlVuHw2f38d0WnwXksE3
         cfbx/GMcym+KZ5HZKr2yJeOH6chb5zDyq4jPqZj+oihagb4fFfg5ogbY3/7KPkZeTnDf
         OjfvwzLvNHpX89scPRq3msJHH5JDtaEzp45Nw1Irs3RDRdCSZNmEakOQnG/VsV4CtqAD
         lx5tQFRJLT2QLwDI4iXXGknyo7RiWTkxBWDu7HbU+XGSPfMk70tAwReJQ+OJgvWNWrMD
         ru5w==
X-Gm-Message-State: ANoB5pk9D5KbP8L28bHNe9RpQ7fF4ee+ACId/yXPBcHbAChJM0JFu2AW
	Yu9Kzdw1Vg1vj7CkZMdER0coYvfECOA=
X-Google-Smtp-Source: AA0mqf46R9fCkzszYDvpIeuaGYSwSAKttvsHB4zus00sWTKj3nxXSBbdDCXN2JpjROD1rxsqUHBg4g==
X-Received: by 2002:a17:903:41d0:b0:188:5e78:be0 with SMTP id u16-20020a17090341d000b001885e780be0mr11808876ple.18.1668393157856;
        Sun, 13 Nov 2022 18:32:37 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/17] powerpc/qspinlock: add ability to prod new queue head CPU
Date: Mon, 14 Nov 2022 12:31:32 +1000
Message-Id: <20221114023137.2679627-14-npiggin@gmail.com>
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

After the head of the queue acquires the lock, it releases the
next waiter in the queue to become the new head. Add an option
to prod the new head if its vCPU was preempted. This may only
have an effect if queue waiters are yielding.

Disable this option by default for now, i.e., no logical change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index f07843b4c497..51123240da8e 100644
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
 
@@ -386,6 +388,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
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
@@ -634,6 +644,22 @@ static int pv_yield_propagate_owner_get(void *data, u64 *val)
 
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
@@ -643,6 +669,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
+		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
 	}
 
 	return 0;
-- 
2.37.2

