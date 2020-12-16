Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF32DBD27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 09:56:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwps506ZFzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 19:56:41 +1100 (AEDT)
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
 header.s=pp1 header.b=cDjiuPtZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwpqF18smzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 19:55:04 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG83XSo143744; Wed, 16 Dec 2020 03:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/A/5I2h8sT8NFPvEs8DzWuVMwFagcKJDpAtGtb8G0AA=;
 b=cDjiuPtZ8MseZ6unHMvI1TTsRjkMVpHxrEqt5s3LO2jTvUreFSQj7+bBSqhs8s4lbI++
 zGyklUU1Cr8Towq2G4+irdXUT1AIXXMo9fOo7EGWxi3IC+jARlnwzfu4yfTb7hbUJRPV
 ZPwYEsxeb+r0zPemJLqw4uK0uLfYhduCj4YONhvEexqA3fUMMuXUy1xxQwHrYkQXrPSh
 TnvoWSw7Jlo8UYslKZkvxzZf8SLLHTUgq5qLKiXuMyv3GuHyz9dxyvzelLtQTNZdbkVI
 VpHvTaVvK123slCvXOKJSsLMdHuqfkldoyhoYqIFimnqaSxrILM1j3rE8W8GQ2JRgZG4 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fe4vhrq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:54:59 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG8nCKg061034;
 Wed, 16 Dec 2020 03:54:58 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fe4vhrpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:54:58 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8rXP0017469;
 Wed, 16 Dec 2020 08:54:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8e31r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 08:54:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG8srBZ29032772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 08:54:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4107242049;
 Wed, 16 Dec 2020 08:54:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B209D42045;
 Wed, 16 Dec 2020 08:54:51 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.116.220])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 08:54:51 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
Date: Wed, 16 Dec 2020 14:24:46 +0530
Message-Id: <20201216085447.1265433-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216085447.1265433-1-bharata@linux.ibm.com>
References: <20201216085447.1265433-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160051
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement H_RPT_INVALIDATE hcall and add KVM capability
KVM_CAP_PPC_RPT_INVALIDATE to indicate the support for the same.

This hcall does two types of TLB invalidations:

1. Process-scoped invalidations for guests with LPCR[GTSE]=0.
   This is currently not used in KVM as GTSE is not usually
   disabled in KVM.
2. Partition-scoped invalidations that an L1 hypervisor does on
   behalf of an L2 guest. This replaces the uses of the existing
   hcall H_TLB_INVALIDATE.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst                |  17 +++
 .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/kvm/book3s_hv.c                  | 121 ++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c           |  94 ++++++++++++++
 arch/powerpc/kvm/powerpc.c                    |   3 +
 arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
 include/uapi/linux/kvm.h                      |   1 +
 8 files changed, 257 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e00a66d72372..5ce237c0d707 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6014,6 +6014,23 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit notifications which user space
 can then handle to implement model specific MSR handling and/or user notifications
 to inform a user that an MSR was not handled.
 
+7.22 KVM_CAP_PPC_RPT_INVALIDATE
+------------------------------
+
+:Capability: KVM_CAP_PPC_RPT_INVALIDATE
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
index 94439e0cefc9..aace7e9b2397 100644
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
index d32ec9ae73bd..0f1c5fa6e8ce 100644
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
index e3b1839fc251..adf2d1191581 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -904,6 +904,118 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 	return yield_count;
 }
 
+static inline void do_tlb_invalidate_all(unsigned long rb, unsigned long rs)
+{
+	asm volatile("ptesync" : : : "memory");
+	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+		: : "r"(rb), "i"(1), "i"(1), "i"(RIC_FLUSH_ALL), "r"(rs)
+		: "memory");
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
+
+static inline void do_tlb_invalidate_pwc(unsigned long rb, unsigned long rs)
+{
+	asm volatile("ptesync" : : : "memory");
+	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+		: : "r"(rb), "i"(1), "i"(1), "i"(RIC_FLUSH_PWC), "r"(rs)
+		: "memory");
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
+
+static inline void do_tlb_invalidate_tlb(unsigned long rb, unsigned long rs)
+{
+	asm volatile("ptesync" : : : "memory");
+	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+		: : "r"(rb), "i"(1), "i"(1), "i"(RIC_FLUSH_TLB), "r"(rs)
+		: "memory");
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
+
+static void do_tlb_invalidate(unsigned long rs, unsigned long target,
+			      unsigned long type, unsigned long page_size,
+			      unsigned long ap, unsigned long start,
+			      unsigned long end)
+{
+	unsigned long rb;
+	unsigned long addr = start;
+
+	if ((type & H_RPTI_TYPE_ALL) == H_RPTI_TYPE_ALL) {
+		rb = PPC_BIT(53); /* IS = 1 */
+		do_tlb_invalidate_all(rb, rs);
+		return;
+	}
+
+	if (type & H_RPTI_TYPE_PWC) {
+		rb = PPC_BIT(53); /* IS = 1 */
+		do_tlb_invalidate_pwc(rb, rs);
+	}
+
+	if (!addr && end == -1) { /* PID */
+		rb = PPC_BIT(53); /* IS = 1 */
+		do_tlb_invalidate_tlb(rb, rs);
+	} else { /* EA */
+		do {
+			rb = addr & ~(PPC_BITMASK(52, 63));
+			rb |= ap << PPC_BITLSHIFT(58);
+			do_tlb_invalidate_tlb(rb, rs);
+			addr += page_size;
+		} while (addr < end);
+	}
+}
+
+static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
+				    unsigned long pid, unsigned long target,
+				    unsigned long type, unsigned long pg_sizes,
+				    unsigned long start, unsigned long end)
+{
+	unsigned long rs, ap, psize;
+
+	if (!kvm_is_radix(vcpu->kvm))
+		return H_FUNCTION;
+
+	if (end < start)
+		return H_P5;
+
+	if (type & H_RPTI_TYPE_NESTED) {
+		if (!nesting_enabled(vcpu->kvm))
+			return H_FUNCTION;
+
+		/* Support only cores as target */
+		if (target != H_RPTI_TARGET_CMMU)
+			return H_P2;
+
+		return kvmhv_h_rpti_nested(vcpu, pid,
+					   (type & ~H_RPTI_TYPE_NESTED),
+					    pg_sizes, start, end);
+	}
+
+	rs = pid << PPC_BITLSHIFT(31);
+	rs |= vcpu->kvm->arch.lpid;
+
+	if (pg_sizes & H_RPTI_PAGE_64K) {
+		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
+		ap = mmu_get_ap(psize);
+		do_tlb_invalidate(rs, target, type, (1UL << 16), ap, start,
+				  end);
+	}
+
+	if (pg_sizes & H_RPTI_PAGE_2M) {
+		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
+		ap = mmu_get_ap(psize);
+		do_tlb_invalidate(rs, target, type, (1UL << 21), ap, start,
+				  end);
+	}
+
+	if (pg_sizes & H_RPTI_PAGE_1G) {
+		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
+		ap = mmu_get_ap(psize);
+		do_tlb_invalidate(rs, target, type, (1UL << 30), ap, start,
+				  end);
+	}
+
+	return H_SUCCESS;
+}
+
 int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 {
 	unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -1112,6 +1224,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
@@ -1158,6 +1278,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	case H_XIRR_X:
 #endif
 	case H_PAGE_INIT:
+	case H_RPT_INVALIDATE:
 		return 1;
 	}
 
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 33b58549a9aa..a54ba4b1d4a7 100644
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
index 13999123b735..172a89187116 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -678,6 +678,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = hv_enabled && kvmppc_hv_ops->enable_svm &&
 			!kvmppc_hv_ops->enable_svm(NULL);
 		break;
+	case KVM_CAP_PPC_RPT_INVALIDATE:
+		r = 1;
+		break;
 #endif
 	default:
 		r = 0;
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index b487b489d4b6..3a2b12d1d49b 100644
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
index ca41220b40b8..c9ece825299e 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1053,6 +1053,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_X86_USER_SPACE_MSR 188
 #define KVM_CAP_X86_MSR_FILTER 189
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
+#define KVM_CAP_PPC_RPT_INVALIDATE 191
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

