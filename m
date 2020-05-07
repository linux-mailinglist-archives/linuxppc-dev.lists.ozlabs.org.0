Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB751C8EAA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:29:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HwpB085yzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:29:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HwgD3M4mzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 00:23:36 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047E2FtV179534; Thu, 7 May 2020 10:23:28 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8t85ndt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 10:23:27 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047ENFhn001525;
 Thu, 7 May 2020 14:23:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 30s0g7cxr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 14:23:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047ENQ8k54788364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 May 2020 14:23:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26499124052;
 Thu,  7 May 2020 14:23:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB17124053;
 Thu,  7 May 2020 14:23:24 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.212])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 May 2020 14:23:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/va: Add a __va() variant that doesn't do input
 validation
Date: Thu,  7 May 2020 19:53:14 +0530
Message-Id: <20200507142316.265457-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_08:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070111
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

On ppc64, __va(x) do check for input argument to be less than PAGE_OFFSET.
In certain code paths, we want to skip that check. Add a variant ___va(x)
to be used in such cases.

Switch the #define to static inline. __pa() still doesn't benefit from this. But
a static inline done in this patch is better than multi-line #define.
For __va() we get the type checking benefit. We still have to keep the
macro __pa(x) to avoid a large number of compilation errors with the change.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/page.h         | 38 ++++++++++++++++---------
 arch/powerpc/mm/nohash/book3e_pgtable.c |  2 +-
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 3ee8df0f66e0..a3a2725a80ab 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -9,6 +9,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/mmdebug.h>
 #else
 #include <asm/types.h>
 #endif
@@ -208,30 +209,41 @@ static inline bool pfn_valid(unsigned long pfn)
  * the other definitions for __va & __pa.
  */
 #if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
-#define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) + VIRT_PHYS_OFFSET))
+#define ___va(x) ((void *)(unsigned long)((phys_addr_t)(x) + VIRT_PHYS_OFFSET))
 #define __pa(x) ((phys_addr_t)(unsigned long)(x) - VIRT_PHYS_OFFSET)
+#define __va(x) ___va(x)
 #else
 #ifdef CONFIG_PPC64
+
+#ifndef __ASSEMBLY__
 /*
  * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
  * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
  * This also results in better code generation.
  */
-#define __va(x)								\
-({									\
-	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\
-	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
-})
-
-#define __pa(x)								\
-({									\
-	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
-	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
-})
+static inline void *___va(phys_addr_t addr)
+{
+	return (void *)(addr | PAGE_OFFSET);
+}
+
+static inline void *__va(phys_addr_t addr)
+{
+	VIRTUAL_BUG_ON((unsigned long)(addr) >= PAGE_OFFSET);
+	return ___va(addr);
+}
+
+static inline phys_addr_t ___pa(void *addr)
+{
+	VIRTUAL_BUG_ON((unsigned long)(addr) < PAGE_OFFSET);
+	return (phys_addr_t)((unsigned long)addr & 0x0fffffffffffffffUL);
+}
+#define __pa(x) ___pa((void *)(x))
+#endif /*  __ASSEMBLY__ */
 
 #else /* 32-bit, non book E */
-#define __va(x) ((void *)(unsigned long)((phys_addr_t)(x) + PAGE_OFFSET - MEMORY_START))
+#define ___va(x) ((void *)(unsigned long)((phys_addr_t)(x) + PAGE_OFFSET - MEMORY_START))
 #define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + MEMORY_START)
+#define __va(x) ___va(x)
 #endif
 #endif
 
diff --git a/arch/powerpc/mm/nohash/book3e_pgtable.c b/arch/powerpc/mm/nohash/book3e_pgtable.c
index 4637fdd469cf..a8ce309ce740 100644
--- a/arch/powerpc/mm/nohash/book3e_pgtable.c
+++ b/arch/powerpc/mm/nohash/book3e_pgtable.c
@@ -60,7 +60,7 @@ static void __init *early_alloc_pgtable(unsigned long size)
 
 	if (!ptr)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx max_addr=%lx\n",
-		      __func__, size, size, __pa(MAX_DMA_ADDRESS));
+		      __func__, size, size, (unsigned long)__pa(MAX_DMA_ADDRESS));
 
 	return ptr;
 }
-- 
2.26.2

