Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366E31B587
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 08:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfFZb1tq3z3bP3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 18:08:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EnZaHze5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EnZaHze5; dkim-atps=neutral
X-Greylist: delayed 1946 seconds by postgrey-1.36 at boromir;
 Mon, 15 Feb 2021 18:08:31 AEDT
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfFZ731ypz30J4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 18:08:30 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11F6Xh9m006674; Mon, 15 Feb 2021 01:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MoqJRm4VUtnez3LYg32pz/w+9veh54o4zCUFERYatzI=;
 b=EnZaHze5Ie1AwSMUDZMit/yQKdtlZ/cbdPRTZjpjlNpstYGzrUntEzpdBmVeTiH1J3MJ
 q/8dGJj9qkKqhW+7we0d6MdiS9wjgjCzMNTWApUwmlPEjspSgmCcQHLbbswiySmKkS1Y
 uaxwOI28dWMiDfEDfVa1UBdVwho3G6llCnUaIFa7cFQd3d0tehDMtkgwCuxyb7uTtSXW
 jan2IYx/N+3Y6vmXrlizLI3lfBP4rq4OIpNlx5BGUx3xExTBJIZ4L+ljdS2otZZshywa
 Ls049wRaxjIO4Jn4VeacUCwXyN5tFV+YKb63Lz3MF5nmJy+ZZoQ7B6gnshUclLcn9VNj mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36qk18h6tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 01:35:57 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11F6XeN4006540;
 Mon, 15 Feb 2021 01:35:56 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36qk18h6sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 01:35:56 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11F6Rde0003872;
 Mon, 15 Feb 2021 06:35:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 36p6d89ha8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 06:35:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11F6ZejO9634140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 06:35:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF8C84204D;
 Mon, 15 Feb 2021 06:35:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23A9C4204C;
 Mon, 15 Feb 2021 06:35:50 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.74.227])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Feb 2021 06:35:49 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/3] KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
Date: Mon, 15 Feb 2021 12:05:41 +0530
Message-Id: <20210215063542.3642366-3-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215063542.3642366-1-bharata@linux.ibm.com>
References: <20210215063542.3642366-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-15_01:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102150054
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
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

In order to handle process scoped invalidations of L2, we
intercept the nested exit handling code in L0 only to handle
H_TLB_INVALIDATE hcall.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst         | 17 +++++
 arch/powerpc/include/asm/kvm_book3s.h  |  3 +
 arch/powerpc/include/asm/mmu_context.h | 11 +++
 arch/powerpc/kvm/book3s_hv.c           | 91 ++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c    | 96 ++++++++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c             |  3 +
 arch/powerpc/mm/book3s64/radix_tlb.c   | 25 +++++++
 include/uapi/linux/kvm.h               |  1 +
 8 files changed, 247 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 99ceb978c8b0..416c36aa35d4 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6038,6 +6038,23 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit notifications which user space
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
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index d5821834dba9..fbf3b5b45fe9 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 
 #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
 extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
+void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
+			 unsigned long type, unsigned long page_size,
+			 unsigned long psize, unsigned long start,
+			 unsigned long end);
 #else
 static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
+static inline void do_h_rpt_invalidate(unsigned long pid,
+				       unsigned long lpid,
+				       unsigned long type,
+				       unsigned long page_size,
+				       unsigned long psize,
+				       unsigned long start,
+				       unsigned long end) { }
 #endif
 
 extern void switch_cop(struct mm_struct *next);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6f612d240392..802cb77c39cc 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -904,6 +904,64 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 	return yield_count;
 }
 
+static void do_h_rpt_invalidate_prs(unsigned long pid, unsigned long lpid,
+				    unsigned long type, unsigned long pg_sizes,
+				    unsigned long start, unsigned long end)
+{
+	unsigned long psize;
+
+	if (pg_sizes & H_RPTI_PAGE_64K) {
+		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_64K);
+		do_h_rpt_invalidate(pid, lpid, type, (1UL << 16), psize,
+				    start, end);
+	}
+
+	if (pg_sizes & H_RPTI_PAGE_2M) {
+		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_2M);
+		do_h_rpt_invalidate(pid, lpid, type, (1UL << 21), psize,
+				    start, end);
+	}
+
+	if (pg_sizes & H_RPTI_PAGE_1G) {
+		psize = rpti_pgsize_to_psize(pg_sizes & H_RPTI_PAGE_1G);
+		do_h_rpt_invalidate(pid, lpid, type, (1UL << 30), psize,
+				    start, end);
+	}
+
+}
+
+static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
+				    unsigned long pid, unsigned long target,
+				    unsigned long type, unsigned long pg_sizes,
+				    unsigned long start, unsigned long end)
+{
+	if (!kvm_is_radix(vcpu->kvm))
+		return H_UNSUPPORTED;
+
+	if (kvmhv_on_pseries())
+		return H_UNSUPPORTED;
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
+	do_h_rpt_invalidate_prs(pid, vcpu->kvm->arch.lpid, type, pg_sizes,
+				start, end);
+	return H_SUCCESS;
+}
+
 int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 {
 	unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -1112,6 +1170,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
@@ -1158,6 +1224,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	case H_XIRR_X:
 #endif
 	case H_PAGE_INIT:
+	case H_RPT_INVALIDATE:
 		return 1;
 	}
 
@@ -1573,6 +1640,30 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		if (!xics_on_xive())
 			kvmppc_xics_rm_complete(vcpu, 0);
 		break;
+	case BOOK3S_INTERRUPT_SYSCALL:
+	{
+		unsigned long req = kvmppc_get_gpr(vcpu, 3);
+
+		if (req != H_RPT_INVALIDATE) {
+			r = RESUME_HOST;
+			break;
+		}
+
+		/*
+		 * The H_RPT_INVALIDATE hcalls issued by nested
+		 * guest for process scoped invalidations when
+		 * GTSE=0 are handled here.
+		 */
+		do_h_rpt_invalidate_prs(kvmppc_get_gpr(vcpu, 4),
+					vcpu->arch.nested->shadow_lpid,
+					kvmppc_get_gpr(vcpu, 5),
+					kvmppc_get_gpr(vcpu, 6),
+					kvmppc_get_gpr(vcpu, 7),
+					kvmppc_get_gpr(vcpu, 8));
+		kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
+		r = RESUME_GUEST;
+		break;
+	}
 	default:
 		r = RESUME_HOST;
 		break;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 33b58549a9aa..40ed4eb80adb 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1149,6 +1149,102 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
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
+	 *
+	 * However, nested KVM issues a L2 lpid flush call when creating
+	 * partition table entries for L2. This happens even before the
+	 * corresponding shadow lpid is created in HV which happens in
+	 * H_ENTER_NESTED call. Since we can't differentiate this case from
+	 * the invalid case, we ignore such flush requests and return success.
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
index cf52d26f49cd..5388cd4a206a 100644
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
index 097402435303..4f746d34b420 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1400,4 +1400,29 @@ extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
 	}
 }
 EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
+
+/*
+ * Process-scoped invalidations for a given LPID.
+ */
+void do_h_rpt_invalidate(unsigned long pid, unsigned long lpid,
+			 unsigned long type, unsigned long page_size,
+			 unsigned long psize, unsigned long start,
+			 unsigned long end)
+{
+	if ((type & H_RPTI_TYPE_ALL) == H_RPTI_TYPE_ALL) {
+		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
+		return;
+	}
+
+	if (type & H_RPTI_TYPE_PWC)
+		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
+
+	if (!start && end == -1) /* PID */
+		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
+	else /* EA */
+		_tlbie_va_range_lpid(start, end, pid, lpid, page_size,
+				     psize, false);
+}
+EXPORT_SYMBOL_GPL(do_h_rpt_invalidate);
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 374c67875cdb..6fd530fae452 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1058,6 +1058,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_PPC_RPT_INVALIDATE 193
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

