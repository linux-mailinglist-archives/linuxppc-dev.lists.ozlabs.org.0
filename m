Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BA1F8E0A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 08:46:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lhhC0LyjzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:46:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lh0B3d6NzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:15:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F63IqH042369; Mon, 15 Jun 2020 02:15:33 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31p1krjrb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 02:15:33 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F6Ew1f031725;
 Mon, 15 Jun 2020 06:15:32 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 31mpe9917v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 06:15:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05F6FUJX54722918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 06:15:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4B08C6059;
 Mon, 15 Jun 2020 06:15:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76BA9C605A;
 Mon, 15 Jun 2020 06:15:28 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.2.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 06:15:28 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 17/41] powerpc/book3s64/kuap: Move KUAP related function
 outside radix
Date: Mon, 15 Jun 2020 11:44:06 +0530
Message-Id: <20200615061430.770174-18-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-12,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 cotscore=-2147483648
 adultscore=0 phishscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150050
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
index 3ee1ec60be84..dff1fef765fa 100644
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
@@ -182,4 +182,4 @@ static inline unsigned long kuap_get_and_check_amr(void)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H */
+#endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index c745ee41ad66..015f51b02741 100644
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
index 810118123e70..cdd200441b58 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -12,6 +12,7 @@
 #include <linux/pkeys.h>
 #include <linux/of_fdt.h>
 
+#include <asm/smp.h>
 
 DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
 int  max_pkey;			/* Maximum key value supported */
@@ -198,6 +199,24 @@ void __init pkey_early_init_devtree(void)
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
index 8acb96de0e48..7ebaf35ec21d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -532,24 +532,6 @@ void setup_kuep(bool disabled)
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

