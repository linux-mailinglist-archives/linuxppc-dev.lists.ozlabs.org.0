Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94855838DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgty3xtkz3f7q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rizd1BDl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rizd1BDl;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmC0mpdz2y27
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:54 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so1175837pjf.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gxJJQeGmIzliflcAXKGUsTxul/P4Q+NSITvwTzGp+5U=;
        b=Rizd1BDlecYopdLi47WXvTvQwqFMWNaSo1WOqC6cvrlo8h+ICB7k8rQdUf1n8S10Ww
         GLvLsGKsX7Soc8VYMwO/JHi+Qt43IbC5NTg+tjbItV0rBo79mlkmxqL/7sFPei6zOK8Z
         fg4mUqLCtZBYsugUQ6aLxWxAbAQX/K0oMT9wKPMu2JWihiPNINC6rzUdbX3/qRUfIA0p
         sZyg3mIGEbwgVcDiRHmknIB4GbwWmwkPKLuasA4pdthcLkrjZeazI5V47CRbw+tpc3jj
         voFilc51iwOZMsdhDLVYPAZ+y6A0/IAGcot9NKlVCqH5AeV3HNdQIcNz2+LOeaRj/J6a
         shNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxJJQeGmIzliflcAXKGUsTxul/P4Q+NSITvwTzGp+5U=;
        b=JSMZDaS2iRw1bV90cOZQR2R2jceOboIKUjunx1fjoGBWlHAyUH6k3eeJg0ZNL/DDnV
         lcr72Cef50tN7xVTcrtnCo4HPyXJEGKMrbm6DrOvY7FgedbbOrvfvaYzYNF+NLwg21ki
         K/CQWjerhGbN/zbyNUpTxeCAJ3MTMSfSj6Ff6xUjEejUOOP16QpNkieKqgUU9l7Osen2
         rUS2AMQYfQR09Z2WcRj7f3m8w2SE1nVthlPJ2lFc5axL/lJQFnk0qOcOUJ75m+R7LW7x
         CGv+uIhhBMDif6WBtH9I3YQEmdXO9l1ge2KAtckV0lGajfcFz2gWiuw8orcPhtMxnA7O
         mfsg==
X-Gm-Message-State: AJIora/VGWBDn7+JiOFxu+LAqgDA16jHUZGPnfgxQC33KPPrj2ZwS4qG
	NGezWIrhSK5fYF6SEpqhgNEvSiwj6Xc=
X-Google-Smtp-Source: AGRyM1tRQe4Ao566G29I0jGs1z7dM6YDEqKHeK9gL1bbktk5EQMt00a3lXNDdTmtwVvkYIMIoDwXcw==
X-Received: by 2002:a17:90b:3ec7:b0:1f3:1bb5:92e8 with SMTP id rm7-20020a17090b3ec700b001f31bb592e8mr2572541pjb.4.1658989912414;
        Wed, 27 Jul 2022 23:31:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/17] powerpc/qspinlock: implement option to yield to previous node
Date: Thu, 28 Jul 2022 16:31:12 +1000
Message-Id: <20220728063120.2867508-11-npiggin@gmail.com>
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

Queued waiters which are not at the head of the queue don't spin on
the lock word but their qnode lock word, waiting for the previous queued
CPU to release them. Add an option which allows these waiters to yield
to the previous CPU if its vCPU is preempted.

Disable this option by default for now, i.e., no logical change.
---
 arch/powerpc/lib/qspinlock.c | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 55286ac91da5..b39f8c5b329c 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly = true;
 static int HEAD_SPINS __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_prev __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -224,6 +225,31 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	cpu_relax();
 }
 
+static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
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
@@ -291,13 +317,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
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
@@ -448,12 +475,29 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
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

