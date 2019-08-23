Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA99A863
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 09:15:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FCNF2sDFzDrB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 17:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=huntbag@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FCJ4220bzDrRK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 17:11:48 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7N775W7143631
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:11:45 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uj90u50s9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:11:44 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Fri, 23 Aug 2019 08:11:42 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 23 Aug 2019 08:11:37 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7N7BbgU52625450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 07:11:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF6E852050;
 Fri, 23 Aug 2019 07:11:36 +0000 (GMT)
Received: from boston16h.aus.stglabs.ibm.com (unknown [9.3.23.78])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2AA4652051;
 Fri, 23 Aug 2019 07:11:35 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, paulus@samba.org
Subject: [RFC 1/3] cpuidle/powernv : Pass state pointer instead of values to
 stop loop
Date: Fri, 23 Aug 2019 02:09:38 -0500
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
References: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082307-4275-0000-0000-0000035C72A6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082307-4276-0000-0000-0000386E9AD8
Message-Id: <20190823070940.43220-2-huntbag@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230072
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, daniel.lezcano@linaro.org,
 rjw@rjwysocki.net, npiggin@gmail.com,
 Abhishek Goel <huntbag@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of passing psscr_val and psscr_mask, we will pass state pointer
to stop loop. This will help to figure out the method to enter/exit idle
state. Removed psscr_mask and psscr_val from driver idle code. Same has
also been done in platform idle code.
Also, added some cleanups and debugging info.

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/processor.h  |  5 +-
 arch/powerpc/platforms/powernv/idle.c | 50 ++++++++-----------
 drivers/cpuidle/cpuidle-powernv.c     | 69 +++++++++++++--------------
 3 files changed, 55 insertions(+), 69 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index a9993e7a443b..855666e8d271 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -39,6 +39,7 @@
 #include <linux/thread_info.h>
 #include <asm/ptrace.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/cpuidle.h>
 
 /* We do _not_ want to define new machine types at all, those must die
  * in favor of using the device-tree
@@ -419,9 +420,7 @@ enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
 extern int powersave_nap;	/* set if nap mode can be used in idle loop */
 
 extern void power7_idle_type(unsigned long type);
-extern void power9_idle_type(unsigned long stop_psscr_val,
-			      unsigned long stop_psscr_mask);
-
+extern void power9_idle_type(struct pnv_idle_states_t *state);
 extern void flush_instruction_cache(void);
 extern void hard_reset_now(void);
 extern void poweroff_now(void);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 09f49eed7fb8..db810c0a16e1 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -40,8 +40,7 @@ int nr_pnv_idle_states;
  * The default stop state that will be used by ppc_md.power_save
  * function on platforms that support stop instruction.
  */
-static u64 pnv_default_stop_val;
-static u64 pnv_default_stop_mask;
+struct pnv_idle_states_t *pnv_default_state;
 static bool default_stop_found;
 
 /*
@@ -54,9 +53,7 @@ static u64 pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
  * psscr value and mask of the deepest stop idle state.
  * Used when a cpu is offlined.
  */
-static u64 pnv_deepest_stop_psscr_val;
-static u64 pnv_deepest_stop_psscr_mask;
-static u64 pnv_deepest_stop_flag;
+static struct pnv_idle_states_t *pnv_deepest_state;
 static bool deepest_stop_found;
 
 static unsigned long power7_offline_type;
@@ -78,7 +75,7 @@ static int pnv_save_sprs_for_deep_states(void)
 	uint64_t hid5_val	= mfspr(SPRN_HID5);
 	uint64_t hmeer_val	= mfspr(SPRN_HMEER);
 	uint64_t msr_val = MSR_IDLE;
-	uint64_t psscr_val = pnv_deepest_stop_psscr_val;
+	uint64_t psscr_val = pnv_deepest_state->psscr_val;
 
 	for_each_present_cpu(cpu) {
 		uint64_t pir = get_hard_smp_processor_id(cpu);
@@ -804,9 +801,13 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-static unsigned long power9_offline_stop(unsigned long psscr)
+static unsigned long power9_offline_stop(struct pnv_idle_states_t *state)
 {
 	unsigned long srr1;
+	unsigned long psscr;
+
+	psscr = mfspr(SPRN_PSSCR);
+	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
 
 #ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	__ppc64_runlatch_off();
@@ -841,8 +842,7 @@ static unsigned long power9_offline_stop(unsigned long psscr)
 }
 #endif
 
-void power9_idle_type(unsigned long stop_psscr_val,
-				      unsigned long stop_psscr_mask)
+void power9_idle_type(struct pnv_idle_states_t *state)
 {
 	unsigned long psscr;
 	unsigned long srr1;
@@ -851,7 +851,7 @@ void power9_idle_type(unsigned long stop_psscr_val,
 		return;
 
 	psscr = mfspr(SPRN_PSSCR);
-	psscr = (psscr & ~stop_psscr_mask) | stop_psscr_val;
+	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
 
 	__ppc64_runlatch_off();
 	srr1 = power9_idle_stop(psscr, true);
@@ -867,7 +867,7 @@ void power9_idle_type(unsigned long stop_psscr_val,
  */
 void power9_idle(void)
 {
-	power9_idle_type(pnv_default_stop_val, pnv_default_stop_mask);
+	power9_idle_type(pnv_default_state);
 }
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
@@ -970,12 +970,7 @@ unsigned long pnv_cpu_offline(unsigned int cpu)
 	__ppc64_runlatch_off();
 
 	if (cpu_has_feature(CPU_FTR_ARCH_300) && deepest_stop_found) {
-		unsigned long psscr;
-
-		psscr = mfspr(SPRN_PSSCR);
-		psscr = (psscr & ~pnv_deepest_stop_psscr_mask) |
-						pnv_deepest_stop_psscr_val;
-		srr1 = power9_offline_stop(psscr);
+		srr1 = power9_offline_stop(pnv_deepest_state);
 	} else if (cpu_has_feature(CPU_FTR_ARCH_206) && power7_offline_type) {
 		srr1 = power7_offline();
 	} else {
@@ -1124,16 +1119,13 @@ static void __init pnv_power9_idle_init(void)
 
 		if (max_residency_ns < state->residency_ns) {
 			max_residency_ns = state->residency_ns;
-			pnv_deepest_stop_psscr_val = state->psscr_val;
-			pnv_deepest_stop_psscr_mask = state->psscr_mask;
-			pnv_deepest_stop_flag = state->flags;
+			pnv_deepest_state = state;
 			deepest_stop_found = true;
 		}
 
 		if (!default_stop_found &&
 		    (state->flags & OPAL_PM_STOP_INST_FAST)) {
-			pnv_default_stop_val = state->psscr_val;
-			pnv_default_stop_mask = state->psscr_mask;
+			pnv_default_state = state;
 			default_stop_found = true;
 			WARN_ON(state->flags & OPAL_PM_LOSE_FULL_CONTEXT);
 		}
@@ -1144,15 +1136,16 @@ static void __init pnv_power9_idle_init(void)
 	} else {
 		ppc_md.power_save = power9_idle;
 		pr_info("cpuidle-powernv: Default stop: psscr = 0x%016llx,mask=0x%016llx\n",
-			pnv_default_stop_val, pnv_default_stop_mask);
+			pnv_default_state->psscr_val,
+			pnv_default_state->psscr_mask);
 	}
 
 	if (unlikely(!deepest_stop_found)) {
 		pr_warn("cpuidle-powernv: No suitable stop state for CPU-Hotplug. Offlined CPUs will busy wait");
 	} else {
 		pr_info("cpuidle-powernv: Deepest stop: psscr = 0x%016llx,mask=0x%016llx\n",
-			pnv_deepest_stop_psscr_val,
-			pnv_deepest_stop_psscr_mask);
+			pnv_deepest_state->psscr_val,
+			pnv_deepest_state->psscr_mask);
 	}
 
 	pr_info("cpuidle-powernv: First stop level that may lose SPRs = 0x%llx\n",
@@ -1174,16 +1167,15 @@ static void __init pnv_disable_deep_states(void)
 	pr_warn("cpuidle-powernv: Idle power-savings, CPU-Hotplug affected\n");
 
 	if (cpu_has_feature(CPU_FTR_ARCH_300) &&
-	    (pnv_deepest_stop_flag & OPAL_PM_LOSE_FULL_CONTEXT)) {
+	    (pnv_deepest_state->flags & OPAL_PM_LOSE_FULL_CONTEXT)) {
 		/*
 		 * Use the default stop state for CPU-Hotplug
 		 * if available.
 		 */
 		if (default_stop_found) {
-			pnv_deepest_stop_psscr_val = pnv_default_stop_val;
-			pnv_deepest_stop_psscr_mask = pnv_default_stop_mask;
+			pnv_deepest_state = pnv_default_state;
 			pr_warn("cpuidle-powernv: Offlined CPUs will stop with psscr = 0x%016llx\n",
-				pnv_deepest_stop_psscr_val);
+				pnv_deepest_state->psscr_val);
 		} else { /* Fallback to snooze loop for CPU-Hotplug */
 			deepest_stop_found = false;
 			pr_warn("cpuidle-powernv: Offlined CPUs will busy wait\n");
diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index 84b1ebe212b3..1b6c84d4ac77 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -36,13 +36,7 @@ static struct cpuidle_driver powernv_idle_driver = {
 static int max_idle_state __read_mostly;
 static struct cpuidle_state *cpuidle_state_table __read_mostly;
 
-struct stop_psscr_table {
-	u64 val;
-	u64 mask;
-};
-
-static struct stop_psscr_table stop_psscr_table[CPUIDLE_STATE_MAX] __read_mostly;
-
+static unsigned int stop_driver_index[CPUIDLE_STATE_MAX] __read_mostly;
 static u64 default_snooze_timeout __read_mostly;
 static bool snooze_timeout_en __read_mostly;
 
@@ -144,8 +138,9 @@ static int stop_loop(struct cpuidle_device *dev,
 		     struct cpuidle_driver *drv,
 		     int index)
 {
-	power9_idle_type(stop_psscr_table[index].val,
-			 stop_psscr_table[index].mask);
+	unsigned int driver_index = stop_driver_index[index];
+
+	power9_idle_type(&pnv_idle_states[driver_index]);
 	return index;
 }
 
@@ -234,7 +229,7 @@ static inline void add_powernv_state(int index, const char *name,
 						    int),
 				     unsigned int target_residency,
 				     unsigned int exit_latency,
-				     u64 psscr_val, u64 psscr_mask)
+				     unsigned int driver_index)
 {
 	strlcpy(powernv_states[index].name, name, CPUIDLE_NAME_LEN);
 	strlcpy(powernv_states[index].desc, name, CPUIDLE_NAME_LEN);
@@ -242,9 +237,7 @@ static inline void add_powernv_state(int index, const char *name,
 	powernv_states[index].target_residency = target_residency;
 	powernv_states[index].exit_latency = exit_latency;
 	powernv_states[index].enter = idle_fn;
-	/* For power8 and below psscr_* will be 0 */
-	stop_psscr_table[index].val = psscr_val;
-	stop_psscr_table[index].mask = psscr_mask;
+	stop_driver_index[index] = driver_index;
 }
 
 /*
@@ -265,7 +258,7 @@ extern u32 pnv_get_supported_cpuidle_states(void);
 static int powernv_add_idle_states(void)
 {
 	int nr_idle_states = 1; /* Snooze */
-	int dt_idle_states;
+	int dt_idle_states = 0;
 	u32 has_stop_states = 0;
 	int i;
 	u32 supported_flags = pnv_get_supported_cpuidle_states();
@@ -284,36 +277,38 @@ static int powernv_add_idle_states(void)
 	 * Since snooze is used as first idle state, max idle states allowed is
 	 * CPUIDLE_STATE_MAX -1
 	 */
-	if (nr_pnv_idle_states > CPUIDLE_STATE_MAX - 1) {
+	if (dt_idle_states > CPUIDLE_STATE_MAX - 1) {
 		pr_warn("cpuidle-powernv: discovered idle states more than allowed");
 		dt_idle_states = CPUIDLE_STATE_MAX - 1;
 	}
 
-	/*
-	 * If the idle states use stop instruction, probe for psscr values
-	 * and psscr mask which are necessary to specify required stop level.
-	 */
-	has_stop_states = (pnv_idle_states[0].flags &
-			   (OPAL_PM_STOP_INST_FAST | OPAL_PM_STOP_INST_DEEP));
-
 	for (i = 0; i < dt_idle_states; i++) {
 		unsigned int exit_latency, target_residency;
 		bool stops_timebase = false;
 		struct pnv_idle_states_t *state = &pnv_idle_states[i];
 
+		has_stop_states = (pnv_idle_states[i].flags &
+				  (OPAL_PM_STOP_INST_FAST |
+				   OPAL_PM_STOP_INST_DEEP));
+
 		/*
 		 * Skip the platform idle state whose flag isn't in
 		 * the supported_cpuidle_states flag mask.
 		 */
-		if ((state->flags & supported_flags) != state->flags)
+		if ((state->flags & supported_flags) != state->flags) {
+			pr_warn("State %d does not have supported flag\n", i);
 			continue;
+		}
+
 		/*
 		 * If an idle state has exit latency beyond
-		 * POWERNV_THRESHOLD_LATENCY_NS then don't use it
-		 * in cpu-idle.
+		 * POWERNV_THRESHOLD_LATENCY_NS then don't use it in cpu-idle.
 		 */
-		if (state->latency_ns > POWERNV_THRESHOLD_LATENCY_NS)
+		if (state->latency_ns > POWERNV_THRESHOLD_LATENCY_NS) {
+			pr_info("State %d is not idletype\n", i);
 			continue;
+		}
+
 		/*
 		 * Firmware passes residency and latency values in ns.
 		 * cpuidle expects it in us.
@@ -321,8 +316,10 @@ static int powernv_add_idle_states(void)
 		exit_latency = DIV_ROUND_UP(state->latency_ns, 1000);
 		target_residency = DIV_ROUND_UP(state->residency_ns, 1000);
 
-		if (has_stop_states && !(state->valid))
-				continue;
+		if (has_stop_states && !(state->valid)) {
+			pr_warn("State %d is invalid\n", i);
+			continue;
+		}
 
 		if (state->flags & OPAL_PM_TIMEBASE_STOP)
 			stops_timebase = true;
@@ -331,13 +328,11 @@ static int powernv_add_idle_states(void)
 			/* Add NAP state */
 			add_powernv_state(nr_idle_states, "Nap",
 					  CPUIDLE_FLAG_NONE, nap_loop,
-					  target_residency, exit_latency, 0, 0);
+					  target_residency, exit_latency, 0);
 		} else if (has_stop_states && !stops_timebase) {
 			add_powernv_state(nr_idle_states, state->name,
 					  CPUIDLE_FLAG_NONE, stop_loop,
-					  target_residency, exit_latency,
-					  state->psscr_val,
-					  state->psscr_mask);
+					  target_residency, exit_latency, i);
 		}
 
 		/*
@@ -351,17 +346,17 @@ static int powernv_add_idle_states(void)
 			add_powernv_state(nr_idle_states, "FastSleep",
 					  CPUIDLE_FLAG_TIMER_STOP,
 					  fastsleep_loop,
-					  target_residency, exit_latency, 0, 0);
+					  target_residency, exit_latency, 0);
 		} else if (has_stop_states && stops_timebase) {
 			add_powernv_state(nr_idle_states, state->name,
 					  CPUIDLE_FLAG_TIMER_STOP, stop_loop,
-					  target_residency, exit_latency,
-					  state->psscr_val,
-					  state->psscr_mask);
+					  target_residency, exit_latency, i);
 		}
 #endif
-		else
+		else {
+			pr_warn("cpuidle-powernv : could not add state\n");
 			continue;
+		}
 		nr_idle_states++;
 	}
 out:
-- 
2.17.1

