Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390BB65FBA1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 07:53:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpDZ50sdhz3cB4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 17:53:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LLvX0NpZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LLvX0NpZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpDY40y6gz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jan 2023 17:52:23 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3063BjuL010905;
	Fri, 6 Jan 2023 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=mTWYLzuUbHLijNpNtMyLQ0G/2RnaPid/69soha3cqBE=;
 b=LLvX0NpZW1qpubaSQzCmVEA/AiI2zCG2rnjTvb9Z/v6QmWUQKfaNX3jYPYxzBVSg8GFQ
 o28oq6QozZoLzP6YDCh1DUHK/Vjsky4RDI7rIwbZKnnKtGGeuPGcgowiaTmnhozJX0N/
 J3jFrsAxdPw6VKIvRqw0qaVLbYipUKCmzERVtYpgOUfgQ0f6zonewqMxhmMf5EvBbMsR
 vm008Pn6cPddt7IULlI+l/riEGXkDtDbIS5OKyHjmlKf8GkIxhEZOoofngGDwG3hukKy
 w80ffdWR3GDl+q1RTPdzoq4+pJpNINXfftDp1yJY2PjYlKKiQbYFrNggAlickC+UqF9K Xw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mxbh5u8jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jan 2023 06:52:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30667X0s030029;
	Fri, 6 Jan 2023 06:52:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6furh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jan 2023 06:52:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3066qA2h45154566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Jan 2023 06:52:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76BE320043;
	Fri,  6 Jan 2023 06:52:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E231C20040;
	Fri,  6 Jan 2023 06:52:07 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.87.181])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Jan 2023 06:52:07 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/imc-pmu: Fix IMC PMU code of using mutex in IRQs disabled section
Date: Fri,  6 Jan 2023 12:21:57 +0530
Message-Id: <20230106065157.182648-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h2IqeMW6usIs4BbU0BHbrSuDKyNPWP5I
X-Proofpoint-ORIG-GUID: h2IqeMW6usIs4BbU0BHbrSuDKyNPWP5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_01,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060050
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current imc-pmu code triggers a WARNING with CONFIG_DEBUG_ATOMIC_SLEEP and
CONFIG_PROVE_LOCKING enabled, while running a thread_imc event.

Command to trigger the warning:
[command]# perf stat -e thread_imc/CPM_CS_FROM_L4_MEM_X_DPTEG/ sleep 5

 Performance counter stats for 'sleep 5':

                 0      thread_imc/CPM_CS_FROM_L4_MEM_X_DPTEG/                                   

       5.002117947 seconds time elapsed

       0.000131000 seconds user
       0.001063000 seconds sys

Below is snippet of the warning in dmesg:

[  196.520838] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
[  196.521126] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 2869, name: perf-exec
[  196.521136] preempt_count: 2, expected: 0
[  196.521143] 4 locks held by perf-exec/2869:
[  196.521151]  #0: c00000004325c540 (&sig->cred_guard_mutex){+.+.}-{3:3}, at: bprm_execve+0x64/0xa90
[  196.521173]  #1: c00000004325c5d8 (&sig->exec_update_lock){++++}-{3:3}, at: begin_new_exec+0x460/0xef0
[  196.521192]  #2: c0000003fa99d4e0 (&cpuctx_lock){-...}-{2:2}, at: perf_event_exec+0x290/0x510
[  196.521212]  #3: c000000017ab8418 (&ctx->lock){....}-{2:2}, at: perf_event_exec+0x29c/0x510
[  196.521230] irq event stamp: 4806
[  196.521237] hardirqs last  enabled at (4805): [<c000000000f65b94>] _raw_spin_unlock_irqrestore+0x94/0xd0
[  196.521248] hardirqs last disabled at (4806): [<c0000000003fae44>] perf_event_exec+0x394/0x510
[  196.521260] softirqs last  enabled at (0): [<c00000000013c404>] copy_process+0xc34/0x1ff0
[  196.521270] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  196.521281] CPU: 36 PID: 2869 Comm: perf-exec Not tainted 6.2.0-rc2-00011-g1247637727f2 #61
[  196.521291] Hardware name: 8375-42A POWER9 0x4e1202 opal:v7.0-16-g9b85f7d961 PowerNV
[  196.521300] Call Trace:
[  196.521306] [c00000004d213560] [c000000000f20c74] dump_stack_lvl+0x98/0xe0 (unreliable)
[  196.521321] [c00000004d2135a0] [c000000000194968] __might_resched+0x2f8/0x310
[  196.521332] [c00000004d213620] [c000000000f5a5dc] __mutex_lock+0x6c/0x13f0
[  196.521344] [c00000004d213740] [c000000000127a44] thread_imc_event_add+0xf4/0x1b0
[  196.521357] [c00000004d2137c0] [c0000000003ec930] event_sched_in+0xe0/0x210
[  196.521369] [c00000004d213810] [c0000000003ed940] merge_sched_in+0x1f0/0x600
[  196.521380] [c00000004d213860] [c0000000003ee00c] visit_groups_merge.isra.92.constprop.166+0x2bc/0x6c0
[  196.521393] [c00000004d213920] [c0000000003ee4dc] ctx_flexible_sched_in+0xcc/0x140
[  196.521405] [c00000004d213980] [c0000000003ee75c] ctx_sched_in+0x20c/0x2a0
[  196.521416] [c00000004d2139f0] [c0000000003ee974] ctx_resched+0x104/0x1c0
[  196.521427] [c00000004d213a50] [c0000000003fadf0] perf_event_exec+0x340/0x510
[  196.521440] [c00000004d213ac0] [c00000000054a570] begin_new_exec+0x730/0xef0
[  196.521451] [c00000004d213b70] [c0000000005dd7f8] load_elf_binary+0x3f8/0x1e10
-------
[  196.522551] do not call blocking ops when !TASK_RUNNING; state=2001 set at [<00000000fd63e7cf>] do_nanosleep+0x60/0x1a0
[  196.522566] WARNING: CPU: 36 PID: 2869 at kernel/sched/core.c:9912 __might_sleep+0x9c/0xb0
[  196.522575] Modules linked in: kvm_hv kvm vmx_crypto leds_powernv powernv_op_panel led_class gf128mul crc32c_vpmsum fuse autofs4
[  196.522594] CPU: 36 PID: 2869 Comm: sleep Tainted: G        W          6.2.0-rc2-00011-g1247637727f2 #61
[  196.522602] Hardware name: 8375-42A POWER9 0x4e1202 opal:v7.0-16-g9b85f7d961 PowerNV
[  196.522609] NIP:  c000000000194a1c LR: c000000000194a18 CTR: c000000000a78670
[  196.522616] REGS: c00000004d2134e0 TRAP: 0700   Tainted: G        W           (6.2.0-rc2-00011-g1247637727f2)
[  196.522624] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 48002824  XER: 00000000
[  196.522639] CFAR: c00000000013fb64 IRQMASK: 1 
[  196.522639] GPR00: c000000000194a18 c00000004d213780 c0000000013c1700 000000000000006b 
[  196.522639] GPR04: 00000000fffeffff c00000004d213540 c00000004d213538 0000000000000027 
-------

The above warning triggered because current imc-pmu code uses mutex lock in
interrupt disabled sections. The function mutex_lock internally calls
"__might_resched" function, which will check if irq is disabled or not and
incase irq is disabled, it will trigger the warning. Patch fix this issue
by changing the mutex lock to spinlock.

Fixes: 8f95faaac56c ("powerpc/powernv: Detect and create IMC device")
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/imc-pmu.h |   2 +-
 arch/powerpc/perf/imc-pmu.c        | 109 +++++++++++++++--------------
 2 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/include/asm/imc-pmu.h b/arch/powerpc/include/asm/imc-pmu.h
index 4f897993b710..699a88584ae1 100644
--- a/arch/powerpc/include/asm/imc-pmu.h
+++ b/arch/powerpc/include/asm/imc-pmu.h
@@ -137,7 +137,7 @@ struct imc_pmu {
  * are inited.
  */
 struct imc_pmu_ref {
-	struct mutex lock;
+	spinlock_t lock;
 	unsigned int id;
 	int refc;
 };
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index d517aba94d1b..39f5ae6ef76d 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -14,6 +14,7 @@
 #include <asm/cputhreads.h>
 #include <asm/smp.h>
 #include <linux/string.h>
+#include <linux/spinlock.h>
 
 /* Nest IMC data structures and variables */
 
@@ -21,7 +22,7 @@
  * Used to avoid races in counting the nest-pmu units during hotplug
  * register and unregister
  */
-static DEFINE_MUTEX(nest_init_lock);
+static DEFINE_SPINLOCK(nest_init_lock);
 static DEFINE_PER_CPU(struct imc_pmu_ref *, local_nest_imc_refc);
 static struct imc_pmu **per_nest_pmu_arr;
 static cpumask_t nest_imc_cpumask;
@@ -50,7 +51,7 @@ static int trace_imc_mem_size;
  * core and trace-imc
  */
 static struct imc_pmu_ref imc_global_refc = {
-	.lock = __MUTEX_INITIALIZER(imc_global_refc.lock),
+	.lock = __SPIN_LOCK_INITIALIZER(imc_global_refc.lock),
 	.id = 0,
 	.refc = 0,
 };
@@ -470,7 +471,7 @@ static void nest_imc_counters_release(struct perf_event *event)
 		return;
 
 	/* Take the mutex lock for this node and then decrement the reference count */
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	if (ref->refc == 0) {
 		/*
 		 * The scenario where this is true is, when perf session is
@@ -482,7 +483,7 @@ static void nest_imc_counters_release(struct perf_event *event)
 		 * an OPAL call to disable the engine in that node.
 		 *
 		 */
-		mutex_unlock(&ref->lock);
+		spin_unlock(&ref->lock);
 		return;
 	}
 	ref->refc--;
@@ -490,7 +491,7 @@ static void nest_imc_counters_release(struct perf_event *event)
 		rc = opal_imc_counters_stop(OPAL_IMC_COUNTERS_NEST,
 					    get_hard_smp_processor_id(event->cpu));
 		if (rc) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("nest-imc: Unable to stop the counters for core %d\n", node_id);
 			return;
 		}
@@ -498,7 +499,7 @@ static void nest_imc_counters_release(struct perf_event *event)
 		WARN(1, "nest-imc: Invalid event reference count\n");
 		ref->refc = 0;
 	}
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 }
 
 static int nest_imc_event_init(struct perf_event *event)
@@ -564,19 +565,19 @@ static int nest_imc_event_init(struct perf_event *event)
 	if (!ref)
 		return -EINVAL;
 
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	if (ref->refc == 0) {
 		rc = opal_imc_counters_start(OPAL_IMC_COUNTERS_NEST,
 					     get_hard_smp_processor_id(event->cpu));
 		if (rc) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("nest-imc: Unable to start the counters for node %d\n",
 									node_id);
 			return rc;
 		}
 	}
 	++ref->refc;
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 
 	event->destroy = nest_imc_counters_release;
 	return 0;
@@ -614,7 +615,7 @@ static int core_imc_mem_init(int cpu, int size)
 
 	/* Init the mutex */
 	core_imc_refc[core_id].id = core_id;
-	mutex_init(&core_imc_refc[core_id].lock);
+	spin_lock_init(&core_imc_refc[core_id].lock);
 
 	rc = opal_imc_counters_init(OPAL_IMC_COUNTERS_CORE,
 				__pa((void *)mem_info->vbase),
@@ -720,11 +721,11 @@ static int ppc_core_imc_cpu_offline(unsigned int cpu)
 		 * last cpu in this core and core-imc event running
 		 * in this cpu.
 		 */
-		mutex_lock(&imc_global_refc.lock);
+		spin_lock(&imc_global_refc.lock);
 		if (imc_global_refc.id == IMC_DOMAIN_CORE)
 			imc_global_refc.refc--;
 
-		mutex_unlock(&imc_global_refc.lock);
+		spin_unlock(&imc_global_refc.lock);
 	}
 	return 0;
 }
@@ -739,7 +740,7 @@ static int core_imc_pmu_cpumask_init(void)
 
 static void reset_global_refc(struct perf_event *event)
 {
-		mutex_lock(&imc_global_refc.lock);
+		spin_lock(&imc_global_refc.lock);
 		imc_global_refc.refc--;
 
 		/*
@@ -751,7 +752,7 @@ static void reset_global_refc(struct perf_event *event)
 			imc_global_refc.refc = 0;
 			imc_global_refc.id = 0;
 		}
-		mutex_unlock(&imc_global_refc.lock);
+		spin_unlock(&imc_global_refc.lock);
 }
 
 static void core_imc_counters_release(struct perf_event *event)
@@ -774,7 +775,7 @@ static void core_imc_counters_release(struct perf_event *event)
 	if (!ref)
 		return;
 
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	if (ref->refc == 0) {
 		/*
 		 * The scenario where this is true is, when perf session is
@@ -786,7 +787,7 @@ static void core_imc_counters_release(struct perf_event *event)
 		 * an OPAL call to disable the engine in that core.
 		 *
 		 */
-		mutex_unlock(&ref->lock);
+		spin_unlock(&ref->lock);
 		return;
 	}
 	ref->refc--;
@@ -794,7 +795,7 @@ static void core_imc_counters_release(struct perf_event *event)
 		rc = opal_imc_counters_stop(OPAL_IMC_COUNTERS_CORE,
 					    get_hard_smp_processor_id(event->cpu));
 		if (rc) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("IMC: Unable to stop the counters for core %d\n", core_id);
 			return;
 		}
@@ -802,7 +803,7 @@ static void core_imc_counters_release(struct perf_event *event)
 		WARN(1, "core-imc: Invalid event reference count\n");
 		ref->refc = 0;
 	}
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 
 	reset_global_refc(event);
 }
@@ -851,19 +852,19 @@ static int core_imc_event_init(struct perf_event *event)
 	 * If yes, take the mutex lock and enable the core counters.
 	 * If not, just increment the count in core_imc_refc struct.
 	 */
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	if (ref->refc == 0) {
 		rc = opal_imc_counters_start(OPAL_IMC_COUNTERS_CORE,
 					     get_hard_smp_processor_id(event->cpu));
 		if (rc) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("core-imc: Unable to start the counters for core %d\n",
 									core_id);
 			return rc;
 		}
 	}
 	++ref->refc;
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 
 	/*
 	 * Since the system can run either in accumulation or trace-mode
@@ -874,7 +875,7 @@ static int core_imc_event_init(struct perf_event *event)
 	 * to know whether any other trace/thread imc
 	 * events are running.
 	 */
-	mutex_lock(&imc_global_refc.lock);
+	spin_lock(&imc_global_refc.lock);
 	if (imc_global_refc.id == 0 || imc_global_refc.id == IMC_DOMAIN_CORE) {
 		/*
 		 * No other trace/thread imc events are running in
@@ -883,10 +884,10 @@ static int core_imc_event_init(struct perf_event *event)
 		imc_global_refc.id = IMC_DOMAIN_CORE;
 		imc_global_refc.refc++;
 	} else {
-		mutex_unlock(&imc_global_refc.lock);
+		spin_unlock(&imc_global_refc.lock);
 		return -EBUSY;
 	}
-	mutex_unlock(&imc_global_refc.lock);
+	spin_unlock(&imc_global_refc.lock);
 
 	event->hw.event_base = (u64)pcmi->vbase + (config & IMC_EVENT_OFFSET_MASK);
 	event->destroy = core_imc_counters_release;
@@ -958,10 +959,10 @@ static int ppc_thread_imc_cpu_offline(unsigned int cpu)
 	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) & (~(1UL << 63))));
 
 	/* Reduce the refc if thread-imc event running on this cpu */
-	mutex_lock(&imc_global_refc.lock);
+	spin_lock(&imc_global_refc.lock);
 	if (imc_global_refc.id == IMC_DOMAIN_THREAD)
 		imc_global_refc.refc--;
-	mutex_unlock(&imc_global_refc.lock);
+	spin_unlock(&imc_global_refc.lock);
 
 	return 0;
 }
@@ -1001,7 +1002,7 @@ static int thread_imc_event_init(struct perf_event *event)
 	if (!target)
 		return -EINVAL;
 
-	mutex_lock(&imc_global_refc.lock);
+	spin_lock(&imc_global_refc.lock);
 	/*
 	 * Check if any other trace/core imc events are running in the
 	 * system, if not set the global id to thread-imc.
@@ -1010,10 +1011,10 @@ static int thread_imc_event_init(struct perf_event *event)
 		imc_global_refc.id = IMC_DOMAIN_THREAD;
 		imc_global_refc.refc++;
 	} else {
-		mutex_unlock(&imc_global_refc.lock);
+		spin_unlock(&imc_global_refc.lock);
 		return -EBUSY;
 	}
-	mutex_unlock(&imc_global_refc.lock);
+	spin_unlock(&imc_global_refc.lock);
 
 	event->pmu->task_ctx_nr = perf_sw_context;
 	event->destroy = reset_global_refc;
@@ -1142,18 +1143,18 @@ static int thread_imc_event_add(struct perf_event *event, int flags)
 	if (!ref)
 		return -EINVAL;
 
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	if (ref->refc == 0) {
 		if (opal_imc_counters_start(OPAL_IMC_COUNTERS_CORE,
 		    get_hard_smp_processor_id(smp_processor_id()))) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("thread-imc: Unable to start the counter\
 				for core %d\n", core_id);
 			return -EINVAL;
 		}
 	}
 	++ref->refc;
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 	return 0;
 }
 
@@ -1170,12 +1171,12 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
 		return;
 	}
 
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	ref->refc--;
 	if (ref->refc == 0) {
 		if (opal_imc_counters_stop(OPAL_IMC_COUNTERS_CORE,
 		    get_hard_smp_processor_id(smp_processor_id()))) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("thread-imc: Unable to stop the counters\
 				for core %d\n", core_id);
 			return;
@@ -1183,7 +1184,7 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
 	} else if (ref->refc < 0) {
 		ref->refc = 0;
 	}
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 
 	/* Set bit 0 of LDBAR to zero, to stop posting updates to memory */
 	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) & (~(1UL << 63))));
@@ -1226,7 +1227,7 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
 
 	/* Init the mutex, if not already */
 	trace_imc_refc[core_id].id = core_id;
-	mutex_init(&trace_imc_refc[core_id].lock);
+	spin_lock_init(&trace_imc_refc[core_id].lock);
 
 	mtspr(SPRN_LDBAR, 0);
 	return 0;
@@ -1246,10 +1247,10 @@ static int ppc_trace_imc_cpu_offline(unsigned int cpu)
 	 * Reduce the refc if any trace-imc event running
 	 * on this cpu.
 	 */
-	mutex_lock(&imc_global_refc.lock);
+	spin_lock(&imc_global_refc.lock);
 	if (imc_global_refc.id == IMC_DOMAIN_TRACE)
 		imc_global_refc.refc--;
-	mutex_unlock(&imc_global_refc.lock);
+	spin_unlock(&imc_global_refc.lock);
 
 	return 0;
 }
@@ -1371,17 +1372,17 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
 	}
 
 	mtspr(SPRN_LDBAR, ldbar_value);
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	if (ref->refc == 0) {
 		if (opal_imc_counters_start(OPAL_IMC_COUNTERS_TRACE,
 				get_hard_smp_processor_id(smp_processor_id()))) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("trace-imc: Unable to start the counters for core %d\n", core_id);
 			return -EINVAL;
 		}
 	}
 	++ref->refc;
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 	return 0;
 }
 
@@ -1414,19 +1415,19 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 		return;
 	}
 
-	mutex_lock(&ref->lock);
+	spin_lock(&ref->lock);
 	ref->refc--;
 	if (ref->refc == 0) {
 		if (opal_imc_counters_stop(OPAL_IMC_COUNTERS_TRACE,
 				get_hard_smp_processor_id(smp_processor_id()))) {
-			mutex_unlock(&ref->lock);
+			spin_unlock(&ref->lock);
 			pr_err("trace-imc: Unable to stop the counters for core %d\n", core_id);
 			return;
 		}
 	} else if (ref->refc < 0) {
 		ref->refc = 0;
 	}
-	mutex_unlock(&ref->lock);
+	spin_unlock(&ref->lock);
 
 	trace_imc_event_stop(event, flags);
 }
@@ -1448,7 +1449,7 @@ static int trace_imc_event_init(struct perf_event *event)
 	 * no other thread is running any core/thread imc
 	 * events
 	 */
-	mutex_lock(&imc_global_refc.lock);
+	spin_lock(&imc_global_refc.lock);
 	if (imc_global_refc.id == 0 || imc_global_refc.id == IMC_DOMAIN_TRACE) {
 		/*
 		 * No core/thread imc events are running in the
@@ -1457,10 +1458,10 @@ static int trace_imc_event_init(struct perf_event *event)
 		imc_global_refc.id = IMC_DOMAIN_TRACE;
 		imc_global_refc.refc++;
 	} else {
-		mutex_unlock(&imc_global_refc.lock);
+		spin_unlock(&imc_global_refc.lock);
 		return -EBUSY;
 	}
-	mutex_unlock(&imc_global_refc.lock);
+	spin_unlock(&imc_global_refc.lock);
 
 	event->hw.idx = -1;
 
@@ -1536,7 +1537,7 @@ static int init_nest_pmu_ref(void)
 		 * Mutex lock to avoid races while tracking the number of
 		 * sessions using the chip's nest pmu units.
 		 */
-		mutex_init(&nest_imc_refc[i].lock);
+		spin_lock_init(&nest_imc_refc[i].lock);
 
 		/*
 		 * Loop to init the "id" with the node_id. Variable "i" initialized to
@@ -1633,7 +1634,7 @@ static void imc_common_mem_free(struct imc_pmu *pmu_ptr)
 static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
 {
 	if (pmu_ptr->domain == IMC_DOMAIN_NEST) {
-		mutex_lock(&nest_init_lock);
+		spin_lock(&nest_init_lock);
 		if (nest_pmus == 1) {
 			cpuhp_remove_state(CPUHP_AP_PERF_POWERPC_NEST_IMC_ONLINE);
 			kfree(nest_imc_refc);
@@ -1643,7 +1644,7 @@ static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
 
 		if (nest_pmus > 0)
 			nest_pmus--;
-		mutex_unlock(&nest_init_lock);
+		spin_unlock(&nest_init_lock);
 	}
 
 	/* Free core_imc memory */
@@ -1800,11 +1801,11 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
 		* rest. To handle the cpuhotplug callback unregister, we track
 		* the number of nest pmus in "nest_pmus".
 		*/
-		mutex_lock(&nest_init_lock);
+		spin_lock(&nest_init_lock);
 		if (nest_pmus == 0) {
 			ret = init_nest_pmu_ref();
 			if (ret) {
-				mutex_unlock(&nest_init_lock);
+				spin_unlock(&nest_init_lock);
 				kfree(per_nest_pmu_arr);
 				per_nest_pmu_arr = NULL;
 				goto err_free_mem;
@@ -1812,7 +1813,7 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
 			/* Register for cpu hotplug notification. */
 			ret = nest_pmu_cpumask_init();
 			if (ret) {
-				mutex_unlock(&nest_init_lock);
+				spin_unlock(&nest_init_lock);
 				kfree(nest_imc_refc);
 				kfree(per_nest_pmu_arr);
 				per_nest_pmu_arr = NULL;
@@ -1820,7 +1821,7 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
 			}
 		}
 		nest_pmus++;
-		mutex_unlock(&nest_init_lock);
+		spin_unlock(&nest_init_lock);
 		break;
 	case IMC_DOMAIN_CORE:
 		ret = core_imc_pmu_cpumask_init();
-- 
2.31.1

