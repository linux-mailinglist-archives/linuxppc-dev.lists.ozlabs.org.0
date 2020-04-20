Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290981B0DF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:08:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495T781fYrzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:08:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495RJs0YJXzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 22:46:20 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KCVD01029978; Mon, 20 Apr 2020 08:46:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghu5rv4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:46:10 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03KCXFxl037921;
 Mon, 20 Apr 2020 08:46:10 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghu5rv3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:46:10 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03KCdtbU022230;
 Mon, 20 Apr 2020 12:46:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 30fs660k79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 12:46:09 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03KCk8a839977312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 12:46:08 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E1DC136051;
 Mon, 20 Apr 2020 12:46:08 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BA1C13605D;
 Mon, 20 Apr 2020 12:46:05 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.51.43])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 12:46:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v3 18/22] powerpc/kvm/book3s: Use find_kvm_host_pte in
 kvmppc_get_hpa
Date: Mon, 20 Apr 2020 18:14:30 +0530
Message-Id: <20200420124434.47330-19-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
References: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_03:2020-04-20,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200107
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
2.25.3

