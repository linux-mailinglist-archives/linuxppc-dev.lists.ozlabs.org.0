Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88F70ED91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR0zq3Lwcz3f5l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JH7/tN5i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JH7/tN5i;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR0yt5MNvz2xkm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:05:09 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64d41763796so347771b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908307; x=1687500307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h76hRggjcOPyKeT4qZCjFVlxoGbcWZbH0agh7LoEb/E=;
        b=JH7/tN5i/taJtcD8ZS9eOTiUsqc6vwgZ46sg9LHPOr24Zz9ChJB9x+qCYyBvQRyVVY
         Mn/tE2JQvyTwNt2CAyr3fez7Hvmz3nrPPObxHmhJHy0NvrqHvXfnvBLXy1SzIGQAP+wq
         vPHwLxZknPrWwx68HVc94NrbyewdTYS8bI9qnvJYSxkNXAWFkZmGw9YQNxDOxpG6tj+Z
         3VSwVwlfI4Tl6nGMN3W/5Ii0UgFCoOMDGLMgx9v0UX2bJu5Njp+p9fdcp9MMK1NkIZ+6
         fnFJwImEtJb3jsaiRuBHltbDJRxZIdkiHMaI4+K+U8YJ5VWLypsYSM96y4sijvg1iz6h
         wGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908307; x=1687500307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h76hRggjcOPyKeT4qZCjFVlxoGbcWZbH0agh7LoEb/E=;
        b=Z2ccY+Z70aTnp/I9qjl0PwZpd6/ChXXcuyZXb7vKrB8Z+TW6coEvV3yyLuXJ32qaVV
         gKS35uXQRWflVTXURoXIlvUVyjSUJ26kI/mXeX57K65ARleoBdUqg/HFPpCS5liep6Ce
         Gg2moQwUCcc1GnJBhZ6H7brGuJiDjX4gF6b2QuTnIboLmpy+srUwl7VPlCyb8ringfbQ
         ElVTn2Bte+RmI99RcNc6yVuaPPf3FYqt3SfJnBBhqLLKRaK4trR1q6PGpR2jNvDWQxY+
         tHfoHYADKmH8dfDoNWw8ZRtCTKCKykISFnrhLXKaRVr6Ijg4nxjB1R6ghp44HCdGKsA5
         DX0A==
X-Gm-Message-State: AC+VfDxG1B9iOhjzytlnByNo1IQLfPBAa1eSFviCyDxLbYnfkni98kpo
	FhpSPnCCmSiY3wzpSjn9OGM=
X-Google-Smtp-Source: ACHHUZ5h8gmTlVFgyzOdv6CRG0hYaebOlspy3KPJgiMnmH+PNp/erWFdKQaV209RguXZ/VoWnFMI/Q==
X-Received: by 2002:a05:6a00:194e:b0:644:8172:3ea9 with SMTP id s14-20020a056a00194e00b0064481723ea9mr1898844pfk.15.1684908306855;
        Tue, 23 May 2023 23:05:06 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id k25-20020aa792d9000000b00646e7d2b5a7sm6678426pfa.112.2023.05.23.23.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:05:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] lazy tlb: fix hotplug exit race with MMU_LAZY_TLB_SHOOTDOWN
Date: Wed, 24 May 2023 16:04:54 +1000
Message-Id: <20230524060455.147699-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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

CPU unplug first calls __cpu_disable(), and that's where powerpc calls
cleanup_cpu_mmu_context(), which clears this CPU from mm_cpumask() of
all mms in the system.

However this CPU may still be using a lazy tlb mm, and its mm_cpumask
bit will be cleared from it. The CPU does not switch away from the lazy
tlb mm until arch_cpu_idle_dead() calls idle_task_exit().

If that user mm exits in this window, it will not be subject to the lazy
tlb mm shootdown and may be freed while in use as a lazy mm by the CPU
that is being unplugged.

cleanup_cpu_mmu_context() could be moved later, but it looks better to
move the lazy tlb mm switching earlier. The problem with doing the lazy
mm switching in idle_task_exit() is explained in commit bf2c59fce4074
("sched/core: Fix illegal RCU from offline CPUs"), which added a wart to
switch away from the mm but leave it set in active_mm to be cleaned up
later.

So instead, switch away from the lazy tlb mm on the stopper kthread
before the CPU is taken down. This CPU will never switch to a user
thread from this point, so it has no chance to pick up a new lazy tlb
mm. This removes the lazy tlb mm handling wart in CPU unplug.

idle_task_exit() remains to reduce churn in the patch. It could be
removed entirely after this because finish_cpu() makes a similar check.
finish_cpu() itself is not strictly needed because init_mm will never
have its refcount drop to zero.  But it is conceptually nicer to keep it
rather than have the idle thread drop the reference on the mm it is
using.

Fixes: 2655421ae69fa ("lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling scheme")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/sched/hotplug.h |  2 ++
 kernel/cpu.c                  | 11 +++++++----
 kernel/sched/core.c           | 24 +++++++++++++++++++-----
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/include/linux/sched/hotplug.h b/include/linux/sched/hotplug.h
index 412cdaba33eb..cb447d8e3f9a 100644
--- a/include/linux/sched/hotplug.h
+++ b/include/linux/sched/hotplug.h
@@ -19,8 +19,10 @@ extern int sched_cpu_dying(unsigned int cpu);
 #endif
 
 #ifdef CONFIG_HOTPLUG_CPU
+extern void idle_task_prepare_exit(void);
 extern void idle_task_exit(void);
 #else
+static inline void idle_task_prepare_exit(void) {}
 static inline void idle_task_exit(void) {}
 #endif
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index f4a2c5845bcb..584def27ff24 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -618,12 +618,13 @@ static int finish_cpu(unsigned int cpu)
 	struct mm_struct *mm = idle->active_mm;
 
 	/*
-	 * idle_task_exit() will have switched to &init_mm, now
-	 * clean up any remaining active_mm state.
+	 * idle_task_prepare_exit() ensured the idle task was using
+	 * &init_mm. Now that the CPU has stopped, drop that refcount.
 	 */
-	if (mm != &init_mm)
-		idle->active_mm = &init_mm;
+	WARN_ON(mm != &init_mm);
+	idle->active_mm = NULL;
 	mmdrop_lazy_tlb(mm);
+
 	return 0;
 }
 
@@ -1030,6 +1031,8 @@ static int take_cpu_down(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int err, cpu = smp_processor_id();
 
+	idle_task_prepare_exit();
+
 	/* Ensure this CPU doesn't handle any more interrupts. */
 	err = __cpu_disable();
 	if (err < 0)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a68d1276bab0..bc4ef1f3394b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9373,19 +9373,33 @@ void sched_setnuma(struct task_struct *p, int nid)
  * Ensure that the idle task is using init_mm right before its CPU goes
  * offline.
  */
-void idle_task_exit(void)
+void idle_task_prepare_exit(void)
 {
 	struct mm_struct *mm = current->active_mm;
 
-	BUG_ON(cpu_online(smp_processor_id()));
-	BUG_ON(current != this_rq()->idle);
+	WARN_ON(!irqs_disabled());
 
 	if (mm != &init_mm) {
-		switch_mm(mm, &init_mm, current);
+		mmgrab_lazy_tlb(&init_mm);
+		current->active_mm = &init_mm;
+		switch_mm_irqs_off(mm, &init_mm, current);
 		finish_arch_post_lock_switch();
+		mmdrop_lazy_tlb(mm);
 	}
+	/* finish_cpu() will mmdrop the init_mm ref after this CPU stops */
+}
+
+/*
+ * After the CPU is offline, double check that it was previously switched to
+ * init_mm. This call can be removed because the condition is caught in
+ * finish_cpu() as well.
+ */
+void idle_task_exit(void)
+{
+	BUG_ON(cpu_online(smp_processor_id()));
+	BUG_ON(current != this_rq()->idle);
 
-	/* finish_cpu(), as ran on the BP, will clean up the active_mm state */
+	WARN_ON_ONCE(current->active_mm != &init_mm);
 }
 
 static int __balance_push_cpu_stop(void *arg)
-- 
2.40.1

