Return-Path: <linuxppc-dev+bounces-2766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0CA9B9AE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 23:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgGC245tJz300M;
	Sat,  2 Nov 2024 09:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730497762;
	cv=none; b=LsLB5OSYvluKNzsMMMrGSQDkel9bjPY2L45rqUtV30gk9E0XcIIAIP752XF3eN607r3X6BaJ7k/mOhfvlP2ZWG9Osse0rGvdpIwxc8S8F6a9Do/zsVjaLzGTGtEvpNEHJKcRitETVE/9DSbjuNkf1TXIDwxlTa5KEY7e4EmQwcY11J9VhSyBzzbbbbmKyEJXQnZPEAqwQqu5NV1qXXXWkAdwkm49tgJ975nzAH6bJEgARDT9bYCE2ux3o8bFaUF/oxsOyG4+gAkRlLfORzeCQa5szla7YDQkMa9ZzpdICbIRAUlJrUpwrpaasBOxppVXnL2lHoIjWiOO9/OKZcK+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730497762; c=relaxed/relaxed;
	bh=PUoCs1r+x1Oq6GxS6Ct3AhaTO7U6watKZI+tJWSNU4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fOP6AzvfBG5FBfkwcD6YKF+YL+8Ox9U41hZwA79sKeRqtNdEUXPJ4SsFLBuQdLVkxy3S97D7cExZtskP06wvFco9CbP7nfdDPQzcGE1GwEAAFOLJaZAxe7SQ6G+OfKCO2rAnS8mfVbBvcetXUvOFz9il0cZfVZo7C/pOXzIIfueb0gc29ZZbdqKEdJUlCZCUuNLtuxQ//t4XzJiDd5Rq9QNrKGWaEXLETn9OF0BkkJP/s1A2uO8wOOZKiUmrXFK+PbNI1OcrDvYqcSO0doPVAZCoWyF2j/Ou33mskaklbZP+ueAIixFmO2llo43p396cK0YhuCb1e7DUuBOd8BVuww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iI64aOCo; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iI64aOCo; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=herton@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iI64aOCo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iI64aOCo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=herton@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgDz56BYGz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 08:49:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730497753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PUoCs1r+x1Oq6GxS6Ct3AhaTO7U6watKZI+tJWSNU4M=;
	b=iI64aOCoNb+6KISyRKnjnkKN1WauNPAqeN2EVRZ5Pt1bAQhYHoGJbZJvBVOrzxv/EDOUQM
	5PeYqpEZPggfL+ZjpmkzcS3G1gNOs/UyaNokAe4qkIjoDSn8s58tVpjq2DJahqilKQbIYc
	ZAvA3WyQmOMnfbkEgDszRMJF9Af6IsM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730497753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PUoCs1r+x1Oq6GxS6Ct3AhaTO7U6watKZI+tJWSNU4M=;
	b=iI64aOCoNb+6KISyRKnjnkKN1WauNPAqeN2EVRZ5Pt1bAQhYHoGJbZJvBVOrzxv/EDOUQM
	5PeYqpEZPggfL+ZjpmkzcS3G1gNOs/UyaNokAe4qkIjoDSn8s58tVpjq2DJahqilKQbIYc
	ZAvA3WyQmOMnfbkEgDszRMJF9Af6IsM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-jUjfIl1IN1CS8mG-xfmPLQ-1; Fri,
 01 Nov 2024 17:49:10 -0400
X-MC-Unique: jUjfIl1IN1CS8mG-xfmPLQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 572D919560AB;
	Fri,  1 Nov 2024 21:49:07 +0000 (UTC)
Received: from redhat.com (unknown [10.96.134.12])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3DBD41956086;
	Fri,  1 Nov 2024 21:49:05 +0000 (UTC)
From: "Herton R. Krzesinski" <herton@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org
Subject: [PATCH] lazy tlb: fix hotplug exit race with MMU_LAZY_TLB_SHOOTDOWN
Date: Fri,  1 Nov 2024 18:49:04 -0300
Message-ID: <20241101214904.3178140-1-herton@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Nicholas Piggin <npiggin@gmail.com>

CPU unplug first calls __cpu_disable(), and that's where powerpc calls
cleanup_cpu_mmu_context(), which clears this CPU from mm_cpumask() of all
mms in the system.

However this CPU may still be using a lazy tlb mm, and its mm_cpumask bit
will be cleared from it.  The CPU does not switch away from the lazy tlb
mm until arch_cpu_idle_dead() calls idle_task_exit().

If that user mm exits in this window, it will not be subject to the lazy
tlb mm shootdown and may be freed while in use as a lazy mm by the CPU
that is being unplugged.

cleanup_cpu_mmu_context() could be moved later, but it looks better to
move the lazy tlb mm switching earlier.  The problem with doing the lazy
mm switching in idle_task_exit() is explained in commit bf2c59fce4074
("sched/core: Fix illegal RCU from offline CPUs"), which added a wart to
switch away from the mm but leave it set in active_mm to be cleaned up
later.

So instead, switch away from the lazy tlb mm at sched_cpu_wait_empty(),
which is the last hotplug state before teardown (CPUHP_AP_SCHED_WAIT_EMPTY).
This CPU will never switch to a user thread from this point, so it has no
chance to pick up a new lazy tlb mm.  This removes the lazy tlb mm handling
wart in CPU unplug.

With this, idle_task_exit() is not needed anymore and can be cleaned up.
This leaves the prototype alone, to be cleaned after this change.

herton: took the suggestions from https://lore.kernel.org/all/87jzvyprsw.ffs@tglx/
and made adjustments on the initial patch proposed by Nicholas.

Link: https://lkml.kernel.org/r/20230524060455.147699-1-npiggin@gmail.com
Link: https://lore.kernel.org/all/20230525205253.E2FAEC433EF@smtp.kernel.org/
Fixes: 2655421ae69fa ("lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling scheme")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Herton R. Krzesinski <herton@redhat.com>
---
 include/linux/sched/hotplug.h |  4 ----
 kernel/cpu.c                  | 11 ++++++-----
 kernel/sched/core.c           | 26 +++++++++++++++++++-------
 3 files changed, 25 insertions(+), 16 deletions(-)

Herton: I contacted Nicholas by email, he was ok with me going ahead
and posting this, I saw the original patch was stalled/didn't went forward. Thus 
I'm posting this but keeping his From/authorship, since he is original
author of the patch, so we can have this moving forward. I have a report
and also reproduced the warning similar to the one reported at
https://github.com/linuxppc/issues/issues/469 - which can be triggered
doing cpu offline/online loop with CONFIG_DEBUG_VM enabled. This patch fixes
the problem. I updated the changelog/patch based on the suggestions given and to
the best of my knowledge/investigation on this issue, thorough review is
appreciated.

If this is ok then I can submit a followup for this to cleanup idle_task_exit().

diff --git a/include/linux/sched/hotplug.h b/include/linux/sched/hotplug.h
index 412cdaba33eb..17e04859b9a4 100644
--- a/include/linux/sched/hotplug.h
+++ b/include/linux/sched/hotplug.h
@@ -18,10 +18,6 @@ extern int sched_cpu_dying(unsigned int cpu);
 # define sched_cpu_dying	NULL
 #endif
 
-#ifdef CONFIG_HOTPLUG_CPU
-extern void idle_task_exit(void);
-#else
 static inline void idle_task_exit(void) {}
-#endif
 
 #endif /* _LINUX_SCHED_HOTPLUG_H */
diff --git a/kernel/cpu.c b/kernel/cpu.c
index d293d52a3e00..fb4f46885cb2 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -904,13 +904,14 @@ static int finish_cpu(unsigned int cpu)
 	struct task_struct *idle = idle_thread_get(cpu);
 	struct mm_struct *mm = idle->active_mm;
 
-	/*
-	 * idle_task_exit() will have switched to &init_mm, now
-	 * clean up any remaining active_mm state.
+	/* 
+	 * sched_force_init_mm() ensured the use of &init_mm,
+	 * drop that refcount now that the CPU has stopped.
 	 */
-	if (mm != &init_mm)
-		idle->active_mm = &init_mm;
+	WARN_ON(mm != &init_mm);
+	idle->active_mm = NULL;
 	mmdrop_lazy_tlb(mm);
+
 	return 0;
 }
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dbfb5717d6af..8a51acd6d650 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7826,19 +7826,26 @@ void sched_setnuma(struct task_struct *p, int nid)
 
 #ifdef CONFIG_HOTPLUG_CPU
 /*
- * Ensure that the idle task is using init_mm right before its CPU goes
- * offline.
+ * Invoked on the outgoing CPU in context of the CPU hotplug thread
+ * after ensuring that there are no user space tasks left on the CPU.
+ *
+ * If there is a lazy mm in use on the hotplug thread, drop it and
+ * switch to init_mm.
+ *
+ * The reference count on init_mm is dropped in finish_cpu().
  */
-void idle_task_exit(void)
+static void sched_force_init_mm(void)
 {
 	struct mm_struct *mm = current->active_mm;
 
-	BUG_ON(cpu_online(smp_processor_id()));
-	BUG_ON(current != this_rq()->idle);
-
 	if (mm != &init_mm) {
-		switch_mm(mm, &init_mm, current);
+		mmgrab_lazy_tlb(&init_mm);
+		local_irq_disable();
+		current->active_mm = &init_mm;
+		switch_mm_irqs_off(mm, &init_mm, current);
+		local_irq_enable();
 		finish_arch_post_lock_switch();
+		mmdrop_lazy_tlb(mm);
 	}
 
 	/* finish_cpu(), as ran on the BP, will clean up the active_mm state */
@@ -7972,6 +7979,10 @@ static void balance_hotplug_wait(void)
 
 #else
 
+static void sched_force_init_mm(void)
+{
+}
+
 static inline void balance_push(struct rq *rq)
 {
 }
@@ -8240,6 +8251,7 @@ int sched_cpu_starting(unsigned int cpu)
 int sched_cpu_wait_empty(unsigned int cpu)
 {
 	balance_hotplug_wait();
+	sched_force_init_mm();
 	return 0;
 }
 
-- 
2.46.2


