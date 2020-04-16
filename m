Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954591ABAF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:18:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492sY10pLDzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492s1f3RSNzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492s1d6p9tz9BYx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:54:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492s1d5mW0z9sSG; Thu, 16 Apr 2020 17:54:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 492s1c75H9z9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 17:54:12 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G7ZBUG054322
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:54:11 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30egk9mq69-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:54:11 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 16 Apr 2020 08:53:31 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Apr 2020 08:53:28 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03G7s5bU52887744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 07:54:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 374F7AE058;
 Thu, 16 Apr 2020 07:54:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 603D4AE04D;
 Thu, 16 Apr 2020 07:54:03 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.182.109])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 07:54:03 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v7 2/3] powerpc/powernv: Introduce support and parsing for
 self-save API
Date: Thu, 16 Apr 2020 13:23:57 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416075358.75155-1-psampat@linux.ibm.com>
References: <20200416075358.75155-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041607-0016-0000-0000-00000305778E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041607-0017-0000-0000-000033697A2D
Message-Id: <20200416075358.75155-3-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_02:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160050
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit introduces and leverages the Self save API. The difference
between self-save and self-restore is that the value to be saved for the
SPR does not need to be passed to the call.

Add the new Self Save OPAL API call in the list of OPAL calls.
Implement the self saving of the SPRs based on the support populated.
This commit prefers the self-save over self-restore in case both are
supported for a particular SPR.

Along with support for self-save, kernel supported save restore is also
populated in the list. This property is only populated for those SPRs
which encapsulate support from the kernel and have the possibility to
garner support from a firmware mode too.

In addition, the commit also parses the device tree for nodes self-save,
self-restore and populate support for the preferred SPRs based on what
was advertised by the device tree.

In the case a SPR is supported by the firmware self-save, self-restore
and kernel save restore then the preference of execution is also in the
same order as above.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 .../bindings/powerpc/opal/power-mgt.txt       |  18 +++
 arch/powerpc/include/asm/opal-api.h           |   3 +-
 arch/powerpc/include/asm/opal.h               |   1 +
 arch/powerpc/platforms/powernv/idle.c         | 135 +++++++++++++++++-
 arch/powerpc/platforms/powernv/opal-call.c    |   1 +
 5 files changed, 150 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt b/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt
index 9d619e955576..5fb03c6d7de9 100644
--- a/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt
+++ b/Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt
@@ -116,3 +116,21 @@ otherwise. The length of all the property arrays must be the same.
 	which of the fields of the PMICR are set in the corresponding
 	entries in ibm,cpu-idle-state-pmicr. This is an optional
 	property on POWER8 and is absent on POWER9.
+
+- self-restore:
+ Array of unsigned 64-bit values containing a property for sprn-mask
+ with each bit indicating the index of the supported SPR for the
+ functionality. This is an optional property for both Power8 and Power9
+
+- self-save:
+  Array of unsigned 64-bit values containing a property for sprn-mask
+  with each bit indicating the index of the supported SPR for the
+  functionality. This is an optional property for both Power8 and Power9
+
+Example of arrangement of self-restore and self-save arrays:
+For instance if PSSCR is supported, the value is 0x357 = 855.
+Since the array is of 64 bit values, the index of the array is determined by
+855 / 64 = 13th element. Within that index, the bit number is determined by
+855 % 64 = 23rd bit.
+This means that if the 23rd bit in array[13] is set, then that SPR is supported
+by the corresponding self-save or self-restore API.
diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 1dffa3cb16ba..7ba698369083 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -214,7 +214,8 @@
 #define OPAL_SECVAR_GET				176
 #define OPAL_SECVAR_GET_NEXT			177
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
-#define OPAL_LAST				178
+#define OPAL_SLW_SELF_SAVE_REG			181
+#define OPAL_LAST				181
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..a370b0e8d899 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -204,6 +204,7 @@ int64_t opal_handle_hmi2(__be64 *out_flags);
 int64_t opal_register_dump_region(uint32_t id, uint64_t start, uint64_t end);
 int64_t opal_unregister_dump_region(uint32_t id);
 int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val);
+int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
 int64_t opal_config_cpu_idle_state(uint64_t state, uint64_t flag);
 int64_t opal_pci_set_phb_cxl_mode(uint64_t phb_id, uint64_t mode, uint64_t pe_number);
 int64_t opal_pci_get_pbcq_tunnel_bar(uint64_t phb_id, uint64_t *addr);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 858ceb86394d..fdcb18a8a05b 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -35,13 +35,20 @@
 /*
  * Type of support for each SPR
  * FIRMWARE_RESTORE: firmware restoration supported: calls self-restore OPAL API
+ * FIRMWARE_SELF_SAVE: firmware save and restore: calls self-save OPAL API
+ * KERNEL_SAVE_RESTORE: kernel handles the saving and restoring of SPR
  */
 #define UNSUPPORTED           0x0
 #define FIRMWARE_RESTORE      0x1
+#define FIRMWARE_SELF_SAVE    0x2
+#define KERNEL_SAVE_RESTORE   0x4
 
 static u32 supported_cpuidle_states;
 struct pnv_idle_states_t *pnv_idle_states;
 int nr_pnv_idle_states;
+/* Caching the lpcr & ptcr support to use later */
+DEFINE_STATIC_KEY_FALSE(is_lpcr_self_save);
+DEFINE_STATIC_KEY_FALSE(is_ptcr_self_save);
 
 struct preferred_sprs {
 	u64 spr;
@@ -51,6 +58,10 @@ struct preferred_sprs {
 /*
  * Supported mode: Default support. Can be overwritten during system
  *		   initialization
+ * Note: SPRs with support for KERNEL_SAVE_RESTORE in this list are only those
+ * which have a possibility of support from another firmware mode (i.e self-save
+ * or self-restore)
+ * SPRs with exclusive kernel save support are implicit.
  */
 struct preferred_sprs preferred_sprs[] = {
 	{
@@ -61,6 +72,10 @@ struct preferred_sprs preferred_sprs[] = {
 		.spr = SPRN_LPCR,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
+	{
+		.spr = SPRN_PTCR,
+		.supported_mode = KERNEL_SAVE_RESTORE,
+	},
 	{
 		.spr = SPRN_HMEER,
 		.supported_mode = FIRMWARE_RESTORE,
@@ -219,11 +234,33 @@ static int pnv_self_save_restore_sprs(void)
 			     curr_spr.spr == SPRN_HID4  ||
 			     curr_spr.spr == SPRN_HID5))
 				continue;
-			if (curr_spr.supported_mode & FIRMWARE_RESTORE) {
+
+			if (curr_spr.supported_mode & FIRMWARE_SELF_SAVE) {
+				rc = opal_slw_self_save_reg(pir,
+							curr_spr.spr);
+				if (rc != 0)
+					return rc;
+				switch (curr_spr.spr) {
+				case SPRN_LPCR:
+					static_branch_enable(&is_lpcr_self_save);
+					break;
+				case SPRN_PTCR:
+					static_branch_enable(&is_ptcr_self_save);
+					break;
+				}
+			} else if (curr_spr.supported_mode & FIRMWARE_RESTORE) {
 				rc = pnv_self_restore_sprs(pir, cpu,
 							   curr_spr.spr);
 				if (rc != 0)
 					return rc;
+			} else {
+				if (curr_spr.supported_mode & KERNEL_SAVE_RESTORE ||
+				    (cpu_has_feature(CPU_FTR_ARCH_300) &&
+				     (curr_spr.spr == SPRN_HID1 ||
+				      curr_spr.spr == SPRN_HID4 ||
+				      curr_spr.spr == SPRN_HID5)))
+					continue;
+				return OPAL_UNSUPPORTED;
 			}
 		}
 	}
@@ -762,7 +799,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
 	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
-		sprs.lpcr	= mfspr(SPRN_LPCR);
+		if (!static_branch_unlikely(&is_lpcr_self_save))
+			sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
 		sprs.fscr	= mfspr(SPRN_FSCR);
 		sprs.pid	= mfspr(SPRN_PID);
@@ -776,7 +814,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		sprs.mmcr1	= mfspr(SPRN_MMCR1);
 		sprs.mmcr2	= mfspr(SPRN_MMCR2);
 
-		sprs.ptcr	= mfspr(SPRN_PTCR);
+		if (!static_branch_unlikely(&is_ptcr_self_save))
+			sprs.ptcr	= mfspr(SPRN_PTCR);
 		sprs.rpr	= mfspr(SPRN_RPR);
 		sprs.tscr	= mfspr(SPRN_TSCR);
 		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
@@ -860,7 +899,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		goto core_woken;
 
 	/* Per-core SPRs */
-	mtspr(SPRN_PTCR,	sprs.ptcr);
+	if (!static_branch_unlikely(&is_ptcr_self_save))
+		mtspr(SPRN_PTCR,	sprs.ptcr);
 	mtspr(SPRN_RPR,		sprs.rpr);
 	mtspr(SPRN_TSCR,	sprs.tscr);
 
@@ -881,7 +921,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	atomic_unlock_and_stop_thread_idle();
 
 	/* Per-thread SPRs */
-	mtspr(SPRN_LPCR,	sprs.lpcr);
+	if (!static_branch_unlikely(&is_lpcr_self_save))
+		mtspr(SPRN_LPCR,	sprs.lpcr);
 	mtspr(SPRN_HFSCR,	sprs.hfscr);
 	mtspr(SPRN_FSCR,	sprs.fscr);
 	mtspr(SPRN_PID,		sprs.pid);
@@ -1060,8 +1101,10 @@ void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
 	 * Program the LPCR via stop-api only if the deepest stop state
 	 * can lose hypervisor context.
 	 */
-	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT)
-		opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
+	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT) {
+		if (!static_branch_unlikely(&is_lpcr_self_save))
+			opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
+	}
 }
 
 /*
@@ -1316,6 +1359,81 @@ static void __init pnv_probe_idle_states(void)
 		supported_cpuidle_states |= pnv_idle_states[i].flags;
 }
 
+/*
+ * Extracts and populates the self save or restore capabilities
+ * passed from the device tree node
+ * @np: /ibm,opal/power-mgt/self-save or
+ *      /ibm,opal/power-mgt/self-restore device node
+ * @support: Activation bit for each SPR to define support for the save-restore
+ *           mode
+ */
+static int extract_save_restore_state_dt(struct device_node *np, u32 support)
+{
+	int nr_sprns = 0, i, bitmask_index;
+	u64 *temp_u64;
+	u64 bit_pos;
+
+	nr_sprns = of_property_count_u64_elems(np, "sprn-bitmask");
+	if (nr_sprns <= 0)
+		return -EINVAL;
+	temp_u64 = kcalloc(nr_sprns, sizeof(u64), GFP_KERNEL);
+	if (of_property_read_u64_array(np, "sprn-bitmask",
+				       temp_u64, nr_sprns)) {
+		pr_warn("cpuidle-powernv: failed to find registers in DT\n");
+		kfree(temp_u64);
+		return -EINVAL;
+	}
+	/*
+	 * Populate acknowledgment of support for the sprs in the global vector
+	 * gotten by the registers supplied by the firmware.
+	 * The registers are in a bitmask, bit index within
+	 * that specifies the SPR
+	 */
+	for (i = 0; i < nr_preferred_sprs; i++) {
+		bitmask_index = BIT_ULL_WORD(preferred_sprs[i].spr);
+		bit_pos = BIT_ULL_MASK(preferred_sprs[i].spr);
+		if ((temp_u64[bitmask_index] & bit_pos) == 0) {
+			preferred_sprs[i].supported_mode &= ~support;
+			continue;
+		}
+		preferred_sprs[i].supported_mode |= support;
+	}
+
+	kfree(temp_u64);
+	return 0;
+}
+
+static int pnv_parse_deepstate_dt(void)
+{
+	struct device_node *np;
+	int rc = 0, i;
+
+	/*
+	 * Self restore register population
+	 * In the case the node is not found, the support for self-restore for
+	 * already populated SPRs is *not* cut. This is because self-restore
+	 * assumes legacy support. In an event, self-restore is actually not
+	 * supported then the call to the firmware fails and deep stop states
+	 * will be cut.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "ibm,opal-self-restore");
+	if (np) {
+		rc = extract_save_restore_state_dt(np, FIRMWARE_RESTORE);
+		if (rc != 0)
+			return rc;
+	}
+	/* Self save register population */
+	np = of_find_compatible_node(NULL, NULL, "ibm,opal-self-save");
+	if (!np) {
+		for (i = 0; i < nr_preferred_sprs; i++)
+			preferred_sprs[i].supported_mode &= ~FIRMWARE_SELF_SAVE;
+	} else {
+		rc = extract_save_restore_state_dt(np, FIRMWARE_SELF_SAVE);
+	}
+	of_node_put(np);
+	return rc;
+}
+
 /*
  * This function parses device-tree and populates all the information
  * into pnv_idle_states structure. It also sets up nr_pnv_idle_states
@@ -1464,6 +1582,9 @@ static int __init pnv_init_idle_states(void)
 		return rc;
 	pnv_probe_idle_states();
 
+	rc = pnv_parse_deepstate_dt();
+	if (rc)
+		return rc;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 		if (!(supported_cpuidle_states & OPAL_PM_SLEEP_ENABLED_ER1)) {
 			power7_fastsleep_workaround_entry = false;
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..11e0ceb90de0 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -223,6 +223,7 @@ OPAL_CALL(opal_handle_hmi,			OPAL_HANDLE_HMI);
 OPAL_CALL(opal_handle_hmi2,			OPAL_HANDLE_HMI2);
 OPAL_CALL(opal_config_cpu_idle_state,		OPAL_CONFIG_CPU_IDLE_STATE);
 OPAL_CALL(opal_slw_set_reg,			OPAL_SLW_SET_REG);
+OPAL_CALL(opal_slw_self_save_reg,		OPAL_SLW_SELF_SAVE_REG);
 OPAL_CALL(opal_register_dump_region,		OPAL_REGISTER_DUMP_REGION);
 OPAL_CALL(opal_unregister_dump_region,		OPAL_UNREGISTER_DUMP_REGION);
 OPAL_CALL(opal_pci_set_phb_cxl_mode,		OPAL_PCI_SET_PHB_CAPI_MODE);
-- 
2.17.1

