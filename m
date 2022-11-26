Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33186639528
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:07:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6qW02PLz3f88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:07:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UpoU0RSR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UpoU0RSR;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6ff6JG5z3f2w
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:10 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 62so5731525pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hEQzYl0altadHCnc6rsswHwjhGI50CiqQmFWhEPYno=;
        b=UpoU0RSRH+gjTguNVioKiusAXtYQFbuiM4csWccCWhJjlFde2fh1mvz95D6p8B6en0
         q16uEeb5ezxwzC1ToTATEY8htJDuYvNRejYcDKJTWG6yTBB+KUNGDI/KqNwXehAJPLpj
         INj0XX+oj+ZN09LibhaAqrdpNl7Aqi64FMorB4yPsG8VNn7maF99fn0p1AIxwG0AfNhO
         Sfu4ZbW0B8ML2sNQsuHy0Tg2QL8tugSe1kbSU0lbv9UU5QsgGbvi4fHbdXoDK7Ph1p/A
         V5BHt3dvsJBVzmkkstUSSJ0ghsI746BIJ9rGIWj4syW14lktTd7MIQYMCmrKm5Z1zveg
         Km4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hEQzYl0altadHCnc6rsswHwjhGI50CiqQmFWhEPYno=;
        b=QlsBJc58Xfvmli2pE/Bn0QaduLVFEVMPXUlEQe+paOO+cPBiijdZ67azBvt1z+fxrK
         CR0uPUhgB/3jNvZ98x1UpQHV4aOrDQC+06kfty12PulYwnCSVGfepGkMB+dan4RKnNfS
         ne4HF+NtOGvKJyzKx1IEMQ/RJLTciLuGQ5wn9J4eum0UG8BOTyMdaJ6/g4LjZTyvuU2L
         1n0r2AG/CvkvUPPE2fYGE0WCitafQIp9foF+J9AoTev+A/v8ylFPf0V6LprP0eIRr+FB
         X4aobncOW2AfWiC0qB2lsHqKnlmppm0kzMqNqfbafqKTk60bHHpFN2Pa3sua3ugOAaDQ
         TZhQ==
X-Gm-Message-State: ANoB5pnAHG+yK197ldQGyata28CLiqQIQm3yVo4A8YhBU4mt7O5MmU4G
	DppiU65yheF2SOXTUpZ5lLi4rFlhP6DXDg==
X-Google-Smtp-Source: AA0mqf7TGVgZQhFxECPBF7Ir574vaAQ8OeXyWsQT5TimPkeYj9telgTlK8Od2TUUXwXgYRN2O3HiHw==
X-Received: by 2002:aa7:8684:0:b0:56c:5afe:67f6 with SMTP id d4-20020aa78684000000b0056c5afe67f6mr22794400pfo.20.1669456808199;
        Sat, 26 Nov 2022 02:00:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/17] powerpc/qspinlock: implement option to yield to previous node
Date: Sat, 26 Nov 2022 19:59:23 +1000
Message-Id: <20221126095932.1234527-9-npiggin@gmail.com>
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

Queued waiters which are not at the head of the queue don't spin on
the lock word but their qnode lock word, waiting for the previous queued
CPU to release them. Add an option which allows these waiters to yield
to the previous CPU if its vCPU is preempted.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index bada773292af..838be0bc8705 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool maybe_stealers __read_mostly = true;
 static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_prev __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -195,6 +196,32 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	cpu_relax();
 }
 
+static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
+{
+	int prev_cpu = decode_tail_cpu(val);
+	u32 yield_count;
+
+	if (!paravirt)
+		goto relax;
+
+	if (!pv_yield_prev)
+		goto relax;
+
+	yield_count = yield_count_of(prev_cpu);
+	if ((yield_count & 1) == 0)
+		goto relax; /* owner vcpu is running */
+
+	smp_rmb(); /* See yield_to_locked_owner comment */
+
+	if (!node->locked) {
+		yield_to_preempted(prev_cpu, yield_count);
+		return;
+	}
+
+relax:
+	cpu_relax();
+}
+
 
 static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
 {
@@ -269,7 +296,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 		/* Wait for mcs node lock to be released */
 		while (!node->locked)
-			cpu_relax();
+			yield_to_prev(lock, node, old, paravirt);
 
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
@@ -417,12 +444,29 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
 
+static int pv_yield_prev_set(void *data, u64 val)
+{
+	pv_yield_prev = !!val;
+
+	return 0;
+}
+
+static int pv_yield_prev_get(void *data, u64 *val)
+{
+	*val = pv_yield_prev;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_prev, pv_yield_prev_get, pv_yield_prev_set, "%llu\n");
+
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 	}
 
 	return 0;
-- 
2.37.2

