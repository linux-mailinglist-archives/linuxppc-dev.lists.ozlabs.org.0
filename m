Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C634E10B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 08:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8fHc72Syz3c0g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:12:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k04pG5oD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k04pG5oD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8fCJ1cCRz30FZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 17:08:44 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U65UBf130696; Tue, 30 Mar 2021 02:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P4IuqE7Ct/ErbQGYmU3B1fYo9LoqwzHhc0Q7NGQOkVw=;
 b=k04pG5oDoJeFvnHKpoN2alxrGyd9uq59gZW4XVtGMGfAHPhknV8dh0ZEgbt6V90j+/Kn
 7Nwpi1U+x3UM2xG8Q062Uknd8LUVAr4E9YNqWKozAZNq08u6RPaHIU2lrkG8kf7WUVqt
 rh8C/M2C1TRo0xSBYplvzM7qIkC1PDarPSDd/MMRfMJk/2zCjZfpIqfYdNksMzYGsics
 /ciPehzlbbBMv+4dUdNZWjY9B4sFGhC693uyPLAWKSHAYyqjdm4D1ux0MVEPqp5WT2C6
 kamdHK5pGttiO6EezEt9C1CQOO0lyoS/mMZktTRS/FyluRaO/TB3rtSQcbzVJrqOrgjo tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37jjb5nqc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:38 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12U65g2c132036;
 Tue, 30 Mar 2021 02:08:38 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37jjb5nqbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U65b29030855;
 Tue, 30 Mar 2021 06:08:37 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 37hvb8ugf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 06:08:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12U68ZxY12780150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 06:08:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62AE17805E;
 Tue, 30 Mar 2021 06:08:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9008D7805F;
 Tue, 30 Mar 2021 06:08:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.226])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 06:08:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 8/9] mm/mremap: Allow arch runtime override
Date: Tue, 30 Mar 2021 11:37:51 +0530
Message-Id: <20210330060752.592769-9-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: teo22iEDyzwHPAyuH-GPzWaKdq7F26eO
X-Proofpoint-ORIG-GUID: moBPXbJ_BmLYtOogCTT2W5EOcbdXUadp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_01:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300043
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
Cc: kaleshsingh@google.com, npiggin@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures like ppc64 can only support faster mremap only with radix
translation. Hence allow a runtime check w.r.t support for fast mremap.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/arc/include/asm/tlb.h     |  5 +++++
 arch/arm64/include/asm/tlb.h   |  6 ++++++
 arch/powerpc/include/asm/tlb.h |  6 ++++++
 arch/x86/include/asm/tlb.h     |  5 +++++
 mm/mremap.c                    | 14 +++++++++++++-
 5 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/tlb.h b/arch/arc/include/asm/tlb.h
index 975b35d3738d..22b8cfb46cbf 100644
--- a/arch/arc/include/asm/tlb.h
+++ b/arch/arc/include/asm/tlb.h
@@ -9,4 +9,9 @@
 #include <linux/pagemap.h>
 #include <asm-generic/tlb.h>
 
+#define arch_supports_page_tables_move arch_supports_page_tables_move
+static inline bool arch_supports_page_tables_move(void)
+{
+	return true;
+}
 #endif /* _ASM_ARC_TLB_H */
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 61c97d3b58c7..fe209efc6a10 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -94,4 +94,10 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#define arch_supports_page_tables_move arch_supports_page_tables_move
+static inline bool arch_supports_page_tables_move(void)
+{
+	return true;
+}
+
 #endif
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index 160422a439aa..058918a7cd3c 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -83,5 +83,11 @@ static inline int mm_is_thread_local(struct mm_struct *mm)
 }
 #endif
 
+#define arch_supports_page_tables_move arch_supports_page_tables_move
+static inline bool arch_supports_page_tables_move(void)
+{
+	return radix_enabled();
+}
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_TLB_H */
diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 1bfe979bb9bc..62915238bb36 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -37,4 +37,9 @@ static inline void __tlb_remove_table(void *table)
 	free_page_and_swap_cache(table);
 }
 
+#define arch_supports_page_tables_move arch_supports_page_tables_move
+static inline bool arch_supports_page_tables_move(void)
+{
+	return true;
+}
 #endif /* _ASM_X86_TLB_H */
diff --git a/mm/mremap.c b/mm/mremap.c
index 7ac1df8e6d51..4d812af3e44b 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -25,7 +25,7 @@
 #include <linux/userfaultfd_k.h>
 
 #include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
+#include <asm/tlb.h>
 #include <asm/pgalloc.h>
 
 #include "internal.h"
@@ -221,6 +221,14 @@ static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
 }
 #endif
 
+#ifndef arch_supports_page_tables_move
+#define arch_supports_page_tables_move arch_supports_page_tables_move
+static inline bool arch_supports_page_tables_move(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_HAVE_MOVE_PMD
 static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
@@ -229,6 +237,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t pmd;
 
+	if (!arch_supports_page_tables_move())
+		return false;
 	/*
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have released it.
@@ -295,6 +305,8 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pud_t pud;
 
+	if (!arch_supports_page_tables_move())
+		return false;
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
-- 
2.30.2

