Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5C2C5F57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:55:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2Pf3pjszDrL7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 15:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mG1QC/Cp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29P1ZYNzDrTM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:44:56 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4VYX5154802; Thu, 26 Nov 2020 23:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MQSgzRBxVM4oNygkrzndVbyZEn9jLyuIDPesz8D4/7c=;
 b=mG1QC/CpBgMyp8RtEEb+FZyZST6lwgzr7MrsUqOyVobMzPUPN49fV8rZBDq3/GBEdJni
 uomRMeqTJjuxu1j6LZnbgqrUONjQ1UMZOFmGuzhR6+0wiz8uB6DFGr/EczVS1mHqDPRD
 fERoxYfzY14YE8LuBxPCRoUKDBBmHS5tLxgsdGvuh6co232KvcJX1VV+vOSl8S1zRn1E
 iyGyPHunhRoAaggjRUr959lSV1ng81vKF7gOiS4DdcKXGJnEh08nnrdcSj9OnQdJqa77
 ncg6lznFyTbhVnYZ4iUbA9PFYdXgDcZDTsAHKE9qRRRCKmOjB0/zI7CrlY6mDQEaQV3M aA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 352s3yhy29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:44:47 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4hAX2017092;
 Fri, 27 Nov 2020 04:44:46 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 34xthapvm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:44:46 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4ijwY10617460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:44:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C63F6E050;
 Fri, 27 Nov 2020 04:44:45 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45E926E04C;
 Fri, 27 Nov 2020 04:44:43 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:44:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 05/22] powerpc/book3s64/kuap: Move KUAP related function
 outside radix
Date: Fri, 27 Nov 2020 10:14:07 +0530
Message-Id: <20201127044424.40686-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270021
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The next set of patches adds support for kuap with hash translation.
In preparation for that rename/move kuap related functions to
non radix names.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../asm/book3s/64/{kup-radix.h => kup.h}      |  6 ++---
 arch/powerpc/include/asm/kup.h                |  4 +++-
 arch/powerpc/mm/book3s64/pkeys.c              | 22 +++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 19 ----------------
 4 files changed, 28 insertions(+), 23 deletions(-)
 rename arch/powerpc/include/asm/book3s/64/{kup-radix.h => kup.h} (97%)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup.h
similarity index 97%
rename from arch/powerpc/include/asm/book3s/64/kup-radix.h
rename to arch/powerpc/include/asm/book3s/64/kup.h
index 68eaa2fac3ab..56dbe3666dc8 100644
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
@@ -200,4 +200,4 @@ static inline void restore_user_access(unsigned long flags)
 }
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H */
+#endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 0d93331d0fab..a06e50b68d40 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -15,11 +15,13 @@
 #define KUAP_CURRENT		(KUAP_CURRENT_READ | KUAP_CURRENT_WRITE)
 
 #ifdef CONFIG_PPC_BOOK3S_64
-#include <asm/book3s/64/kup-radix.h>
+#include <asm/book3s/64/kup.h>
 #endif
+
 #ifdef CONFIG_PPC_8xx
 #include <asm/nohash/32/kup-8xx.h>
 #endif
+
 #ifdef CONFIG_PPC_BOOK3S_32
 #include <asm/book3s/32/kup.h>
 #endif
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 7dc71f85683d..c75994cf50a7 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -9,9 +9,12 @@
 #include <asm/mmu_context.h>
 #include <asm/mmu.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
+
 #include <linux/pkeys.h>
 #include <linux/of_fdt.h>
 
+
 int  num_pkey;		/* Max number of pkeys supported */
 /*
  *  Keys marked in the reservation list cannot be allocated by  userspace
@@ -226,6 +229,25 @@ void __init pkey_early_init_devtree(void)
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
+	/*
+	 * Set the default kernel AMR values on all cpus.
+	 */
+	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+	isync();
+}
+#endif
+
 static inline u64 read_amr(void)
 {
 	return mfspr(SPRN_AMR);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index f5f248d44d5c..fe2c26dbcb28 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -609,25 +609,6 @@ void setup_kuep(bool disabled)
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
-	/*
-	 * Set the default kernel AMR values on all cpus.
-	 */
-	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
-	isync();
-}
-#endif
-
 void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
-- 
2.28.0

