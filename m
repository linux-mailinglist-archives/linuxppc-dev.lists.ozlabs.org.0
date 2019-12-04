Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AD1127A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 10:35:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SYc118c6zDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 20:35:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SYYj2SfyzDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 20:33:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47SYYh0sYcz8stv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 20:33:12 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47SYYh03Gnz9sRH; Wed,  4 Dec 2019 20:33:12 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47SYYg28ptz9sRC
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Dec 2019 20:33:11 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB49Vpwo030408
 for <linuxppc-dev@ozlabs.org>; Wed, 4 Dec 2019 04:33:08 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnsvhth44-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 04 Dec 2019 04:33:07 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Wed, 4 Dec 2019 09:33:06 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Dec 2019 09:33:04 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB49X24D36503582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 09:33:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AF7EA405C;
 Wed,  4 Dec 2019 09:33:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4DF7A4054;
 Wed,  4 Dec 2019 09:32:59 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.83.83])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Dec 2019 09:32:59 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 svaidy@linux.ibm.com, ego@linux.vnet.ibm.com, linuxram@us.ibm.com,
 psampat@linux.ibm.com, pratik.sampat@in.ibm.com
Subject: [RFC 1/3] powerpc/powernv: Interface to define support and preference
 for a SPR
Date: Wed,  4 Dec 2019 15:02:53 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191204093255.11849-1-psampat@linux.ibm.com>
References: <20191204093255.11849-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120409-0016-0000-0000-000002D0E227
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120409-0017-0000-0000-00003332E0AA
Message-Id: <20191204093255.11849-2-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_02:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912040073
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

Define a bitmask interface to determine support for the Self Restore,
Self Save or both.

Also define an interface to determine the preference of that SPR to
be strictly saved or restored or encapsulated with an order of preference.

The preference bitmask is shown as below:
----------------------------
|... | 2nd pref | 1st pref |
----------------------------
MSB			  LSB

The preference from higher to lower is from LSB to MSB with a shift of 8
bits.
Example:
Prefer self save first, if not available then prefer self
restore
The preference mask for this scenario will be seen as below.
((SELF_RESTORE_STRICT << PREFERENCE_SHIFT) | SELF_SAVE_STRICT)
---------------------------------
|... | Self restore | Self save |
---------------------------------
MSB			        LSB

Finally, declare a list of preferred SPRs which encapsulate the bitmaks
for preferred and supported with defaults of both being set to support
legacy firmware.

This commit also implements using the above interface and retains the
legacy functionality of self restore.

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 325 +++++++++++++++++++++-----
 1 file changed, 269 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 78599bca66c2..d38b8b6dcbce 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -32,9 +32,106 @@
 #define P9_STOP_SPR_MSR 2000
 #define P9_STOP_SPR_PSSCR      855
 
+/* Interface for the stop state supported and preference */
+#define SELF_RESTORE_TYPE    0
+#define SELF_SAVE_TYPE       1
+
+#define NR_PREFERENCES    2
+#define PREFERENCE_SHIFT  8
+#define PREFERENCE_MASK   0xff
+
+#define UNSUPPORTED         0x0
+#define SELF_RESTORE_STRICT 0x01
+#define SELF_SAVE_STRICT    0x10
+
+/*
+ * Bitmask defining the kind of preferences available.
+ * Note : The higher to lower preference is from LSB to MSB, with a shift of
+ * 8 bits.
+ * ----------------------------
+ * |    | 2nd pref | 1st pref |
+ * ----------------------------
+ * MSB			      LSB
+ */
+/* Prefer Restore if available, otherwise unsupported */
+#define PREFER_SELF_RESTORE_ONLY	SELF_RESTORE_STRICT
+/* Prefer Save if available, otherwise unsupported */
+#define PREFER_SELF_SAVE_ONLY		SELF_SAVE_STRICT
+/* Prefer Restore when available, otherwise prefer Save */
+#define PREFER_RESTORE_SAVE		((SELF_SAVE_STRICT << \
+					  PREFERENCE_SHIFT)\
+					  | SELF_RESTORE_STRICT)
+/* Prefer Save when available, otherwise prefer Restore*/
+#define PREFER_SAVE_RESTORE		((SELF_RESTORE_STRICT <<\
+					  PREFERENCE_SHIFT)\
+					  | SELF_SAVE_STRICT)
 static u32 supported_cpuidle_states;
 struct pnv_idle_states_t *pnv_idle_states;
 int nr_pnv_idle_states;
+/* Caching the lpcr & ptcr support to use later */
+static bool is_lpcr_self_save;
+static bool is_ptcr_self_save;
+
+struct preferred_sprs {
+	u64 spr;
+	u32 preferred_mode;
+	u32 supported_mode;
+};
+
+struct preferred_sprs preferred_sprs[] = {
+	{
+		.spr = SPRN_HSPRG0,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_LPCR,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_PTCR,
+		.preferred_mode = PREFER_SAVE_RESTORE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_HMEER,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_HID0,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = P9_STOP_SPR_MSR,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = P9_STOP_SPR_PSSCR,
+		.preferred_mode = PREFER_SAVE_RESTORE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_HID1,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_HID4,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	},
+	{
+		.spr = SPRN_HID5,
+		.preferred_mode = PREFER_RESTORE_SAVE,
+		.supported_mode = SELF_RESTORE_STRICT,
+	}
+};
+
+const int nr_preferred_sprs = ARRAY_SIZE(preferred_sprs);
 
 /*
  * The default stop state that will be used by ppc_md.power_save
@@ -61,78 +158,187 @@ static bool deepest_stop_found;
 
 static unsigned long power7_offline_type;
 
-static int pnv_save_sprs_for_deep_states(void)
+static int pnv_self_restore_sprs(u64 pir, int cpu, u64 spr)
 {
-	int cpu;
+	u64 reg_val;
 	int rc;
 
-	/*
-	 * hid0, hid1, hid4, hid5, hmeer and lpcr values are symmetric across
-	 * all cpus at boot. Get these reg values of current cpu and use the
-	 * same across all cpus.
-	 */
-	uint64_t lpcr_val	= mfspr(SPRN_LPCR);
-	uint64_t hid0_val	= mfspr(SPRN_HID0);
-	uint64_t hid1_val	= mfspr(SPRN_HID1);
-	uint64_t hid4_val	= mfspr(SPRN_HID4);
-	uint64_t hid5_val	= mfspr(SPRN_HID5);
-	uint64_t hmeer_val	= mfspr(SPRN_HMEER);
-	uint64_t msr_val = MSR_IDLE;
-	uint64_t psscr_val = pnv_deepest_stop_psscr_val;
-
-	for_each_present_cpu(cpu) {
-		uint64_t pir = get_hard_smp_processor_id(cpu);
-		uint64_t hsprg0_val = (uint64_t)paca_ptrs[cpu];
-
-		rc = opal_slw_set_reg(pir, SPRN_HSPRG0, hsprg0_val);
+	switch (spr) {
+	case SPRN_HSPRG0:
+		reg_val = (uint64_t)paca_ptrs[cpu];
+		rc = opal_slw_set_reg(pir, SPRN_HSPRG0, reg_val);
 		if (rc != 0)
 			return rc;
-
-		rc = opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
+		break;
+	case SPRN_LPCR:
+		reg_val = mfspr(SPRN_LPCR);
+		rc = opal_slw_set_reg(pir, SPRN_LPCR, reg_val);
 		if (rc != 0)
 			return rc;
-
+		break;
+	case P9_STOP_SPR_MSR:
+		reg_val = MSR_IDLE;
 		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, msr_val);
+			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, reg_val);
 			if (rc)
 				return rc;
-
-			rc = opal_slw_set_reg(pir,
-					      P9_STOP_SPR_PSSCR, psscr_val);
-
+		}
+		break;
+	case P9_STOP_SPR_PSSCR:
+		reg_val = pnv_deepest_stop_psscr_val;
+		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+			rc = opal_slw_set_reg(pir, P9_STOP_SPR_PSSCR, reg_val);
 			if (rc)
 				return rc;
 		}
-
-		/* HIDs are per core registers */
+		break;
+	case SPRN_HMEER:
+		reg_val = mfspr(SPRN_HMEER);
 		if (cpu_thread_in_core(cpu) == 0) {
-
-			rc = opal_slw_set_reg(pir, SPRN_HMEER, hmeer_val);
-			if (rc != 0)
+			rc = opal_slw_set_reg(pir, SPRN_HMEER, reg_val);
+			if (rc)
 				return rc;
-
-			rc = opal_slw_set_reg(pir, SPRN_HID0, hid0_val);
-			if (rc != 0)
+		}
+		break;
+	case SPRN_HID0:
+		reg_val = mfspr(SPRN_HID0);
+		if (cpu_thread_in_core(cpu) == 0) {
+			rc = opal_slw_set_reg(pir, SPRN_HID0, reg_val);
+			if (rc)
 				return rc;
+		}
+		break;
+	case SPRN_HID1:
+		reg_val = mfspr(SPRN_HID1);
+		if (cpu_thread_in_core(cpu) == 0 &&
+		    !cpu_has_feature(CPU_FTR_ARCH_300)) {
+			rc = opal_slw_set_reg(pir, SPRN_HID1, reg_val);
+			if (rc)
+				return rc;
+		}
+		break;
+	case SPRN_HID4:
+		reg_val = mfspr(SPRN_HID4);
+		if (cpu_thread_in_core(cpu) == 0 &&
+		    !cpu_has_feature(CPU_FTR_ARCH_300)) {
+			rc = opal_slw_set_reg(pir, SPRN_HID4, reg_val);
+			if (rc)
+				return rc;
+		}
+		break;
+	case SPRN_HID5:
+		reg_val = mfspr(SPRN_HID5);
+		if (cpu_thread_in_core(cpu) == 0 &&
+		    !cpu_has_feature(CPU_FTR_ARCH_300)) {
+			rc = opal_slw_set_reg(pir, SPRN_HID5, reg_val);
+			if (rc)
+				return rc;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
 
-			/* Only p8 needs to set extra HID regiters */
-			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
-
-				rc = opal_slw_set_reg(pir, SPRN_HID1, hid1_val);
-				if (rc != 0)
-					return rc;
+static int pnv_self_save_restore_sprs(void)
+{
+	int rc, index, cpu, k;
+	u64 pir;
+	struct preferred_sprs curr_spr;
+	bool is_initialized;
+	u32 preferred;
+
+	is_lpcr_self_save = false;
+	is_ptcr_self_save = false;
+	for_each_present_cpu(cpu) {
+		pir = get_hard_smp_processor_id(cpu);
+		for (index = 0; index < nr_preferred_sprs; index++) {
+			curr_spr = preferred_sprs[index];
+			is_initialized = false;
+			/*
+			 * Go through each of the preferences
+			 * Check if it is preferred as well as supported
+			 */
+			for (k = 0; k < NR_PREFERENCES; k++) {
+				preferred = curr_spr.preferred_mode
+						& PREFERENCE_MASK;
+				if (preferred & curr_spr.supported_mode
+				    & SELF_RESTORE_STRICT) {
+					is_initialized = true;
+					rc = pnv_self_restore_sprs(pir, cpu,
+								curr_spr.spr);
+					if (rc != 0)
+						return rc;
+					break;
+				} else if (preferred & curr_spr.supported_mode
+					   & SELF_SAVE_STRICT) {
+					is_initialized = true;
+					if (curr_spr.spr == SPRN_HMEER &&
+					    cpu_thread_in_core(cpu) != 0) {
+						continue;
+					}
+					rc = opal_slw_self_save_reg(pir,
+								curr_spr.spr);
+					if (rc != 0)
+						return rc;
+					switch (curr_spr.spr) {
+					case SPRN_LPCR:
+						is_lpcr_self_save = true;
+						break;
+					case SPRN_PTCR:
+						is_ptcr_self_save = true;
+						break;
+					}
+					break;
+				}
+				preferred_sprs[index].preferred_mode =
+					preferred_sprs[index].preferred_mode >>
+					PREFERENCE_SHIFT;
+				curr_spr = preferred_sprs[index];
+			}
+			if (!is_initialized) {
+				if (preferred_sprs[index].spr == SPRN_PTCR ||
+				    (cpu_has_feature(CPU_FTR_ARCH_300) &&
+				    (preferred_sprs[index].spr == SPRN_HID1 ||
+				     preferred_sprs[index].spr == SPRN_HID4 ||
+				     preferred_sprs[index].spr == SPRN_HID5)))
+					continue;
+				return OPAL_UNSUPPORTED;
+			}
+		}
+	}
+	return 0;
+}
 
-				rc = opal_slw_set_reg(pir, SPRN_HID4, hid4_val);
-				if (rc != 0)
-					return rc;
+static int pnv_save_sprs_for_deep_states(void)
+{
+	int rc;
+	int index;
 
-				rc = opal_slw_set_reg(pir, SPRN_HID5, hid5_val);
-				if (rc != 0)
-					return rc;
-			}
+	/*
+	 * Iterate over the preffered SPRs and if even one of them is
+	 * still unsupported We cut support for deep stop states
+	 */
+	for (index = 0; index < nr_preferred_sprs; index++) {
+		if (preferred_sprs[index].supported_mode == UNSUPPORTED) {
+			if (preferred_sprs[index].spr == SPRN_PTCR ||
+			    (cpu_has_feature(CPU_FTR_ARCH_300) &&
+			    (preferred_sprs[index].spr == SPRN_HID1 ||
+			     preferred_sprs[index].spr == SPRN_HID4 ||
+			     preferred_sprs[index].spr == SPRN_HID5)))
+				continue;
+			return OPAL_UNSUPPORTED;
 		}
 	}
 
+	/*
+	 * Try to self restore or self save the registers based on their support
+	 * and respective preferences
+	 */
+	rc = pnv_self_save_restore_sprs();
+	if (rc != 0)
+		return rc;
 	return 0;
 }
 
@@ -658,7 +864,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
 	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
-		sprs.lpcr	= mfspr(SPRN_LPCR);
+		if (!is_lpcr_self_save)
+			sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
 		sprs.fscr	= mfspr(SPRN_FSCR);
 		sprs.pid	= mfspr(SPRN_PID);
@@ -672,7 +879,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		sprs.mmcr1	= mfspr(SPRN_MMCR1);
 		sprs.mmcr2	= mfspr(SPRN_MMCR2);
 
-		sprs.ptcr	= mfspr(SPRN_PTCR);
+		if (!is_ptcr_self_save)
+			sprs.ptcr	= mfspr(SPRN_PTCR);
 		sprs.rpr	= mfspr(SPRN_RPR);
 		sprs.tscr	= mfspr(SPRN_TSCR);
 		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
@@ -756,7 +964,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		goto core_woken;
 
 	/* Per-core SPRs */
-	mtspr(SPRN_PTCR,	sprs.ptcr);
+	if (!is_ptcr_self_save)
+		mtspr(SPRN_PTCR,	sprs.ptcr);
 	mtspr(SPRN_RPR,		sprs.rpr);
 	mtspr(SPRN_TSCR,	sprs.tscr);
 
@@ -777,7 +986,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	atomic_unlock_and_stop_thread_idle();
 
 	/* Per-thread SPRs */
-	mtspr(SPRN_LPCR,	sprs.lpcr);
+	if (!is_lpcr_self_save)
+		mtspr(SPRN_LPCR,	sprs.lpcr);
 	mtspr(SPRN_HFSCR,	sprs.hfscr);
 	mtspr(SPRN_FSCR,	sprs.fscr);
 	mtspr(SPRN_PID,		sprs.pid);
@@ -956,8 +1166,11 @@ void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
 	 * Program the LPCR via stop-api only if the deepest stop state
 	 * can lose hypervisor context.
 	 */
-	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT)
-		opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
+	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT) {
+		if (!is_lpcr_self_save)
+			opal_slw_set_reg(pir, SPRN_LPCR,
+					 lpcr_val);
+	}
 }
 
 /*
-- 
2.21.0

