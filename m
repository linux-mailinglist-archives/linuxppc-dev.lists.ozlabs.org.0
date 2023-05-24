Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02D70ED95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR10k0s2Pz3fCP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XZsStjLC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XZsStjLC;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR0yx50D5z2xkm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:05:13 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d5b4c3ffeso362944b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908311; x=1687500311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNLXI/ZXaW5BbdyJvbyW+B6lruy4aiQp89HdExaBNqE=;
        b=XZsStjLCv18FM2g7O3gXy/8cWdYtOMZq5OMcEmXO8qgBTvKakpexXgr6gxA973G4a9
         ULcQPjBmdUtrgKCKx8Nnm+RYUVrUyFoqIMf7qOjcC0OAc6puDsd6I5yosXHIpOhFPfNS
         GS8UlLWA5yPc2pAzipi8vy1aBvVq8raTYwBMy7y8BeCPni/J5UsCM2os9B0DyFh0hYts
         cssUlCXS9k8JiV0husJODnB0hbUS/mkq6MNQ8K5MvipAa7Pn1cXTURPGRUBbxUqLGojr
         AWfnlSvRXfQvNucyl3Oe66sXszCd3uqR8kRLBhTJsab/b2kMzLp3rtpFeb0QCwW0xQik
         q7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908311; x=1687500311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNLXI/ZXaW5BbdyJvbyW+B6lruy4aiQp89HdExaBNqE=;
        b=CtV1Opq91hxsZ0CNm69zCtTpu3JZIac02RmA7HnCc9GE8qXlazjTM7VNdNAMeN3W/r
         N+MoJGFREHeE1urNtrBec9lhHv/3GbTozgi57Ga01EYW32qa/wY8Fn32XSJVSBjXCmGW
         Je29Iy2hONC0wNeFvuQ5WA8sVAoWuxA9hVI7X8oE7g+YDWyKxohXI1R2inlbY9NkmSlR
         S/OJP9RQlDc6NRwVO+jjO97i+hlaBJ7JpuvtpfcoKjY7VXthDp7ut+rhXP1DNXGNTIEx
         qm/pZRGY8VwBZlHd4FFOwBAfB3f4w+d1bTUfErFN21vqtVeWMLDuT/rbGWv0oUC7Xsv0
         2zAA==
X-Gm-Message-State: AC+VfDyd5PRSHMtrhsBWi3Tnn5FWPU1eCctULdUkls14gI5HjieBsebc
	18yqME4YqpbdoWCJOjh7RkY=
X-Google-Smtp-Source: ACHHUZ4irL3h3o0BuihBytIxkgP7P3dYhPfYa99TuQfqazLCyVb5fcQLFaIev+2r8sVmMIute6392A==
X-Received: by 2002:a05:6a00:2287:b0:63b:19e5:a9ec with SMTP id f7-20020a056a00228700b0063b19e5a9ecmr2053192pfe.33.1684908310708;
        Tue, 23 May 2023 23:05:10 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id k25-20020aa792d9000000b00646e7d2b5a7sm6678426pfa.112.2023.05.23.23.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:05:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] lazy tlb: consolidate lazy tlb mm switching
Date: Wed, 24 May 2023 16:04:55 +1000
Message-Id: <20230524060455.147699-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524060455.147699-1-npiggin@gmail.com>
References: <20230524060455.147699-1-npiggin@gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switching a kernel thread using a "lazy tlb mm" to init_mm is a
relatively common sequence that is not quite trivial. Consolidate this
into a function.

This fixes a bug in do_shoot_lazy_tlb() for any arch that implements
finish_arch_post_lock_switch(). None select MMU_LAZY_TLB_SHOOTDOWN at
the moment.

Fixes: 2655421ae69fa ("lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling scheme")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c |  6 +----
 include/linux/sched/task.h           |  2 ++
 kernel/fork.c                        |  7 ++----
 kernel/sched/core.c                  | 34 ++++++++++++++++++++--------
 4 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index ce804b7bf84e..90953cf9f648 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -795,12 +795,8 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 		goto out;
 
 	if (current->active_mm == mm) {
-		WARN_ON_ONCE(current->mm != NULL);
 		/* Is a kernel thread and is using mm as the lazy tlb */
-		mmgrab_lazy_tlb(&init_mm);
-		current->active_mm = &init_mm;
-		switch_mm_irqs_off(mm, &init_mm, current);
-		mmdrop_lazy_tlb(mm);
+		kthread_end_lazy_tlb_mm();
 	}
 
 	/*
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 537cbf9a2ade..23693b94a09b 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -61,6 +61,8 @@ extern int lockdep_tasklist_lock_is_held(void);
 extern asmlinkage void schedule_tail(struct task_struct *prev);
 extern void init_idle(struct task_struct *idle, int cpu);
 
+extern void kthread_end_lazy_tlb_mm(void);
+
 extern int sched_fork(unsigned long clone_flags, struct task_struct *p);
 extern void sched_cgroup_fork(struct task_struct *p, struct kernel_clone_args *kargs);
 extern void sched_post_fork(struct task_struct *p);
diff --git a/kernel/fork.c b/kernel/fork.c
index ed4e01daccaa..8b005c2c7c3c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -854,11 +854,8 @@ static void do_shoot_lazy_tlb(void *arg)
 {
 	struct mm_struct *mm = arg;
 
-	if (current->active_mm == mm) {
-		WARN_ON_ONCE(current->mm);
-		current->active_mm = &init_mm;
-		switch_mm(mm, &init_mm, current);
-	}
+	if (current->active_mm == mm)
+		kthread_end_lazy_tlb_mm();
 }
 
 static void cleanup_lazy_tlbs(struct mm_struct *mm)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index bc4ef1f3394b..71706df22b41 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5346,6 +5346,29 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	return finish_task_switch(prev);
 }
 
+/*
+ * If this kthread has a user process's mm for its active_mm (aka lazy tlb mm)
+ * then switch away from it, to init_mm. Must not be called while using an
+ * mm with kthread_use_mm().
+ */
+void kthread_end_lazy_tlb_mm(void)
+{
+	struct mm_struct *mm = current->active_mm;
+
+	WARN_ON_ONCE(!irqs_disabled());
+
+	if (WARN_ON_ONCE(current->mm))
+		return; /* Not a kthread or doing kthread_use_mm */
+
+	if (mm != &init_mm) {
+		mmgrab_lazy_tlb(&init_mm);
+		current->active_mm = &init_mm;
+		switch_mm_irqs_off(mm, &init_mm, current);
+		finish_arch_post_lock_switch();
+		mmdrop_lazy_tlb(mm);
+	}
+}
+
 /*
  * nr_running and nr_context_switches:
  *
@@ -9375,17 +9398,8 @@ void sched_setnuma(struct task_struct *p, int nid)
  */
 void idle_task_prepare_exit(void)
 {
-	struct mm_struct *mm = current->active_mm;
-
 	WARN_ON(!irqs_disabled());
-
-	if (mm != &init_mm) {
-		mmgrab_lazy_tlb(&init_mm);
-		current->active_mm = &init_mm;
-		switch_mm_irqs_off(mm, &init_mm, current);
-		finish_arch_post_lock_switch();
-		mmdrop_lazy_tlb(mm);
-	}
+	kthread_end_lazy_tlb_mm();
 	/* finish_cpu() will mmdrop the init_mm ref after this CPU stops */
 }
 
-- 
2.40.1

