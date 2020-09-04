Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C825E435
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 01:33:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjvBB1XdhzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 09:33:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bjv2G18KfzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 09:26:29 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 94D8E2ACD5; Fri,  4 Sep 2020 19:26:27 -0400 (EDT)
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Message-Id: <bb61650bea4f4c91fb8e24b9a6f130a1438651a7.1599260540.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1599260540.git.fthain@telegraphics.com.au>
References: <cover.1599260540.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 2/5] powerpc/tau: Convert from timer to workqueue
Date: Sat, 05 Sep 2020 09:02:20 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 19dbdcb8039cf ("smp: Warn on function calls from softirq
context") the Thermal Assist Unit driver causes a warning like the
following when CONFIG_SMP is enabled.

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/smp.c:428 smp_call_function_many_cond+0xf4/0x38c
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-pmac #3
NIP:  c00b37a8 LR: c00b3abc CTR: c001218c
REGS: c0799c60 TRAP: 0700   Not tainted  (5.7.0-pmac)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 42000224  XER: 00000000

GPR00: c00b3abc c0799d18 c076e300 c079ef5c c0011fec 00000000 00000000 00000000
GPR08: 00000100 00000100 00008000 ffffffff 42000224 00000000 c079d040 c079d044
GPR16: 00000001 00000000 00000004 c0799da0 c079f054 c07a0000 c07a0000 00000000
GPR24: c0011fec 00000000 c079ef5c c079ef5c 00000000 00000000 00000000 00000000
NIP [c00b37a8] smp_call_function_many_cond+0xf4/0x38c
LR [c00b3abc] on_each_cpu+0x38/0x68
Call Trace:
[c0799d18] [ffffffff] 0xffffffff (unreliable)
[c0799d68] [c00b3abc] on_each_cpu+0x38/0x68
[c0799d88] [c0096704] call_timer_fn.isra.26+0x20/0x7c
[c0799d98] [c0096b40] run_timer_softirq+0x1d4/0x3fc
[c0799df8] [c05b4368] __do_softirq+0x118/0x240
[c0799e58] [c0039c44] irq_exit+0xc4/0xcc
[c0799e68] [c000ade8] timer_interrupt+0x1b0/0x230
[c0799ea8] [c0013520] ret_from_except+0x0/0x14
--- interrupt: 901 at arch_cpu_idle+0x24/0x6c
    LR = arch_cpu_idle+0x24/0x6c
[c0799f70] [00000001] 0x1 (unreliable)
[c0799f80] [c0060990] do_idle+0xd8/0x17c
[c0799fa0] [c0060ba8] cpu_startup_entry+0x24/0x28
[c0799fb0] [c072d220] start_kernel+0x434/0x44c
[c0799ff0] [00003860] 0x3860
Instruction dump:
8129f204 2f890000 40beff98 3d20c07a 8929eec4 2f890000 40beff88 0fe00000
81220000 552805de 550802ef 4182ff84 <0fe00000> 3860ffff 7f65db78 7f44d378
---[ end trace 34a886e47819c2eb ]---

Don't call on_each_cpu() from a timer callback, call it from a worker
thread instead.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/powerpc/kernel/tau_6xx.c | 38 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 976d5bc1b5176..268205cc347da 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -13,13 +13,14 @@
  */
 
 #include <linux/errno.h>
-#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/workqueue.h>
 
 #include <asm/io.h>
 #include <asm/reg.h>
@@ -39,8 +40,6 @@ static struct tau_temp
 	unsigned char grew;
 } tau[NR_CPUS];
 
-struct timer_list tau_timer;
-
 #undef DEBUG
 
 /* TODO: put these in a /proc interface, with some sanity checks, and maybe
@@ -50,7 +49,7 @@ struct timer_list tau_timer;
 #define step_size		2	/* step size when temp goes out of range */
 #define window_expand		1	/* expand the window by this much */
 /* configurable values for shrinking the window */
-#define shrink_timer	2*HZ	/* period between shrinking the window */
+#define shrink_timer	2000	/* period between shrinking the window */
 #define min_window	2	/* minimum window size, degrees C */
 
 static void set_thresholds(unsigned long cpu)
@@ -187,14 +186,18 @@ static void tau_timeout(void * info)
 	local_irq_restore(flags);
 }
 
-static void tau_timeout_smp(struct timer_list *unused)
-{
+static struct workqueue_struct *tau_workq;
 
-	/* schedule ourselves to be run again */
-	mod_timer(&tau_timer, jiffies + shrink_timer) ;
+static void tau_work_func(struct work_struct *work)
+{
+	msleep(shrink_timer);
 	on_each_cpu(tau_timeout, NULL, 0);
+	/* schedule ourselves to be run again */
+	queue_work(tau_workq, work);
 }
 
+DECLARE_WORK(tau_work, tau_work_func);
+
 /*
  * setup the TAU
  *
@@ -227,21 +230,16 @@ static int __init TAU_init(void)
 		return 1;
 	}
 
-
-	/* first, set up the window shrinking timer */
-	timer_setup(&tau_timer, tau_timeout_smp, 0);
-	tau_timer.expires = jiffies + shrink_timer;
-	add_timer(&tau_timer);
+	tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1, 0);
+	if (!tau_workq)
+		return -ENOMEM;
 
 	on_each_cpu(TAU_init_smp, NULL, 0);
 
-	printk("Thermal assist unit ");
-#ifdef CONFIG_TAU_INT
-	printk("using interrupts, ");
-#else
-	printk("using timers, ");
-#endif
-	printk("shrink_timer: %d jiffies\n", shrink_timer);
+	queue_work(tau_workq, &tau_work);
+
+	pr_info("Thermal assist unit using %s, shrink_timer: %d ms\n",
+		IS_ENABLED(CONFIG_TAU_INT) ? "interrupts" : "workqueue", shrink_timer);
 	tau_initialized = 1;
 
 	return 0;
-- 
2.26.2

