Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A00227D78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 12:46:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9wHX4p3szDqZG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 20:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9wCD41k2zDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 20:42:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LAXAoQ082549; Tue, 21 Jul 2020 06:42:11 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dmfk8nhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 06:42:10 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LAaB13030968;
 Tue, 21 Jul 2020 10:42:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 32brq81wm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:42:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LAg5Xx63439014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 10:42:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519AC4C062;
 Tue, 21 Jul 2020 10:42:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD37A4C058;
 Tue, 21 Jul 2020 10:42:04 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.145.36.105])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 10:42:04 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v2 1/2] KVM: PPC: Book3S HV: move kvmppc_svm_page_out up
Date: Tue, 21 Jul 2020 12:42:01 +0200
Message-Id: <20200721104202.15727-2-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721104202.15727-1-ldufour@linux.ibm.com>
References: <20200721104202.15727-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_03:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=2 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210075
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
Cc: sukadev@linux.ibm.com, linuxram@us.ibm.com, bauerman@linux.ibm.com,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 166 ++++++++++++++++-------------
 1 file changed, 90 insertions(+), 76 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index a2b4d259f8b0..5a4b02d3f651 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -526,6 +526,96 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 	return ret;
 }
 
+/*
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
 /*
  * Drop device pages that we maintain for the secure guest
  *
@@ -898,82 +988,6 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
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
2.27.0

