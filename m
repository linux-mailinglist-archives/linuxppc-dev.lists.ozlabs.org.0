Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E501F2308
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 01:12:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gpvD0XS7zDq6J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:12:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ScuVlswD; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gpq73BV6zDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 09:09:23 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B3FF208C3;
 Mon,  8 Jun 2020 23:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657760;
 bh=x0MXilqjWFoGf1w3AwECfY3U95b1XL8ugjDvAzAarPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ScuVlswDwbZXNFWxcfqguRUqLjW52cU7lAWYb5/tb6UyPhqf+oUjH2sHjfsAUsXy5
 e1X+Uh4x0KUvEH29vKjpWRQ32YlkCj7G/9F+F+4pv0rVQUyW5VUeh81HLhloZDQ6Gj
 ut7YdfMOgh2cOD/v9yxGvRAQycr45LArQkXF8KCI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 145/274] sched/core: Fix illegal RCU from offline
 CPUs
Date: Mon,  8 Jun 2020 19:03:58 -0400
Message-Id: <20200608230607.3361041-145-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
 linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

[ Upstream commit bf2c59fce4074e55d622089b34be3a6bc95484fb ]

In the CPU-offline process, it calls mmdrop() after idle entry and the
subsequent call to cpuhp_report_idle_dead(). Once execution passes the
call to rcu_report_dead(), RCU is ignoring the CPU, which results in
lockdep complaining when mmdrop() uses RCU from either memcg or
debugobjects below.

Fix it by cleaning up the active_mm state from BP instead. Every arch
which has CONFIG_HOTPLUG_CPU should have already called idle_task_exit()
from AP. The only exception is parisc because it switches them to
&init_mm unconditionally (see smp_boot_one_cpu() and smp_cpu_init()),
but the patch will still work there because it calls mmgrab(&init_mm) in
smp_cpu_init() and then should call mmdrop(&init_mm) in finish_cpu().

  WARNING: suspicious RCU usage
  -----------------------------
  kernel/workqueue.c:710 RCU or wq_pool_mutex should be held!

  other info that might help us debug this:

  RCU used illegally from offline CPU!
  Call Trace:
   dump_stack+0xf4/0x164 (unreliable)
   lockdep_rcu_suspicious+0x140/0x164
   get_work_pool+0x110/0x150
   __queue_work+0x1bc/0xca0
   queue_work_on+0x114/0x120
   css_release+0x9c/0xc0
   percpu_ref_put_many+0x204/0x230
   free_pcp_prepare+0x264/0x570
   free_unref_page+0x38/0xf0
   __mmdrop+0x21c/0x2c0
   idle_task_exit+0x170/0x1b0
   pnv_smp_cpu_kill_self+0x38/0x2e0
   cpu_die+0x48/0x64
   arch_cpu_idle_dead+0x30/0x50
   do_idle+0x2f4/0x470
   cpu_startup_entry+0x38/0x40
   start_secondary+0x7a8/0xa80
   start_secondary_resume+0x10/0x14

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Qian Cai <cai@lca.pw>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Link: https://lkml.kernel.org/r/20200401214033.8448-1-cai@lca.pw
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/smp.c |  1 -
 include/linux/sched/mm.h             |  2 ++
 kernel/cpu.c                         | 18 +++++++++++++++++-
 kernel/sched/core.c                  |  5 +++--
 4 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 13e251699346..b2ba3e95bda7 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -167,7 +167,6 @@ static void pnv_smp_cpu_kill_self(void)
 	/* Standard hot unplug procedure */
 
 	idle_task_exit();
-	current->active_mm = NULL; /* for sanity */
 	cpu = smp_processor_id();
 	DBG("CPU%d offline\n", cpu);
 	generic_set_cpu_dead(cpu);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index c49257a3b510..a132d875d351 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -49,6 +49,8 @@ static inline void mmdrop(struct mm_struct *mm)
 		__mmdrop(mm);
 }
 
+void mmdrop(struct mm_struct *mm);
+
 /*
  * This has to be called after a get_task_mm()/mmget_not_zero()
  * followed by taking the mmap_sem for writing before modifying the
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2371292f30b0..244d30544377 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3,6 +3,7 @@
  *
  * This code is licenced under the GPL.
  */
+#include <linux/sched/mm.h>
 #include <linux/proc_fs.h>
 #include <linux/smp.h>
 #include <linux/init.h>
@@ -564,6 +565,21 @@ static int bringup_cpu(unsigned int cpu)
 	return bringup_wait_for_ap(cpu);
 }
 
+static int finish_cpu(unsigned int cpu)
+{
+	struct task_struct *idle = idle_thread_get(cpu);
+	struct mm_struct *mm = idle->active_mm;
+
+	/*
+	 * idle_task_exit() will have switched to &init_mm, now
+	 * clean up any remaining active_mm state.
+	 */
+	if (mm != &init_mm)
+		idle->active_mm = &init_mm;
+	mmdrop(mm);
+	return 0;
+}
+
 /*
  * Hotplug state machine related functions
  */
@@ -1549,7 +1565,7 @@ static struct cpuhp_step cpuhp_hp_states[] = {
 	[CPUHP_BRINGUP_CPU] = {
 		.name			= "cpu:bringup",
 		.startup.single		= bringup_cpu,
-		.teardown.single	= NULL,
+		.teardown.single	= finish_cpu,
 		.cant_stop		= true,
 	},
 	/* Final state before CPU kills itself */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9a2fbf98fd6f..0bbf387d0f19 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6190,13 +6190,14 @@ void idle_task_exit(void)
 	struct mm_struct *mm = current->active_mm;
 
 	BUG_ON(cpu_online(smp_processor_id()));
+	BUG_ON(current != this_rq()->idle);
 
 	if (mm != &init_mm) {
 		switch_mm(mm, &init_mm, current);
-		current->active_mm = &init_mm;
 		finish_arch_post_lock_switch();
 	}
-	mmdrop(mm);
+
+	/* finish_cpu(), as ran on the BP, will clean up the active_mm state */
 }
 
 /*
-- 
2.25.1

