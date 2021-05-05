Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E099B373EEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 17:49:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb1NN6mZZz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 01:49:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d8OTuDGR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d8OTuDGR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb1L32YpPz2yyC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 01:47:07 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145FYtCb046109; Wed, 5 May 2021 11:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=4FmNkvs84ZQ8JmG/4m+DpV2g+SpHAPtmT+zrW5eS6TI=;
 b=d8OTuDGRpEJ8Xqd8lz24kF6jCUD0YOKoL5vpeeeGB43OVezG30ABZjRX/z/BBwQitdAn
 duf8zBg5/06tfbzPPqRzNPp9M/MU7ez0SPS/n1nwAZnOwmrWv8RYmJtFIflQSjU1aZhF
 NLLL7huzc2qQ2e4Vk9w1Vj9vpXmCIc6a4HwvFbpOlmW0blLcmKtybWR8RjHu6K3Jem59
 +CiZ5qpnCG82T8L0pr5dKwYAG2xP6Jnp+x7KRJh+fMzjxXD9fXzqgmOwy6rbFJvdyNPT
 7BvxB4bOLQS6ZlJWwIaDMiiOmd3GldQMpu3DmhLnsYor9dw2DnYeJe6/R+EGPC/Gn0vB 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bvgd42fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:47:03 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 145FZEVo048360;
 Wed, 5 May 2021 11:47:00 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bvgd42ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:47:00 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145Fccjn029714;
 Wed, 5 May 2021 15:46:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 38bee58d8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 15:46:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 145Fksl539125374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 15:46:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD461AE051;
 Wed,  5 May 2021 15:46:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18DE2AE045;
 Wed,  5 May 2021 15:46:53 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.85.70])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 15:46:52 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 3/6] KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE
Date: Wed,  5 May 2021 21:16:39 +0530
Message-Id: <20210505154642.178702-4-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505154642.178702-1-bharata@linux.ibm.com>
References: <20210505154642.178702-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TkdmPQWTnaUBW_WQiOo0nTFnMFpU9HBK
X-Proofpoint-ORIG-GUID: h8Lch21LA7A1oEleBldQRJIvSsxzRxMQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050112
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

H_RPT_INVALIDATE does two types of TLB invalidations:

1. Process-scoped invalidations for guests when LPCR[GTSE]=0.
   This is currently not used in KVM as GTSE is not usually
   disabled in KVM.
2. Partition-scoped invalidations that an L1 hypervisor does on
   behalf of an L2 guest. This is currently handled
   by H_TLB_INVALIDATE hcall and this new replaces the old that.

This commit enables process-scoped invalidations for L1 guests.
Support for process-scoped and partition-scoped invalidations
from/for nested guests will be added separately.

Process scoped tlbie invalidations from L1 and nested guests
need RS register for TLBIE instruction to contain both PID and
LPID.  This patch introduces primitives that execute tlbie
instruction with both PID and LPID set in prepartion for
H_RPT_INVALIDATE hcall.

A description of H_RPT_INVALIDATE follows:

int64   /* H_Success: Return code on successful completion */
        /* H_Busy - repeat the call with the same */
        /* H_Parameter, H_P2, H_P3, H_P4, H_P5 : Invalid
	   parameters */
hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate RPT
					translation
					lookaside information */
      uint64 id,        /* PID/LPID to invalidate */
      uint64 target,    /* Invalidation target */
      uint64 type,      /* Type of lookaside information */
      uint64 pg_sizes,  /* Page sizes */
      uint64 start,     /* Start of Effective Address (EA)
			   range (inclusive) */
      uint64 end)       /* End of EA range (exclusive) */

Invalidation targets (target)
-----------------------------
Core MMU        0x01 /* All virtual processors in the
			partition */
Core local MMU  0x02 /* Current virtual processor */
Nest MMU        0x04 /* All nest/accelerator agents
			in use by the partition */

A combination of the above can be specified,
except core and core local.

Type of translation to invalidate (type)
---------------------------------------
NESTED       0x0001  /* invalidate nested guest partition-scope */
TLB          0x0002  /* Invalidate TLB */
PWC          0x0004  /* Invalidate Page Walk Cache */
PRT          0x0008  /* Invalidate caching of Process Table
			Entries if NESTED is clear */
PAT          0x0008  /* Invalidate caching of Partition Table
			Entries if NESTED is set */

A combination of the above can be specified.

Page size mask (pages)
----------------------
4K              0x01
64K             0x02
2M              0x04
1G              0x08
All sizes       (-1UL)

A combination of the above can be specified.
All page sizes can be selected with -1.

Semantics: Invalidate radix tree lookaside information
           matching the parameters given.
* Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters
  are different from the defined values.
* Return H_PARAMETER if NESTED is set and pid is not a valid nested
  LPID allocated to this partition
* Return H_P5 if (start, end) doesn't form a valid range. Start and
  end should be a valid Quadrant address and  end > start.
* Return H_NotSupported if the partition is not in running in radix
  translation mode.
* May invalidate more translation information than requested.
* If start = 0 and end = -1, set the range to cover all valid
  addresses. Else start and end should be aligned to 4kB (lower 11
  bits clear).
* If NESTED is clear, then invalidate process scoped lookaside
  information. Else pid specifies a nested LPID, and the invalidation
  is performed   on nested guest partition table and nested guest
  partition scope real addresses.
* If pid = 0 and NESTED is clear, then valid addresses are quadrant 3
  and quadrant 0 spaces, Else valid addresses are quadrant 0.
* Pages which are fully covered by the range are to be invalidated.
  Those which are partially covered are considered outside
  invalidation range, which allows a caller to optimally invalidate
  ranges that may   contain mixed page sizes.
* Return H_SUCCESS on success.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 arch/powerpc/include/asm/mmu_context.h |  11 ++
 arch/powerpc/kvm/book3s_hv.c           |  46 ++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c   | 148 +++++++++++++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 4bc45d3ed8b0..128760eb598e 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -124,8 +124,19 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 
 #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
 extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
+void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
+			     unsigned long type, unsigned long page_size,
+			     unsigned long psize, unsigned long start,
+			     unsigned long end);
 #else
 static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
+static inline void do_h_rpt_invalidate_prt(unsigned long pid,
+					   unsigned long lpid,
+					   unsigned long type,
+					   unsigned long page_size,
+					   unsigned long psize,
+					   unsigned long start,
+					   unsigned long end) { }
 #endif
 
 extern void switch_cop(struct mm_struct *next);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 28a80d240b76..bcf34246bbe9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -76,6 +76,7 @@
 #include <asm/kvm_book3s_uvmem.h>
 #include <asm/ultravisor.h>
 #include <asm/dtl.h>
+#include <asm/plpar_wrappers.h>
 
 #include "book3s.h"
 
@@ -924,6 +925,42 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 	return yield_count;
 }
 
+static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
+				    unsigned long id, unsigned long target,
+				    unsigned long type, unsigned long pg_sizes,
+				    unsigned long start, unsigned long end)
+{
+	unsigned long psize;
+	struct mmu_psize_def *def;
+
+	if (!kvm_is_radix(vcpu->kvm))
+		return H_UNSUPPORTED;
+
+	if (end < start)
+		return H_P5;
+
+	/*
+	 * Partition-scoped invalidation for nested guests.
+	 * Not yet supported
+	 */
+	if (type & H_RPTI_TYPE_NESTED)
+		return H_P3;
+
+	/*
+	 * Process-scoped invalidation for L1 guests.
+	 */
+	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+		def = &mmu_psize_defs[psize];
+		if (!(pg_sizes & def->h_rpt_pgsize))
+			continue;
+
+		do_h_rpt_invalidate_prt(id, vcpu->kvm->arch.lpid,
+					type, (1UL << def->shift),
+					psize, start, end);
+	}
+	return H_SUCCESS;
+}
+
 int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 {
 	unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -1132,6 +1169,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
@@ -1178,6 +1223,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	case H_XIRR_X:
 #endif
 	case H_PAGE_INIT:
+	case H_RPT_INVALIDATE:
 		return 1;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 409e61210789..65aad9ce3557 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -130,6 +130,21 @@ static __always_inline void __tlbie_pid(unsigned long pid, unsigned long ric)
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
+static __always_inline void __tlbie_pid_lpid(unsigned long pid,
+					     unsigned long lpid,
+					     unsigned long ric)
+{
+	unsigned long rb, rs, prs, r;
+
+	rb = PPC_BIT(53); /* IS = 1 */
+	rs = (pid << PPC_BITLSHIFT(31)) | (lpid & ~(PPC_BITMASK(0, 31)));
+	prs = 1; /* process scoped */
+	r = 1;   /* radix format */
+
+	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
+	trace_tlbie(0, 0, rb, rs, ric, prs, r);
+}
 static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
@@ -190,6 +205,23 @@ static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
 	trace_tlbie(0, 0, rb, rs, ric, prs, r);
 }
 
+static __always_inline void __tlbie_va_lpid(unsigned long va, unsigned long pid,
+					    unsigned long lpid,
+					    unsigned long ap, unsigned long ric)
+{
+	unsigned long rb, rs, prs, r;
+
+	rb = va & ~(PPC_BITMASK(52, 63));
+	rb |= ap << PPC_BITLSHIFT(58);
+	rs = (pid << PPC_BITLSHIFT(31)) | (lpid & ~(PPC_BITMASK(0, 31)));
+	prs = 1; /* process scoped */
+	r = 1;   /* radix format */
+
+	asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
+		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(rs) : "memory");
+	trace_tlbie(0, 0, rb, rs, ric, prs, r);
+}
+
 static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
 					    unsigned long ap, unsigned long ric)
 {
@@ -235,6 +267,22 @@ static inline void fixup_tlbie_va_range(unsigned long va, unsigned long pid,
 	}
 }
 
+static inline void fixup_tlbie_va_range_lpid(unsigned long va,
+					     unsigned long pid,
+					     unsigned long lpid,
+					     unsigned long ap)
+{
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync" : : : "memory");
+		__tlbie_pid_lpid(0, lpid, RIC_FLUSH_TLB);
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync" : : : "memory");
+		__tlbie_va_lpid(va, pid, lpid, ap, RIC_FLUSH_TLB);
+	}
+}
+
 static inline void fixup_tlbie_pid(unsigned long pid)
 {
 	/*
@@ -254,6 +302,25 @@ static inline void fixup_tlbie_pid(unsigned long pid)
 	}
 }
 
+static inline void fixup_tlbie_pid_lpid(unsigned long pid, unsigned long lpid)
+{
+	/*
+	 * We can use any address for the invalidation, pick one which is
+	 * probably unused as an optimisation.
+	 */
+	unsigned long va = ((1UL << 52) - 1);
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
+		asm volatile("ptesync" : : : "memory");
+		__tlbie_pid_lpid(0, lpid, RIC_FLUSH_TLB);
+	}
+
+	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
+		asm volatile("ptesync" : : : "memory");
+		__tlbie_va_lpid(va, pid, lpid, mmu_get_ap(MMU_PAGE_64K),
+				RIC_FLUSH_TLB);
+	}
+}
 
 static inline void fixup_tlbie_lpid_va(unsigned long va, unsigned long lpid,
 				       unsigned long ap)
@@ -344,6 +411,31 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
+static inline void _tlbie_pid_lpid(unsigned long pid, unsigned long lpid,
+				   unsigned long ric)
+{
+	asm volatile("ptesync" : : : "memory");
+
+	/*
+	 * Workaround the fact that the "ric" argument to __tlbie_pid
+	 * must be a compile-time contraint to match the "i" constraint
+	 * in the asm statement.
+	 */
+	switch (ric) {
+	case RIC_FLUSH_TLB:
+		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
+		fixup_tlbie_pid_lpid(pid, lpid);
+		break;
+	case RIC_FLUSH_PWC:
+		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
+		break;
+	case RIC_FLUSH_ALL:
+	default:
+		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
+		fixup_tlbie_pid_lpid(pid, lpid);
+	}
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
 struct tlbiel_pid {
 	unsigned long pid;
 	unsigned long ric;
@@ -469,6 +561,20 @@ static inline void __tlbie_va_range(unsigned long start, unsigned long end,
 	fixup_tlbie_va_range(addr - page_size, pid, ap);
 }
 
+static inline void __tlbie_va_range_lpid(unsigned long start, unsigned long end,
+					 unsigned long pid, unsigned long lpid,
+					 unsigned long page_size,
+					 unsigned long psize)
+{
+	unsigned long addr;
+	unsigned long ap = mmu_get_ap(psize);
+
+	for (addr = start; addr < end; addr += page_size)
+		__tlbie_va_lpid(addr, pid, lpid, ap, RIC_FLUSH_TLB);
+
+	fixup_tlbie_va_range_lpid(addr - page_size, pid, lpid, ap);
+}
+
 static __always_inline void _tlbie_va(unsigned long va, unsigned long pid,
 				      unsigned long psize, unsigned long ric)
 {
@@ -549,6 +655,18 @@ static inline void _tlbie_va_range(unsigned long start, unsigned long end,
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
 
+static inline void _tlbie_va_range_lpid(unsigned long start, unsigned long end,
+					unsigned long pid, unsigned long lpid,
+					unsigned long page_size,
+					unsigned long psize, bool also_pwc)
+{
+	asm volatile("ptesync" : : : "memory");
+	if (also_pwc)
+		__tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
+	__tlbie_va_range_lpid(start, end, pid, lpid, page_size, psize);
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+}
+
 static inline void _tlbiel_va_range_multicast(struct mm_struct *mm,
 				unsigned long start, unsigned long end,
 				unsigned long pid, unsigned long page_size,
@@ -1381,4 +1499,34 @@ extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
 	}
 }
 EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
+
+/*
+ * Performs process-scoped invalidations for a given LPID
+ * as part of H_RPT_INVALIDATE hcall.
+ */
+void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
+			     unsigned long type, unsigned long page_size,
+			     unsigned long psize, unsigned long start,
+			     unsigned long end)
+{
+	/*
+	 * A H_RPTI_TYPE_ALL request implies RIC=3, hence
+	 * do a single IS=1 based flush.
+	 */
+	if ((type & H_RPTI_TYPE_ALL) == H_RPTI_TYPE_ALL) {
+		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
+		return;
+	}
+
+	if (type & H_RPTI_TYPE_PWC)
+		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
+
+	if (start == 0 && end == -1) /* PID */
+		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
+	else /* EA */
+		_tlbie_va_range_lpid(start, end, pid, lpid, page_size,
+				     psize, false);
+}
+EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
-- 
2.26.2

