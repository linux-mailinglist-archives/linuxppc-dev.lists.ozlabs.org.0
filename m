Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC173E0F26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:26:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgKt90Mbqz3dSY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:26:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JN7+l7nx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JN7+l7nx; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgKrM4hnWz3bXC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:25:07 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17573LYK057190; Thu, 5 Aug 2021 03:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1LTIEE11FWqPIVM4A8yHwxW9O0PlIoIiN6eN5E97rtw=;
 b=JN7+l7nxPAKPcZ8lZW0dWfvy1kZcsSj5gdJbpA6G8gGbecX5rZAyEEJDcMRVVFjEmcqS
 ieZSEnFWiVs/j2NhnwiesdhcC4cC/oQDl1QeRvSda0eGwmKQGgZGSUQ4o/99S4QpX6Mi
 aI+GaNAvhHmW71QfYyuE7d6LjjBw3/YXynOm5CqIYemqZ38rTGyHUVVxqbNUPeXVVn+N
 g2iefZoJYJYyTEnA4Y/eMDQd6E3v8pbep9ubImnjq2QksLuSAtP/xmguScjV93A+stth
 h+zchoPWUY2PjI5IQ0qKY7K1A7otMd+Jb4KmgfxW9kSJyHnLxZ1/50wt9uaAKhQ0a/yU eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7b790p0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:25:04 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17573NOG057483;
 Thu, 5 Aug 2021 03:25:03 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7b790nyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:25:03 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17577bRL009127;
 Thu, 5 Aug 2021 07:25:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x592r9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:25:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1757Owvd53346604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:24:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FCA8A4078;
 Thu,  5 Aug 2021 07:24:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 333E0A4057;
 Thu,  5 Aug 2021 07:24:56 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 07:24:55 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 3/5] KVM: PPC: Book3S: Enable setting SRR1 flags for DSI
Date: Thu,  5 Aug 2021 12:54:37 +0530
Message-Id: <20210805072439.501481-4-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805072439.501481-1-bharata@linux.ibm.com>
References: <20210805072439.501481-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bOchKJX_XWy-xJV9s14JkNU7v2Yiv-Mx
X-Proofpoint-ORIG-GUID: QjzlV6MH5NU946n9fD0V6NZEThJsj20k
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxlogscore=801 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050041
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
 kvm@vger.kernel.org, bharata.rao@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_core_queue_data_storage() doesn't provide an option to
set SRR1 flags when raising DSI. Since kvmppc_inject_interrupt()
allows for such a provision, add an argument to allow the same.

This will be used to raise DSI with SRR1_PROGTRAP set when
expropriation interrupt needs to be injected to the guest.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_ppc.h     | 3 ++-
 arch/powerpc/kvm/book3s.c              | 6 +++---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 +++---
 arch/powerpc/kvm/book3s_hv.c           | 4 ++--
 arch/powerpc/kvm/book3s_hv_nested.c    | 4 ++--
 arch/powerpc/kvm/book3s_pr.c           | 4 ++--
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 2d88944f9f34..09235bdfd4ac 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -143,7 +143,8 @@ extern void kvmppc_core_queue_dtlb_miss(struct kvm_vcpu *vcpu, ulong dear_flags,
 					ulong esr_flags);
 extern void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu,
 					   ulong dear_flags,
-					   ulong esr_flags);
+					   ulong esr_flags,
+					   ulong srr1_flags);
 extern void kvmppc_core_queue_itlb_miss(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_queue_inst_storage(struct kvm_vcpu *vcpu,
 					   ulong esr_flags);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 79833f78d1da..f7f6641a788d 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -284,11 +284,11 @@ void kvmppc_core_dequeue_external(struct kvm_vcpu *vcpu)
 }
 
 void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu, ulong dar,
-				    ulong flags)
+				    ulong dsisr, ulong srr1)
 {
 	kvmppc_set_dar(vcpu, dar);
-	kvmppc_set_dsisr(vcpu, flags);
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE, 0);
+	kvmppc_set_dsisr(vcpu, dsisr);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE, srr1);
 }
 EXPORT_SYMBOL_GPL(kvmppc_core_queue_data_storage);
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index b5905ae4377c..618206a504b0 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -946,7 +946,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	if (dsisr & DSISR_BADACCESS) {
 		/* Reflect to the guest as DSI */
 		pr_err("KVM: Got radix HV page fault with DSISR=%lx\n", dsisr);
-		kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
+		kvmppc_core_queue_data_storage(vcpu, ea, dsisr, 0);
 		return RESUME_GUEST;
 	}
 
@@ -971,7 +971,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 			 * Bad address in guest page table tree, or other
 			 * unusual error - reflect it to the guest as DSI.
 			 */
-			kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
+			kvmppc_core_queue_data_storage(vcpu, ea, dsisr, 0);
 			return RESUME_GUEST;
 		}
 		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
@@ -981,7 +981,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 		if (writing) {
 			/* give the guest a DSI */
 			kvmppc_core_queue_data_storage(vcpu, ea, DSISR_ISSTORE |
-						       DSISR_PROTFAULT);
+						       DSISR_PROTFAULT, 0);
 			return RESUME_GUEST;
 		}
 		kvm_ro = true;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 47ccd4a2df54..d07e9065f7c1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1592,7 +1592,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 
 		if (!(vcpu->arch.fault_dsisr & (DSISR_NOHPTE | DSISR_PROTFAULT))) {
 			kvmppc_core_queue_data_storage(vcpu,
-				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
+				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr, 0);
 			r = RESUME_GUEST;
 			break;
 		}
@@ -1610,7 +1610,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 			r = RESUME_PAGE_FAULT;
 		} else {
 			kvmppc_core_queue_data_storage(vcpu,
-				vcpu->arch.fault_dar, err);
+				vcpu->arch.fault_dar, err, 0);
 			r = RESUME_GUEST;
 		}
 		break;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 898f942eb198..a10ef0d5f925 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1556,7 +1556,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (!memslot || (memslot->flags & KVM_MEMSLOT_INVALID)) {
 		if (dsisr & (DSISR_PRTABLE_FAULT | DSISR_BADACCESS)) {
 			/* unusual error -> reflect to the guest as a DSI */
-			kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
+			kvmppc_core_queue_data_storage(vcpu, ea, dsisr, 0);
 			return RESUME_GUEST;
 		}
 
@@ -1567,7 +1567,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 		if (writing) {
 			/* Give the guest a DSI */
 			kvmppc_core_queue_data_storage(vcpu, ea,
-					DSISR_ISSTORE | DSISR_PROTFAULT);
+					DSISR_ISSTORE | DSISR_PROTFAULT, 0);
 			return RESUME_GUEST;
 		}
 		kvm_ro = true;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 6bc9425acb32..f7fc8e01fd8e 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -754,7 +754,7 @@ static int kvmppc_handle_pagefault(struct kvm_vcpu *vcpu,
 			flags = DSISR_NOHPTE;
 		if (data) {
 			flags |= vcpu->arch.fault_dsisr & DSISR_ISSTORE;
-			kvmppc_core_queue_data_storage(vcpu, eaddr, flags);
+			kvmppc_core_queue_data_storage(vcpu, eaddr, flags, 0);
 		} else {
 			kvmppc_core_queue_inst_storage(vcpu, flags);
 		}
@@ -1229,7 +1229,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 			r = kvmppc_handle_pagefault(vcpu, dar, exit_nr);
 			srcu_read_unlock(&vcpu->kvm->srcu, idx);
 		} else {
-			kvmppc_core_queue_data_storage(vcpu, dar, fault_dsisr);
+			kvmppc_core_queue_data_storage(vcpu, dar, fault_dsisr, 0);
 			r = RESUME_GUEST;
 		}
 		break;
-- 
2.31.1

