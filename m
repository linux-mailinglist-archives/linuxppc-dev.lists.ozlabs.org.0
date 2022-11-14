Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 579396274A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:41:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YVT1gn3z3f4h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:41:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dTNP2CTe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dTNP2CTe;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHf0bWMz3cLF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:29 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id q71so9115491pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxlZzY3oPQoAvpJ/JC2WvocxFOzKd/6CJ/9uPnl4FMo=;
        b=dTNP2CTeTqoouloFiOWtNOXRHE28GCBm0qfU+Rg9vPIYxhpLzEjLw1YFSaZp2qBtdG
         bUUFMDbPx4IZrCvUqlameZfC6w7JrW2rvdBht40Dz9MXEEAcqyr37cx0m6ygJkjdpqsY
         g0BfIizmOF30NCgzA8YvxRwLf7fuJNPvdIw/PcpArDxOaCgZAjZ1XpxFyKO1Cij4lHu0
         jim1fDnrlbnQ4r/eCxX+Pq/p6nIw7X7nPZwTzVjiCp8hbMKNHDwBZAq7rksduhkVttN2
         9wUXJ/x18yiTQCjy282HNS/UEHd/jbvp3XguJO73n7bZQAVUPYVybT6hVm+Zkt9agW7d
         qVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxlZzY3oPQoAvpJ/JC2WvocxFOzKd/6CJ/9uPnl4FMo=;
        b=54WhBHZzGdKNiFbmgz3jzfUEbwwR0F4bFq79xegA6KHy8//5gNZR0sVH5+67/EbBpn
         QL8mAv5lJZe9pHw23lc1lQ7SaNAIasvkR6y+2zbN7/F+cDzvgEOGm/LwwlCyHPfI/bzE
         3Md12POBY/I+Cs/Our3fBVDY2tyS5Il473jVRibs0VypfkPWyRlrSQpRtO/FjAcTRCDP
         vFn3mJtTik4KT5OXrEG0l0pFPBrwaucT6qjfHDMZjZ0tb180Ih04FEOPJU+StN5R1rcL
         BObXiAnAFK5CUdKqatXPTBZTPXxLWb9ROw2G9by7YdscHhJVCx7ncn9mnJvA9KBxOO/y
         OksA==
X-Gm-Message-State: ANoB5pktNs0EYLAZpH5cvW5asFtQe/RD2hI5iqMxnhYtqNxTJF4jIsvB
	RThewDgwNE3in2wk1kGEenk9Qr1PDaY=
X-Google-Smtp-Source: AA0mqf4+SLWa/5FEWYE2/aktP90O+DZbCM+sSZdh7mTBhfL0l24VXJDeq5IxoTpm21JFCYc9EALtJQ==
X-Received: by 2002:a63:e50e:0:b0:470:3a39:4c18 with SMTP id r14-20020a63e50e000000b004703a394c18mr9875865pgh.163.1668393147213;
        Sun, 13 Nov 2022 18:32:27 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/17] powerpc/qspinlock: implement option to yield to previous node
Date: Mon, 14 Nov 2022 12:31:29 +1000
Message-Id: <20221114023137.2679627-11-npiggin@gmail.com>
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

Queued waiters which are not at the head of the queue don't spin on
the lock word but their qnode lock word, waiting for the previous queued
CPU to release them. Add an option which allows these waiters to yield
to the previous CPU if its vCPU is preempted.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index d81d72125034..272467c99b90 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool maybe_stealers __read_mostly = true;
 static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_prev __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -214,6 +215,32 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
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
@@ -286,7 +313,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 		/* Wait for mcs node lock to be released */
 		while (!node->locked)
-			cpu_relax();
+			yield_to_prev(lock, node, old, paravirt);
 
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
@@ -458,12 +485,29 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
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

