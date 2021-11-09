Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0DC44A5AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 05:12:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpF255xMXz3bbx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 15:12:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qJxIvWCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qJxIvWCE; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpF0j6wDBz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 15:11:33 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id g19so12200149pfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 20:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQFU+G/DSpCOLSveRI/qk3sBgfhtXA2EHZFO2cdZU3k=;
 b=qJxIvWCExqTfbShydvUAUEHw6FPpZoGR5E3RcJCItA+OAJ5G/pMOfRerK0px5Tb+WS
 DnNOXgGGdjBZ6dNL2QP6A/cZC1qSKOGOsasvjXhDKHQ5JvcyV2EzOWIxPPS46Cscfn7M
 V1oX904uxGev4PA0bV5KcJedjxnrW10wCzfiEtkD/DXZg4H/mnv9WAw/u7p5DOnQ+jFp
 tCghQUyjIEp7Xs3I/c+0PiD27omu5QwdLly0KitYRmW0wG8yjCIabKosZIDMUNKAKryb
 tp5YIBE8vINHnKtor/eg8mR9r9tl+P6m9l5ydmQYaSjtPwlC7eIp5FffshIMffXHy7S0
 PnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQFU+G/DSpCOLSveRI/qk3sBgfhtXA2EHZFO2cdZU3k=;
 b=wS8rLSrLBVLKWR9Z1uYTbVMlrzGHP/fP+H6vSKxsGXm+MpSH97gb69NB9jb8BzeCx7
 lXnfYjy67wwJP2SNb7ragHdqJanDYaTlDPRP41fxhERjRC9vt14Hw5VbZRAMlHy7VvqF
 lXfUQS9G/+cVgkv2LwBmvF8EX9BvhGbwVkmEhIpWIQpHKiH0sbGoA2YLYSKXlxb5sK7Y
 /m8LiKNBh7EJjdSMWV4ZQiVonw+DyMdCRYM3BqOLae+/6+Eq1EqNDWnOY99nec2nIETR
 eLw+MnNtlpduFW9IjWrNy0Qj4kuU0RStEdnyb8S1oFahLfrbK8FGojxuKywXZEpqQWip
 BMIQ==
X-Gm-Message-State: AOAM530YfIS3dJ8XmcT8ycsnqNQQLY4B3HQtY/aulXk56cRFIKh5LW28
 HpzNgSLq9emTgqlZC3P5CuU=
X-Google-Smtp-Source: ABdhPJxcyaGAYMWexUl6VpDyScbecT8IrSM4/mBcOSWvZMP+IcmfUAwYfo4xdWSidD9cB7AIJVMZbQ==
X-Received: by 2002:a63:7d6:: with SMTP id 205mr3634863pgh.289.1636431091328; 
 Mon, 08 Nov 2021 20:11:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 o19sm18278063pfu.56.2021.11.08.20.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 20:11:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 1/4] lazy tlb: introduce lazy mm refcount helper functions
Date: Tue,  9 Nov 2021 14:11:16 +1000
Message-Id: <20211109041119.1972927-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211109041119.1972927-1-npiggin@gmail.com>
References: <20211109041119.1972927-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add explicit _lazy_tlb annotated functions for lazy mm refcounting.
This makes lazy mm references more obvious, and allows explicit
refcounting to be removed if it is not used.

The non-trivial change in kthread_use_mm/kthread_unuse_mm is because it
is clever with refcounting: If it happens that the kthread's lazy tlb mm
(active_mm) is the same as the mm to be used, the code doesn't touch the
refcount but rather transfers the lazy refcount to used-mm refcount. Now
that lazy tlb mm refcount may not be equivalent to regular refcount,
this trick doesn't work and we must mmgrab a regular reference on mm to
use, and mmdrop_lazy_tlb the previous active_mm.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm/mach-rpc/ecard.c            |  2 +-
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c |  4 ++--
 fs/exec.c                            |  2 +-
 include/linux/sched/mm.h             | 11 +++++++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/kthread.c                     | 21 +++++++++++++--------
 kernel/sched/core.c                  | 15 ++++++++-------
 9 files changed, 39 insertions(+), 22 deletions(-)

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
index 605bab448f84..88875387a347 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1582,7 +1582,7 @@ void start_secondary(void *unused)
 	if (IS_ENABLED(CONFIG_PPC32))
 		setup_kup();
 
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm = &init_mm;
 
 	smp_store_cpu_info(cpu);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..59156c2d2ebe 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -786,10 +786,10 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
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
index a098c133d8d7..30ba5449bb14 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1030,7 +1030,7 @@ static int exec_mmap(struct mm_struct *mm)
 		mmput(old_mm);
 		return 0;
 	}
-	mmdrop(active_mm);
+	mmdrop_lazy_tlb(active_mm);
 	return 0;
 }
 
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 5561486fddef..f7a0b347fecb 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -49,6 +49,17 @@ static inline void mmdrop(struct mm_struct *mm)
 		__mmdrop(mm);
 }
 
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
 /**
  * mmget() - Pin the address space associated with a &struct mm_struct.
  * @mm: The address space to pin.
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 192e43a87407..fffe8b738201 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -613,7 +613,7 @@ static int finish_cpu(unsigned int cpu)
 	 */
 	if (mm != &init_mm)
 		idle->active_mm = &init_mm;
-	mmdrop(mm);
+	mmdrop_lazy_tlb(mm);
 	return 0;
 }
 
diff --git a/kernel/exit.c b/kernel/exit.c
index 91a43e57a32e..8e7b41702ad6 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -475,7 +475,7 @@ static void exit_mm(void)
 		__set_current_state(TASK_RUNNING);
 		mmap_read_lock(mm);
 	}
-	mmgrab(mm);
+	mmgrab_lazy_tlb(mm);
 	BUG_ON(mm != current->active_mm);
 	/* more a memory barrier than a real lock */
 	task_lock(current);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 5b37a8567168..83ed75d531b4 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1350,14 +1350,19 @@ void kthread_use_mm(struct mm_struct *mm)
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
@@ -1374,12 +1379,9 @@ void kthread_use_mm(struct mm_struct *mm)
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
 
 	to_kthread(tsk)->oldfs = force_uaccess_begin();
 }
@@ -1411,10 +1413,13 @@ void kthread_unuse_mm(struct mm_struct *mm)
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
index 1bba4128a3e6..480205b6a188 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4831,13 +4831,14 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 * rq->curr, before returning to userspace, so provide them here:
 	 *
 	 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
-	 *   provided by mmdrop(),
+	 *   provided by mmdrop_lazy_tlb(),
 	 * - a sync_core for SYNC_CORE.
 	 */
 	if (mm) {
 		membarrier_mm_sync_core_before_usermode(mm);
-		mmdrop(mm);
+		mmdrop_lazy_tlb(mm);
 	}
+
 	if (unlikely(prev_state == TASK_DEAD)) {
 		if (prev->sched_class->task_dead)
 			prev->sched_class->task_dead(prev);
@@ -4900,9 +4901,9 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
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
@@ -4910,7 +4911,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
 		next->active_mm = prev->active_mm;
 		if (prev->mm)                           // from user
-			mmgrab(prev->active_mm);
+			mmgrab_lazy_tlb(prev->active_mm);
 		else
 			prev->active_mm = NULL;
 	} else {                                        // to user
@@ -4926,7 +4927,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
 
 		if (!prev->mm) {                        // from kernel
-			/* will mmdrop() in finish_task_switch(). */
+			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
 			rq->prev_mm = prev->active_mm;
 			prev->active_mm = NULL;
 		}
@@ -9441,7 +9442,7 @@ void __init sched_init(void)
 	/*
 	 * The boot idle thread does lazy MMU switching as well:
 	 */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	enter_lazy_tlb(&init_mm, current);
 
 	/*
-- 
2.23.0

