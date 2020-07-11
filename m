Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7881821C354
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 11:24:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3kyR3bmnzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 19:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3klx4TpfzDr24
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 19:15:41 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06B92Br8020914; Sat, 11 Jul 2020 05:15:34 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279gkh558-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Jul 2020 05:15:34 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06B9BOwR020029;
 Sat, 11 Jul 2020 09:15:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 327527r7ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Jul 2020 09:15:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06B9EDYt58654852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 11 Jul 2020 09:14:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C062E11C04A;
 Sat, 11 Jul 2020 09:14:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE1A711C054;
 Sat, 11 Jul 2020 09:14:10 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.39.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 11 Jul 2020 09:14:10 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [v3 4/5] KVM: PPC: Book3S HV: retry page migration before
 erroring-out H_SVM_PAGE_IN
Date: Sat, 11 Jul 2020 02:13:46 -0700
Message-Id: <1594458827-31866-5-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
References: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-11_03:2020-07-10,
 2020-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007110065
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
Cc: ldufour@linux.ibm.com, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The page requested for page-in; sometimes, can have transient
references, and hence cannot migrate immediately. Retry a few times
before returning error.

H_SVM_PAGE_IN interface is enhanced to return H_BUSY if the page is
not in a migratable state.

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bharata B Rao <bharata@linux.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 Documentation/powerpc/ultravisor.rst |  1 +
 arch/powerpc/kvm/book3s_hv_uvmem.c   | 54 +++++++++++++++++++++---------------
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index d98fc85..638d1a7 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -1034,6 +1034,7 @@ Return values
 	* H_PARAMETER	if ``guest_pa`` is invalid.
 	* H_P2		if ``flags`` is invalid.
 	* H_P3		if ``order`` of page is invalid.
+	* H_BUSY	if ``page`` is not in a state to pagein
 
 Description
 ~~~~~~~~~~~
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 12ed52a..c9bdef6 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -843,7 +843,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	struct vm_area_struct *vma;
 	int srcu_idx;
 	unsigned long gfn = gpa >> page_shift;
-	int ret;
+	int ret, repeat_count = REPEAT_COUNT;
 
 	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
 		return H_UNSUPPORTED;
@@ -857,34 +857,44 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	if (flags & H_PAGE_IN_SHARED)
 		return kvmppc_share_page(kvm, gpa, page_shift);
 
-	ret = H_PARAMETER;
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	down_write(&kvm->mm->mmap_sem);
 
-	start = gfn_to_hva(kvm, gfn);
-	if (kvm_is_error_hva(start))
-		goto out;
-
-	mutex_lock(&kvm->arch.uvmem_lock);
 	/* Fail the page-in request of an already paged-in page */
-	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
-		goto out_unlock;
+	mutex_lock(&kvm->arch.uvmem_lock);
+	ret = kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL);
+	mutex_unlock(&kvm->arch.uvmem_lock);
+	if (ret) {
+		srcu_read_unlock(&kvm->srcu, srcu_idx);
+		return H_PARAMETER;
+	}
 
-	end = start + (1UL << page_shift);
-	vma = find_vma_intersection(kvm->mm, start, end);
-	if (!vma || vma->vm_start > start || vma->vm_end < end)
-		goto out_unlock;
+	do {
+		ret = H_PARAMETER;
+		down_write(&kvm->mm->mmap_sem);
 
-	if (kvmppc_svm_migrate_page(vma, start, end, gpa, kvm, page_shift,
-				true))
-		goto out_unlock;
+		start = gfn_to_hva(kvm, gfn);
+		if (kvm_is_error_hva(start)) {
+			up_write(&kvm->mm->mmap_sem);
+			break;
+		}
 
-	ret = H_SUCCESS;
+		end = start + (1UL << page_shift);
+		vma = find_vma_intersection(kvm->mm, start, end);
+		if (!vma || vma->vm_start > start || vma->vm_end < end) {
+			up_write(&kvm->mm->mmap_sem);
+			break;
+		}
+
+		mutex_lock(&kvm->arch.uvmem_lock);
+		ret = kvmppc_svm_migrate_page(vma, start, end, gpa, kvm, page_shift, true);
+		mutex_unlock(&kvm->arch.uvmem_lock);
+
+		up_write(&kvm->mm->mmap_sem);
+	} while (ret == -2 && repeat_count--);
+
+	if (ret == -2)
+		ret = H_BUSY;
 
-out_unlock:
-	mutex_unlock(&kvm->arch.uvmem_lock);
-out:
-	up_write(&kvm->mm->mmap_sem);
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return ret;
 }
-- 
1.8.3.1

