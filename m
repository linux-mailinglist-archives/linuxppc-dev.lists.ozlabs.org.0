Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2E1AFB12
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 16:04:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494s5m3tpkzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 00:04:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 494rw32LwtzDqyH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 23:56:19 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03JDVq94055642; Sun, 19 Apr 2020 09:56:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmu635bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Apr 2020 09:56:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03JDtmhG022927;
 Sun, 19 Apr 2020 13:56:11 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 30fs664ceb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Apr 2020 13:56:11 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03JDuAT360096928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Apr 2020 13:56:10 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C40C6A04D;
 Sun, 19 Apr 2020 13:56:10 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BF2F6A047;
 Sun, 19 Apr 2020 13:56:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.84.210])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 19 Apr 2020 13:56:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 01/10] powerpc/book3s64/pkeys: Fixup bit numbering
Date: Sun, 19 Apr 2020 19:25:40 +0530
Message-Id: <20200419135549.731829-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-19_03:2020-04-17,
 2020-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=978
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004190118
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This number the pkey bit such that it is easy to follow. PKEY_BIT0 is
the lower order bit. This makes further changes easy to follow.

No functional change in this patch other than linux page table for
hash translation now maps pkeys differently.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  9 +++----
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  8 +++----
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  8 +++----
 arch/powerpc/include/asm/pkeys.h              | 24 +++++++++----------
 4 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 3f9ae3585ab9..f889d56bf8cf 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -57,11 +57,12 @@
 #define H_PMD_FRAG_NR	(PAGE_SIZE >> H_PMD_FRAG_SIZE_SHIFT)
 
 /* memory key bits, only 8 keys supported */
-#define H_PTE_PKEY_BIT0	0
-#define H_PTE_PKEY_BIT1	0
+#define H_PTE_PKEY_BIT4	0
+#define H_PTE_PKEY_BIT3	0
 #define H_PTE_PKEY_BIT2	_RPAGE_RSV3
-#define H_PTE_PKEY_BIT3	_RPAGE_RSV4
-#define H_PTE_PKEY_BIT4	_RPAGE_RSV5
+#define H_PTE_PKEY_BIT1	_RPAGE_RSV4
+#define H_PTE_PKEY_BIT0	_RPAGE_RSV5
+
 
 /*
  * On all 4K setups, remap_4k_pfn() equates to remap_pfn_range()
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index 0729c034e56f..0a15fd14cf72 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -36,11 +36,11 @@
 #define H_PAGE_HASHPTE	_RPAGE_RPN43	/* PTE has associated HPTE */
 
 /* memory key bits. */
-#define H_PTE_PKEY_BIT0	_RPAGE_RSV1
-#define H_PTE_PKEY_BIT1	_RPAGE_RSV2
+#define H_PTE_PKEY_BIT4	_RPAGE_RSV1
+#define H_PTE_PKEY_BIT3	_RPAGE_RSV2
 #define H_PTE_PKEY_BIT2	_RPAGE_RSV3
-#define H_PTE_PKEY_BIT3	_RPAGE_RSV4
-#define H_PTE_PKEY_BIT4	_RPAGE_RSV5
+#define H_PTE_PKEY_BIT1	_RPAGE_RSV4
+#define H_PTE_PKEY_BIT0	_RPAGE_RSV5
 
 /*
  * We need to differentiate between explicit huge page and THP huge
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3fa1b962dc27..58fcc959f9d5 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -86,8 +86,8 @@
 #define HPTE_R_PP0		ASM_CONST(0x8000000000000000)
 #define HPTE_R_TS		ASM_CONST(0x4000000000000000)
 #define HPTE_R_KEY_HI		ASM_CONST(0x3000000000000000)
-#define HPTE_R_KEY_BIT0		ASM_CONST(0x2000000000000000)
-#define HPTE_R_KEY_BIT1		ASM_CONST(0x1000000000000000)
+#define HPTE_R_KEY_BIT4		ASM_CONST(0x2000000000000000)
+#define HPTE_R_KEY_BIT3		ASM_CONST(0x1000000000000000)
 #define HPTE_R_RPN_SHIFT	12
 #define HPTE_R_RPN		ASM_CONST(0x0ffffffffffff000)
 #define HPTE_R_RPN_3_0		ASM_CONST(0x01fffffffffff000)
@@ -103,8 +103,8 @@
 #define HPTE_R_R		ASM_CONST(0x0000000000000100)
 #define HPTE_R_KEY_LO		ASM_CONST(0x0000000000000e00)
 #define HPTE_R_KEY_BIT2		ASM_CONST(0x0000000000000800)
-#define HPTE_R_KEY_BIT3		ASM_CONST(0x0000000000000400)
-#define HPTE_R_KEY_BIT4		ASM_CONST(0x0000000000000200)
+#define HPTE_R_KEY_BIT1		ASM_CONST(0x0000000000000400)
+#define HPTE_R_KEY_BIT0		ASM_CONST(0x0000000000000200)
 #define HPTE_R_KEY		(HPTE_R_KEY_LO | HPTE_R_KEY_HI)
 
 #define HPTE_V_1TB_SEG		ASM_CONST(0x4000000000000000)
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 20ebf153c871..f8f4d0793789 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -35,11 +35,11 @@ static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
 	if (static_branch_likely(&pkey_disabled))
 		return 0x0UL;
 
-	return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT4 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT1) ? H_PTE_PKEY_BIT3 : 0x0UL) |
+	return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
+		((vm_flags & VM_PKEY_BIT1) ? H_PTE_PKEY_BIT1 : 0x0UL) |
 		((vm_flags & VM_PKEY_BIT2) ? H_PTE_PKEY_BIT2 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT3) ? H_PTE_PKEY_BIT1 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT4) ? H_PTE_PKEY_BIT0 : 0x0UL));
+		((vm_flags & VM_PKEY_BIT3) ? H_PTE_PKEY_BIT3 : 0x0UL) |
+		((vm_flags & VM_PKEY_BIT4) ? H_PTE_PKEY_BIT4 : 0x0UL));
 }
 
 static inline int vma_pkey(struct vm_area_struct *vma)
@@ -53,20 +53,20 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 
 static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
 {
-	return (((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
+	return (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
 		((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL));
+		((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
 }
 
 static inline u16 pte_to_pkey_bits(u64 pteflags)
 {
-	return (((pteflags & H_PTE_PKEY_BIT0) ? 0x10 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT1) ? 0x8 : 0x0UL) |
+	return (((pteflags & H_PTE_PKEY_BIT4) ? 0x10 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT3) ? 0x8 : 0x0UL) |
 		((pteflags & H_PTE_PKEY_BIT2) ? 0x4 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT3) ? 0x2 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT4) ? 0x1 : 0x0UL));
+		((pteflags & H_PTE_PKEY_BIT1) ? 0x2 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT0) ? 0x1 : 0x0UL));
 }
 
 #define pkey_alloc_mask(pkey) (0x1 << pkey)
-- 
2.25.2

