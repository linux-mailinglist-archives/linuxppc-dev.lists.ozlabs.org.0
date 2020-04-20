Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3F1B0D95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:00:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495SyV1wVkzDqpp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:00:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495RJb4NdhzDqdv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 22:46:07 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KCXXZp023832; Mon, 20 Apr 2020 08:45:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gfeaba3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:45:58 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03KCfh1L052443;
 Mon, 20 Apr 2020 08:45:57 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gfeaba37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:45:57 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03KCj1IA028452;
 Mon, 20 Apr 2020 12:45:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 30fs66cqyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 12:45:56 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03KCjt2648628064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 12:45:55 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 041E4136055;
 Mon, 20 Apr 2020 12:45:55 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6F3213604F;
 Mon, 20 Apr 2020 12:45:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.51.43])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 12:45:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v3 15/22] powerpc/kvm/book3s: use find_kvm_host_pte in
 pute_tce functions
Date: Mon, 20 Apr 2020 18:14:27 +0530
Message-Id: <20200420124434.47330-16-aneesh.kumar@linux.ibm.com>
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
 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=8 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 kirill@shutemov.name, leonardo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current code just hold rmap lock to ensure parallel page table update is
prevented. That is not sufficient. The kernel should also check whether
a mmu_notifer callback was running in parallel.

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_vio_hv.c | 30 +++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index 6fcaf1fa8e02..acc3ce570be7 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -437,8 +437,8 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 	return H_SUCCESS;
 }
 
-static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu,
-		unsigned long ua, unsigned long *phpa)
+static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu, unsigned long mmu_seq,
+				unsigned long ua, unsigned long *phpa)
 {
 	pte_t *ptep, pte;
 	unsigned shift = 0;
@@ -452,10 +452,17 @@ static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu,
 	 * to exit which will agains result in the below page table walk
 	 * to finish.
 	 */
-	ptep = __find_linux_pte(vcpu->arch.pgdir, ua, NULL, &shift);
-	if (!ptep || !pte_present(*ptep))
+	/* an rmap lock won't make it safe. because that just ensure hash
+	 * page table entries are removed with rmap lock held. After that
+	 * mmu notifier returns and we go ahead and removing ptes from Qemu page table.
+	 */
+	ptep = find_kvm_host_pte(vcpu->kvm, mmu_seq, ua, &shift);
+	if (!ptep)
+		return -ENXIO;
+
+	pte = READ_ONCE(*ptep);
+	if (!pte_present(pte))
 		return -ENXIO;
-	pte = *ptep;
 
 	if (!shift)
 		shift = PAGE_SHIFT;
@@ -477,10 +484,12 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		unsigned long liobn, unsigned long ioba,
 		unsigned long tce_list,	unsigned long npages)
 {
+	struct kvm *kvm = vcpu->kvm;
 	struct kvmppc_spapr_tce_table *stt;
 	long i, ret = H_SUCCESS;
 	unsigned long tces, entry, ua = 0;
 	unsigned long *rmap = NULL;
+	unsigned long mmu_seq;
 	bool prereg = false;
 	struct kvmppc_spapr_tce_iommu_table *stit;
 
@@ -488,6 +497,12 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 	if (kvm_is_radix(vcpu->kvm))
 		return H_TOO_HARD;
 
+	/*
+	 * used to check for invalidations in progress
+	 */
+	mmu_seq = kvm->mmu_notifier_seq;
+	smp_rmb();
+
 	stt = kvmppc_find_table(vcpu->kvm, liobn);
 	if (!stt)
 		return H_TOO_HARD;
@@ -547,7 +562,9 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		 * real page.
 		 */
 		lock_rmap(rmap);
-		if (kvmppc_rm_ua_to_hpa(vcpu, ua, &tces)) {
+
+		arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
+		if (kvmppc_rm_ua_to_hpa(vcpu, mmu_seq, ua, &tces)) {
 			ret = H_TOO_HARD;
 			goto unlock_exit;
 		}
@@ -593,6 +610,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 	if (rmap)
 		unlock_rmap(rmap);
 
+	arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
 	return ret;
 }
 
-- 
2.25.3

