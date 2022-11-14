Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2B6274A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:42:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YWV0my7z3cH9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:42:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DwY5klbp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DwY5klbp;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHj4d7Hz3cLF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:33 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id n17so1488099pgh.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jESh/QHriL5jCEX0NFLvVT4M44gqscG0SJjoh++TX7Y=;
        b=DwY5klbpZLEBzGmZdDjNuPOmEBWeZUqeXjXnq0z657BFVPUEmTcS2hcAIRT9M7isiN
         8TyRTTSYWqhQlSXpWhXKuz7ICaEvOx+9mx+Zcs5C6Qa0LGxuRkFWbAzzuVOhmV1tkWhi
         WJ/4PlS108t2QRbcbBYrDipo8QJHwOlzIHobZkK3lHnOSOAxQJq0ZRsRzI264MefSzkh
         i/RnPvjmy3HZhxTrDw4906ntVG3BkUBO8XJk73v8mJ0ooNb7ZuBycRHPeZZo65YmfxOd
         Bk78TLikD3V+lJF+Mm0qA72+bIlOOsat+r/mrJJLhiXQoWPKt9ceD0je94+BcYKOo+R6
         fdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jESh/QHriL5jCEX0NFLvVT4M44gqscG0SJjoh++TX7Y=;
        b=c3xZAyeXV621AE5GIGoFEvGcS+v2NlS5gcO6FxtpD7KzhxUIm/sNZdcYmjXu8bacRe
         sAhGW47ZqXM1QinPFNByop5PMRdynEmh7PvxbhZXUieH0jCUpEB9O2KeoKHDyOqPM+n2
         cZ0SiPXm4GiHvhgifO2sHkjxnvOe0MJS9MHduD6U5glY8VfkVInWkKfmeBY4z/dtZzgc
         A0bAR7NLPY3xkiGPmwi6GIwggem/g5UeIGcVyD1g8R/rrF5K5dIKChji8exUeerYCttk
         XAo78JkepUqB8Vahbgxa39Xh6QPpKtYYNpy7Y9p/y3mqAA7E1NHt0m7k6lrDhwHIpjV4
         kTTA==
X-Gm-Message-State: ANoB5pmX2nSnFy4eDmx/3Eba4qQ1nVMnQVrV7M/skgcV59axKjvIlJWQ
	A8XmScpF79hXLua/23Tbv7Li2LqVz3I=
X-Google-Smtp-Source: AA0mqf5vl4+61lH3MOkrizq95zaPuBQ/QMNwdQPixBBajVzkLC3WMNEPGmzsM6xfdKQlyCu/TGkqCA==
X-Received: by 2002:a63:114b:0:b0:470:5b0d:b50e with SMTP id 11-20020a63114b000000b004705b0db50emr9826439pgr.488.1668393150927;
        Sun, 13 Nov 2022 18:32:30 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/17] powerpc/qspinlock: allow stealing when head of queue yields
Date: Mon, 14 Nov 2022 12:31:30 +1000
Message-Id: <20221114023137.2679627-12-npiggin@gmail.com>
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

If the head of queue is preventing stealing but it finds the owner vCPU
is preempted, it will yield its cycles to the owner which could cause it
to become preempted. Add an option to re-allow stealers before yielding,
and disallow them again after returning from the yield.

Disable this option by default for now, i.e., no logical change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 61 +++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 272467c99b90..6b54b4628991 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -26,6 +26,7 @@ static bool maybe_stealers __read_mostly = true;
 static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
+static bool pv_yield_allow_steal __read_mostly = false;
 static bool pv_yield_prev __read_mostly = true;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
@@ -154,6 +155,22 @@ static __always_inline u32 set_mustq(struct qspinlock *lock)
 	return prev;
 }
 
+static __always_inline u32 clear_mustq(struct qspinlock *lock)
+{
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# clear_mustq				\n"
+"	andc	%0,%0,%2						\n"
+"	stwcx.	%0,0,%1							\n"
+"	bne-	1b							\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (_Q_MUST_Q_VAL)
+	: "cr0", "memory");
+
+	return prev;
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = decode_tail_cpu(val);
@@ -178,7 +195,7 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 	BUG();
 }
 
-static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool mustq)
 {
 	int owner;
 	u32 yield_count;
@@ -207,7 +224,11 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	smp_rmb();
 
 	if (READ_ONCE(lock->val) == val) {
+		if (mustq)
+			clear_mustq(lock);
 		yield_to_preempted(owner, yield_count);
+		if (mustq)
+			set_mustq(lock);
 		/* Don't relax if we yielded. Maybe we should? */
 		return;
 	}
@@ -215,6 +236,21 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
 	cpu_relax();
 }
 
+static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	__yield_to_locked_owner(lock, val, paravirt, false);
+}
+
+static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
+{
+	bool mustq = false;
+
+	if ((val & _Q_MUST_Q_VAL) && pv_yield_allow_steal)
+		mustq = true;
+
+	__yield_to_locked_owner(lock, val, paravirt, mustq);
+}
+
 static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
 {
 	int prev_cpu = decode_tail_cpu(val);
@@ -230,7 +266,7 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
 	if ((yield_count & 1) == 0)
 		goto relax; /* owner vcpu is running */
 
-	smp_rmb(); /* See yield_to_locked_owner comment */
+	smp_rmb(); /* See __yield_to_locked_owner comment */
 
 	if (!node->locked) {
 		yield_to_preempted(prev_cpu, yield_count);
@@ -325,7 +361,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_head_to_locked_owner(lock, val, paravirt);
 		}
 
 		/* If we're the last queued, must clean up the tail. */
@@ -348,7 +384,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			if (!(val & _Q_LOCKED_VAL))
 				break;
 
-			yield_to_locked_owner(lock, val, paravirt);
+			yield_head_to_locked_owner(lock, val, paravirt);
 
 			iters++;
 			if (!mustq && iters >= get_head_spins(paravirt)) {
@@ -485,6 +521,22 @@ static int pv_yield_owner_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
 
+static int pv_yield_allow_steal_set(void *data, u64 val)
+{
+	pv_yield_allow_steal = !!val;
+
+	return 0;
+}
+
+static int pv_yield_allow_steal_get(void *data, u64 *val)
+{
+	*val = pv_yield_allow_steal;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_allow_steal, pv_yield_allow_steal_get, pv_yield_allow_steal_set, "%llu\n");
+
 static int pv_yield_prev_set(void *data, u64 val)
 {
 	pv_yield_prev = !!val;
@@ -507,6 +559,7 @@ static __init int spinlock_debugfs_init(void)
 	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 	if (is_shared_processor()) {
 		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
+		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
 	}
 
-- 
2.37.2

