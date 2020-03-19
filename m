Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E818ABA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:15:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jYTy2NzQzDrGn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:15:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jY4x6KXfzDr6X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 14:57:05 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J3Waa8104634; Wed, 18 Mar 2020 23:56:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8adxvq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:56:56 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J3WbLw104694;
 Wed, 18 Mar 2020 23:56:56 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8adxvpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:56:56 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J3s3Z2010833;
 Thu, 19 Mar 2020 03:56:54 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2yrpw75nhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 03:56:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J3us6b25493894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 03:56:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05AF5112062;
 Thu, 19 Mar 2020 03:56:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E05A3112063;
 Thu, 19 Mar 2020 03:56:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.34.213])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 03:56:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v2 09/22] powerpc/kvm/book3s: Add helper to walk partition
 scoped linux page table.
Date: Thu, 19 Mar 2020 09:25:56 +0530
Message-Id: <20200319035609.158654-10-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
References: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190015
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
Cc: leonardo@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 npiggin@gmail.com, kirill@shutemov.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The locking rules for walking partition scoped table is different from process
scoped table. Hence add a helper for secondary linux page table walk and also
add check whether we are holding the right locks.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h | 13 +++++++++++++
 arch/powerpc/kvm/book3s_64_mmu_radix.c   | 12 ++++++------
 arch/powerpc/kvm/book3s_hv_nested.c      |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 04b2b927bb5a..2c2635967d6e 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -14,6 +14,7 @@
 #include <asm/book3s/64/mmu-hash.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/ppc-opcode.h>
+#include <asm/pte-walk.h>
 
 #ifdef CONFIG_PPC_PSERIES
 static inline bool kvmhv_on_pseries(void)
@@ -634,6 +635,18 @@ extern void kvmhv_remove_nest_rmap_range(struct kvm *kvm,
 				unsigned long gpa, unsigned long hpa,
 				unsigned long nbytes);
 
+static inline pte_t *find_kvm_secondary_pte(struct kvm *kvm, unsigned long ea,
+					    unsigned *hshift)
+{
+	pte_t *pte;
+
+	VM_WARN(!spin_is_locked(&kvm->mmu_lock),
+		"%s called with kvm mmu_lock not held \n", __func__);
+	pte = __find_linux_pte(kvm->arch.pgtable, ea, NULL, hshift);
+
+	return pte;
+}
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 #endif /* __ASM_KVM_BOOK3S_64_H__ */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 803940d79b73..d769d7e31047 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -980,11 +980,11 @@ int kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 		return 0;
 	}
 
-	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
+	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
 	if (ptep && pte_present(*ptep))
 		kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
 				 kvm->arch.lpid);
-	return 0;				
+	return 0;
 }
 
 /* Called with kvm->mmu_lock held */
@@ -1000,7 +1000,7 @@ int kvm_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return ref;
 
-	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
+	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
 	if (ptep && pte_present(*ptep) && pte_young(*ptep)) {
 		old = kvmppc_radix_update_pte(kvm, ptep, _PAGE_ACCESSED, 0,
 					      gpa, shift);
@@ -1027,7 +1027,7 @@ int kvm_test_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return ref;
 
-	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
+	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
 	if (ptep && pte_present(*ptep) && pte_young(*ptep))
 		ref = 1;
 	return ref;
@@ -1047,7 +1047,7 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return ret;
 
-	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
+	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
 	if (ptep && pte_present(*ptep) && pte_dirty(*ptep)) {
 		ret = 1;
 		if (shift)
@@ -1108,7 +1108,7 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	gpa = memslot->base_gfn << PAGE_SHIFT;
 	spin_lock(&kvm->mmu_lock);
 	for (n = memslot->npages; n; --n) {
-		ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
+		ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
 		if (ptep && pte_present(*ptep))
 			kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
 					 kvm->arch.lpid);
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index dc97e5be76f6..7f1fc5db13ea 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1362,7 +1362,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
 	/* See if can find translation in our partition scoped tables for L1 */
 	pte = __pte(0);
 	spin_lock(&kvm->mmu_lock);
-	pte_p = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
+	pte_p = find_kvm_secondary_pte(kvm, gpa, &shift);
 	if (!shift)
 		shift = PAGE_SHIFT;
 	if (pte_p)
-- 
2.24.1

