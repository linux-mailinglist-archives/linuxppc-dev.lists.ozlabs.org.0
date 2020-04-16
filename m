Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA551ABB01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:19:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492sbD4f30zDrRS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492s1j1CvNzDqjk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:54:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 492s1h5fPSz99jc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:54:16 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 492s1h11qyz9sSl; Thu, 16 Apr 2020 17:54:16 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 492s1g1Mpgz9sSG
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 17:54:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G7aMgf132044
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:54:13 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ejsqs29w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Apr 2020 03:54:12 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 16 Apr 2020 08:53:33 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Apr 2020 08:53:31 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03G7r1wZ41550118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 07:53:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58805AE04D;
 Thu, 16 Apr 2020 07:54:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86059AE057;
 Thu, 16 Apr 2020 07:54:05 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.182.109])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 07:54:05 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v7 3/3] powerpc/powernv: Preference optimization for SPRs with
 constant values
Date: Thu, 16 Apr 2020 13:23:58 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416075358.75155-1-psampat@linux.ibm.com>
References: <20200416075358.75155-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041607-0016-0000-0000-00000305778F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041607-0017-0000-0000-000033697A2E
Message-Id: <20200416075358.75155-4-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_02:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004160050
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

There are SPRs whose values don't tend to change over time and invoking
self-save on them, where the values are gotten each time may turn out to
be inefficient. In that case calling a self-restore where passing the
value makes more sense as, if the value is same the memory location
is not updated.
SPRs that dont change are as follows:
SPRN_HSPRG0,
SPRN_LPCR,
SPRN_PTCR,
SPRN_HMEER,
SPRN_HID0,

There are also SPRs whose values change and/or their value may not be
correcty determinable in the kernel. Eg: MSR and PSSCR

The value of LPCR is dynamic based on if the CPU is entered a stop
state during cpu idle versus cpu hotplug.

Therefore in this optimization patch, introducing the concept of
preference for each SPR to choose from in the case both self-save and
self-restore is supported.

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
((FIRMWARE_RESTORE << PREFERENCE_SHIFT) | FIRMWARE_SELF_SAVE)
---------------------------------
|... | Self restore | Self save |
---------------------------------
MSB			        LSB

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/idle.c | 88 +++++++++++++++++++++------
 1 file changed, 70 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index fdcb18a8a05b..daa2f920bd05 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -43,6 +43,31 @@
 #define FIRMWARE_SELF_SAVE    0x2
 #define KERNEL_SAVE_RESTORE   0x4
 
+#define NR_PREFERENCES    2
+#define PREFERENCE_SHIFT  4
+#define PREFERENCE_MASK   0xf
+/*
+ * Bitmask defining the kind of preferences available.
+ * Note : The higher to lower preference is from LSB to MSB, with a shift of
+ * 4 bits.
+ * ----------------------------
+ * |    | 2nd pref | 1st pref |
+ * ----------------------------
+ * MSB			      LSB
+ */
+/* Prefer Restore if available, otherwise unsupported */
+#define PREFER_SELF_RESTORE_ONLY	FIRMWARE_RESTORE
+/* Prefer Save if available, otherwise unsupported */
+#define PREFER_SELF_SAVE_ONLY		FIRMWARE_SELF_SAVE
+/* Prefer Restore when available, otherwise prefer Save */
+#define PREFER_RESTORE_SAVE		((FIRMWARE_SELF_SAVE << \
+					  PREFERENCE_SHIFT)\
+					  | FIRMWARE_RESTORE)
+/* Prefer Save when available, otherwise prefer Restore*/
+#define PREFER_SAVE_RESTORE		((FIRMWARE_RESTORE <<\
+					  PREFERENCE_SHIFT)\
+					  | FIRMWARE_SELF_SAVE)
+
 static u32 supported_cpuidle_states;
 struct pnv_idle_states_t *pnv_idle_states;
 int nr_pnv_idle_states;
@@ -52,6 +77,7 @@ DEFINE_STATIC_KEY_FALSE(is_ptcr_self_save);
 
 struct preferred_sprs {
 	u64 spr;
+	u32 preferred_mode;
 	u32 supported_mode;
 };
 
@@ -66,42 +92,52 @@ struct preferred_sprs {
 struct preferred_sprs preferred_sprs[] = {
 	{
 		.spr = SPRN_HSPRG0,
+		.preferred_mode = PREFER_RESTORE_SAVE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = SPRN_LPCR,
+		.preferred_mode = PREFER_SAVE_RESTORE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = SPRN_PTCR,
+		.preferred_mode = PREFER_RESTORE_SAVE,
 		.supported_mode = KERNEL_SAVE_RESTORE,
 	},
 	{
 		.spr = SPRN_HMEER,
+		.preferred_mode = PREFER_RESTORE_SAVE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = SPRN_HID0,
+		.preferred_mode = PREFER_RESTORE_SAVE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = P9_STOP_SPR_MSR,
+		.preferred_mode = PREFER_SAVE_RESTORE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = P9_STOP_SPR_PSSCR,
+		.preferred_mode = PREFER_SAVE_RESTORE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = SPRN_HID1,
+		.preferred_mode = PREFER_RESTORE_SAVE,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = SPRN_HID4,
+		.preferred_mode = PREFER_SELF_RESTORE_ONLY,
 		.supported_mode = FIRMWARE_RESTORE,
 	},
 	{
 		.spr = SPRN_HID5,
+		.preferred_mode = PREFER_SELF_RESTORE_ONLY,
 		.supported_mode = FIRMWARE_RESTORE,
 	}
 };
@@ -218,7 +254,9 @@ static int pnv_self_restore_sprs(u64 pir, int cpu, u64 spr)
 
 static int pnv_self_save_restore_sprs(void)
 {
-	int rc, index, cpu;
+	int rc, index, cpu, k;
+	bool is_initialized;
+	u32 preferred;
 	u64 pir;
 	struct preferred_sprs curr_spr;
 
@@ -234,26 +272,40 @@ static int pnv_self_save_restore_sprs(void)
 			     curr_spr.spr == SPRN_HID4  ||
 			     curr_spr.spr == SPRN_HID5))
 				continue;
-
-			if (curr_spr.supported_mode & FIRMWARE_SELF_SAVE) {
-				rc = opal_slw_self_save_reg(pir,
-							curr_spr.spr);
-				if (rc != 0)
-					return rc;
-				switch (curr_spr.spr) {
-				case SPRN_LPCR:
-					static_branch_enable(&is_lpcr_self_save);
+			for (k = 0; k < NR_PREFERENCES; k++) {
+				preferred = curr_spr.preferred_mode
+					& PREFERENCE_MASK;
+				if (preferred & curr_spr.supported_mode &
+				    FIRMWARE_SELF_SAVE) {
+					is_initialized = true;
+					rc = opal_slw_self_save_reg(pir,
+								    curr_spr.spr);
+					if (rc != 0)
+						return rc;
+					switch (curr_spr.spr) {
+					case SPRN_LPCR:
+						static_branch_enable(&is_lpcr_self_save);
+						break;
+					case SPRN_PTCR:
+						static_branch_enable(&is_ptcr_self_save);
+						break;
+					}
 					break;
-				case SPRN_PTCR:
-					static_branch_enable(&is_ptcr_self_save);
+				} else if (preferred & curr_spr.supported_mode &
+					   FIRMWARE_RESTORE) {
+					is_initialized = true;
+					rc = pnv_self_restore_sprs(pir, cpu,
+								   curr_spr.spr);
+					if (rc != 0)
+						return rc;
 					break;
 				}
-			} else if (curr_spr.supported_mode & FIRMWARE_RESTORE) {
-				rc = pnv_self_restore_sprs(pir, cpu,
-							   curr_spr.spr);
-				if (rc != 0)
-					return rc;
-			} else {
+				preferred_sprs[index].preferred_mode =
+					preferred_sprs[index].preferred_mode >>
+					PREFERENCE_SHIFT;
+				curr_spr = preferred_sprs[index];
+			}
+			if (!is_initialized) {
 				if (curr_spr.supported_mode & KERNEL_SAVE_RESTORE ||
 				    (cpu_has_feature(CPU_FTR_ARCH_300) &&
 				     (curr_spr.spr == SPRN_HID1 ||
-- 
2.17.1

