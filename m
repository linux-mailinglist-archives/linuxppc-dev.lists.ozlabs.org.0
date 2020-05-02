Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8321C24A4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:19:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dmpw0h79zDr7L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:19:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmj55xwpzDr0d
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:14:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042AWbOC078700; Sat, 2 May 2020 07:14:12 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s45qvaew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:14:12 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BAqhM023734;
 Sat, 2 May 2020 11:14:11 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 30s0g5txfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:14:11 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BEBCK47448476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:14:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DB402805E;
 Sat,  2 May 2020 11:14:11 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C3D62805A;
 Sat,  2 May 2020 11:14:09 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:14:09 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 02/12] powerpc/book3s64/pkeys: pkeys are supported only on
 hash on book3s.
Date: Sat,  2 May 2020 16:43:37 +0530
Message-Id: <20200502111347.541836-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
References: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=907 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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

