Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E11F735A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:14:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jpmx1899zDqvn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:14:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpl34v6TzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:47 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C542OY025439; Fri, 12 Jun 2020 01:12:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m31h8hk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:43 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C5567V028541;
 Fri, 12 Jun 2020 01:12:42 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m31h8hjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C59M6t011044;
 Fri, 12 Jun 2020 05:12:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 31hw1cftxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5CeXV19595630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76007C605B;
 Fri, 12 Jun 2020 05:12:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0558FC605A;
 Fri, 12 Jun 2020 05:12:39 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:39 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/18] powerpc/pseries: remove cede offline state for CPUs
Date: Fri, 12 Jun 2020 00:12:21 -0500
Message-Id: <20200612051238.1007764-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 cotscore=-2147483648 impostorscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This effectively reverts commit 3aa565f53c39 ("powerpc/pseries: Add
hooks to put the CPU into an appropriate offline state"), which added
an offline mode for CPUs which uses the H_CEDE hcall instead of the
architected stop-self RTAS function in order to facilitate "folding"
of dedicated mode processors on PowerVM platforms to achieve energy
savings. This has been the default offline mode since its
introduction.

There's nothing about stop-self that would prevent the hypervisor from
achieving the energy savings available via H_CEDE, so the original
premise of this change appears to be flawed.

I also have encountered the claim that the transition to and from
ceded state is much faster than stop-self/start-cpu. Certainly we
would not want to use stop-self as an *idle* mode. That is what H_CEDE
is for. However, this difference is insignificant in the context of
Linux CPU hotplug, where the latency of an offline or online operation
on current systems is on the order of 100ms, mainly attributable to
all the various subsystems' cpuhp callbacks.

The cede offline mode also prevents accurate accounting, as discussed
before:
https://lore.kernel.org/linuxppc-dev/1571740391-3251-1-git-send-email-ego@linux.vnet.ibm.com/

Unconditionally use stop-self to offline processor threads. This is
the architected method for offlining CPUs on PAPR systems.

The "cede_offline" boot parameter is rendered obsolete.

Removing this code enables the removal of the partition suspend code
which temporarily onlines all present CPUs.

Fixes: 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU into an appropriate offline state")

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 Documentation/core-api/cpu_hotplug.rst        |   7 -
 arch/powerpc/platforms/pseries/hotplug-cpu.c  | 170 ++----------------
 .../platforms/pseries/offline_states.h        |  38 ----
 arch/powerpc/platforms/pseries/pmem.c         |   1 -
 arch/powerpc/platforms/pseries/smp.c          |  28 +--
 5 files changed, 15 insertions(+), 229 deletions(-)
 delete mode 100644 arch/powerpc/platforms/pseries/offline_states.h

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index 4a50ab7817f7..b1ae1ac159cf 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -50,13 +50,6 @@ Command Line Switches
 
   This option is limited to the X86 and S390 architecture.
 
-``cede_offline={"off","on"}``
-  Use this option to disable/enable putting offlined processors to an extended
-  ``H_CEDE`` state on supported pseries platforms. If nothing is specified,
-  ``cede_offline`` is set to "on".
-
-  This option is limited to the PowerPC architecture.
-
 ``cpu0_hotplug``
   Allow to shutdown CPU0.
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 3e8cbfe7a80f..d4b346355bb9 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -35,54 +35,10 @@
 #include <asm/topology.h>
 
 #include "pseries.h"
-#include "offline_states.h"
 
 /* This version can't take the spinlock, because it never returns */
 static int rtas_stop_self_token = RTAS_UNKNOWN_SERVICE;
 
-static DEFINE_PER_CPU(enum cpu_state_vals, preferred_offline_state) =
-							CPU_STATE_OFFLINE;
-static DEFINE_PER_CPU(enum cpu_state_vals, current_state) = CPU_STATE_OFFLINE;
-
-static enum cpu_state_vals default_offline_state = CPU_STATE_OFFLINE;
-
-static bool cede_offline_enabled __read_mostly = true;
-
-/*
- * Enable/disable cede_offline when available.
- */
-static int __init setup_cede_offline(char *str)
-{
-	return (kstrtobool(str, &cede_offline_enabled) == 0);
-}
-
-__setup("cede_offline=", setup_cede_offline);
-
-enum cpu_state_vals get_cpu_current_state(int cpu)
-{
-	return per_cpu(current_state, cpu);
-}
-
-void set_cpu_current_state(int cpu, enum cpu_state_vals state)
-{
-	per_cpu(current_state, cpu) = state;
-}
-
-enum cpu_state_vals get_preferred_offline_state(int cpu)
-{
-	return per_cpu(preferred_offline_state, cpu);
-}
-
-void set_preferred_offline_state(int cpu, enum cpu_state_vals state)
-{
-	per_cpu(preferred_offline_state, cpu) = state;
-}
-
-void set_default_offline_state(int cpu)
-{
-	per_cpu(preferred_offline_state, cpu) = default_offline_state;
-}
-
 static void rtas_stop_self(void)
 {
 	static struct rtas_args args;
@@ -101,9 +57,7 @@ static void rtas_stop_self(void)
 
 static void pseries_mach_cpu_die(void)
 {
-	unsigned int cpu = smp_processor_id();
 	unsigned int hwcpu = hard_smp_processor_id();
-	u8 cede_latency_hint = 0;
 
 	local_irq_disable();
 	idle_task_exit();
@@ -112,49 +66,6 @@ static void pseries_mach_cpu_die(void)
 	else
 		xics_teardown_cpu();
 
-	if (get_preferred_offline_state(cpu) == CPU_STATE_INACTIVE) {
-		set_cpu_current_state(cpu, CPU_STATE_INACTIVE);
-		if (ppc_md.suspend_disable_cpu)
-			ppc_md.suspend_disable_cpu();
-
-		cede_latency_hint = 2;
-
-		get_lppaca()->idle = 1;
-		if (!lppaca_shared_proc(get_lppaca()))
-			get_lppaca()->donate_dedicated_cpu = 1;
-
-		while (get_preferred_offline_state(cpu) == CPU_STATE_INACTIVE) {
-			while (!prep_irq_for_idle()) {
-				local_irq_enable();
-				local_irq_disable();
-			}
-
-			extended_cede_processor(cede_latency_hint);
-		}
-
-		local_irq_disable();
-
-		if (!lppaca_shared_proc(get_lppaca()))
-			get_lppaca()->donate_dedicated_cpu = 0;
-		get_lppaca()->idle = 0;
-
-		if (get_preferred_offline_state(cpu) == CPU_STATE_ONLINE) {
-			unregister_slb_shadow(hwcpu);
-
-			hard_irq_disable();
-			/*
-			 * Call to start_secondary_resume() will not return.
-			 * Kernel stack will be reset and start_secondary()
-			 * will be called to continue the online operation.
-			 */
-			start_secondary_resume();
-		}
-	}
-
-	/* Requested state is CPU_STATE_OFFLINE at this point */
-	WARN_ON(get_preferred_offline_state(cpu) != CPU_STATE_OFFLINE);
-
-	set_cpu_current_state(cpu, CPU_STATE_OFFLINE);
 	unregister_slb_shadow(hwcpu);
 	rtas_stop_self();
 
@@ -200,24 +111,13 @@ static void pseries_cpu_die(unsigned int cpu)
 	int cpu_status = 1;
 	unsigned int pcpu = get_hard_smp_processor_id(cpu);
 
-	if (get_preferred_offline_state(cpu) == CPU_STATE_INACTIVE) {
-		cpu_status = 1;
-		for (tries = 0; tries < 5000; tries++) {
-			if (get_cpu_current_state(cpu) == CPU_STATE_INACTIVE) {
-				cpu_status = 0;
-				break;
-			}
-			msleep(1);
-		}
-	} else if (get_preferred_offline_state(cpu) == CPU_STATE_OFFLINE) {
+	for (tries = 0; tries < 25; tries++) {
+		cpu_status = smp_query_cpu_stopped(pcpu);
+		if (cpu_status == QCSS_STOPPED ||
+		    cpu_status == QCSS_HARDWARE_ERROR)
+			break;
+		cpu_relax();
 
-		for (tries = 0; tries < 25; tries++) {
-			cpu_status = smp_query_cpu_stopped(pcpu);
-			if (cpu_status == QCSS_STOPPED ||
-			    cpu_status == QCSS_HARDWARE_ERROR)
-				break;
-			cpu_relax();
-		}
 	}
 
 	if (cpu_status != 0) {
@@ -359,28 +259,15 @@ static int dlpar_offline_cpu(struct device_node *dn)
 			if (get_hard_smp_processor_id(cpu) != thread)
 				continue;
 
-			if (get_cpu_current_state(cpu) == CPU_STATE_OFFLINE)
+			if (!cpu_online(cpu))
 				break;
 
-			if (get_cpu_current_state(cpu) == CPU_STATE_ONLINE) {
-				set_preferred_offline_state(cpu,
-							    CPU_STATE_OFFLINE);
-				cpu_maps_update_done();
-				timed_topology_update(1);
-				rc = device_offline(get_cpu_device(cpu));
-				if (rc)
-					goto out;
-				cpu_maps_update_begin();
-				break;
-			}
-
-			/*
-			 * The cpu is in CPU_STATE_INACTIVE.
-			 * Upgrade it's state to CPU_STATE_OFFLINE.
-			 */
-			set_preferred_offline_state(cpu, CPU_STATE_OFFLINE);
-			WARN_ON(plpar_hcall_norets(H_PROD, thread) != H_SUCCESS);
-			__cpu_die(cpu);
+			cpu_maps_update_done();
+			timed_topology_update(1);
+			rc = device_offline(get_cpu_device(cpu));
+			if (rc)
+				goto out;
+			cpu_maps_update_begin();
 			break;
 		}
 		if (cpu == num_possible_cpus()) {
@@ -414,8 +301,6 @@ static int dlpar_online_cpu(struct device_node *dn)
 		for_each_present_cpu(cpu) {
 			if (get_hard_smp_processor_id(cpu) != thread)
 				continue;
-			BUG_ON(get_cpu_current_state(cpu)
-					!= CPU_STATE_OFFLINE);
 			cpu_maps_update_done();
 			timed_topology_update(1);
 			find_and_online_cpu_nid(cpu);
@@ -1013,27 +898,8 @@ static struct notifier_block pseries_smp_nb = {
 	.notifier_call = pseries_smp_notifier,
 };
 
-#define MAX_CEDE_LATENCY_LEVELS		4
-#define	CEDE_LATENCY_PARAM_LENGTH	10
-#define CEDE_LATENCY_PARAM_MAX_LENGTH	\
-	(MAX_CEDE_LATENCY_LEVELS * CEDE_LATENCY_PARAM_LENGTH * sizeof(char))
-#define CEDE_LATENCY_TOKEN		45
-
-static char cede_parameters[CEDE_LATENCY_PARAM_MAX_LENGTH];
-
-static int parse_cede_parameters(void)
-{
-	memset(cede_parameters, 0, CEDE_LATENCY_PARAM_MAX_LENGTH);
-	return rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
-			 NULL,
-			 CEDE_LATENCY_TOKEN,
-			 __pa(cede_parameters),
-			 CEDE_LATENCY_PARAM_MAX_LENGTH);
-}
-
 static int __init pseries_cpu_hotplug_init(void)
 {
-	int cpu;
 	int qcss_tok;
 
 #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
@@ -1056,16 +922,8 @@ static int __init pseries_cpu_hotplug_init(void)
 	smp_ops->cpu_die = pseries_cpu_die;
 
 	/* Processors can be added/removed only on LPAR */
-	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+	if (firmware_has_feature(FW_FEATURE_LPAR))
 		of_reconfig_notifier_register(&pseries_smp_nb);
-		cpu_maps_update_begin();
-		if (cede_offline_enabled && parse_cede_parameters() == 0) {
-			default_offline_state = CPU_STATE_INACTIVE;
-			for_each_online_cpu(cpu)
-				set_default_offline_state(cpu);
-		}
-		cpu_maps_update_done();
-	}
 
 	return 0;
 }
diff --git a/arch/powerpc/platforms/pseries/offline_states.h b/arch/powerpc/platforms/pseries/offline_states.h
deleted file mode 100644
index 51414aee2862..000000000000
--- a/arch/powerpc/platforms/pseries/offline_states.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _OFFLINE_STATES_H_
-#define _OFFLINE_STATES_H_
-
-/* Cpu offline states go here */
-enum cpu_state_vals {
-	CPU_STATE_OFFLINE,
-	CPU_STATE_INACTIVE,
-	CPU_STATE_ONLINE,
-	CPU_MAX_OFFLINE_STATES
-};
-
-#ifdef CONFIG_HOTPLUG_CPU
-extern enum cpu_state_vals get_cpu_current_state(int cpu);
-extern void set_cpu_current_state(int cpu, enum cpu_state_vals state);
-extern void set_preferred_offline_state(int cpu, enum cpu_state_vals state);
-extern void set_default_offline_state(int cpu);
-#else
-static inline enum cpu_state_vals get_cpu_current_state(int cpu)
-{
-	return CPU_STATE_ONLINE;
-}
-
-static inline void set_cpu_current_state(int cpu, enum cpu_state_vals state)
-{
-}
-
-static inline void set_preferred_offline_state(int cpu, enum cpu_state_vals state)
-{
-}
-
-static inline void set_default_offline_state(int cpu)
-{
-}
-#endif
-
-extern enum cpu_state_vals get_preferred_offline_state(int cpu);
-#endif
diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index f860a897a9e0..f827de7087e9 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -24,7 +24,6 @@
 #include <asm/topology.h>
 
 #include "pseries.h"
-#include "offline_states.h"
 
 static struct device_node *pmem_node;
 
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 6891710833be..7ebacac03dc3 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -44,8 +44,6 @@
 #include <asm/svm.h>
 
 #include "pseries.h"
-#include "offline_states.h"
-
 
 /*
  * The Primary thread of each non-boot processor was started from the OF client
@@ -108,10 +106,7 @@ static inline int smp_startup_cpu(unsigned int lcpu)
 
 	/* Fixup atomic count: it exited inside IRQ handler. */
 	task_thread_info(paca_ptrs[lcpu]->__current)->preempt_count	= 0;
-#ifdef CONFIG_HOTPLUG_CPU
-	if (get_cpu_current_state(lcpu) == CPU_STATE_INACTIVE)
-		goto out;
-#endif
+
 	/* 
 	 * If the RTAS start-cpu token does not exist then presume the
 	 * cpu is already spinning.
@@ -126,9 +121,6 @@ static inline int smp_startup_cpu(unsigned int lcpu)
 		return 0;
 	}
 
-#ifdef CONFIG_HOTPLUG_CPU
-out:
-#endif
 	return 1;
 }
 
@@ -143,10 +135,6 @@ static void smp_setup_cpu(int cpu)
 		vpa_init(cpu);
 
 	cpumask_clear_cpu(cpu, of_spin_mask);
-#ifdef CONFIG_HOTPLUG_CPU
-	set_cpu_current_state(cpu, CPU_STATE_ONLINE);
-	set_default_offline_state(cpu);
-#endif
 }
 
 static int smp_pSeries_kick_cpu(int nr)
@@ -163,20 +151,6 @@ static int smp_pSeries_kick_cpu(int nr)
 	 * the processor will continue on to secondary_start
 	 */
 	paca_ptrs[nr]->cpu_start = 1;
-#ifdef CONFIG_HOTPLUG_CPU
-	set_preferred_offline_state(nr, CPU_STATE_ONLINE);
-
-	if (get_cpu_current_state(nr) == CPU_STATE_INACTIVE) {
-		long rc;
-		unsigned long hcpuid;
-
-		hcpuid = get_hard_smp_processor_id(nr);
-		rc = plpar_hcall_norets(H_PROD, hcpuid);
-		if (rc != H_SUCCESS)
-			printk(KERN_ERR "Error: Prod to wake up processor %d "
-						"Ret= %ld\n", nr, rc);
-	}
-#endif
 
 	return 0;
 }
-- 
2.25.4

