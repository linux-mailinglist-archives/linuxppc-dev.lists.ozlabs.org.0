Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5183639533
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6th4PZjz3f83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R/Q6S60W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R/Q6S60W;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fq2F4zz3f4L
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:19 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id jn7so5934553plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7ItALSQmBYmE/CIt7MKw1pwIYiizTeoZ6ZroZLhvCk=;
        b=R/Q6S60WrnYgoEvQlOmmiLyNAOiYIxon8ULrrjOVrn/3z4aRCCxCCMqo7aDwVRiBXq
         Q5aN85KB+hkh8Qii+Lc7xCiPCZjOq9yumyyz43qGQ036bud3rGbk1aWneDUWloLhe6tB
         +bZW9i41ZjopKY1hY5FlvTQTA7isq/vekjNgad1DF41QKJMJQVzhauRxHI+few7x1qfF
         Z9ZJlhlRRFX6joKJ4uDkqM6esRckRIS6cQr5POwTy9DMgw1Ow/WO6bOD38ByEnYrXhIj
         RkSVYC5GRmsEFA8OkRBvG9M0Img5s9FnMrnn7MXteDU15DXVm8/wgN0oUKLIl8zRK6Ue
         kwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7ItALSQmBYmE/CIt7MKw1pwIYiizTeoZ6ZroZLhvCk=;
        b=ST6THi/9r4GGBDIuTPbUkgOvRJKN1l++aH7p30lc+SGVsk8JtyCY1lHY/Huv5JlMTP
         75BLxMHD1VMEhzLIl64FRJSKlw2HxtJgavNpRyiqzkiGF8hq5zIBPny3EQEH5qE5r0Mr
         EQ9zHmyLlH8/MxXFnF8ymMelOr6PVESMbPk8Zy8MHOFeYSl1/2SWhMLYpCZz/tZtzT5v
         Fb1wTFh8/jyhYRgXe7jsbtlTe4uPnAmLdytWVcLhrgVrovM6KjBo9c38em/NEuAfHa47
         68F3ZUSl+wrxbsvNj5uzm/szwxkQispWJLMr5rYWx5C9bS59GHTQn/KpYpwqpwIaoqro
         401A==
X-Gm-Message-State: ANoB5pkynx/pfbGj2YdIN22+IvGF+W+ut6kD0OmEN0kuzeR3NYCDyXK0
	6pKVukzpW6ljlKCVwQJ6X21weG9+8Xk9AA==
X-Google-Smtp-Source: AA0mqf53zu/DHPLbjl2UgUysLtTlt9x60FRkCLpgtzWZhxohdB/MbYdchAfMwDShAhGXOO2JzWjYZg==
X-Received: by 2002:a17:90b:4fcc:b0:219:1b9c:4682 with SMTP id qa12-20020a17090b4fcc00b002191b9c4682mr2434948pjb.1.1669456817190;
        Sat, 26 Nov 2022 02:00:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/17] powerpc/qspinlock: add ability to prod new queue head CPU
Date: Sat, 26 Nov 2022 19:59:26 +1000
Message-Id: <20221126095932.1234527-12-npiggin@gmail.com>
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

After the head of the queue acquires the lock, it releases the
next waiter in the queue to become the new head. Add an option
to prod the new head if its vCPU was preempted. This may only
have an effect if queue waiters are yielding.

Disable this option by default for now, i.e., no logical change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index b044760a05e9..03329f4ed238 100644
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
 
@@ -370,10 +372,11 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	node = &qnodesp->nodes[idx];
 	node->next = NULL;
 	node->lock = lock;
+	node->cpu = smp_processor_id();
 	node->yield_cpu = -1;
 	node->locked = 0;
 
-	tail = encode_tail_cpu(smp_processor_id());
+	tail = encode_tail_cpu(node->cpu);
 
 	old = publish_tail_cpu(lock, tail);
 
@@ -439,7 +442,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
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
@@ -590,6 +600,22 @@ static int pv_yield_propagate_owner_get(void *data, u64 *val)
 
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
@@ -599,6 +625,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
+		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
 	}
 
 	return 0;
-- 
2.37.2

