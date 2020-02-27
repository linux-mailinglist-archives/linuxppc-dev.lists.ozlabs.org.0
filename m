Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8217115B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:21:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SkcM3446zDqRv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:21:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk4g31PSzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6shPg038204; Thu, 27 Feb 2020 01:57:19 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydq6x2b6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:18 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6ssS7038683;
 Thu, 27 Feb 2020 01:57:18 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydq6x2b5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:18 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6uk2R023123;
 Thu, 27 Feb 2020 06:57:17 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 2ydcmku97s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:57:17 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6vGPp16318970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:57:16 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D1262805A;
 Thu, 27 Feb 2020 06:57:16 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F23B2805C;
 Thu, 27 Feb 2020 06:57:14 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:57:13 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 12/21] powerpc/kvm/book3s: Use kvm helpers to walk shadow
 or secondary table
Date: Thu, 27 Feb 2020 12:26:11 +0530
Message-Id: <20200227065620.50804-13-aneesh.kumar@linux.ibm.com>
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
 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270054
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

update kvmppc_hv_handle_set_rc to use find_kvm_nested_guest_pte and
find_kvm_secondary_pte

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s.h    |  2 +-
 arch/powerpc/include/asm/kvm_book3s_64.h |  3 +++
 arch/powerpc/kvm/book3s_64_mmu_radix.c   | 18 +++++++++---------
 arch/powerpc/kvm/book3s_hv_nested.c      | 13 ++++++-------
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 506e4df2d730..37c8b50cb505 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -198,7 +198,7 @@ extern void kvmppc_unmap_pte(struct kvm *kvm, pte_t *pte, unsigned long gpa,
 			unsigned int shift,
 			const struct kvm_memory_slot *memslot,
 			unsigned int lpid);
-extern bool kvmppc_hv_handle_set_rc(struct kvm *kvm, pgd_t *pgtable,
+extern bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested,
 				    bool writing, unsigned long gpa,
 				    unsigned int lpid);
 extern int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 2c2635967d6e..2860521992b6 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -647,6 +647,9 @@ static inline pte_t *find_kvm_secondary_pte(struct kvm *kvm, unsigned long ea,
 	return pte;
 }
 
+extern pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
+					unsigned long ea, unsigned *hshift);
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 #endif /* __ASM_KVM_BOOK3S_64_H__ */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index d769d7e31047..f0b021052e33 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -735,7 +735,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 	return ret;
 }
 
-bool kvmppc_hv_handle_set_rc(struct kvm *kvm, pgd_t *pgtable, bool writing,
+bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested, bool writing,
 			     unsigned long gpa, unsigned int lpid)
 {
 	unsigned long pgflags;
@@ -750,12 +750,12 @@ bool kvmppc_hv_handle_set_rc(struct kvm *kvm, pgd_t *pgtable, bool writing,
 	pgflags = _PAGE_ACCESSED;
 	if (writing)
 		pgflags |= _PAGE_DIRTY;
-	/*
-	 * We are walking the secondary (partition-scoped) page table here.
-	 * We can do this without disabling irq because the Linux MM
-	 * subsystem doesn't do THP splits and collapses on this tree.
-	 */
-	ptep = __find_linux_pte(pgtable, gpa, NULL, &shift);
+
+	if (nested)
+		ptep = find_kvm_nested_guest_pte(kvm, lpid, gpa, &shift);
+	else
+		ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
+
 	if (ptep && pte_present(*ptep) && (!writing || pte_write(*ptep))) {
 		kvmppc_radix_update_pte(kvm, ptep, 0, pgflags, gpa, shift);
 		return true;
@@ -948,8 +948,8 @@ int kvmppc_book3s_radix_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	/* Failed to set the reference/change bits */
 	if (dsisr & DSISR_SET_RC) {
 		spin_lock(&kvm->mmu_lock);
-		if (kvmppc_hv_handle_set_rc(kvm, kvm->arch.pgtable,
-					    writing, gpa, kvm->arch.lpid))
+		if (kvmppc_hv_handle_set_rc(kvm, false, writing,
+					    gpa, kvm->arch.lpid))
 			dsisr &= ~DSISR_SET_RC;
 		spin_unlock(&kvm->mmu_lock);
 
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index b2cc3eaec618..99011f1b772a 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -750,8 +750,8 @@ static struct kvm_nested_guest *kvmhv_find_nested(struct kvm *kvm, int lpid)
 	return kvm->arch.nested_guests[lpid];
 }
 
-static pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
-					unsigned long ea, unsigned *hshift)
+pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
+				 unsigned long ea, unsigned *hshift)
 {
 	struct kvm_nested_guest *gp;
 	pte_t *pte;
@@ -767,7 +767,6 @@ static pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
 	return pte;
 }
 
-
 static inline bool kvmhv_n_rmap_is_equal(u64 rmap_1, u64 rmap_2)
 {
 	return !((rmap_1 ^ rmap_2) & (RMAP_NESTED_LPID_MASK |
@@ -1226,16 +1225,16 @@ static long kvmhv_handle_nested_set_rc(struct kvm_vcpu *vcpu,
 
 	spin_lock(&kvm->mmu_lock);
 	/* Set the rc bit in the pte of our (L0) pgtable for the L1 guest */
-	ret = kvmppc_hv_handle_set_rc(kvm, kvm->arch.pgtable, writing,
-				     gpte.raddr, kvm->arch.lpid);
+	ret = kvmppc_hv_handle_set_rc(kvm, false, writing,
+				      gpte.raddr, kvm->arch.lpid);
 	if (!ret) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
 
 	/* Set the rc bit in the pte of the shadow_pgtable for the nest guest */
-	ret = kvmppc_hv_handle_set_rc(kvm, gp->shadow_pgtable, writing, n_gpa,
-				      gp->shadow_lpid);
+	ret = kvmppc_hv_handle_set_rc(kvm, true, writing,
+				      n_gpa, gp->shadow_lpid);
 	if (!ret)
 		ret = -EINVAL;
 	else
-- 
2.24.1

