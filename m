Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0239D48F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz2gV19Cnz3c6M
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IWTXP/cc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IWTXP/cc; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz2b13SsNz3btR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:52:45 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1575YORD014248; Mon, 7 Jun 2021 01:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=92N0jmBCzJzh0Db63BxRwkrxCJOhAsCH0YSp8AwI5A4=;
 b=IWTXP/ccDLPNOePsOjV5OdvF+6Dwiwg4WcZbC78zUW5yjtN8CctLQMiAL9X6rdabEzwF
 sVlZWy4f+MLX376MZjpPzlH0En6h168OwN5QI8+g5K1eg/avo+Cn+PLmhcRSX5cFBdIR
 NQDZmevuREl8cTY1mIOkaeb4LMtZMOAdPoYKgc4CVX/hfI6R8G6WVsvFTqnm4Zeqhbvx
 wBh5yCHov+OP1Dv9bfYeO1rsYnBR7H19RemD7YJsPx3i3XYmMCbS67c3r4LZGK5lpaVN
 tbUyt5teu06W7e08zBemBeXg5WHR6Oo541dRWDHQpawJVOMvX0PD66zHO4m9pK0KAkZA qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391cxdrxyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:34 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1575odNU065952;
 Mon, 7 Jun 2021 01:52:33 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391cxdrxyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:33 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1575hTed032541;
 Mon, 7 Jun 2021 05:52:33 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3900w8yr88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 05:52:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1575qWYc38601202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 05:52:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09C2D28058;
 Mon,  7 Jun 2021 05:52:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C5B528060;
 Mon,  7 Jun 2021 05:52:28 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.129])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 05:52:27 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v7 09/11] mm/mremap: Allow arch runtime override
Date: Mon,  7 Jun 2021 11:21:29 +0530
Message-Id: <20210607055131.156184-10-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZXRNE2ltfFzjhFtag_twspn2D8cUHKj2
X-Proofpoint-ORIG-GUID: XO_JwDjwkxA2eGuU3jI-d0r1fVOp_Gjr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_03:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070042
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures like ppc64 support faster mremap only with radix
translation. Hence allow a runtime check w.r.t support for fast mremap.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/tlb.h |  6 ++++++
 mm/mremap.c                    | 15 ++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index 160422a439aa..09a9ae5f3656 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -83,5 +83,11 @@ static inline int mm_is_thread_local(struct mm_struct *mm)
 }
 #endif
 
+#define arch_supports_page_table_move arch_supports_page_table_move
+static inline bool arch_supports_page_table_move(void)
+{
+	return radix_enabled();
+}
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_TLB_H */
diff --git a/mm/mremap.c b/mm/mremap.c
index dacfa9111ab1..9cd352fb9cf8 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -25,7 +25,7 @@
 #include <linux/userfaultfd_k.h>
 
 #include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
+#include <asm/tlb.h>
 #include <asm/pgalloc.h>
 
 #include "internal.h"
@@ -210,6 +210,15 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		drop_rmap_locks(vma);
 }
 
+#ifndef arch_supports_page_table_move
+#define arch_supports_page_table_move arch_supports_page_table_move
+static inline bool arch_supports_page_table_move(void)
+{
+	return IS_ENABLED(CONFIG_HAVE_MOVE_PMD) ||
+		IS_ENABLED(CONFIG_HAVE_MOVE_PUD);
+}
+#endif
+
 #ifdef CONFIG_HAVE_MOVE_PMD
 static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
@@ -218,6 +227,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t pmd;
 
+	if (!arch_supports_page_table_move())
+		return false;
 	/*
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have released it.
@@ -284,6 +295,8 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pud_t pud;
 
+	if (!arch_supports_page_table_move())
+		return false;
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
-- 
2.31.1

