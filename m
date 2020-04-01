Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098319B7FB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:56:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0QD0mqJzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=s8lq9KtN; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t04d3LRHzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:41:04 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id c145so1738534qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0RdWMZB6RJn98FXdUSZnSjFG7Se9Mrq9epKZxJ4TlZU=;
 b=s8lq9KtNGitOmED9ThaQGTb5+/x0rpr3TJKyVHk/V41WssZvfEWTggpVH2Qs+oUCXQ
 3zhK1WERFaKh2wtJ8usMb18qkenhhMbR6eEUemwBPcyrjYt0sJ5KDo1VpH86xwfB7zid
 ugcuvNqf8khkGAEZ0WtHEHdhh0tN07ePRggoKzQa3bocnLkfVVfGKEt3fFN6lOSej2IT
 cIpt8G9f9DnV5fLPC5Ctvsc0/ghdGF018LKW6vNrTQALlHX5wZ6O+/E7rzWH7OIQ66w5
 /isdkpjq0WzlYNkOrWlcADEiGMujKBbHE+ByHfdaRm18AxBexuz/yBeUoOD1kdzWMDW9
 vabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0RdWMZB6RJn98FXdUSZnSjFG7Se9Mrq9epKZxJ4TlZU=;
 b=Uy3glt1TlnXH0UZPkrf8GFS0xdLgPKrWERNcEE1iKZFhJ6mvFRJFYNjnJnUacPd5nk
 +y90RemuXdKsynkYn5S8KG96iC5fvQtFLYXPrpsaLaHERelDpShw/fMpkRQbOhxfXq0J
 A9B6uFTLoiGssiQT7UzCbqK62ts1u80J9AFps/iFItMs/ABshtSxqruYJrG11XjIZxjj
 5sFeuUbI4C5TWKzh9XB6VuOTRMxAdB4NCwYSOo2THTPEa8AShPWqkCELzhI8H/HUVM3B
 rjc93Ryco9lzJGlA6o17HGNmxrNY5B3pKO9ddfHfvndbXJ96b6naN7kjKx9Rm5/e0JSZ
 YiTA==
X-Gm-Message-State: AGi0PuYLlaGHeIsyHkLsVI4+yepfGX4e8HFPXLxAP9lohDMNkU3AH618
 NkpaymWQPpjrvErph9CQoVGw1Q==
X-Google-Smtp-Source: APiQypIxrxO6hwyk+9NdzKlR3uKKCXFELr9z5SQnOCvSSKC8X1SAAg+Q+tEpT2bf897wOLX9h+OxAg==
X-Received: by 2002:a37:87c7:: with SMTP id j190mr434836qkd.66.1585777261160; 
 Wed, 01 Apr 2020 14:41:01 -0700 (PDT)
Received: from ovpn-113-105.phx2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id s56sm2456990qtk.9.2020.04.01.14.40.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2020 14:41:00 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: peterz@infradead.org,
	mingo@redhat.com
Subject: [PATCH v2] sched/core: fix illegal RCU from offline CPUs
Date: Wed,  1 Apr 2020 17:40:33 -0400
Message-Id: <20200401214033.8448-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
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
Cc: juri.lelli@redhat.com, James.Bottomley@HansenPartnership.com,
 vincent.guittot@linaro.org, linux-parisc@vger.kernel.org, paulmck@kernel.org,
 deller@gmx.de, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 bsegall@google.com, linux-mm@kvack.org, Qian Cai <cai@lca.pw>, mgorman@suse.de,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

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

<Peter to sign off here>
Signed-off-by: Qian Cai <cai@lca.pw>
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
index a2694ba82874..8787958339d5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6200,13 +6200,14 @@ void idle_task_exit(void)
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
2.21.0 (Apple Git-122.2)

