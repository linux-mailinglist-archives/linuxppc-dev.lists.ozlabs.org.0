Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD28A11F5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:51:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w0BG1k16zDqQB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 01:51:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=rppt@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vzj11HgBzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 01:29:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42FTKrH053881
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 11:29:54 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s81jgvwrk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 11:29:54 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <rppt@linux.ibm.com>;
 Thu, 2 May 2019 16:29:50 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 May 2019 16:29:41 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x42FTe3a53215466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2019 15:29:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 617B852052;
 Thu,  2 May 2019 15:29:40 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.205.209])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id C91C15204F;
 Thu,  2 May 2019 15:29:35 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation);
 Thu, 02 May 2019 18:29:34 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/15] nds32: switch to generic version of pte allocation
Date: Thu,  2 May 2019 18:28:36 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556810922-20248-1-git-send-email-rppt@linux.ibm.com>
References: <1556810922-20248-1-git-send-email-rppt@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19050215-0012-0000-0000-000003179C5E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050215-0013-0000-0000-000021500C32
Message-Id: <1556810922-20248-10-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020103
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>, Sam Creasey <sammy@sammy.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Greentime Hu <green.hu@gmail.com>, nios2-dev@lists.rocketboards.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Kuo <rkuo@codeaurora.org>, Paul Burton <paul.burton@mips.com>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The nds32 implementation of pte_alloc_one_kernel() differs from the generic
in the use of __GFP_RETRY_MAYFAIL flag, which is removed after the
conversion.

The nds32 version of pte_alloc_one() missed the call to pgtable_page_ctor()
and also used __GFP_RETRY_MAYFAIL. Switching it to use generic
__pte_alloc_one() for the PTE page allocation ensures that page table
constructor is run and the user page tables are allocated with
__GFP_ACCOUNT.

The conversion to the generic version of pte_free_kernel() removes the NULL
check for pte.

The pte_free() version on nds32 is identical to the generic one and can be
simply dropped.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/nds32/include/asm/pgalloc.h | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/arch/nds32/include/asm/pgalloc.h b/arch/nds32/include/asm/pgalloc.h
index 3c5fee5..954696c 100644
--- a/arch/nds32/include/asm/pgalloc.h
+++ b/arch/nds32/include/asm/pgalloc.h
@@ -9,6 +9,9 @@
 #include <asm/tlbflush.h>
 #include <asm/proc-fns.h>
 
+#define __HAVE_ARCH_PTE_ALLOC_ONE
+#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
+
 /*
  * Since we have only two-level page tables, these are trivial
  */
@@ -22,22 +25,11 @@ extern void pgd_free(struct mm_struct *mm, pgd_t * pgd);
 
 #define check_pgt_cache()		do { } while (0)
 
-static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	pte_t *pte;
-
-	pte =
-	    (pte_t *) __get_free_page(GFP_KERNEL | __GFP_RETRY_MAYFAIL |
-				      __GFP_ZERO);
-
-	return pte;
-}
-
 static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
 	pgtable_t pte;
 
-	pte = alloc_pages(GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO, 0);
+	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER);
 	if (pte)
 		cpu_dcache_wb_page((unsigned long)page_address(pte));
 
@@ -45,21 +37,6 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 }
 
 /*
- * Free one PTE table.
- */
-static inline void pte_free_kernel(struct mm_struct *mm, pte_t * pte)
-{
-	if (pte) {
-		free_page((unsigned long)pte);
-	}
-}
-
-static inline void pte_free(struct mm_struct *mm, pgtable_t pte)
-{
-	__free_page(pte);
-}
-
-/*
  * Populate the pmdp entry with a pointer to the pte.  This pmd is part
  * of the mm address space.
  *
-- 
2.7.4

