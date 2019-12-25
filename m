Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21A12A5F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 06:18:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jLwN1YZYzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 16:18:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jLt56hRrzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 16:16:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47jLt50KHPz8sXw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 16:16:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47jLt46bGVz9sP6; Wed, 25 Dec 2019 16:16:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47jLt41Ryjz9sP3;
 Wed, 25 Dec 2019 16:16:43 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBP5CNgq096458; Wed, 25 Dec 2019 00:16:36 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x21b1udt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Dec 2019 00:16:36 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBP5GIJ5025286;
 Wed, 25 Dec 2019 05:16:36 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 2x1b16frhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Dec 2019 05:16:36 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBP5GZKB42729768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Dec 2019 05:16:35 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7719112065;
 Wed, 25 Dec 2019 05:16:35 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A62C112062;
 Wed, 25 Dec 2019 05:16:35 +0000 (GMT)
Received: from suka-w540.usor.ibm.com (unknown [9.70.94.45])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Dec 2019 05:16:34 +0000 (GMT)
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>, 
 linuxram@us.ibm.com
Subject: [PATCH 1/2] powerpc/pseries/svm: Use FW_FEATURE to detect SVM
Date: Tue, 24 Dec 2019 21:16:33 -0800
Message-Id: <20191225051634.3262-1-sukadev@linux.ibm.com>
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-24_07:2019-12-24,2019-12-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912250039
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
Cc: linux-mm@kvack.org, linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use FW_FEATURE_SVM to detect a secure guest (SVM). This would be
more efficient than calling mfmsr() frequently.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       | 3 ++-
 arch/powerpc/include/asm/svm.h            | 6 +++++-
 arch/powerpc/kernel/paca.c                | 6 +++++-
 arch/powerpc/platforms/pseries/firmware.c | 3 +++
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index b3e214a97f3a..23cffcec8a55 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -51,6 +51,7 @@
 #define FW_FEATURE_BLOCK_REMOVE ASM_CONST(0x0000001000000000)
 #define FW_FEATURE_PAPR_SCM 	ASM_CONST(0x0000002000000000)
 #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
+#define FW_FEATURE_SVM		ASM_CONST(0x0000008000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -69,7 +70,7 @@ enum {
 		FW_FEATURE_TYPE1_AFFINITY | FW_FEATURE_PRRN |
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
-		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR,
+		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR | FW_FEATURE_SVM,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
index 85580b30aba4..1d056c70fa87 100644
--- a/arch/powerpc/include/asm/svm.h
+++ b/arch/powerpc/include/asm/svm.h
@@ -10,9 +10,13 @@
 
 #ifdef CONFIG_PPC_SVM
 
+/*
+ * Note that this is not usable in early boot - before FW
+ * features were probed
+ */
 static inline bool is_secure_guest(void)
 {
-	return mfmsr() & MSR_S;
+	return firmware_has_feature(FW_FEATURE_SVM);
 }
 
 void dtl_cache_ctor(void *addr);
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 949eceb254d8..3cba33a99549 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -120,7 +120,11 @@ static struct lppaca * __init new_lppaca(int cpu, unsigned long limit)
 	if (early_cpu_has_feature(CPU_FTR_HVMODE))
 		return NULL;
 
-	if (is_secure_guest())
+	/*
+	 * Firmware features may not have been probed yet, so check
+	 * MSR rather than FW_FEATURE_SVM in is_secure_guest().
+	 */
+	if (mfmsr() & MSR_S)
 		lp = alloc_shared_lppaca(LPPACA_SIZE, 0x400, limit, cpu);
 	else
 		lp = alloc_paca_data(LPPACA_SIZE, 0x400, limit, cpu);
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index d4a8f1702417..c98527fb4937 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -175,4 +175,7 @@ static int __init probe_fw_features(unsigned long node, const char *uname, int
 void __init pseries_probe_fw_features(void)
 {
 	of_scan_flat_dt(probe_fw_features, NULL);
+
+	if (mfmsr() & MSR_S)
+		powerpc_firmware_features |= FW_FEATURE_SVM;
 }
-- 
2.17.2

