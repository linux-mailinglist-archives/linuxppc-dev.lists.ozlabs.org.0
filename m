Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A485330D043
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:28:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjGF5nY9zDqWK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rNPHFoyD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVJwN676PzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:11:48 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11292KmG057342; Tue, 2 Feb 2021 04:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KpmIorzGkabpWUv3bXRwa/iYwGf1iLX1SSENY5Cpwm0=;
 b=rNPHFoyDMlQDBRsJBBDtuIGseyaVUF+im+QjuMchkVAWGwI9mohMh/yoIK020eGjPSJF
 EvBdpXeXHaHPF+0iYKaVzRJdpKU8rbJl71VPifbdUmVp4LE5psnu6V7bYtwyjKF3cGYi
 +vQffZhp97h6g1WCoWkLOEQQdoWyJHW8lmijW4aduETO+4yGceiYBk4J/heN5jZuFy8U
 MTRId6mECevLS6UIYiLrIIHKNvmZ77XMxZkXPZ62clwSpfZSBNqx3LcS3lSHWA4P9Kjr
 Gv24i3Gtd2Pc6CIknLq6pka86xdYMhSdLaofLAyDCDZJc2zHGa7IMhRte3PPpf5WcbSx Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f3kd8kbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:40 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11292tT5060245;
 Tue, 2 Feb 2021 04:11:40 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f3kd8kb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:40 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112983vO003242;
 Tue, 2 Feb 2021 09:11:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 36ex3njcaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:11:39 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1129BcuF27001270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 09:11:38 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C93C02805C;
 Tue,  2 Feb 2021 09:11:38 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCCA028059;
 Tue,  2 Feb 2021 09:11:35 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.35.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 09:11:35 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [RFC PATCH 5/6] mm/mremap: Allow arch runtime override
Date: Tue,  2 Feb 2021 14:41:15 +0530
Message-Id: <20210202091116.196134-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_04:2021-01-29,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020059
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
Cc: peterz@infradead.org, kaleshsingh@google.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures like ppc64 can only support faster mremap only with radix
translation. Hence allow a runtime check w.r.t support for fast mremap.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/arm64/include/asm/tlb.h   |  6 ++++++
 arch/powerpc/include/asm/tlb.h |  6 ++++++
 arch/x86/include/asm/tlb.h     |  5 +++++
 mm/mremap.c                    | 14 +++++++++++++-
 4 files changed, 30 insertions(+), 1 deletion(-)

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
index 820082bd6880..62827553afd8 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -38,4 +38,9 @@ static inline void __tlb_remove_table(void *table)
 	free_page_and_swap_cache(table);
 }
 
+#define arch_supports_page_tables_move arch_supports_page_tables_move
+static inline bool arch_supports_page_tables_move(void)
+{
+	return true;
+}
 #endif /* _ASM_X86_TLB_H */
diff --git a/mm/mremap.c b/mm/mremap.c
index 14778d215011..dd1244a410bb 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -26,7 +26,7 @@
 #include <linux/userfaultfd_k.h>
 
 #include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
+#include <asm/tlb.h>
 #include <asm/pgalloc.h>
 
 #include "internal.h"
@@ -211,6 +211,14 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		drop_rmap_locks(vma);
 }
 
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
@@ -220,6 +228,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mmu_gather tlb;
 	pmd_t pmd;
 
+	if (!arch_supports_page_tables_move())
+		return false;
 	/*
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have released it.
@@ -298,6 +308,8 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mmu_gather tlb;
 	pud_t pud;
 
+	if (!arch_supports_page_tables_move())
+		return false;
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
-- 
2.29.2

