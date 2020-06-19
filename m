Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E154201180
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 17:44:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pNR90VGYzDqxg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 01:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL6L1SXFzDrMT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 00:00:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcJVa122247; Fri, 19 Jun 2020 10:00:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31rx2th76g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 10:00:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDtBXB026318;
 Fri, 19 Jun 2020 14:00:00 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 31q6c6b1ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 14:00:00 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDxuL214287134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45B3DBE056;
 Fri, 19 Jun 2020 13:59:58 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2120BBE04F;
 Fri, 19 Jun 2020 13:59:56 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 19/26] powerpc/book3s64/kuap: Move KUAP related function
 outside radix
Date: Fri, 19 Jun 2020 19:28:43 +0530
Message-Id: <20200619135850.47155-20-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 cotscore=-2147483648 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190096
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next set of patches adds support for kuap with hash translation.
In preparation for that rename/move kuap related functions to
non radix names.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../asm/book3s/64/{kup-radix.h => kup.h}      |  6 +++---
 arch/powerpc/include/asm/kup.h                |  2 +-
 arch/powerpc/kernel/syscall_64.c              |  2 +-
 arch/powerpc/mm/book3s64/pkeys.c              | 19 +++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 18 ------------------
 5 files changed, 24 insertions(+), 23 deletions(-)
 rename arch/powerpc/include/asm/book3s/64/{kup-radix.h => kup.h} (97%)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup.h
similarity index 97%
rename from arch/powerpc/include/asm/book3s/64/kup-radix.h
rename to arch/powerpc/include/asm/book3s/64/kup.h
index c57063c35833..54e237c093da 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
-#define _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
+#ifndef _ASM_POWERPC_BOOK3S_64_KUP_H
+#define _ASM_POWERPC_BOOK3S_64_KUP_H
 
 #include <linux/const.h>
 #include <asm/reg.h>
@@ -202,4 +202,4 @@ static inline void reset_kuep(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H */
+#endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 4dc23a706910..593707e112cc 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -15,7 +15,7 @@
 #define KUAP_CURRENT		(KUAP_CURRENT_READ | KUAP_CURRENT_WRITE)
 
 #ifdef CONFIG_PPC64
-#include <asm/book3s/64/kup-radix.h>
+#include <asm/book3s/64/kup.h>
 #endif
 #ifdef CONFIG_PPC_8xx
 #include <asm/nohash/32/kup-8xx.h>
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 79edba3ab312..7e560a01afa4 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -2,7 +2,7 @@
 
 #include <linux/err.h>
 #include <asm/asm-prototypes.h>
-#include <asm/book3s/64/kup-radix.h>
+#include <asm/book3s/64/kup.h>
 #include <asm/cputime.h>
 #include <asm/hw_irq.h>
 #include <asm/kprobes.h>
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 0d72c0246052..e93b65a0e6e7 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -12,6 +12,7 @@
 #include <linux/pkeys.h>
 #include <linux/of_fdt.h>
 
+#include <asm/smp.h>
 
 DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
 int  max_pkey;			/* Maximum key value supported */
@@ -199,6 +200,24 @@ void __init pkey_early_init_devtree(void)
 	return;
 }
 
+#ifdef CONFIG_PPC_KUAP
+void __init setup_kuap(bool disabled)
+{
+	if (disabled || !early_radix_enabled())
+		return;
+
+	if (smp_processor_id() == boot_cpuid) {
+		pr_info("Activating Kernel Userspace Access Prevention\n");
+		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
+	}
+
+	/* Make sure userspace can't change the AMR */
+	mtspr(SPRN_UAMOR, 0);
+	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+	isync();
+}
+#endif
+
 void pkey_mm_init(struct mm_struct *mm)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 04fd749c6339..3959b7d4ad3c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -534,24 +534,6 @@ void setup_kuep(bool disabled)
 }
 #endif
 
-#ifdef CONFIG_PPC_KUAP
-void setup_kuap(bool disabled)
-{
-	if (disabled || !early_radix_enabled())
-		return;
-
-	if (smp_processor_id() == boot_cpuid) {
-		pr_info("Activating Kernel Userspace Access Prevention\n");
-		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
-	}
-
-	/* Make sure userspace can't change the AMR */
-	mtspr(SPRN_UAMOR, 0);
-	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
-	isync();
-}
-#endif
-
 void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
-- 
2.26.2

