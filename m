Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D583AE54D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 10:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7jw603ghz3cJF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 18:52:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ix2wrqpF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ix2wrqpF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7jsd0Smrz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 18:50:28 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15L8YVvh023955; Mon, 21 Jun 2021 04:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=unCUF681w0HbQDXRfSoYrLe81K5Z2v0X6LOCKXMbMLA=;
 b=ix2wrqpFoZseJHWX/ZsVjdUCinDsXV0Gcxu9XAo5tACLJjCWE0mRhMFTd/ubOZ/9p9MA
 JIZmjYBoM9iFmTwoPZ/JlUJ8pbz0OWYstZUGaC1kO6fdUNA5b7DTWOmyq3mG5lu2U3Rk
 9nP4vXR9SovFAZavrtN8Qj/FpEYq1qZM3m4t72hlHn/xbllJNt4ZgWhHs24YPdxEQ0jw
 n9Gxo2gw/ymn3XRKrvClMpzIvyEiiPm71DB2TgyIegBNljHjMBABIfoXllm2w9Dr5WgT
 mid4hSv6mm35P4PrAkYnLOl9r1lJ5xmtYse6wgMdtTUPeyM9yMVwPlnMMCVqm1NtnVhI 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39apn79v64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:50:23 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15L8Zu3M029679;
 Mon, 21 Jun 2021 04:50:23 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39apn79v59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:50:22 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15L8mxvt022531;
 Mon, 21 Jun 2021 08:50:20 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3998788ds7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 08:50:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15L8oHtN25428368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 08:50:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98419A4040;
 Mon, 21 Jun 2021 08:50:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA174A405B;
 Mon, 21 Jun 2021 08:50:15 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.82.83])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 08:50:15 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 4/6] KVM: PPC: Book3S HV: Nested support in H_RPT_INVALIDATE
Date: Mon, 21 Jun 2021 14:20:01 +0530
Message-Id: <20210621085003.904767-5-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621085003.904767-1-bharata@linux.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WSh1iH5ej7kG7sfEmu1wc0wq-APi9bAe
X-Proofpoint-ORIG-GUID: HRv2X2spgeCtGBtI-rPTuWT3AsoFczLg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_03:2021-06-20,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210049
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
 arch/powerpc/kvm/book3s_hv.c                  |  59 ++++++++-
 arch/powerpc/kvm/book3s_hv_nested.c           | 117 ++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
 5 files changed, 180 insertions(+), 7 deletions(-)

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
index e6b53c6e21e3..caaa0f592d8e 100644
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
index 7e6da4687d88..3d5b8ba3786d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -925,6 +925,34 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
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
+	unsigned long pid, pg_sizes, start, end;
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
+	do_h_rpt_invalidate_prt(pid, vcpu->arch.nested->shadow_lpid,
+				type, pg_sizes, start, end);
+
+	kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
+	return RESUME_GUEST;
+}
+
 static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
 				    unsigned long id, unsigned long target,
 				    unsigned long type, unsigned long pg_sizes,
@@ -938,10 +966,18 @@ static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
 
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
@@ -1629,6 +1665,23 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
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
index 60724f674421..056d3df68de1 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1214,6 +1214,123 @@ long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu)
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
+ * Number of pages above which we invalidate the entire LPID rather than
+ * flush individual pages.
+ */
+static unsigned long tlb_range_flush_page_ceiling __read_mostly = 33;
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
+	/*
+	 * We don't need to handle a PWC flush like process table here,
+	 * because intermediate partition scoped table in nested guest doesn't
+	 * really have PWC. Only level we have PWC is in L0 and for nested
+	 * invalidate at L0 we always do kvm_flush_lpid() which does
+	 * radix__flush_all_lpid(). For range invalidate at any level, we
+	 * are not removing the higher level page tables and hence there is
+	 * no PWC invalidate needed.
+	 *
+	 * if (type & H_RPTI_TYPE_PWC) {
+	 *	ret = do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
+	 *	if (ret)
+	 *		return H_P4;
+	 * }
+	 */
+
+	if (start == 0 && end == -1)
+		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
+
+	if (type & H_RPTI_TYPE_TLB) {
+		struct mmu_psize_def *def;
+		bool flush_lpid;
+		unsigned long nr_pages;
+
+		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+			def = &mmu_psize_defs[psize];
+			if (!(pg_sizes & def->h_rpt_pgsize))
+				continue;
+
+			nr_pages = (end - start) >> def->shift;
+			flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
+			if (flush_lpid)
+				return do_tlb_invalidate_nested_all(vcpu, lpid,
+								RIC_FLUSH_TLB);
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
index cdd98b9e7b15..4f38cf34ea40 100644
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
2.31.1

