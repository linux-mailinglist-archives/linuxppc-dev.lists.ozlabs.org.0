Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC32BFC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 08:54:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Cl2W256FzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 16:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ckx15JtFzDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 16:49:57 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4S6btrv105794
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 02:49:54 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2srxxm29pq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 02:49:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 28 May 2019 07:49:52 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 May 2019 07:49:50 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4S6nmuI54657230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 06:49:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 731DF11C04A;
 Tue, 28 May 2019 06:49:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBBBD11C04C;
 Tue, 28 May 2019 06:49:46 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.100])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 May 2019 06:49:46 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/6] kvmppc: Shared pages support for secure guests
Date: Tue, 28 May 2019 12:19:29 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528064933.23119-1-bharata@linux.ibm.com>
References: <20190528064933.23119-1-bharata@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19052806-0008-0000-0000-000002EB1A71
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052806-0009-0000-0000-00002257E5D2
Message-Id: <20190528064933.23119-3-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-28_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=782 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905280045
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A secure guest will share some of its pages with hypervisor (Eg. virtio
bounce buffers etc). Support shared pages in HMM driver.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h |  3 ++
 arch/powerpc/kvm/book3s_hv_hmm.c  | 58 +++++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 2f6b952deb0f..05b8536f6653 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -337,6 +337,9 @@
 #define H_TLB_INVALIDATE	0xF808
 #define H_COPY_TOFROM_GUEST	0xF80C
 
+/* Flags for H_SVM_PAGE_IN */
+#define H_PAGE_IN_SHARED        0x1
+
 /* Platform-specific hcalls used by the Ultravisor */
 #define H_SVM_PAGE_IN		0xEF00
 #define H_SVM_PAGE_OUT		0xEF04
diff --git a/arch/powerpc/kvm/book3s_hv_hmm.c b/arch/powerpc/kvm/book3s_hv_hmm.c
index 713806003da3..333829682f59 100644
--- a/arch/powerpc/kvm/book3s_hv_hmm.c
+++ b/arch/powerpc/kvm/book3s_hv_hmm.c
@@ -45,6 +45,7 @@ struct kvmppc_hmm_page_pvt {
 	unsigned long *rmap;
 	unsigned int lpid;
 	unsigned long gpa;
+	bool skip_page_out;
 };
 
 struct kvmppc_hmm_migrate_args {
@@ -212,6 +213,45 @@ static const struct migrate_vma_ops kvmppc_hmm_migrate_ops = {
 	.finalize_and_map = kvmppc_hmm_migrate_finalize_and_map,
 };
 
+/*
+ * Shares the page with HV, thus making it a normal page.
+ *
+ * - If the page is already secure, then provision a new page and share
+ * - If the page is a normal page, share the existing page
+ *
+ * In the former case, uses the HMM fault handler to release the HMM page.
+ */
+static unsigned long
+kvmppc_share_page(struct kvm *kvm, unsigned long *rmap, unsigned long gpa,
+		  unsigned long addr, unsigned long page_shift)
+{
+
+	int ret;
+	unsigned int lpid = kvm->arch.lpid;
+	struct page *hmm_page;
+	struct kvmppc_hmm_page_pvt *pvt;
+	unsigned long pfn;
+	int srcu_idx;
+
+	if (kvmppc_is_hmm_pfn(*rmap)) {
+		hmm_page = pfn_to_page(*rmap & ~KVMPPC_PFN_HMM);
+		pvt = (struct kvmppc_hmm_page_pvt *)
+			hmm_devmem_page_get_drvdata(hmm_page);
+		pvt->skip_page_out = true;
+	}
+
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	pfn = gfn_to_pfn(kvm, gpa >> page_shift);
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+	if (is_error_noslot_pfn(pfn))
+		return H_PARAMETER;
+
+	ret = uv_page_in(lpid, pfn << page_shift, gpa, 0, page_shift);
+	kvm_release_pfn_clean(pfn);
+
+	return (ret == U_SUCCESS) ? H_SUCCESS : H_PARAMETER;
+}
+
 /*
  * Move page from normal memory to secure memory.
  */
@@ -242,9 +282,12 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 
 	end = addr + (1UL << page_shift);
 
-	if (flags)
+	if (flags & ~H_PAGE_IN_SHARED)
 		return H_P2;
 
+	if (flags & H_PAGE_IN_SHARED)
+		return kvmppc_share_page(kvm, rmap, gpa, addr, page_shift);
+
 	args.rmap = rmap;
 	args.lpid = kvm->arch.lpid;
 	args.gpa = gpa;
@@ -291,8 +334,17 @@ kvmppc_hmm_fault_migrate_alloc_and_copy(struct vm_area_struct *vma,
 	       hmm_devmem_page_get_drvdata(spage);
 
 	pfn = page_to_pfn(dpage);
-	ret = uv_page_out(pvt->lpid, pfn << PAGE_SHIFT,
-			  pvt->gpa, 0, PAGE_SHIFT);
+
+	/*
+	 * This same alloc_and_copy() callback is used in two cases:
+	 * - When HV touches a secure page, for which we do page-out
+	 * - When a secure page is converted to shared page, we touch
+	 *   the page to essentially discard the HMM page. In this case we
+	 *   skip page-out.
+	 */
+	if (!pvt->skip_page_out)
+		ret = uv_page_out(pvt->lpid, pfn << PAGE_SHIFT,
+				  pvt->gpa, 0, PAGE_SHIFT);
 	if (ret == U_SUCCESS)
 		*dst_pfn = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
 }
-- 
2.17.1

