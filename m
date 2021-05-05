Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998E373EED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 17:48:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb1Mv2kxpz3c1h
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 01:48:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SLeC3CAJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SLeC3CAJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb1L30WS8z2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 01:47:06 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145FZ9M2064536; Wed, 5 May 2021 11:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Z/sI2bNYx3q2foR7RY8iBZfw33eC9gP84MPfAe1S0A8=;
 b=SLeC3CAJ0Lyapo/Ay+lXl4l809aefunlLrXTCrxu07xG5mvqEPOQIJ1bom4He+UT7oog
 usFxlQGX4fr+g6MQcI+jTnLS/h8HvhhZmoDaTQhg7OhQfb3+CPcGEpFZFdRJhu5TqPr/
 /iuYUkNXhOQlxvC3wf7+bV9Nphop2IM1BtLAEuWPZMA6yO1WM2Fh2Khy1/S3wt0IpKAE
 7CkOSVbhZWsGIZmfaZHMljWB1yTiZ6Pwbad4Jl2E8T71RC3B8tCQINzbRsqTJ6Ilzi+1
 hp7Anly+z+z9Je2uKj8w8fnrI9uYpVGrCU/eq+jKPx5E3F43hT+Kzuu35JZ15WxHJt5e Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bw4ntew1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:47:02 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 145FZSlc065979;
 Wed, 5 May 2021 11:47:01 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bw4ntevd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:47:01 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145FcqLj031082;
 Wed, 5 May 2021 15:46:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 38bee987fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 15:46:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 145FkVQ025624932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 15:46:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFB31AE053;
 Wed,  5 May 2021 15:46:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 122B6AE045;
 Wed,  5 May 2021 15:46:55 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.85.70])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 15:46:54 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 4/6] KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE
Date: Wed,  5 May 2021 21:16:40 +0530
Message-Id: <20210505154642.178702-5-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505154642.178702-1-bharata@linux.ibm.com>
References: <20210505154642.178702-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gu5NUcoVYAZSFH91Xq8tmpFiVIltpvDG
X-Proofpoint-ORIG-GUID: i1Q4WaYWiJeD7ORi6DgYqEycAKSn1Sec
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105050112
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

Enable support for process-scoped invalidations from nested
guests and partition-scoped invalidations for nested guests.

Process-scoped invalidations for any level of nested guests
are handled by implementing H_RPT_INVALIDATE handler in the
nested guest exit path in L0.

Partition-scoped invalidation requests are forwarded to the
right nested guest, handled there and passed down to L0
for eventual handling.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
	[Nested guest partition-scoped invalidation changes]
---
 .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
 arch/powerpc/include/asm/kvm_book3s.h         |   3 +
 arch/powerpc/kvm/book3s_hv.c                  |  66 ++++++++++-
 arch/powerpc/kvm/book3s_hv_nested.c           | 104 ++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
 5 files changed, 174 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 8b33601cdb9d..a46fd37ad552 100644
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
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index a6e9a5585e61..fdf54741c58c 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -307,6 +307,9 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
 void kvmhv_release_all_nested(struct kvm *kvm);
 long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
 long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
+long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
+			     unsigned long type, unsigned long pg_sizes,
+			     unsigned long start, unsigned long end);
 int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu,
 			  u64 time_limit, unsigned long lpcr);
 void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bcf34246bbe9..a2e7fbec796a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -925,6 +925,41 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 	return yield_count;
 }
 
+/*
+ * H_RPT_INVALIDATE hcall handler for nested guests.
+ *
+ * Handles only nested process-scoped invalidation requests in L0.
+ */
+static int kvmppc_nested_h_rpt_invalidate(struct kvm_vcpu *vcpu)
+{
+	unsigned long type = kvmppc_get_gpr(vcpu, 6);
+	unsigned long pid, pg_sizes, start, end, psize;
+	struct mmu_psize_def *def;
+
+	/*
+	 * The partition-scoped invalidations aren't handled here in L0.
+	 */
+	if (type & H_RPTI_TYPE_NESTED)
+		return RESUME_HOST;
+
+	pid = kvmppc_get_gpr(vcpu, 4);
+	pg_sizes = kvmppc_get_gpr(vcpu, 7);
+	start = kvmppc_get_gpr(vcpu, 8);
+	end = kvmppc_get_gpr(vcpu, 9);
+
+	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+		def = &mmu_psize_defs[psize];
+		if (pg_sizes & def->h_rpt_pgsize)
+			do_h_rpt_invalidate_prt(pid,
+						vcpu->arch.nested->shadow_lpid,
+						type, (1UL << def->shift),
+						psize, start, end);
+	}
+
+	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
+	return RESUME_GUEST;
+}
+
 static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
 				    unsigned long id, unsigned long target,
 				    unsigned long type, unsigned long pg_sizes,
@@ -941,10 +976,18 @@ static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Partition-scoped invalidation for nested guests.
-	 * Not yet supported
 	 */
-	if (type & H_RPTI_TYPE_NESTED)
-		return H_P3;
+	if (type & H_RPTI_TYPE_NESTED) {
+		if (!nesting_enabled(vcpu->kvm))
+			return H_FUNCTION;
+
+		/* Support only cores as target */
+		if (target != H_RPTI_TARGET_CMMU)
+			return H_P2;
+
+		return do_h_rpt_invalidate_pat(vcpu, id, type, pg_sizes,
+					       start, end);
+	}
 
 	/*
 	 * Process-scoped invalidation for L1 guests.
@@ -1639,6 +1682,23 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		if (!xics_on_xive())
 			kvmppc_xics_rm_complete(vcpu, 0);
 		break;
+	case BOOK3S_INTERRUPT_SYSCALL:
+	{
+		unsigned long req = kvmppc_get_gpr(vcpu, 3);
+
+		/*
+		 * The H_RPT_INVALIDATE hcalls issued by nested
+		 * guests for process-scoped invalidations when
+		 * GTSE=0, are handled here in L0.
+		 */
+		if (req == H_RPT_INVALIDATE) {
+			r = kvmppc_nested_h_rpt_invalidate(vcpu);
+			break;
+		}
+
+		r = RESUME_HOST;
+		break;
+	}
 	default:
 		r = RESUME_HOST;
 		break;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 60724f674421..91f10290130d 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1214,6 +1214,110 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
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
+					 unsigned long lpid, unsigned long ric)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_nested_guest *gp;
+
+	gp = kvmhv_get_nested(kvm, lpid, false);
+	if (gp) {
+		kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
+		kvmhv_put_nested(gp);
+	}
+	return H_SUCCESS;
+}
+
+/*
+ * Performs partition-scoped invalidations for nested guests
+ * as part of H_RPT_INVALIDATE hcall.
+ */
+long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
+			     unsigned long type, unsigned long pg_sizes,
+			     unsigned long start, unsigned long end)
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
+	/*
+	 * A flush all request can be handled by a full lpid flush only.
+	 */
+	if ((type & H_RPTI_TYPE_NESTED_ALL) == H_RPTI_TYPE_NESTED_ALL)
+		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_ALL);
+
+#if 0
+	/*
+	 * We don't need to handle a PWC flush like process table here,
+	 * because intermediate partition scoped table in nested guest doesn't
+	 * really have PWC. Only level we have PWC is in L0 and for nested
+	 * invalidate at L0 we always do kvm_flush_lpid() which does
+	 * radix__flush_all_lpid(). For range invalidate at any level, we
+	 * are not removing the higher level page tables and hence there is
+	 * no PWC invalidate needed.
+	 */
+	if (type & H_RPTI_TYPE_PWC) {
+		ret = do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
+		if (ret)
+			return H_P4;
+	}
+#endif
+
+	if (start == 0 && end == -1)
+		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
+
+	if (type & H_RPTI_TYPE_TLB) {
+		struct mmu_psize_def *def;
+
+		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+			def = &mmu_psize_defs[psize];
+			if (!(pg_sizes & def->h_rpt_pgsize))
+				continue;
+
+			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
+							   (1UL << def->shift),
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
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 65aad9ce3557..613198c41006 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -20,10 +20,6 @@
 
 #include "internal.h"
 
-#define RIC_FLUSH_TLB 0
-#define RIC_FLUSH_PWC 1
-#define RIC_FLUSH_ALL 2
-
 /*
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
-- 
2.26.2

