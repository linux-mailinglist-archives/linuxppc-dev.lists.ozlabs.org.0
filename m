Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C229266A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 13:35:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFF6b0GCnzDqFL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 22:35:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G7ttXwRj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFDxJ0rMvzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 22:26:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JB3dI6053834; Mon, 19 Oct 2020 07:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=exoZShDfrUiqNe2rho3zOlNg4YqtLyRDX6XRorZ2VVo=;
 b=G7ttXwRjMsJUcnv56/IE8j2DpaJePHhUZ4v9hmtjvFMFmDvfpAeYeL5R8TSEpr2gJQx7
 KWUNT/Ji+PNvo4AHtaXlgdSIWM2O2ztMOHVJIWquYg3dqHdpfLxBTBnPRgkQd2SMmXS7
 aOIiv2as/BdMmd+wI9pq5BUitwus1PfWnKOY5Mw3EUR2u+NrcKBeRv4pUWxtgep96K5n
 KUSZpeF21ZlbEk18eGf9F/35D/CvVyo55K3EtGMU7XNue1uG/epiufgMmjyQN/9TyQjm
 dSjYo2FzFKpPcxfI+8m+sq4UeVT0qtssCjx2opJu72KoVydXgYFIvSBE0AjLD4WLR2eQ Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3498p1tjm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 07:26:53 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09JBPsVN126186;
 Mon, 19 Oct 2020 07:26:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3498p1tjkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 07:26:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09JBMmEt017143;
 Mon, 19 Oct 2020 11:26:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 348d5qs6gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 11:26:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09JBQmQE31064370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 11:26:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 462D2AE053;
 Mon, 19 Oct 2020 11:26:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E820AAE051;
 Mon, 19 Oct 2020 11:26:46 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.73.75])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 11:26:46 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/2] KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
 (nested case only)
Date: Mon, 19 Oct 2020 16:56:41 +0530
Message-Id: <20201019112642.53016-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019112642.53016-1-bharata@linux.ibm.com>
References: <20201019112642.53016-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_02:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190082
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implements H_RPT_INVALIDATE hcall and supports only nested case
currently.

A KVM capability KVM_CAP_RPT_INVALIDATE is added to indicate the
support for this hcall.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst                | 17 ++++
 .../include/asm/book3s/64/tlbflush-radix.h    | 18 ++++
 arch/powerpc/include/asm/kvm_book3s.h         |  3 +
 arch/powerpc/kvm/book3s_hv.c                  | 32 +++++++
 arch/powerpc/kvm/book3s_hv_nested.c           | 94 +++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                    |  3 +
 arch/powerpc/mm/book3s64/radix_tlb.c          |  4 -
 include/uapi/linux/kvm.h                      |  1 +
 8 files changed, 168 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1f26d83e6b168..67e98a56271ae 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5852,6 +5852,23 @@ controlled by the kvm module parameter halt_poll_ns. This capability allows
 the maximum halt time to specified on a per-VM basis, effectively overriding
 the module parameter for the target VM.
 
+7.21 KVM_CAP_RPT_INVALIDATE
+--------------------------
+
+:Capability: KVM_CAP_RPT_INVALIDATE
+:Architectures: ppc
+:Type: vm
+
+This capability indicates that the kernel is capable of handling
+H_RPT_INVALIDATE hcall.
+
+In order to enable the use of H_RPT_INVALIDATE in the guest,
+user space might have to advertise it for the guest. For example,
+IBM pSeries (sPAPR) guest starts using it if "hcall-rpt-invalidate" is
+present in the "ibm,hypertas-functions" device-tree property.
+
+This capability is always enabled.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 94439e0cefc9c..aace7e9b2397d 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -4,6 +4,10 @@
 
 #include <asm/hvcall.h>
 
+#define RIC_FLUSH_TLB 0
+#define RIC_FLUSH_PWC 1
+#define RIC_FLUSH_ALL 2
+
 struct vm_area_struct;
 struct mm_struct;
 struct mmu_gather;
@@ -21,6 +25,20 @@ static inline u64 psize_to_rpti_pgsize(unsigned long psize)
 	return H_RPTI_PAGE_ALL;
 }
 
+static inline int rpti_pgsize_to_psize(unsigned long page_size)
+{
+	if (page_size == H_RPTI_PAGE_4K)
+		return MMU_PAGE_4K;
+	if (page_size == H_RPTI_PAGE_64K)
+		return MMU_PAGE_64K;
+	if (page_size == H_RPTI_PAGE_2M)
+		return MMU_PAGE_2M;
+	if (page_size == H_RPTI_PAGE_1G)
+		return MMU_PAGE_1G;
+	else
+		return MMU_PAGE_64K; /* Default */
+}
+
 static inline int mmu_get_ap(int psize)
 {
 	return mmu_psize_defs[psize].ap;
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index d32ec9ae73bd4..0f1c5fa6e8ce3 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -298,6 +298,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
 void kvmhv_release_all_nested(struct kvm *kvm);
 long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
 long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
+long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
+			 unsigned long type, unsigned long pg_sizes,
+			 unsigned long start, unsigned long end);
 int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
 			  u64 time_limit, unsigned long lpcr);
 void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3bd3118c76330..6cbd37af91ebf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -904,6 +904,28 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 	return yield_count;
 }
 
+static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
+				    unsigned long pid, unsigned long target,
+				    unsigned long type, unsigned long pg_sizes,
+				    unsigned long start, unsigned long end)
+{
+	if (end < start)
+		return H_P5;
+
+	if ((!type & H_RPTI_TYPE_NESTED))
+		return H_P3;
+
+	if (!nesting_enabled(vcpu->kvm))
+		return H_FUNCTION;
+
+	/* Support only cores as target */
+	if (target != H_RPTI_TARGET_CMMU)
+		return H_P2;
+
+	return kvmhv_h_rpti_nested(vcpu, pid, (type & ~H_RPTI_TYPE_NESTED),
+				   pg_sizes, start, end);
+}
+
 int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 {
 	unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -1112,6 +1134,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		 */
 		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
 		break;
+	case H_RPT_INVALIDATE:
+		ret = kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
+					      kvmppc_get_gpr(vcpu, 5),
+					      kvmppc_get_gpr(vcpu, 6),
+					      kvmppc_get_gpr(vcpu, 7),
+					      kvmppc_get_gpr(vcpu, 8),
+					      kvmppc_get_gpr(vcpu, 9));
+		break;
 
 	default:
 		return RESUME_HOST;
@@ -1158,6 +1188,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	case H_XIRR_X:
 #endif
 	case H_PAGE_INIT:
+	case H_RPT_INVALIDATE:
 		return 1;
 	}
 
@@ -5334,6 +5365,7 @@ static unsigned int default_hcall_list[] = {
 	H_XIRR,
 	H_XIRR_X,
 #endif
+	H_RPT_INVALIDATE,
 	0
 };
 
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 6822d23a2da4d..3ec0231628b42 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1149,6 +1149,100 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
 	return H_SUCCESS;
 }
 
+static long do_tlb_invalidate_nested_tlb(struct kvm_vcpu *vcpu,
+					 unsigned long lpid,
+					 unsigned long page_size,
+					 unsigned long ap,
+					 unsigned long start,
+					 unsigned long end)
+{
+	unsigned long addr = start;
+	int ret;
+
+	do {
+		ret = kvmhv_emulate_tlbie_tlb_addr(vcpu, lpid, ap,
+						   get_epn(addr));
+		if (ret)
+			return ret;
+		addr += page_size;
+	} while (addr < end);
+
+	return ret;
+}
+
+static long do_tlb_invalidate_nested_all(struct kvm_vcpu *vcpu,
+					 unsigned long lpid)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_nested_guest *gp;
+
+	gp = kvmhv_get_nested(kvm, lpid, false);
+	if (gp) {
+		kvmhv_emulate_tlbie_lpid(vcpu, gp, RIC_FLUSH_ALL);
+		kvmhv_put_nested(gp);
+	}
+	return H_SUCCESS;
+}
+
+long kvmhv_h_rpti_nested(struct kvm_vcpu *vcpu, unsigned long lpid,
+			 unsigned long type, unsigned long pg_sizes,
+			 unsigned long start, unsigned long end)
+{
+	struct kvm_nested_guest *gp;
+	long ret;
+	unsigned long psize, ap;
+
+	/*
+	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
+	 * Nested KVM issues a L2 lpid flush call when creating
+	 * partition table entries for L2. This happens even before
+	 * the corresponding shadow lpid is created in HV. Until
+	 * this is fixed, ignore such flush requests.
+	 */
+	gp = kvmhv_find_nested(vcpu->kvm, lpid);
+	if (!gp)
+		return H_SUCCESS;
+
+	if ((type & H_RPTI_TYPE_NESTED_ALL) == H_RPTI_TYPE_NESTED_ALL)
+		return do_tlb_invalidate_nested_all(vcpu, lpid);
+
+	if ((type & H_RPTI_TYPE_TLB) == H_RPTI_TYPE_TLB) {
+		if (pg_sizes & H_RPTI_PAGE_64K) {
+			psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
+			ap = mmu_get_ap(psize);
+
+			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
+							   (1UL << 16),
+							   ap, start, end);
+			if (ret)
+				return H_P4;
+		}
+
+		if (pg_sizes & H_RPTI_PAGE_2M) {
+			psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
+			ap = mmu_get_ap(psize);
+
+			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
+							   (1UL << 21),
+							   ap, start, end);
+			if (ret)
+				return H_P4;
+		}
+
+		if (pg_sizes & H_RPTI_PAGE_1G) {
+			psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
+			ap = mmu_get_ap(psize);
+
+			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
+							   (1UL << 30),
+							   ap, start, end);
+			if (ret)
+				return H_P4;
+		}
+	}
+	return H_SUCCESS;
+}
+
 /* Used to convert a nested guest real address to a L1 guest real address */
 static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
 				       struct kvm_nested_guest *gp,
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 13999123b7358..8ab4a71c40b4a 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -678,6 +678,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = hv_enabled && kvmppc_hv_ops->enable_svm &&
 			!kvmppc_hv_ops->enable_svm(NULL);
 		break;
+	case KVM_CAP_RPT_INVALIDATE:
+		r = 1;
+		break;
 #endif
 	default:
 		r = 0;
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index b487b489d4b68..3a2b12d1d49b8 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -18,10 +18,6 @@
 #include <asm/cputhreads.h>
 #include <asm/plpar_wrappers.h>
 
-#define RIC_FLUSH_TLB 0
-#define RIC_FLUSH_PWC 1
-#define RIC_FLUSH_ALL 2
-
 /*
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7d8eced6f459b..109ede74735d4 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1037,6 +1037,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_SMALLER_MAXPHYADDR 185
 #define KVM_CAP_S390_DIAG318 186
 #define KVM_CAP_STEAL_TIME 187
+#define KVM_CAP_RPT_INVALIDATE 188
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

