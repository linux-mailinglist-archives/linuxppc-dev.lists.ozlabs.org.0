Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71556D33C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh86R5w3cz3f6T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:11:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TlbVcN9J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TlbVcN9J;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zk38xHz3cFW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:22 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso3744643pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pcEsjqfe9z82LNi/h168uZWmWZKxEa/6hhUbZNwifdA=;
        b=TlbVcN9JpFi1Scas0JcVJTQmKbwvCPDxP3CW0QSas0BLH7TkwZ9i8rIdlc3c6XwEj8
         wJaCOqnPEUEJjg5SbF/8eB2FODt7iVvr62uZX+uklOWp6TStoAEb6KywOSMFsKyyTewf
         bYlko2/dYkaFc4CFo+DO4YXg5cu4yNzwP/KCgVbRnrJs+6XUrcZVAIjoArbv+Br0Bx+U
         38UB6IKBPPHC/y2oGFumAHLc1Bf4n3yJdkZFqN42kqUf8YE1knNQfpoHfpAHC/f0CTRM
         Iqu0gRbcrK86b+XJNksTdZUb06KiN5Hvz20gXnZXdtsrd+J/cv+e2Vu7vRo/vEmopAYd
         7Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcEsjqfe9z82LNi/h168uZWmWZKxEa/6hhUbZNwifdA=;
        b=EEc0Gu2IaO2P7k3W+Ig4WNVlK0P/ZWIZ0KG4TV2DhDSP54qt2cphco+eOArbC4LQ46
         wmjIfhIgW5965B5f/ROjyASv1k7d2TEeDnUISz9ZJrosDjp5VjbrC+Q60QLW5DCLKawW
         05aYGPo5VYTT5adyWHgg/w+Uh1lpZNvIjn3QCgFu91WQDD31upHZUqtOWkD5cQEpZBuX
         oZjZ8ISyT9sNX7P+/p4uVdpw+XQKBXFRiysWRNLGOg6HCrlLLBvKUTnxxSYrSt1a7niY
         l/0zzXojDD+X3KbzxqeVDNJe4J7R7H4W61fdmxiyh9/kDacHLQHveCkuxJJA0kB96PJV
         pXeg==
X-Gm-Message-State: AJIora83/ARid7+UHrewYBQwAly4FnMdwqy20gqtW9igcLMVzg3CayX0
	mlIkjhWl3kbqUw1+CWf9BDEQH33sFrc=
X-Google-Smtp-Source: AGRyM1uSIyAdkqPciYVSXTeuFtM9nmAOLUbAjuZ8cd2foE/Fr+Ov/y1/Z1qXR6CULEoaNoba2/dfCA==
X-Received: by 2002:a17:903:3011:b0:16c:3d34:fde4 with SMTP id o17-20020a170903301100b0016c3d34fde4mr7183128pla.79.1657508720361;
        Sun, 10 Jul 2022 20:05:20 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 09/14] powerpc/qspinlock: implement option to yield to previous node
Date: Mon, 11 Jul 2022 13:04:48 +1000
Message-Id: <20220711030453.150644-10-npiggin@gmail.com>
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

Queued waiters which are not at the head of the queue don't spin on
the lock word but their qnode lock word, waiting for the previous queued
CPU to release them. Add an option which allows these waiters to yield
to the previous CPU if its vCPU is preempted.

Disable this option by default for now, i.e., no logical change.
---
 arch/powerpc/lib/qspinlock.c | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index ee85198d5e28..1a58ed51c060 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly = true;
 static int HEAD_SPINS __read_mostly = (1<<13);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_prev __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -214,6 +215,31 @@ static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt
 	cpu_relax();
 }
 
+static void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
+{
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
@@ -276,13 +302,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	 */
 	if (old & _Q_TAIL_CPU_MASK) {
 		struct qnode *prev = get_tail_qnode(lock, old);
+		int prev_cpu = get_tail_cpu(old);
 
 		/* Link @node into the waitqueue. */
 		WRITE_ONCE(prev->next, node);
 
 		/* Wait for mcs node lock to be released */
 		while (!node->locked)
-			cpu_relax();
+			yield_to_prev(lock, node, prev_cpu, paravirt);
 
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
@@ -430,12 +457,29 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
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
2.35.1

