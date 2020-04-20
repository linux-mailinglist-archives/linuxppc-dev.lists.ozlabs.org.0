Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B385D1B0D8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 15:58:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Svk4lmLzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 23:58:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495RJc1bjLzDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 22:46:07 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KCWjK0051078; Mon, 20 Apr 2020 08:45:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gcbed6yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:45:53 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03KCWmXu051170;
 Mon, 20 Apr 2020 08:45:52 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gcbed6xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:45:52 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03KCdt3A020512;
 Mon, 20 Apr 2020 12:45:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 30fs660jnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 12:45:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03KCjoQN59244996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 12:45:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18966136053;
 Mon, 20 Apr 2020 12:45:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D509136059;
 Mon, 20 Apr 2020 12:45:46 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.51.43])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 12:45:45 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v3 14/22] powerpc/kvm/book3s: Use find_kvm_host_pte in h_enter
Date: Mon, 20 Apr 2020 18:14:26 +0530
Message-Id: <20200420124434.47330-15-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
References: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_04:2020-04-20,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=877
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200110
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

Since kvmppc_do_h_enter can get called in realmode use low level
arch_spin_lock which is safe to be called in realmode.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c |  5 ++---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 22 ++++++----------------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 121146f5a331..9d48173a8b77 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -281,11 +281,10 @@ static long kvmppc_virtmode_do_h_enter(struct kvm *kvm, unsigned long flags,
 {
 	long ret;
 
-	/* Protect linux PTE lookup from page table destruction */
-	rcu_read_lock_sched();	/* this disables preemption too */
+	preempt_disable();
 	ret = kvmppc_do_h_enter(kvm, flags, pte_index, pteh, ptel,
 				kvm->mm->pgd, false, pte_idx_ret);
-	rcu_read_unlock_sched();
+	preempt_enable();
 	if (ret == H_TOO_HARD) {
 		/* this can't happen */
 		pr_err("KVM: Oops, kvmppc_h_enter returned too hard!\n");
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 03f8347de48b..83e987fecf97 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -210,7 +210,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 	pte_t *ptep;
 	unsigned int writing;
 	unsigned long mmu_seq;
-	unsigned long rcbits, irq_flags = 0;
+	unsigned long rcbits;
 
 	if (kvm_is_radix(kvm))
 		return H_FUNCTION;
@@ -248,17 +248,9 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 
 	/* Translate to host virtual address */
 	hva = __gfn_to_hva_memslot(memslot, gfn);
-	/*
-	 * If we had a page table table change after lookup, we would
-	 * retry via mmu_notifier_retry.
-	 */
-	if (!realmode)
-		local_irq_save(irq_flags);
-	/*
-	 * If called in real mode we have MSR_EE = 0. Otherwise
-	 * we disable irq above.
-	 */
-	ptep = __find_linux_pte(pgdir, hva, NULL, &hpage_shift);
+
+	arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
+	ptep = find_kvm_host_pte(kvm, mmu_seq, hva, &hpage_shift);
 	if (ptep) {
 		pte_t pte;
 		unsigned int host_pte_size;
@@ -272,8 +264,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 		 * to <= host page size, if host is using hugepage
 		 */
 		if (host_pte_size < psize) {
-			if (!realmode)
-				local_irq_restore(flags);
+			arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
 			return H_PARAMETER;
 		}
 		pte = kvmppc_read_update_linux_pte(ptep, writing);
@@ -287,8 +278,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 			pa |= gpa & ~PAGE_MASK;
 		}
 	}
-	if (!realmode)
-		local_irq_restore(irq_flags);
+	arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
 
 	ptel &= HPTE_R_KEY | HPTE_R_PP0 | (psize-1);
 	ptel |= pa;
-- 
2.25.3

