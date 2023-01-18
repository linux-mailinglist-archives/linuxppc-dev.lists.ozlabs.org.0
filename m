Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C866715BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:02:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxdX25VPQz3fDq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:02:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mLPAcj75;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mLPAcj75;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxdV45lL1z2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:00:28 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id y1so36114779plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6PuCTERzdY2d/gYc8R3maLl/fbctX4OPH6RObWuYyk=;
        b=mLPAcj75durv64NidSKodcHmBhYym/DDM+iL8MW5HDxvzQ5mMgHhbdgrXMpJGbOi4Y
         mVW9wBj5zIok1vK4Tj2bKVEe6bs1LBNMhZmZtD+n8mfhO8aNk1YcaysWuuWRHrSw6pFM
         UHPaAcT1FbrZaF9vdXEgSY47DOHbKtLKA3Adq6HXuimKYkD6R1fgcTphKi5s0lO2eqH5
         eupSgPjW+jy9HiX5ukWEqS2r+u8df35c62Wc5Sm3oOxka7ARVkbcVCZk+bOH3OlLVlH4
         xJHj62JSP0Q0g1rP9oo+WXMSAJy8ojYfY/mTTWZkllr+1/fbmo7L0Y7+eK5PDWH5WUNO
         0Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6PuCTERzdY2d/gYc8R3maLl/fbctX4OPH6RObWuYyk=;
        b=cQo82cnenKcCgnVxyozXEXsTxsOoj8+fXfdZ2vbBZxA3bLG7uVzjLNCc19/wCQiQcK
         gpMO+FJhqOxEvvDgTMApggUgZmxEEW1L2FXzTPzad9+zaRly0E2TXKFevuD5+u+vf+R7
         iNLOit1T+a+h4FEcWAvEMtZphHDQu8ftwiUdXaEoMtFAI6eoRHVfM5icULpKtTxcwyRN
         1VhJLUnXeZK6XKTeKt5Tept2FGXp1DIzyDCVJXwniwoo2Z5APBznmtDoJS1JHV7EiZp8
         SvRWUKI19INV4I5HmjdACSrOCvOT/LDPfEOz2RFXX0YMZ+d7J67vwZxrhRwLHWY9BUXh
         ladg==
X-Gm-Message-State: AFqh2kokEV9A82vzAtSrwVdXgs/ez+u4qFBEaaC12uqpcESCNlNVH1r1
	GX7ZzsQAzGHkInKC3pV2fs18fVcms9ubkg==
X-Google-Smtp-Source: AMrXdXtoyvjMvP0/AkXBEr4j6oVuizDW6dMWCoEY70bY2IPo7cXCt1CBRz4u1euS2CBCOAp/EY+llw==
X-Received: by 2002:a17:90a:dd98:b0:229:8526:ba98 with SMTP id l24-20020a17090add9800b002298526ba98mr6450941pjv.12.1674028826410;
        Wed, 18 Jan 2023 00:00:26 -0800 (PST)
Received: from bobo.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a16c200b002272616d3e1sm738462pje.40.2023.01.18.00.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:00:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 1/5] lazy tlb: introduce lazy tlb mm refcount helper functions
Date: Wed, 18 Jan 2023 18:00:07 +1000
Message-Id: <20230118080011.2258375-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118080011.2258375-1-npiggin@gmail.com>
References: <20230118080011.2258375-1-npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add explicit _lazy_tlb annotated functions for lazy tlb mm refcounting.
This makes the lazy tlb mm references more obvious, and allows the
refcounting scheme to be modified in later changes.

The only functional change is in kthread_use_mm/kthread_unuse_mm is
because it is clever with refcounting: If it happens that the kthread's
lazy tlb mm (active_mm) is the same as the mm to be used, the code
doesn't touch the refcount but rather transfers the lazy refcount to
used-mm refcount. If the lazy tlb mm refcount is no longer equivalent to
the regular refcount, this trick can not be used. mmgrab a regular
reference on mm to use, and mmdrop_lazy_tlb the previous active_mm.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm/mach-rpc/ecard.c            |  2 +-
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c |  4 ++--
 fs/exec.c                            |  2 +-
 include/linux/sched/mm.h             | 16 ++++++++++++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/kthread.c                     | 21 +++++++++++++--------
 kernel/sched/core.c                  | 15 ++++++++-------
 9 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-rpc/ecard.c b/arch/arm/mach-rpc/ecard.c
index 53813f9464a2..c30df1097c52 100644
--- a/arch/arm/mach-rpc/ecard.c
+++ b/arch/arm/mach-rpc/ecard.c
@@ -253,7 +253,7 @@ static int ecard_init_mm(void)
 	current->mm = mm;
 	current->active_mm = mm;
 	activate_mm(active_mm, mm);
-	mmdrop(active_mm);
+	mmdrop_lazy_tlb(active_mm);
 	ecard_init_pgtables(mm);
 	return 0;
 }
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6b90f10a6c81..7db6b3faea65 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1611,7 +1611,7 @@ void start_secondary(void *unused)
 	if (IS_ENABLED(CONFIG_PPC32))
 		setup_kup();
 
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm = &init_mm;
 
 	smp_store_cpu_info(cpu);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4e29b619578c..282359ab525b 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -794,10 +794,10 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 	if (current->active_mm == mm) {
 		WARN_ON_ONCE(current->mm != NULL);
 		/* Is a kernel thread and is using mm as the lazy tlb */
-		mmgrab(&init_mm);
+		mmgrab_lazy_tlb(&init_mm);
 		current->active_mm = &init_mm;
 		switch_mm_irqs_off(mm, &init_mm, current);
-		mmdrop(mm);
+		mmdrop_lazy_tlb(mm);
 	}
 
 	/*
diff --git a/fs/exec.c b/fs/exec.c
index ab913243a367..1a32a88db173 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1033,7 +1033,7 @@ static int exec_mmap(struct mm_struct *mm)
 		mmput(old_mm);
 		return 0;
 	}
-	mmdrop(active_mm);
+	mmdrop_lazy_tlb(active_mm);
 	return 0;
 }
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 2a243616f222..5376caf6fcf3 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -79,6 +79,22 @@ static inline void mmdrop_sched(struct mm_struct *mm)
 }
 #endif
 
+/* Helpers for lazy TLB mm refcounting */
+static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
+{
+	mmgrab(mm);
+}
+
+static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
+{
+	mmdrop(mm);
+}
+
+static inline void mmdrop_lazy_tlb_sched(struct mm_struct *mm)
+{
+	mmdrop_sched(mm);
+}
+
 /**
  * mmget() - Pin the address space associated with a &struct mm_struct.
  * @mm: The address space to pin.
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6c0a92ca6bb5..189895288d9d 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -623,7 +623,7 @@ static int finish_cpu(unsigned int cpu)
 	 */
 	if (mm != &init_mm)
 		idle->active_mm = &init_mm;
-	mmdrop(mm);
+	mmdrop_lazy_tlb(mm);
 	return 0;
 }
 
diff --git a/kernel/exit.c b/kernel/exit.c
index 15dc2ec80c46..1a4608d765e4 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -537,7 +537,7 @@ static void exit_mm(void)
 		return;
 	sync_mm_rss(mm);
 	mmap_read_lock(mm);
-	mmgrab(mm);
+	mmgrab_lazy_tlb(mm);
 	BUG_ON(mm != current->active_mm);
 	/* more a memory barrier than a real lock */
 	task_lock(current);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index f97fd01a2932..691b213e578f 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1410,14 +1410,19 @@ void kthread_use_mm(struct mm_struct *mm)
 	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
 	WARN_ON_ONCE(tsk->mm);
 
+	/*
+	 * It's possible that tsk->active_mm == mm here, but we must
+	 * still mmgrab(mm) and mmdrop_lazy_tlb(active_mm), because lazy
+	 * mm may not have its own refcount (see mmgrab/drop_lazy_tlb()).
+	 */
+	mmgrab(mm);
+
 	task_lock(tsk);
 	/* Hold off tlb flush IPIs while switching mm's */
 	local_irq_disable();
 	active_mm = tsk->active_mm;
-	if (active_mm != mm) {
-		mmgrab(mm);
+	if (active_mm != mm)
 		tsk->active_mm = mm;
-	}
 	tsk->mm = mm;
 	membarrier_update_current_mm(mm);
 	switch_mm_irqs_off(active_mm, mm, tsk);
@@ -1434,12 +1439,9 @@ void kthread_use_mm(struct mm_struct *mm)
 	 * memory barrier after storing to tsk->mm, before accessing
 	 * user-space memory. A full memory barrier for membarrier
 	 * {PRIVATE,GLOBAL}_EXPEDITED is implicitly provided by
-	 * mmdrop(), or explicitly with smp_mb().
+	 * mmdrop_lazy_tlb().
 	 */
-	if (active_mm != mm)
-		mmdrop(active_mm);
-	else
-		smp_mb();
+	mmdrop_lazy_tlb(active_mm);
 }
 EXPORT_SYMBOL_GPL(kthread_use_mm);
 
@@ -1467,10 +1469,13 @@ void kthread_unuse_mm(struct mm_struct *mm)
 	local_irq_disable();
 	tsk->mm = NULL;
 	membarrier_update_current_mm(NULL);
+	mmgrab_lazy_tlb(mm);
 	/* active_mm is still 'mm' */
 	enter_lazy_tlb(mm, tsk);
 	local_irq_enable();
 	task_unlock(tsk);
+
+	mmdrop(mm);
 }
 EXPORT_SYMBOL_GPL(kthread_unuse_mm);
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 25b582b6ee5f..26aaa974ee6d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5140,13 +5140,14 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 * rq->curr, before returning to userspace, so provide them here:
 	 *
 	 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
-	 *   provided by mmdrop(),
+	 *   provided by mmdrop_lazy_tlb(),
 	 * - a sync_core for SYNC_CORE.
 	 */
 	if (mm) {
 		membarrier_mm_sync_core_before_usermode(mm);
-		mmdrop_sched(mm);
+		mmdrop_lazy_tlb_sched(mm);
 	}
+
 	if (unlikely(prev_state == TASK_DEAD)) {
 		if (prev->sched_class->task_dead)
 			prev->sched_class->task_dead(prev);
@@ -5203,9 +5204,9 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
 	/*
 	 * kernel -> kernel   lazy + transfer active
-	 *   user -> kernel   lazy + mmgrab() active
+	 *   user -> kernel   lazy + mmgrab_lazy_tlb() active
 	 *
-	 * kernel ->   user   switch + mmdrop() active
+	 * kernel ->   user   switch + mmdrop_lazy_tlb() active
 	 *   user ->   user   switch
 	 */
 	if (!next->mm) {                                // to kernel
@@ -5213,7 +5214,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
 		next->active_mm = prev->active_mm;
 		if (prev->mm)                           // from user
-			mmgrab(prev->active_mm);
+			mmgrab_lazy_tlb(prev->active_mm);
 		else
 			prev->active_mm = NULL;
 	} else {                                        // to user
@@ -5230,7 +5231,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		lru_gen_use_mm(next->mm);
 
 		if (!prev->mm) {                        // from kernel
-			/* will mmdrop() in finish_task_switch(). */
+			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
 			rq->prev_mm = prev->active_mm;
 			prev->active_mm = NULL;
 		}
@@ -9859,7 +9860,7 @@ void __init sched_init(void)
 	/*
 	 * The boot idle thread does lazy MMU switching as well:
 	 */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	enter_lazy_tlb(&init_mm, current);
 
 	/*
-- 
2.37.2

