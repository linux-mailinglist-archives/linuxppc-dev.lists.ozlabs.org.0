Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 658FC171154
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:17:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SkXK6hkczDqvN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:17:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk4b5lZ8zDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:19 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6sHpG119284; Thu, 27 Feb 2020 01:57:13 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqfvhrsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:13 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6vC3s126261;
 Thu, 27 Feb 2020 01:57:12 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqfvhrrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:12 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6ulp5017843;
 Thu, 27 Feb 2020 06:57:11 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2ydcmkx44c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:57:11 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6vB2j46858546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:57:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6B5A28058;
 Thu, 27 Feb 2020 06:57:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB5E128059;
 Thu, 27 Feb 2020 06:57:08 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:57:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 10/21] powerpc/kvm/book3s: Add helper to walk partition
 scoped linux page table.
Date: Thu, 27 Feb 2020 12:26:09 +0530
Message-Id: <20200227065620.50804-11-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
References: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002270054
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
 linuxppc-dev@lists.ozlabs.org
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

