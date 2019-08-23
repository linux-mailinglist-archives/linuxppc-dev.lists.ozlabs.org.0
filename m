Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E06F9A86A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 09:17:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FCQY6Jx8zDqf4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 17:17:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FCJ60G2YzDrJB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 17:11:49 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7N773Ll036049
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:11:47 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ujap99wv4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 03:11:46 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Fri, 23 Aug 2019 08:11:44 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 23 Aug 2019 08:11:41 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7N7BJ2s19726690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 07:11:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64B1D52052;
 Fri, 23 Aug 2019 07:11:40 +0000 (GMT)
Received: from boston16h.aus.stglabs.ibm.com (unknown [9.3.23.78])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A3D7A5204E;
 Fri, 23 Aug 2019 07:11:38 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, paulus@samba.org
Subject: [RFC 2/3] cpuidle/powernv: Add support for versioned stop states
Date: Fri, 23 Aug 2019 02:09:39 -0500
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
References: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082307-0008-0000-0000-0000030C6655
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082307-0009-0000-0000-00004A2A9773
Message-Id: <20190823070940.43220-3-huntbag@linux.vnet.ibm.com>
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

New device tree format adds a compatible flag which has version
corresponding to every state, so that only kernel which has the capability
to handle the version of stop state will enable it. Drawback of the array
based dt node is that versioning of idle states is not possible.

Older kernel will still see stop0 and stop0_lite in older format and we
will deprecate it after some time.

Consider a case that stop4 has a bug. We take the following steps to
mitigate the problem.

1) Change compatible string for stop4 in OPAL to "stop4,v2" from
"stop4,v1", i.e. basicallly bump up the previous version and ship the
new firmware.
2) The kernel will ignore stop4 as it won't be able to recognize this
new version. Kernel will also ignore all the deeper states because its
possible that a cpu have requested for a deeper state but was never able
to enter into it. But we will still have shallower states that are there
before stop 4. This, thus prevents from completely disabling stop states.

Linux kernel can now look at the version string and decide if it has the
ability to handle that idle state. Henceforth, if kernel does not know
about a version, it will skip that state and all the deeper state.

Once when the workaround are implemented into the kernel, we can bump up
the known version in kernel for that state, so that support can be
enabled once again in kernel.

New Device-tree :

Final output
       power-mgt {
            ...
         ibm,enabled-stop-levels = <0xec000000>;
         ibm,cpu-idle-state-psscr-mask = <0x0 0x3003ff 0x0 0x3003ff>;
         ibm,cpu-idle-state-latencies-ns = <0x3e8 0x7d0>;
         ibm,cpu-idle-state-psscr = <0x0 0x330 0x0 0x300330>;
         ibm,cpu-idle-state-flags = <0x100000 0x101000>;
         ibm,cpu-idle-state-residency-ns = <0x2710 0x4e20>;
         ibm,idle-states {
                     stop4 {
                         flags = <0x207000>;
                         compatible = "stop4,v1",
                         psscr-mask = <0x0 0x3003ff>;
                         latency-ns = <0x186a0>;
                         residency-ns = <0x989680>;
                         psscr = <0x0 0x300374>;
			 ...
                  };
                    ...
                    stop11 {
                         ...
                         compatible = "stop11,v1",
                         ...
                  };
             };

Since state pointer is being passed to stop loop, I have separated idle
fast path for lite, shallow and deep states. This improves the
readability of the code and also future maintainability of the code.
Stop handle corresponding to each state can be called directly since
state pointer is being passed now.

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/cpuidle.h    |   8 +-
 arch/powerpc/platforms/powernv/idle.c | 331 +++++++++++++++++++++++---
 2 files changed, 299 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/cpuidle.h b/arch/powerpc/include/asm/cpuidle.h
index 9844b3ded187..5eb9a98fcb86 100644
--- a/arch/powerpc/include/asm/cpuidle.h
+++ b/arch/powerpc/include/asm/cpuidle.h
@@ -70,15 +70,19 @@
 
 #ifndef __ASSEMBLY__
 
-#define PNV_IDLE_NAME_LEN    16
+#define PNV_VERSION_LEN		25
+#define PNV_IDLE_NAME_LEN	16
 struct pnv_idle_states_t {
 	char name[PNV_IDLE_NAME_LEN];
+	char compat_version[PNV_VERSION_LEN];
 	u32 latency_ns;
 	u32 residency_ns;
 	u64 psscr_val;
 	u64 psscr_mask;
-	u32 flags;
+	u64 flags;
 	bool valid;
+	unsigned long (*stop_handle)(struct pnv_idle_states_t *state,
+				     bool mmu_on);
 };
 
 extern struct pnv_idle_states_t *pnv_idle_states;
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index db810c0a16e1..7398a66e1ddb 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -49,6 +49,12 @@ static bool default_stop_found;
 static u64 pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
 static u64 pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
 
+struct stop_version_t {
+	const char compat_version[PNV_VERSION_LEN];
+	unsigned long (*stop_handle)(struct pnv_idle_states_t *state,
+				     bool mmu_on);
+};
+
 /*
  * psscr value and mask of the deepest stop idle state.
  * Used when a cpu is offlined.
@@ -599,40 +605,152 @@ struct p9_sprs {
 	u64 uamor;
 };
 
-static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
+/* Splitting the previous power9_idle_stop into three functions
+ * to separately handle lite, shallow and deep states.
+ */
+
+static unsigned long power9_stop_lite(struct pnv_idle_states_t *state,
+				      bool mmu_on)
 {
-	int cpu = raw_smp_processor_id();
-	int first = cpu_first_thread_sibling(cpu);
-	unsigned long *state = &paca_ptrs[first]->idle_state;
-	unsigned long core_thread_mask = (1UL << threads_per_core) - 1;
 	unsigned long srr1;
-	unsigned long pls;
+	unsigned long psscr;
+
+	psscr = mfspr(SPRN_PSSCR);
+	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
+
+	/* EC=ESL=0 case */
+	BUG_ON(!mmu_on);
+
+	/*
+	 * Wake synchronously. SRESET via xscom may still cause
+	 * a 0x100 powersave wakeup with SRR1 reason!
+	 */
+	srr1 = isa300_idle_stop_noloss(psscr);		/* go idle */
+	if (likely(!srr1))
+		return 0;
+
+	/*
+	 * Registers not saved, can't recover!
+	 * This would be a hardware bug
+	 */
+	BUG_ON((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS);
+
+	if (mmu_on)
+		mtmsr(MSR_KERNEL);
+
+	return srr1;
+}
+
+static unsigned long power9_stop_shallow(struct pnv_idle_states_t *state,
+					 bool mmu_on)
+{
+	unsigned long srr1;
+	unsigned long psscr;
 	unsigned long mmcr0 = 0;
 	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
-	bool sprs_saved = false;
 
-	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
-		/* EC=ESL=0 case */
+	psscr = mfspr(SPRN_PSSCR);
+	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
 
-		BUG_ON(!mmu_on);
+	/* EC=ESL=1 case */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	if (cpu_has_feature(CPU_FTR_P9_TM_XER_SO_BUG)) {
+		local_paca->requested_psscr = psscr;
+		/* order setting requested_psscr vs testing dont_stop */
+		smp_mb();
+		if (atomic_read(&local_paca->dont_stop)) {
+			local_paca->requested_psscr = 0;
+			return 0;
+		}
+	}
+#endif
 
+	if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
 		/*
-		 * Wake synchronously. SRESET via xscom may still cause
-		 * a 0x100 powersave wakeup with SRR1 reason!
+		 * POWER9 DD2 can incorrectly set PMAO when waking up
+		 * after a state-loss idle. Saving and restoring MMCR0
+		 * over idle is a workaround.
 		 */
-		srr1 = isa300_idle_stop_noloss(psscr);		/* go idle */
-		if (likely(!srr1))
-			return 0;
+		mmcr0		= mfspr(SPRN_MMCR0);
+	}
+
+	sprs.amr	= mfspr(SPRN_AMR);
+	sprs.iamr	= mfspr(SPRN_IAMR);
+	sprs.amor	= mfspr(SPRN_AMOR);
+	sprs.uamor	= mfspr(SPRN_UAMOR);
+
+	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
+	if (unlikely(!srr1))
+		return 0;
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	local_paca->requested_psscr = 0;
+#endif
+
+	psscr = mfspr(SPRN_PSSCR);
+
+	WARN_ON_ONCE(!srr1);
+	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
+
+	if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
+		unsigned long mmcra;
 
 		/*
-		 * Registers not saved, can't recover!
-		 * This would be a hardware bug
+		 * We don't need an isync after the mtsprs here because the
+		 * upcoming mtmsrd is execution synchronizing.
 		 */
-		BUG_ON((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS);
+		mtspr(SPRN_AMR,		sprs.amr);
+		mtspr(SPRN_IAMR,	sprs.iamr);
+		mtspr(SPRN_AMOR,	sprs.amor);
+		mtspr(SPRN_UAMOR,	sprs.uamor);
 
-		goto out;
+		/*
+		 * Workaround for POWER9 DD2.0, if we lost resources, the ERAT
+		 * might have been corrupted and needs flushing. We also need
+		 * to reload MMCR0 (see mmcr0 comment above).
+		 */
+		if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
+			asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT);
+			mtspr(SPRN_MMCR0, mmcr0);
+		}
+
+		/*
+		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
+		 * to ensure the PMU starts running.
+		 */
+		mmcra = mfspr(SPRN_MMCRA);
+		mmcra |= PPC_BIT(60);
+		mtspr(SPRN_MMCRA, mmcra);
+		mmcra &= ~PPC_BIT(60);
+		mtspr(SPRN_MMCRA, mmcra);
 	}
 
+	if (unlikely((srr1 & SRR1_WAKEMASK_P8) == SRR1_WAKEHMI))
+		hmi_exception_realmode(NULL);
+
+	if (mmu_on)
+		mtmsr(MSR_KERNEL);
+
+	return srr1;
+}
+
+static unsigned long power9_stop_deep(struct pnv_idle_states_t *state,
+				      bool mmu_on)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long *first_state = &paca_ptrs[first]->idle_state;
+	unsigned long core_thread_mask = (1UL << threads_per_core) - 1;
+	unsigned long srr1;
+	unsigned long pls;
+	unsigned long psscr;
+	unsigned long mmcr0 = 0;
+	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
+	bool sprs_saved = false;
+
+	psscr = mfspr(SPRN_PSSCR);
+	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
+
 	/* EC=ESL=1 case */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	if (cpu_has_feature(CPU_FTR_P9_TM_XER_SO_BUG)) {
@@ -654,7 +772,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		  */
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
-	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
+
 		sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
 		sprs.fscr	= mfspr(SPRN_FSCR);
@@ -677,14 +795,15 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		sprs_saved = true;
 
 		atomic_start_thread_idle();
-	}
 
 	sprs.amr	= mfspr(SPRN_AMR);
 	sprs.iamr	= mfspr(SPRN_IAMR);
 	sprs.amor	= mfspr(SPRN_AMOR);
 	sprs.uamor	= mfspr(SPRN_UAMOR);
 
-	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
+	srr1 = isa300_idle_stop_mayloss(psscr);         /* go idle */
+	if (unlikely(!srr1))
+		return 0;
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	local_paca->requested_psscr = 0;
@@ -748,7 +867,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 
 	atomic_lock_thread_idle();
 
-	if ((*state & core_thread_mask) != 0)
+	if ((*first_state & core_thread_mask) != 0)
 		goto core_woken;
 
 	/* Per-core SPRs */
@@ -804,14 +923,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 static unsigned long power9_offline_stop(struct pnv_idle_states_t *state)
 {
 	unsigned long srr1;
-	unsigned long psscr;
-
-	psscr = mfspr(SPRN_PSSCR);
-	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
 
 #ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr, true);
+	srr1 = state->stop_handle(state, true);
 	__ppc64_runlatch_on();
 #else
 	/*
@@ -827,7 +942,7 @@ static unsigned long power9_offline_stop(struct pnv_idle_states_t *state)
 	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_IDLE;
 
 	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr, false);
+	srr1 = state->stop_handle(state, false);
 	__ppc64_runlatch_on();
 
 	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_KERNEL;
@@ -844,17 +959,16 @@ static unsigned long power9_offline_stop(struct pnv_idle_states_t *state)
 
 void power9_idle_type(struct pnv_idle_states_t *state)
 {
-	unsigned long psscr;
 	unsigned long srr1;
 
 	if (!prep_irq_for_idle_irqsoff())
 		return;
 
-	psscr = mfspr(SPRN_PSSCR);
-	psscr = (psscr & ~state->psscr_mask) | state->psscr_val;
-
 	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr, true);
+	/* We will directly call the stop handle of the state
+	 * as we have the state being passed to the idle loop
+	 */
+	srr1 = state->stop_handle(state, true);
 	__ppc64_runlatch_on();
 
 	fini_irq_for_idle_irqsoff();
@@ -989,6 +1103,45 @@ unsigned long pnv_cpu_offline(unsigned int cpu)
 }
 #endif
 
+/* Define all the known versions that are compatible for the kernel */
+struct stop_version_t known_versions[] = {
+		{
+			.compat_version = "stop0_lite,v1",
+			.stop_handle	= power9_stop_lite
+		},
+		{
+			.compat_version = "stop0,v1",
+			.stop_handle	= power9_stop_shallow
+		},
+		{
+			.compat_version = "stop1,v1",
+			.stop_handle	= power9_stop_shallow
+		},
+		{
+			.compat_version = "stop2,v1",
+			.stop_handle	= power9_stop_shallow
+		},
+		{
+			.compat_version = "stop4,v1",
+			.stop_handle	= power9_stop_deep
+		},
+		{
+			.compat_version = "stop5,v1",
+			.stop_handle	= power9_stop_deep
+		},
+		{
+			.compat_version = "stop8,v1",
+			.stop_handle	= power9_stop_deep
+		},
+		{
+			.compat_version = "stop11,v1",
+			.stop_handle	= power9_stop_deep
+		},
+		{
+			.stop_handle	= NULL
+		}
+};
+
 /*
  * Power ISA 3.0 idle initialization.
  *
@@ -1202,6 +1355,70 @@ static void __init pnv_probe_idle_states(void)
 		supported_cpuidle_states |= pnv_idle_states[i].flags;
 }
 
+/* Parsing the new format of idle device tree */
+static int parse_stop_state(struct device_node *dt_node, int idx)
+{
+	const char *temp_str;
+	int rc;
+
+	if (!dt_node) {
+		pr_err("Invalid device_node\n");
+		return -EINVAL;
+	}
+
+	rc = of_property_read_string(dt_node, "name", &temp_str);
+	if (rc) {
+		pr_err("error reading names rc = %d\n", rc);
+		return -EINVAL;
+	}
+	strncpy(pnv_idle_states[idx].name, temp_str, PNV_IDLE_NAME_LEN);
+
+	rc = of_property_read_string(dt_node, "compatible", &temp_str);
+	if (rc) {
+		pr_err("error reading compatible version rc = %d\n", rc);
+		return -EINVAL;
+	}
+	strncpy(pnv_idle_states[idx].compat_version, temp_str,
+		PNV_VERSION_LEN);
+
+	rc = of_property_read_u32(dt_node, "residency-ns",
+				  &pnv_idle_states[idx].residency_ns);
+	if (rc) {
+		pr_err("error reading residency rc = %d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u32(dt_node, "latency-ns",
+				  &pnv_idle_states[idx].latency_ns);
+	if (rc) {
+		pr_err("error reading latency rc = %d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u64(dt_node, "flags",
+				  &pnv_idle_states[idx].flags);
+	if (rc) {
+		pr_err("error reading flags rc = %d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u64(dt_node, "psscr-mask",
+				  &pnv_idle_states[idx].psscr_mask);
+	if (rc) {
+		pr_err("error reading psscr-mask rc = %d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u64(dt_node, "psscr",
+				  &pnv_idle_states[idx].psscr_val);
+	if (rc) {
+		pr_err("error reading psscr rc = %d\n", rc);
+		return -EINVAL;
+	}
+
+	return 0;
+
+}
 /*
  * This function parses device-tree and populates all the information
  * into pnv_idle_states structure. It also sets up nr_pnv_idle_states
@@ -1210,8 +1427,9 @@ static void __init pnv_probe_idle_states(void)
 
 static int pnv_parse_cpuidle_dt(void)
 {
-	struct device_node *np;
+	struct device_node *np, *np1, *dt_node;
 	int nr_idle_states, i;
+	int additional_states = 0;
 	int rc = 0;
 	u32 *temp_u32;
 	u64 *temp_u64;
@@ -1225,8 +1443,14 @@ static int pnv_parse_cpuidle_dt(void)
 	nr_idle_states = of_property_count_u32_elems(np,
 						"ibm,cpu-idle-state-flags");
 
-	pnv_idle_states = kcalloc(nr_idle_states, sizeof(*pnv_idle_states),
-				  GFP_KERNEL);
+	np1 = of_find_node_by_path("/ibm,opal/power-mgt/ibm,idle-states");
+	if (np1) {
+		for_each_child_of_node(np1, dt_node)
+			additional_states++;
+	}
+	pr_info("states in new format : %d\n", additional_states);
+	pnv_idle_states = kcalloc(nr_idle_states + additional_states,
+				  sizeof(*pnv_idle_states), GFP_KERNEL);
 	temp_u32 = kcalloc(nr_idle_states, sizeof(u32),  GFP_KERNEL);
 	temp_u64 = kcalloc(nr_idle_states, sizeof(u64),  GFP_KERNEL);
 	temp_string = kcalloc(nr_idle_states, sizeof(char *),  GFP_KERNEL);
@@ -1305,8 +1529,39 @@ static int pnv_parse_cpuidle_dt(void)
 	for (i = 0; i < nr_idle_states; i++)
 		strlcpy(pnv_idle_states[i].name, temp_string[i],
 			PNV_IDLE_NAME_LEN);
+
 	nr_pnv_idle_states = nr_idle_states;
-	rc = 0;
+	/* Parsing node-based idle states device-tree format */
+	if (!np1) {
+		pr_info("dt does not contain ibm,idle_states");
+		goto out;
+	}
+	/* Parse each child node with appropriate parser_fn */
+	for_each_child_of_node(np1, dt_node) {
+		bool found_known_version = false;
+
+		for (i = 0; known_versions[i].stop_handle != NULL; i++) {
+			if (of_device_is_compatible(dt_node,
+					known_versions[i].compat_version)) {
+				rc = parse_stop_state(dt_node,
+						      nr_pnv_idle_states);
+				if (rc) {
+					pr_err("%s could not parse\n",
+					known_versions[i].compat_version);
+					continue;
+				}
+				found_known_version = true;
+				break;
+			}
+		}
+		if (!found_known_version) {
+			pr_info("Unsupported state, skipping all further state\n");
+			goto out;
+		}
+		pnv_idle_states[nr_pnv_idle_states].stop_handle =
+						known_versions[i].stop_handle;
+		nr_pnv_idle_states++;
+	}
 out:
 	kfree(temp_u32);
 	kfree(temp_u64);
-- 
2.17.1

