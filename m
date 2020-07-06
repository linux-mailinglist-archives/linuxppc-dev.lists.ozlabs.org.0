Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B5215348
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 09:25:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0cXf0wDVzDqgr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 17:25:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hH90ovSY; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0cVy4ktCzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 17:23:38 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id t6so17993392pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=/n7qmna+81iqwNn7K7nxIBKAMee6aaPGWP4cNzBkYLk=;
 b=hH90ovSYTNc2CcHvuW1P2E7SRzuhUGci7vhQD+L7r9PjTiFOMTmRFOtm+sfl6vOCEE
 oyV/eY/hvGINE1SyqjY68tFRe2W4xPataCSesjUKHYNIuaIfwleuAaEU8/ISxxLo+QpI
 1tf+aTe+REo2ejlC/YIEx05OMUzyRHkFYa2FHdKtPY0j1dHab/RzKmM5QELr6jaSAtL3
 fuHs5h0YL1CXNUOoloL+RK7hVHZ/NfeBfzRFnXRq+/dVCpxty/jgCsEStKta6Nj8PbiE
 qH202WWbgqdjRtQr8I+QfuDIhf1Pff2k944SNJUaHcWop3CIf750zLo/Ax4mfxi7Upv8
 HQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=/n7qmna+81iqwNn7K7nxIBKAMee6aaPGWP4cNzBkYLk=;
 b=FxFiXgvczbixndPjjeGm6+V19eYVcfZKBWpbWUcx1kTRZSMJnYty74rLDtmEly+8Yj
 TqkYLPoQP6QY5ceNPThRtPocJeSBtc14Qy8p7c7VOW0omYKe5YDIZdl08/xMuP3FkCZk
 FWkTqxQlQMsKj4irKv0E9f+EtAl64d87yypXZSn1XCgwHwknjrHq+C6MB8y506KABwaz
 ZWo/k/zZyndRQETKRVq7W4I/PCXipQfG4CwdkhVIvS8GyhurRCCy4tNcTVA+GGcFpAVV
 mmtVkIEXcCcI98ZWvxl/lSMY5ql3r6o3fVjzmNOUQ6Q7GQjNx9lpeEeq5qlWiU9u7/ZU
 Z3nQ==
X-Gm-Message-State: AOAM533QRLr2vo93X7Bfe7+5AscgGVkwgEMq5Pg4UBZmBwj/tUBlec7Z
 v9h8dS7rErTKi/zSF7YFp84=
X-Google-Smtp-Source: ABdhPJwl+PnyQNGtGUDDASWiyBV3TkmhGfL/yWOjH9QczG29EW+OMQfWP33zlFtb3PwPLEvJLpk2Nw==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr4464661pgt.215.1594020215189; 
 Mon, 06 Jul 2020 00:23:35 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id e128sm18527158pfe.196.2020.07.06.00.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:23:34 -0700 (PDT)
Date: Mon, 06 Jul 2020 17:23:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC][PATCH] avoid refcounting the lazy tlb mm struct
To: linux-mm@kvack.org
MIME-Version: 1.0
Message-Id: <1594019787.286knc5cet.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On big systems, the mm refcount can become highly contented when doing
a lot of context switching with threaded applications (particularly
switching between the idle thread and an application thread).

Not doing lazy tlb at all slows switching down quite a bit, so I wonder
if we can avoid the refcount for the lazy tlb, but have __mmdrop() IPI
all CPUs that might be using this mm lazily.

This patch has only had light testing so far, but seems to work okay.

Thanks,
Nick

--

diff --git a/arch/Kconfig b/arch/Kconfig
index 8cc35dc556c7..69ea7172db3d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -411,6 +411,16 @@ config MMU_GATHER_NO_GATHER
 	bool
 	depends on MMU_GATHER_TABLE_FREE
=20
+config MMU_LAZY_TLB_SHOOTDOWN
+	bool
+	help
+	  Instead of refcounting the "lazy tlb" mm struct, which can cause
+	  contention with multi-threaded apps on large multiprocessor systems,
+	  this option causes __mmdrop to IPI all CPUs in the mm_cpumask and
+	  switch to init_mm if they were using the to-be-freed mm as the lazy
+	  tlb. Architectures which do not track all possible lazy tlb CPUs in
+	  mm_cpumask can not use this (without modification).
+
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
 	bool
=20
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 920c4e3ca4ef..24ac85c868db 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -225,6 +225,7 @@ config PPC
 	select HAVE_PERF_USER_STACK_DUMP
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_PAGE_SIZE
+	select MMU_LAZY_TLB_SHOOTDOWN
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s6=
4/radix_tlb.c
index b5cc9b23cf02..52730629b3eb 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -652,10 +652,10 @@ static void do_exit_flush_lazy_tlb(void *arg)
 		 * Must be a kernel thread because sender is single-threaded.
 		 */
 		BUG_ON(current->mm);
-		mmgrab(&init_mm);
+		mmgrab_lazy_tlb(&init_mm);
 		switch_mm(mm, &init_mm, current);
 		current->active_mm =3D &init_mm;
-		mmdrop(mm);
+		mmdrop_lazy_tlb(mm);
 	}
 	_tlbiel_pid(pid, RIC_FLUSH_ALL);
 }
diff --git a/fs/exec.c b/fs/exec.c
index e6e8a9a70327..6c96c8feba1f 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1119,7 +1119,7 @@ static int exec_mmap(struct mm_struct *mm)
 		mmput(old_mm);
 		return 0;
 	}
-	mmdrop(active_mm);
+	mmdrop_lazy_tlb(active_mm);
 	return 0;
 }
=20
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 480a4d1b7dd8..ef28059086a1 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -51,6 +51,25 @@ static inline void mmdrop(struct mm_struct *mm)
=20
 void mmdrop(struct mm_struct *mm);
=20
+static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
+{
+	if (!IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN))
+		mmgrab(mm);
+}
+
+static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
+{
+	if (!IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN))
+		mmdrop(mm);
+}
+
+static inline void mmdrop_lazy_tlb_smp_mb(struct mm_struct *mm)
+{
+	mmdrop_lazy_tlb(mm);
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN))
+		smp_mb();
+}
+
 /*
  * This has to be called after a get_task_mm()/mmget_not_zero()
  * followed by taking the mmap_lock for writing before modifying the
diff --git a/kernel/fork.c b/kernel/fork.c
index 142b23645d82..e3f1039cee9f 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -685,6 +685,34 @@ static void check_mm(struct mm_struct *mm)
 #define allocate_mm()	(kmem_cache_alloc(mm_cachep, GFP_KERNEL))
 #define free_mm(mm)	(kmem_cache_free(mm_cachep, (mm)))
=20
+static void do_shoot_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm =3D arg;
+
+	if (current->active_mm =3D=3D mm) {
+		BUG_ON(current->mm);
+		switch_mm(mm, &init_mm, current);
+		current->active_mm =3D &init_mm;
+	}
+}
+
+static void do_check_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm =3D arg;
+
+	BUG_ON(current->active_mm =3D=3D mm);
+}
+
+void shoot_lazy_tlbs(struct mm_struct *mm)
+{
+	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
+		smp_call_function_many(mm_cpumask(mm), do_shoot_lazy_tlb, (void *)mm, 1)=
;
+		do_shoot_lazy_tlb(mm);
+	}
+	smp_call_function(do_check_lazy_tlb, (void *)mm, 1);
+	do_check_lazy_tlb(mm);
+}
+
 /*
  * Called when the last reference to the mm
  * is dropped: either by a lazy thread or by
@@ -692,6 +720,7 @@ static void check_mm(struct mm_struct *mm)
  */
 void __mmdrop(struct mm_struct *mm)
 {
+	shoot_lazy_tlbs(mm);
 	BUG_ON(mm =3D=3D &init_mm);
 	WARN_ON_ONCE(mm =3D=3D current->mm);
 	WARN_ON_ONCE(mm =3D=3D current->active_mm);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ca5db40392d4..4d615e0be9e0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3308,7 +3308,7 @@ static struct rq *finish_task_switch(struct task_stru=
ct *prev)
 	 */
 	if (mm) {
 		membarrier_mm_sync_core_before_usermode(mm);
-		mmdrop(mm);
+		mmdrop_lazy_tlb_smp_mb(mm);
 	}
 	if (unlikely(prev_state =3D=3D TASK_DEAD)) {
 		if (prev->sched_class->task_dead)
@@ -3413,9 +3413,9 @@ context_switch(struct rq *rq, struct task_struct *pre=
v,
=20
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
@@ -3423,7 +3423,7 @@ context_switch(struct rq *rq, struct task_struct *pre=
v,
=20
 		next->active_mm =3D prev->active_mm;
 		if (prev->mm)                           // from user
-			mmgrab(prev->active_mm);
+			mmgrab_lazy_tlb(prev->active_mm);
 		else
 			prev->active_mm =3D NULL;
 	} else {                                        // to user
@@ -3439,7 +3439,7 @@ context_switch(struct rq *rq, struct task_struct *pre=
v,
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
=20
 		if (!prev->mm) {                        // from kernel
-			/* will mmdrop() in finish_task_switch(). */
+			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
 			rq->prev_mm =3D prev->active_mm;
 			prev->active_mm =3D NULL;
 		}
