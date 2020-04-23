Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2E1B5A10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 13:09:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497F243H1CzDr7h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 21:09:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497DmN0LhczDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:57:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 497DmM49Ddz8sxp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:57:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 497DmM1HTZz9sSt; Thu, 23 Apr 2020 20:57:55 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 497DmL22Mvz9sSd
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 20:57:54 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NAW7WF093094
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 06:57:52 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmua8pbj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 06:57:51 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 23 Apr 2020 11:54:02 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Apr 2020 11:54:00 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03NAsssa1835434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 10:54:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E68342042;
 Thu, 23 Apr 2020 10:54:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04BE142041;
 Thu, 23 Apr 2020 10:54:51 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.176.162])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 10:54:50 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v8 3/3] Self save API integration
Date: Thu, 23 Apr 2020 16:24:38 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423105438.29034-1-psampat@linux.ibm.com>
References: <20200423105438.29034-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042310-0020-0000-0000-000003CD1C26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042310-0021-0000-0000-000022261C87
Message-Id: <20200423105438.29034-4-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_07:2020-04-22,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230078
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

The commit makes the self save API available outside the firmware by defining
an OPAL wrapper.
This wrapper has a similar interface to that of self restore and expects the
cpu pir, SPR number, minus the value of that SPR to be passed in its
paramters and returns OPAL_SUCCESS on success. It adds a device-tree
node signifying support for self-save after verifying the stop API
version compatibility.

The commit also documents both the self-save and the self-restore API
calls along with their working and usage.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 doc/opal-api/opal-slw-self-save-reg-181.rst |  51 ++++++++++
 doc/opal-api/opal-slw-set-reg-100.rst       |   5 +
 doc/power-management.rst                    |  48 +++++++++
 hw/slw.c                                    | 106 ++++++++++++++++++++
 include/opal-api.h                          |   3 +-
 include/p9_stop_api.H                       |  18 ++++
 include/skiboot.h                           |   3 +
 7 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 doc/opal-api/opal-slw-self-save-reg-181.rst

diff --git a/doc/opal-api/opal-slw-self-save-reg-181.rst b/doc/opal-api/opal-slw-self-save-reg-181.rst
new file mode 100644
index 00000000..f20e9b81
--- /dev/null
+++ b/doc/opal-api/opal-slw-self-save-reg-181.rst
@@ -0,0 +1,51 @@
+.. OPAL_SLW_SELF_SAVE_REG:
+
+OPAL_SLW_SELF_SAVE_REG
+======================
+
+.. code-block:: c
+
+   #define OPAL_SLW_SELF_SAVE_REG			181
+
+   int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
+
+:ref:`OPAL_SLW_SELF_SAVE_REG` is used to inform low-level firmware to save
+the current contents of the SPR before entering a state of loss and
+also restore the content back on waking up from a deep stop state.
+
+An OPAL call `OPAL_SLW_SET_REG` exists which is similar in function as
+saving and restoring the SPR, with one difference being that the value of the
+SPR must also be supplied in the parameters.
+Complete reference: doc/opal-api/opal-slw-set-reg-100.rst
+
+Parameters
+----------
+
+``uint64_t cpu_pir``
+  This parameter specifies the pir of the cpu for which the call is being made.
+``uint64_t sprn``
+  This parameter specifies the spr number as mentioned in p9_stop_api.H
+  The list of SPRs supported is as follows.
+	P9_STOP_SPR_DAWR,
+	P9_STOP_SPR_HSPRG0,
+	P9_STOP_SPR_LDBAR,
+	P9_STOP_SPR_LPCR,
+	P9_STOP_SPR_PSSCR,
+	P9_STOP_SPR_MSR,
+	P9_STOP_SPR_HRMOR,
+	P9_STOP_SPR_HMEER,
+	P9_STOP_SPR_PMCR,
+	P9_STOP_SPR_PTCR
+
+  The property "ibm,opal-self-save" is supplied to the device tree to advterise
+  support.
+
+Returns
+-------
+
+:ref:`OPAL_UNSUPPORTED`
+  If spr restore is not supported by pore engine.
+:ref:`OPAL_PARAMETER`
+  Invalid handle for the pir/chip
+:ref:`OPAL_SUCCESS`
+  On success
diff --git a/doc/opal-api/opal-slw-set-reg-100.rst b/doc/opal-api/opal-slw-set-reg-100.rst
index 2e8f1bd6..ee3e68ce 100644
--- a/doc/opal-api/opal-slw-set-reg-100.rst
+++ b/doc/opal-api/opal-slw-set-reg-100.rst
@@ -21,6 +21,11 @@ In Power 9, it uses p9_stop_save_cpureg(), api provided by self restore code,
 to inform the spr with their corresponding values with which they
 must be restored.
 
+An OPAL call `OPAL_SLW_SELF_SAVE_REG` exists which is similar in function
+saving and restoring the SPR, with one difference being that the value of the
+SPR doesn't need to be passed in the parameters, only with the SPR number
+the firmware can identify, save and restore the values for the same.
+Complete reference: doc/opal-api/opal-slw-self-save-reg-181.rst
 
 Parameters
 ----------
diff --git a/doc/power-management.rst b/doc/power-management.rst
index 76491a71..d6bd5358 100644
--- a/doc/power-management.rst
+++ b/doc/power-management.rst
@@ -15,3 +15,51 @@ On boot, specific stop states can be disabled via setting a mask. For example,
 to disable all but stop 0,1,2, use ~0xE0000000. ::
 
   nvram -p ibm,skiboot --update-config opal-stop-state-disable-mask=0x1FFFFFFF
+
+Saving and restoring Special Purpose Registers(SPRs)
+----------------------------------------------------
+
+When a CPU wakes up from a deep stop state which can result in
+hypervisor state loss, all the SPRs are lost. The Linux Kernel expects
+a small set of SPRs to contain an expected value when the CPU wakes up
+from such a deep stop state. The microcode firmware provides the
+following two APIs, collectively known as the stop-APIs, to allow the
+kernel/OPAL to specify this set of SPRs and the value that they need
+to be restored with on waking up from a deep stop state.
+
+Self-restore:
+int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val);
+The SPR number and the value of the that SPR must be restored with on
+wakeup from the deep-stop state must be specified. When this call is
+made, the microcode inserts instruction into the HOMER region to
+restore the content of the SPR to the specified value on wakeup from a
+deep-stop state. These instructions are executed by the CPU as soon as
+it wakes up from a deep stop state. The call is to be made once per
+SPR.
+
+Self-Save:
+int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
+Only the SPR number needs to be specified. When this call is made, the
+microcode inserts instructions into the HOMER region to save the
+current value of the SPR before the CPU goes to a deep stop state, and
+restores the value back when the CPU wakes up from a deep stop state.
+These instructions are correspondingly executed just before and after
+the CPU goes/comes out of a deep stop state. This call can be made
+once per SPR.
+
+The key difference between self-save and self-restore is the
+use-case. If the Kernel expects the SPR to contain a particular value
+on waking up from a deep-stop state, that wasn't the value of that SPR
+before entering deep stop-state, then self-restore is preferable.
+Also in a case where SPR does not change across the lifetime
+self-restore is more efficient as when the value is same the memeory location
+is not updated.
+
+When deep stop states are to be supported in an Ultravisor
+environment, since HOMER is in a secure region, the stop-api cannot
+update the HOMER if invoked from a context when the OPAL/Kernel is
+executing without the ultravisor privilege. In this scenario, at the
+time of early OPAL boot, while OPAL has ultravisor privileges, it can
+make the self-save stop-api call for all the supported SPRs, so that
+the microcode in the HOMER will always save and restore all the
+supported SPRs during entry/exit from a deep stop state.
diff --git a/hw/slw.c b/hw/slw.c
index beb129a8..8423eeaf 100644
--- a/hw/slw.c
+++ b/hw/slw.c
@@ -35,6 +35,43 @@ static bool slw_current_le = false;
 enum wakeup_engine_states wakeup_engine_state = WAKEUP_ENGINE_NOT_PRESENT;
 bool has_deep_states = false;
 
+/**
+ * The struct and SPR list is partially consistent with libpore/p9_stop_api.c
+ */
+/**
+ * @brief summarizes attributes associated with a SPR register.
+ */
+typedef struct
+{
+    uint32_t iv_sprId;
+    bool     iv_isThreadScope;
+    uint32_t iv_saveMaskPos;
+
+} StopSprReg_t;
+
+/**
+ * @brief a true in the table below means register is of scope thread
+ * whereas a false meanse register is of scope core.
+ * The number is the bit position on a uint32_t mask
+ */
+
+static const StopSprReg_t g_sprRegister[] =
+{
+	{ P9_STOP_SPR_DAWR,      true,  1   },
+	{ P9_STOP_SPR_HSPRG0,    true,  3   },
+	{ P9_STOP_SPR_LDBAR,     true,  4,  },
+	{ P9_STOP_SPR_LPCR,      true,  5   },
+	{ P9_STOP_SPR_PSSCR,     true,  6   },
+	{ P9_STOP_SPR_MSR,       true,  7   },
+	{ P9_STOP_SPR_HRMOR,     false, 255 },
+	{ P9_STOP_SPR_HID,       false, 21  },
+	{ P9_STOP_SPR_HMEER,     false, 22  },
+	{ P9_STOP_SPR_PMCR,      false, 23  },
+	{ P9_STOP_SPR_PTCR,      false, 24  },
+};
+
+static const uint32_t MAX_SPR_SUPPORTED	= ARRAY_SIZE(g_sprRegister);
+
 DEFINE_LOG_ENTRY(OPAL_RC_SLW_INIT, OPAL_PLATFORM_ERR_EVT, OPAL_SLW,
 		 OPAL_PLATFORM_FIRMWARE, OPAL_PREDICTIVE_ERR_GENERAL,
 		 OPAL_NA);
@@ -720,11 +757,14 @@ void add_cpu_idle_state_properties(void)
 	struct cpu_idle_states *states;
 	struct proc_chip *chip;
 	int nr_states;
+	int rc;
 
 	bool can_sleep = true;
 	bool has_stop_inst = false;
+	bool has_self_save = true;
 	u8 i;
 
+	u64 compVector = -1;
 	fdt64_t *pm_ctrl_reg_val_buf;
 	fdt64_t *pm_ctrl_reg_mask_buf;
 	u32 supported_states_mask;
@@ -766,6 +806,20 @@ void add_cpu_idle_state_properties(void)
 	 */
 	chip = next_chip(NULL);
 	assert(chip);
+	rc = proc_stop_api_discover_capability((void *) chip->homer_base,
+					       &compVector);
+	if (rc == STOP_SAVE_ARG_INVALID_IMG) {
+		prlog(PR_DEBUG, "HOMER BASE INVALID\n");
+		return;
+	} else if (rc == STOP_SAVE_API_IMG_INCOMPATIBLE) {
+		prlog(PR_DEBUG, "STOP API running incompatible versions\n");
+		if ((compVector & SELF_RESTORE_VER_MISMATCH) == 0) {
+			prlog(PR_DEBUG, "Self-save API unsupported\n");
+			has_self_save = false;
+		}
+	}
+	if (has_self_save)
+		dt_add_property(power_mgt, "ibm,opal-self-save", NULL, 0);
 	if (chip->type == PROC_CHIP_P9_NIMBUS ||
 	    chip->type == PROC_CHIP_P9_CUMULUS ||
 	    chip->type == PROC_CHIP_P9P) {
@@ -1446,6 +1500,58 @@ int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val)
 
 opal_call(OPAL_SLW_SET_REG, opal_slw_set_reg, 3);
 
+int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn)
+{
+	struct cpu_thread * c = find_cpu_by_pir(cpu_pir);
+	uint32_t save_reg_vector = 0;
+	struct proc_chip * chip;
+	int rc;
+	int index;
+
+	if (!c) {
+		prlog(PR_DEBUG, "SLW: Unknown thread with pir %x\n",
+		      (u32) cpu_pir);
+		return OPAL_PARAMETER;
+	}
+
+	chip = get_chip(c->chip_id);
+	if (!chip) {
+		prlog(PR_DEBUG, "SLW: Unknown chip for thread with pir %x\n",
+		      (u32) cpu_pir);
+		return OPAL_PARAMETER;
+	}
+	if (proc_gen != proc_gen_p9 || !has_deep_states) {
+		prlog(PR_DEBUG, "SLW: Self-save feature unsupported\n");
+		return OPAL_UNSUPPORTED;
+	}
+	if (wakeup_engine_state != WAKEUP_ENGINE_PRESENT) {
+		log_simple_error(&e_info(OPAL_RC_SLW_REG),
+			"SLW: wakeup_engine in bad state=%d chip=%x\n",
+			wakeup_engine_state, chip->id);
+		return OPAL_INTERNAL_ERROR;
+	}
+	for (index = 0; index < MAX_SPR_SUPPORTED; ++index) {
+		if (sprn == (CpuReg_t) g_sprRegister[index].iv_sprId) {
+			save_reg_vector = PPC_BIT32(
+				g_sprRegister[index].iv_saveMaskPos);
+			break;
+		}
+	}
+	if (save_reg_vector == 0)
+		return OPAL_INTERNAL_ERROR;
+	rc = p9_stop_save_cpureg_control((void *) chip->homer_base,
+						cpu_pir, save_reg_vector);
+
+	if (rc) {
+		log_simple_error(&e_info(OPAL_RC_SLW_REG),
+			"SLW: Failed to save vector %x for CPU %x\n",
+			save_reg_vector, c->pir);
+		return OPAL_INTERNAL_ERROR;
+	}
+	return OPAL_SUCCESS;
+}
+opal_call(OPAL_SLW_SELF_SAVE_REG, opal_slw_self_save_reg, 2);
+
 void slw_init(void)
 {
 	struct proc_chip *chip;
diff --git a/include/opal-api.h b/include/opal-api.h
index e90cab1e..1607a89b 100644
--- a/include/opal-api.h
+++ b/include/opal-api.h
@@ -227,7 +227,8 @@
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
 #define OPAL_PHB_SET_OPTION			179
 #define OPAL_PHB_GET_OPTION			180
-#define OPAL_LAST				180
+#define OPAL_SLW_SELF_SAVE_REG			181
+#define OPAL_LAST				181
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
diff --git a/include/p9_stop_api.H b/include/p9_stop_api.H
index cb5ffd6f..09ce3dc1 100644
--- a/include/p9_stop_api.H
+++ b/include/p9_stop_api.H
@@ -34,6 +34,8 @@
 ///
 /// @file   p9_stop_api.H
 /// @brief  describes STOP API which  create/manipulate STOP image.
+///         This header need not be consistent, however is a subset of the
+///         libpore/p9_stop_api.H counterpart
 ///
 // *HWP HW Owner    :  Greg Still <stillgs@us.ibm.com>
 // *HWP FW Owner    :  Prem Shanker Jha <premjha2@in.ibm.com>
@@ -58,6 +60,7 @@ typedef enum
     P9_STOP_SPR_HRMOR   =    313,   // core register
     P9_STOP_SPR_LPCR    =    318,   // thread register
     P9_STOP_SPR_HMEER   =    337,   // core register
+    P9_STOP_SPR_PTCR    =    464,   // core register
     P9_STOP_SPR_LDBAR   =    850,   // thread register
     P9_STOP_SPR_PSSCR   =    855,   // thread register
     P9_STOP_SPR_PMCR    =    884,   // core register
@@ -247,6 +250,21 @@ StopReturnCode_t p9_stop_save_scom( void* const   i_pImage,
                                     const ScomOperation_t i_operation,
                                     const ScomSection_t i_section );
 
+/**
+ * @brief       Facilitates self save and restore of a list of SPRs of a thread.
+ * @param[in]   i_pImage        points to the start of HOMER image of P9 chip.
+ * @param[in]   i_pir           PIR associated with thread
+ * @param[in]   i_saveRegVector bit vector representing SPRs that needs to be restored.
+ * @return      STOP_SAVE_SUCCESS if API succeeds, error code otherwise.
+ * @note        SPR save vector is a bit vector. For each SPR supported,
+ *              there is an associated bit position in the bit vector.Refer
+ *              to definition of SprBitPositionList_t to determine bit position
+ *              associated with a particular SPR.
+ */
+StopReturnCode_t
+p9_stop_save_cpureg_control( void* i_pImage, const uint64_t i_pir,
+                             const uint32_t  i_saveRegVector );
+
 /**
  * @brief       verifies if API is compatible of current HOMER image.
  * @param[in]   i_pImage        points to the start of HOMER image of P9 chip.
diff --git a/include/skiboot.h b/include/skiboot.h
index 30ff500c..9ced240e 100644
--- a/include/skiboot.h
+++ b/include/skiboot.h
@@ -306,6 +306,9 @@ extern void nx_p9_rng_late_init(void);
 /* SLW reinit function for switching core settings */
 extern int64_t slw_reinit(uint64_t flags);
 
+/* Self save SPR before entering the stop state */
+extern int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
+
 /* Patch SPR in SLW image */
 extern int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val);
 
-- 
2.25.1

