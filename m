Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D133B146
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 12:40:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzZHW6QBHz3Wtp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:40:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D53PPd2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D53PPd2a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzZGD5jxMz300C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 22:39:48 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FBXgwa024546; Mon, 15 Mar 2021 07:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cxU07J7wnqanXMKNUqpjwH3eyXd8hQEHkx7yDjG0YjM=;
 b=D53PPd2ayRyTXgyqeXlvUFLugZNUc7a7Jwek1hgwLrAV6QwgEJUS7fjSrQIIkUx2nr1I
 q7iMshTW13qxkv8A5bYcgrANj1Neb7bJW0jWL+bixbJJIQ5sCKHIfrGDbfSCeTvLY+gE
 otXYSKOtEEmJ4pYS1DtrHEqE/Z0kTM1700YtVYvO/2yacR65YrMq+IUHD6P/drMRuYfC
 9WwhNVhhO8MPVHYPxvTdfhrbyDyotz4NAo9BCU+QGRuPbxTaJM5hYPIPL4AdlDwTdauf
 hg44MnW0b006Z9y3tMH6nH91qUhw/Er3mihoZHLQRRgJF0K67v/ptkZet188U1S9FQuT uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379ryd9qg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FBY3o8026458;
 Mon, 15 Mar 2021 07:38:51 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379ryd9qfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:51 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FBW4ws010707;
 Mon, 15 Mar 2021 11:38:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 378n19jh4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:38:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FBcnaB27656626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:38:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E779AC05F;
 Mon, 15 Mar 2021 11:38:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF29CAC059;
 Mon, 15 Mar 2021 11:38:46 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.36.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 11:38:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 5/6] mm/mremap: Allow arch runtime override
Date: Mon, 15 Mar 2021 17:08:23 +0530
Message-Id: <20210315113824.270796-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
References: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150081
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
index fafa73b965d3..316181822cce 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -25,7 +25,7 @@
 #include <linux/userfaultfd_k.h>
 
 #include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
+#include <asm/tlb.h>
 #include <asm/pgalloc.h>
 
 #include "internal.h"
@@ -210,6 +210,14 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
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
@@ -219,6 +227,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mmu_gather tlb;
 	pmd_t pmd;
 
+	if (!arch_supports_page_tables_move())
+		return false;
 	/*
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have released it.
@@ -297,6 +307,8 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mmu_gather tlb;
 	pud_t pud;
 
+	if (!arch_supports_page_tables_move())
+		return false;
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
-- 
2.29.2

