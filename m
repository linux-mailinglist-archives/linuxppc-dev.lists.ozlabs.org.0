Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6455321ACE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 04:09:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2xLX3ByfzDrHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 12:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VdbXxslE; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2x4t0N2czDr4R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 11:57:34 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id x8so1589054plm.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 18:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r3T2qDIJBRF7db837UpeGXiEJ21sH+EdceuIiNA/ntY=;
 b=VdbXxslEKwgSTBFhB0flLEIm8JG6qFiJq08UUQI+IEUIR6XakM5E7x329H8nKpzRIS
 k2l/8T1Y2gnFL4xryZLuuDoAVEDnQ0RiFduaS8KpQ0+vKFIEmXcjy30kyZtHC9ZZFL6U
 zl3ULuN8r/SqvAV1RGq1Ur1gk/GWMxQM4ciFhZRwcyJlxOdsJ1sMVQK31bykWIc8ENQA
 4u0+Q2mOD1Lq2yDEzXzkbnrn0odk6FKAFEBIySAD/3Wz3SJZ3OhFBnVPBfM5BvZ8Lmd0
 McV0TehMM0Hld7pUfN7AnRHutVDtv6BLSKPr7sVrsbh5OAZysL1vUPFohrXLXRGbqCNq
 AMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3T2qDIJBRF7db837UpeGXiEJ21sH+EdceuIiNA/ntY=;
 b=cbEbVw781llh7L28O530zlQNRGT9C0DhfPrA/ft/fUFgwiY3d2keOXSGWWCaYy09VB
 vjQ+cwquS2Em0dzo7OHYd8uPpjmIDDJXo01u5BzhBcHvJpjaR7dnyWvhO3ruloNPd0er
 IZD09HMtS9E6lA5jViMJ5ZNHECHLk+Nv200Vddfd0Xuu6YV4BjNbPObHwbTGfcfUYm4M
 tOKh+JYQBPwj7GSWWh2BDZwT++wTLmHeVOGJ2L3wE1f0Y/UT7AgGpnMeF9OTUC38UqwW
 +1jITla/UXeWMQyMICKv/BAxwH93QYYXSDFtYs3uGFMHyz9G47ZqOvrjTp0YAsBytShn
 oyDQ==
X-Gm-Message-State: AOAM532/nrf+MpvDsblB32m7jTAVeOerPdWhXdFx1qFnS+q8gQ1+vxHz
 MYgYlA+/iWC2funNZRT55Ww=
X-Google-Smtp-Source: ABdhPJyJnvcOSj8f0eErnh4Nc7C/8jUSd3vab/TG0F2X973u875kSeE0uCqdm6s+HyFNPPn5Ydm8Fw==
X-Received: by 2002:a17:902:7b92:: with SMTP id
 w18mr46750453pll.258.1594346251490; 
 Thu, 09 Jul 2020 18:57:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-245-19-62.static.tpgi.com.au.
 [220.245.19.62])
 by smtp.gmail.com with ESMTPSA id 7sm3912834pgw.85.2020.07.09.18.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 18:57:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Subject: [RFC PATCH 5/7] lazy tlb: introduce lazy mm refcount helper functions
Date: Fri, 10 Jul 2020 11:56:44 +1000
Message-Id: <20200710015646.2020871-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200710015646.2020871-1-npiggin@gmail.com>
References: <20200710015646.2020871-1-npiggin@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add explicit _lazy_tlb annotated functions for lazy mm refcounting.
This makes things a bit more explicit, and allows explicit refcounting
to be removed if it is not used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c |  4 ++--
 fs/exec.c                            |  2 +-
 include/linux/sched/mm.h             | 17 +++++++++++++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/kthread.c                     | 11 +++++++----
 kernel/sched/core.c                  | 13 +++++++------
 8 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 73199470c265..ad95812d2a3f 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1253,7 +1253,7 @@ void start_secondary(void *unused)
 	unsigned int cpu = smp_processor_id();
 	struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
 
-	mmgrab(&init_mm);
+	mmgrab(&init_mm); /* XXX: where is the mmput for this? */
 	current->active_mm = &init_mm;
 
 	smp_store_cpu_info(cpu);
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
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
 		current->active_mm = &init_mm;
-		mmdrop(mm);
+		mmdrop_lazy_tlb(mm);
 	}
 	_tlbiel_pid(pid, RIC_FLUSH_ALL);
 }
diff --git a/fs/exec.c b/fs/exec.c
index e2ab71e88293..3a01b2751ea9 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1119,7 +1119,7 @@ static int exec_mmap(struct mm_struct *mm)
 		mmput(old_mm);
 	} else {
 		exit_lazy_tlb(active_mm, tsk);
-		mmdrop(active_mm);
+		mmdrop_lazy_tlb(active_mm);
 	}
 	return 0;
 }
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 9b026264b445..110d4ad21de6 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -50,6 +50,23 @@ static inline void mmdrop(struct mm_struct *mm)
 
 void mmdrop(struct mm_struct *mm);
 
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
+static inline void mmdrop_lazy_tlb_smp_mb(struct mm_struct *mm)
+{
+	/* This depends on mmdrop providing a full smp_mb() */
+	mmdrop(mm);
+}
+
 /*
  * This has to be called after a get_task_mm()/mmget_not_zero()
  * followed by taking the mmap_lock for writing before modifying the
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 134688d79589..ff9fcbc4e76b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -578,7 +578,7 @@ static int finish_cpu(unsigned int cpu)
 	 */
 	if (mm != &init_mm)
 		idle->active_mm = &init_mm;
-	mmdrop(mm);
+	mmdrop_lazy_tlb(mm);
 	return 0;
 }
 
diff --git a/kernel/exit.c b/kernel/exit.c
index 727150f28103..d535da9fd2f8 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -470,7 +470,7 @@ static void exit_mm(void)
 		__set_current_state(TASK_RUNNING);
 		mmap_read_lock(mm);
 	}
-	mmgrab(mm);
+	mmgrab_lazy_tlb(mm);
 	BUG_ON(mm != current->active_mm);
 	/* more a memory barrier than a real lock */
 	task_lock(current);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 6f93c649aa97..a7133cc2ddaf 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1238,12 +1238,12 @@ void kthread_use_mm(struct mm_struct *mm)
 	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
 	WARN_ON_ONCE(tsk->mm);
 
+	mmgrab(mm);
+
 	task_lock(tsk);
 	active_mm = tsk->active_mm;
-	if (active_mm != mm) {
-		mmgrab(mm);
+	if (active_mm != mm)
 		tsk->active_mm = mm;
-	}
 	tsk->mm = mm;
 	switch_mm(active_mm, mm, tsk);
 	task_unlock(tsk);
@@ -1253,7 +1253,7 @@ void kthread_use_mm(struct mm_struct *mm)
 
 	exit_lazy_tlb(active_mm, tsk);
 	if (active_mm != mm)
-		mmdrop(active_mm);
+		mmdrop_lazy_tlb(active_mm);
 
 	to_kthread(tsk)->oldfs = get_fs();
 	set_fs(USER_DS);
@@ -1276,9 +1276,12 @@ void kthread_unuse_mm(struct mm_struct *mm)
 	task_lock(tsk);
 	sync_mm_rss(mm);
 	tsk->mm = NULL;
+	mmgrab_lazy_tlb(mm);
 	/* active_mm is still 'mm' */
 	enter_lazy_tlb(mm, tsk);
 	task_unlock(tsk);
+
+	mmdrop(mm);
 }
 EXPORT_SYMBOL_GPL(kthread_unuse_mm);
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 31e22c79826c..d19f2f517f6c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3302,10 +3302,11 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 * schedule between user->kernel->user threads without passing though
 	 * switch_mm(). Membarrier requires a full barrier after storing to
 	 * rq->curr, before returning to userspace, for
-	 * {PRIVATE,GLOBAL}_EXPEDITED. This is implicitly provided by mmdrop().
+	 * {PRIVATE,GLOBAL}_EXPEDITED. This is implicitly provided by
+	 * mmdrop_lazy_tlb_smp_mb().
 	 */
 	if (mm)
-		mmdrop(mm);
+		mmdrop_lazy_tlb_smp_mb(mm);
 
 	if (unlikely(prev_state == TASK_DEAD)) {
 		if (prev->sched_class->task_dead)
@@ -3410,9 +3411,9 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
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
@@ -3420,7 +3421,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
 		next->active_mm = prev->active_mm;
 		if (prev->mm)                           // from user
-			mmgrab(prev->active_mm);
+			mmgrab_lazy_tlb(prev->active_mm);
 		else
 			prev->active_mm = NULL;
 	} else {                                        // to user
@@ -3438,7 +3439,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 		if (!prev->mm) {                        // from kernel
 			exit_lazy_tlb(prev->active_mm, next);
 
-			/* will mmdrop() in finish_task_switch(). */
+			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
 			rq->prev_mm = prev->active_mm;
 			prev->active_mm = NULL;
 		}
-- 
2.23.0

