Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBE622B79E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 22:23:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCP100zMQzDrCS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 06:23:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCNgM29XSzDrS7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 06:08:15 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NK1cem097379; Thu, 23 Jul 2020 16:08:08 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faj6vhyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 16:08:08 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NK7YQK010065;
 Thu, 23 Jul 2020 20:08:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 32brbgufyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 20:08:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NK83hK32244020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 20:08:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 253AD4C04A;
 Thu, 23 Jul 2020 20:08:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3D274C044;
 Thu, 23 Jul 2020 20:07:59 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.150.76])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 20:07:59 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 6/7] KVM: PPC: Book3S HV: move kvmppc_svm_page_out up
Date: Thu, 23 Jul 2020 13:07:23 -0700
Message-Id: <1595534844-16188-7-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
References: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_09:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 suspectscore=2 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230142
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

From: Laurent Dufour <ldufour@linux.ibm.com>

kvmppc_svm_page_out() will need to be called by kvmppc_uvmem_drop_pages()
so move it upper in this file.

Furthermore it will be interesting to call this function when already
holding the kvm->arch.uvmem_lock, so prefix the original function with __
and remove the locking in it, and introduce a wrapper which call that
function with the lock held.

There is no functional change.

Cc: Ram Pai <linuxram@us.ibm.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>
Cc: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 166 ++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index fd9ff6e..c772e92 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -535,6 +535,96 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 }
 
 /*
+ * Provision a new page on HV side and copy over the contents
+ * from secure memory using UV_PAGE_OUT uvcall.
+ * Caller must held kvm->arch.uvmem_lock.
+ */
+static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
+		unsigned long start,
+		unsigned long end, unsigned long page_shift,
+		struct kvm *kvm, unsigned long gpa)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma mig;
+	struct page *dpage, *spage;
+	struct kvmppc_uvmem_page_pvt *pvt;
+	unsigned long pfn;
+	int ret = U_SUCCESS;
+
+	memset(&mig, 0, sizeof(mig));
+	mig.vma = vma;
+	mig.start = start;
+	mig.end = end;
+	mig.src = &src_pfn;
+	mig.dst = &dst_pfn;
+	mig.src_owner = &kvmppc_uvmem_pgmap;
+
+	/* The requested page is already paged-out, nothing to do */
+	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
+		return ret;
+
+	ret = migrate_vma_setup(&mig);
+	if (ret)
+		return -1;
+
+	spage = migrate_pfn_to_page(*mig.src);
+	if (!spage || !(*mig.src & MIGRATE_PFN_MIGRATE))
+		goto out_finalize;
+
+	if (!is_zone_device_page(spage))
+		goto out_finalize;
+
+	dpage = alloc_page_vma(GFP_HIGHUSER, vma, start);
+	if (!dpage) {
+		ret = -1;
+		goto out_finalize;
+	}
+
+	lock_page(dpage);
+	pvt = spage->zone_device_data;
+	pfn = page_to_pfn(dpage);
+
+	/*
+	 * This function is used in two cases:
+	 * - When HV touches a secure page, for which we do UV_PAGE_OUT
+	 * - When a secure page is converted to shared page, we *get*
+	 *   the page to essentially unmap the device page. In this
+	 *   case we skip page-out.
+	 */
+	if (!pvt->skip_page_out)
+		ret = uv_page_out(kvm->arch.lpid, pfn << page_shift,
+				  gpa, 0, page_shift);
+
+	if (ret == U_SUCCESS)
+		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
+	else {
+		unlock_page(dpage);
+		__free_page(dpage);
+		goto out_finalize;
+	}
+
+	migrate_vma_pages(&mig);
+
+out_finalize:
+	migrate_vma_finalize(&mig);
+	return ret;
+}
+
+static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
+				      unsigned long start, unsigned long end,
+				      unsigned long page_shift,
+				      struct kvm *kvm, unsigned long gpa)
+{
+	int ret;
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
+	mutex_unlock(&kvm->arch.uvmem_lock);
+
+	return ret;
+}
+
+/*
  * Drop device pages that we maintain for the secure guest
  *
  * We first mark the pages to be skipped from UV_PAGE_OUT when there
@@ -866,82 +956,6 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	return ret;
 }
 
-/*
- * Provision a new page on HV side and copy over the contents
- * from secure memory using UV_PAGE_OUT uvcall.
- */
-static int kvmppc_svm_page_out(struct vm_area_struct *vma,
-		unsigned long start,
-		unsigned long end, unsigned long page_shift,
-		struct kvm *kvm, unsigned long gpa)
-{
-	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma mig;
-	struct page *dpage, *spage;
-	struct kvmppc_uvmem_page_pvt *pvt;
-	unsigned long pfn;
-	int ret = U_SUCCESS;
-
-	memset(&mig, 0, sizeof(mig));
-	mig.vma = vma;
-	mig.start = start;
-	mig.end = end;
-	mig.src = &src_pfn;
-	mig.dst = &dst_pfn;
-	mig.src_owner = &kvmppc_uvmem_pgmap;
-
-	mutex_lock(&kvm->arch.uvmem_lock);
-	/* The requested page is already paged-out, nothing to do */
-	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
-		goto out;
-
-	ret = migrate_vma_setup(&mig);
-	if (ret)
-		goto out;
-
-	spage = migrate_pfn_to_page(*mig.src);
-	if (!spage || !(*mig.src & MIGRATE_PFN_MIGRATE))
-		goto out_finalize;
-
-	if (!is_zone_device_page(spage))
-		goto out_finalize;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER, vma, start);
-	if (!dpage) {
-		ret = -1;
-		goto out_finalize;
-	}
-
-	lock_page(dpage);
-	pvt = spage->zone_device_data;
-	pfn = page_to_pfn(dpage);
-
-	/*
-	 * This function is used in two cases:
-	 * - When HV touches a secure page, for which we do UV_PAGE_OUT
-	 * - When a secure page is converted to shared page, we *get*
-	 *   the page to essentially unmap the device page. In this
-	 *   case we skip page-out.
-	 */
-	if (!pvt->skip_page_out)
-		ret = uv_page_out(kvm->arch.lpid, pfn << page_shift,
-				  gpa, 0, page_shift);
-
-	if (ret == U_SUCCESS)
-		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
-	else {
-		unlock_page(dpage);
-		__free_page(dpage);
-		goto out_finalize;
-	}
-
-	migrate_vma_pages(&mig);
-out_finalize:
-	migrate_vma_finalize(&mig);
-out:
-	mutex_unlock(&kvm->arch.uvmem_lock);
-	return ret;
-}
 
 /*
  * Fault handler callback that gets called when HV touches any page that
-- 
1.8.3.1

