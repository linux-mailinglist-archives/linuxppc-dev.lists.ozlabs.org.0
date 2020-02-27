Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CBD17118B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:34:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Skv80nQtzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:34:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk526SBWzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:42 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6sCFq115957; Thu, 27 Feb 2020 01:57:37 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydxrdh20n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:37 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6sn2p117414;
 Thu, 27 Feb 2020 01:57:37 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydxrdh20d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:37 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6ukGw022814;
 Thu, 27 Feb 2020 06:57:36 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2ydcmkk967-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:57:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6va4t48628054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:57:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53C212805C;
 Thu, 27 Feb 2020 06:57:36 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16B5428058;
 Thu, 27 Feb 2020 06:57:34 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:57:33 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 19/21] powerpc/kvm/book3s: Use find_kvm_host_pte in
 kvmppc_get_hpa
Date: Thu, 27 Feb 2020 12:26:18 +0530
Message-Id: <20200227065620.50804-20-aneesh.kumar@linux.ibm.com>
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
 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=961 impostorscore=0 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270054
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

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 32 ++++++++++-------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 83e987fecf97..3b168c69d503 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -878,8 +878,8 @@ long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 	return ret;
 }
 
-static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long gpa,
-			  int writing, unsigned long *hpa,
+static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long mmu_seq,
+			  unsigned long gpa, int writing, unsigned long *hpa,
 			  struct kvm_memory_slot **memslot_p)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -898,7 +898,7 @@ static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long gpa,
 	hva = __gfn_to_hva_memslot(memslot, gfn);
 
 	/* Try to find the host pte for that virtual address */
-	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
+	ptep = find_kvm_host_pte(kvm, mmu_seq, hva, &shift);
 	if (!ptep)
 		return H_TOO_HARD;
 	pte = kvmppc_read_update_linux_pte(ptep, writing);
@@ -933,16 +933,11 @@ static long kvmppc_do_h_page_init_zero(struct kvm_vcpu *vcpu,
 	mmu_seq = kvm->mmu_notifier_seq;
 	smp_rmb();
 
-	ret = kvmppc_get_hpa(vcpu, dest, 1, &pa, &memslot);
-	if (ret != H_SUCCESS)
-		return ret;
-
-	/* Check if we've been invalidated */
 	arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
-	if (mmu_notifier_retry(kvm, mmu_seq)) {
-		ret = H_TOO_HARD;
+
+	ret = kvmppc_get_hpa(vcpu, mmu_seq, dest, 1, &pa, &memslot);
+	if (ret != H_SUCCESS)
 		goto out_unlock;
-	}
 
 	/* Zero the page */
 	for (i = 0; i < SZ_4K; i += L1_CACHE_BYTES, pa += L1_CACHE_BYTES)
@@ -966,19 +961,14 @@ static long kvmppc_do_h_page_init_copy(struct kvm_vcpu *vcpu,
 	mmu_seq = kvm->mmu_notifier_seq;
 	smp_rmb();
 
-	ret = kvmppc_get_hpa(vcpu, dest, 1, &dest_pa, &dest_memslot);
-	if (ret != H_SUCCESS)
-		return ret;
-	ret = kvmppc_get_hpa(vcpu, src, 0, &src_pa, NULL);
+	arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
+	ret = kvmppc_get_hpa(vcpu, mmu_seq, dest, 1, &dest_pa, &dest_memslot);
 	if (ret != H_SUCCESS)
-		return ret;
+		goto out_unlock;
 
-	/* Check if we've been invalidated */
-	arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
-	if (mmu_notifier_retry(kvm, mmu_seq)) {
-		ret = H_TOO_HARD;
+	ret = kvmppc_get_hpa(vcpu, mmu_seq, src, 0, &src_pa, NULL);
+	if (ret != H_SUCCESS)
 		goto out_unlock;
-	}
 
 	/* Copy the page */
 	memcpy((void *)dest_pa, (void *)src_pa, SZ_4K);
-- 
2.24.1

