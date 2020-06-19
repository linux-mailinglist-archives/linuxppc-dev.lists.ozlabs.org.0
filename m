Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF177200B1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 16:15:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pLRV325RzDrNH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 00:15:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL5L32R3zDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:59:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDciAY072569; Fri, 19 Jun 2020 09:59:12 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31runcnjfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:59:12 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDspA6008980;
 Fri, 19 Jun 2020 13:59:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 31rd95fvbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:59:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDx8U411076180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47D5FBE053;
 Fri, 19 Jun 2020 13:59:10 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BE32BE051;
 Fri, 19 Jun 2020 13:59:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 02/26] powerpc/book3s64/pkeys: pkeys are supported only on
 hash on book3s.
Date: Fri, 19 Jun 2020 19:28:26 +0530
Message-Id: <20200619135850.47155-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=894
 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190096
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

Move them to hash specific file and add BUG() for radix path.
---
 .../powerpc/include/asm/book3s/64/hash-pkey.h | 32 ++++++++++++++++
 arch/powerpc/include/asm/book3s/64/pkeys.h    | 25 +++++++++++++
 arch/powerpc/include/asm/pkeys.h              | 37 ++++---------------
 3 files changed, 64 insertions(+), 30 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h

diff --git a/arch/powerpc/include/asm/book3s/64/hash-pkey.h b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
new file mode 100644
index 000000000000..795010897e5d
--- /dev/null
+++ b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_BOOK3S_64_HASH_PKEY_H
+#define _ASM_POWERPC_BOOK3S_64_HASH_PKEY_H
+
+static inline u64 hash__vmflag_to_pte_pkey_bits(u64 vm_flags)
+{
+	return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
+		((vm_flags & VM_PKEY_BIT1) ? H_PTE_PKEY_BIT1 : 0x0UL) |
+		((vm_flags & VM_PKEY_BIT2) ? H_PTE_PKEY_BIT2 : 0x0UL) |
+		((vm_flags & VM_PKEY_BIT3) ? H_PTE_PKEY_BIT3 : 0x0UL) |
+		((vm_flags & VM_PKEY_BIT4) ? H_PTE_PKEY_BIT4 : 0x0UL));
+}
+
+static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
+{
+	return (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
+}
+
+static inline u16 hash__pte_to_pkey_bits(u64 pteflags)
+{
+	return (((pteflags & H_PTE_PKEY_BIT4) ? 0x10 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT3) ? 0x8 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT2) ? 0x4 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT1) ? 0x2 : 0x0UL) |
+		((pteflags & H_PTE_PKEY_BIT0) ? 0x1 : 0x0UL));
+}
+
+#endif
diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
new file mode 100644
index 000000000000..8174662a9173
--- /dev/null
+++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _ASM_POWERPC_BOOK3S_64_PKEYS_H
+#define _ASM_POWERPC_BOOK3S_64_PKEYS_H
+
+#include <asm/book3s/64/hash-pkey.h>
+
+static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
+{
+	if (static_branch_likely(&pkey_disabled))
+		return 0x0UL;
+
+	if (radix_enabled())
+		BUG();
+	return hash__vmflag_to_pte_pkey_bits(vm_flags);
+}
+
+static inline u16 pte_to_pkey_bits(u64 pteflags)
+{
+	if (radix_enabled())
+		BUG();
+	return hash__pte_to_pkey_bits(pteflags);
+}
+
+#endif /*_ASM_POWERPC_KEYS_H */
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index f8f4d0793789..5dd0a79d1809 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -25,23 +25,18 @@ extern u32 reserved_allocation_mask; /* bits set for reserved keys */
 				PKEY_DISABLE_WRITE  | \
 				PKEY_DISABLE_EXECUTE)
 
+#ifdef CONFIG_PPC_BOOK3S_64
+#include <asm/book3s/64/pkeys.h>
+#else
+#error "Not supported"
+#endif
+
+
 static inline u64 pkey_to_vmflag_bits(u16 pkey)
 {
 	return (((u64)pkey << VM_PKEY_SHIFT) & ARCH_VM_PKEY_FLAGS);
 }
 
-static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
-{
-	if (static_branch_likely(&pkey_disabled))
-		return 0x0UL;
-
-	return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT1) ? H_PTE_PKEY_BIT1 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT2) ? H_PTE_PKEY_BIT2 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT3) ? H_PTE_PKEY_BIT3 : 0x0UL) |
-		((vm_flags & VM_PKEY_BIT4) ? H_PTE_PKEY_BIT4 : 0x0UL));
-}
-
 static inline int vma_pkey(struct vm_area_struct *vma)
 {
 	if (static_branch_likely(&pkey_disabled))
@@ -51,24 +46,6 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 
 #define arch_max_pkey() pkeys_total
 
-static inline u64 pte_to_hpte_pkey_bits(u64 pteflags)
-{
-	return (((pteflags & H_PTE_PKEY_BIT4) ? HPTE_R_KEY_BIT4 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT3) ? HPTE_R_KEY_BIT3 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT2) ? HPTE_R_KEY_BIT2 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT1) ? HPTE_R_KEY_BIT1 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT0) ? HPTE_R_KEY_BIT0 : 0x0UL));
-}
-
-static inline u16 pte_to_pkey_bits(u64 pteflags)
-{
-	return (((pteflags & H_PTE_PKEY_BIT4) ? 0x10 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT3) ? 0x8 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT2) ? 0x4 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT1) ? 0x2 : 0x0UL) |
-		((pteflags & H_PTE_PKEY_BIT0) ? 0x1 : 0x0UL));
-}
-
 #define pkey_alloc_mask(pkey) (0x1 << pkey)
 
 #define mm_pkey_allocation_map(mm) (mm->context.pkey_allocation_map)
-- 
2.26.2

