Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D78471C2506
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 14:09:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnwK2K2NzDqZS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 22:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DmvG2XLhzDr86
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:23:06 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042AWdRi078780; Sat, 2 May 2020 07:23:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s45qvf2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:23:02 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 042BFbGn156886;
 Sat, 2 May 2020 07:23:02 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s45qvf29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:23:01 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BK85f014373;
 Sat, 2 May 2020 11:23:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 30s0g5jbyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:23:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BMxjp29229324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:22:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B40CB7805C;
 Sat,  2 May 2020 11:22:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44C547805E;
 Sat,  2 May 2020 11:22:57 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:22:56 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 05/28] powerpc/book3s64/kuap: Move KUAP related function
 outside radix
Date: Sat,  2 May 2020 16:52:06 +0530
Message-Id: <20200502112229.545331-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
References: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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
 bauerman@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next set of patches adds support for kuap with hash translation.
In preparation for that rename/move kuap related functions to
non radix names.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../asm/book3s/64/{kup-radix.h => kup.h}       |  6 +++---
 arch/powerpc/include/asm/kup.h                 |  2 +-
 arch/powerpc/kernel/syscall_64.c               |  2 +-
 arch/powerpc/mm/book3s64/pkeys.c               | 18 ++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c       | 18 ------------------
 5 files changed, 23 insertions(+), 23 deletions(-)
 rename arch/powerpc/include/asm/book3s/64/{kup-radix.h => kup.h} (97%)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup.h
similarity index 97%
rename from arch/powerpc/include/asm/book3s/64/kup-radix.h
rename to arch/powerpc/include/asm/book3s/64/kup.h
index e82df54f5681..21de441762d5 100644
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
@@ -184,4 +184,4 @@ static inline unsigned long kuap_get_and_check_amr(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H */
+#endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 92bcd1a26d73..248438dff74a 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -13,7 +13,7 @@
 #define KUAP_CURRENT	4
 
 #ifdef CONFIG_PPC64
-#include <asm/book3s/64/kup-radix.h>
+#include <asm/book3s/64/kup.h>
 #endif
 #ifdef CONFIG_PPC_8xx
 #include <asm/nohash/32/kup-8xx.h>
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index bfb161a3a0ea..f704f657e1f7 100644
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
index 810118123e70..e923be3b52e7 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -198,6 +198,24 @@ void __init pkey_early_init_devtree(void)
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
index 8f9edf07063a..74558ce6b5cb 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -526,24 +526,6 @@ void setup_kuep(bool disabled)
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

