Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB783FE15D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 19:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0BPS2gJDz2yQL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 03:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UH2vlxUQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UH2vlxUQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0BNh1xJyz2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 03:48:03 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181HZdXv006875; Wed, 1 Sep 2021 13:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=84a79cFjCdvK9jtoGbG0+r/njaWtJwc98/346b9dRXk=;
 b=UH2vlxUQa2NKdghuJNTLNdOLSpciV437VQDplwfn7A2mmfRUOVwtqkGMaxUzB2bNCZw9
 F3ss/axYfB0wH20FqB2DoaO9Y/v6eOLL3ILSVnVsizuf6a5EBqeFZ3LQMFlV9J602eOv
 xoqcnpDeal/De+mmdED07n9uSeRoUoMGOUjf4lAA3BW0gTsN25EiIN/6TNpNXb3eYiLI
 CuB15DW8du+nqAD6I3gEXIwjCSgOnUuwCNYaWH+HA2uVD8Eaye+nYJglJdY5+M7kAW7k
 f6E9LrDHUnIwv07zZrajXMWlWVEVxSkh2RxuPs+AxqLuVXD5DDHMmpnOIrSbR56px21L 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ate26r9vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:47:57 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181HaXL3009339;
 Wed, 1 Sep 2021 13:47:56 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ate26r9v1-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 13:47:56 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181HWoHD000344;
 Wed, 1 Sep 2021 17:34:13 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3atdxdr408-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 17:34:13 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181HYCwG53477870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 17:34:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD9E478063;
 Wed,  1 Sep 2021 17:34:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56EFA7806D;
 Wed,  1 Sep 2021 17:34:11 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.58.54])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 17:34:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 5/5] KVM: PPC: Book3S: Stop exporting non-builtin symbols
Date: Wed,  1 Sep 2021 14:33:57 -0300
Message-Id: <20210901173357.3183658-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210901173357.3183658-1-farosas@linux.ibm.com>
References: <20210901173357.3183658-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TRUv-hzlE04srlVPK3J44foMw0FvgwRN
X-Proofpoint-ORIG-GUID: SMpL53O7GlkgASfAv0UlZ0YZgL8xo-mj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxlogscore=771 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109010100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we have only one kvm module, we can stop exporting some
symbols.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/book3s.c              | 15 ---------------
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  3 ---
 arch/powerpc/kvm/book3s_64_vio.c       |  3 ---
 arch/powerpc/kvm/book3s_rtas.c         |  1 -
 arch/powerpc/kvm/book3s_xics.c         |  4 ----
 arch/powerpc/kvm/book3s_xive.c         |  6 ------
 arch/powerpc/kvm/emulate.c             |  1 -
 arch/powerpc/kvm/powerpc.c             | 14 --------------
 8 files changed, 47 deletions(-)

diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index c381bb17b0f9..120a68c76501 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -191,27 +191,23 @@ void kvmppc_book3s_queue_irqprio(struct kvm_vcpu *vcpu, unsigned int vec)
 	printk(KERN_INFO "Queueing interrupt %x\n", vec);
 #endif
 }
-EXPORT_SYMBOL_GPL(kvmppc_book3s_queue_irqprio);
 
 void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu, ulong flags)
 {
 	/* might as well deliver this straight away */
 	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_MACHINE_CHECK, flags);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_queue_machine_check);
 
 void kvmppc_core_queue_syscall(struct kvm_vcpu *vcpu)
 {
 	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_SYSCALL, 0);
 }
-EXPORT_SYMBOL(kvmppc_core_queue_syscall);
 
 void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong flags)
 {
 	/* might as well deliver this straight away */
 	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_PROGRAM, flags);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_queue_program);
 
 void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu)
 {
@@ -235,19 +231,16 @@ void kvmppc_core_queue_dec(struct kvm_vcpu *vcpu)
 {
 	kvmppc_book3s_queue_irqprio(vcpu, BOOK3S_INTERRUPT_DECREMENTER);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_queue_dec);
 
 int kvmppc_core_pending_dec(struct kvm_vcpu *vcpu)
 {
 	return test_bit(BOOK3S_IRQPRIO_DECREMENTER, &vcpu->arch.pending_exceptions);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_pending_dec);
 
 void kvmppc_core_dequeue_dec(struct kvm_vcpu *vcpu)
 {
 	kvmppc_book3s_dequeue_irqprio(vcpu, BOOK3S_INTERRUPT_DECREMENTER);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_dequeue_dec);
 
 void kvmppc_core_queue_external(struct kvm_vcpu *vcpu,
                                 struct kvm_interrupt *irq)
@@ -290,13 +283,11 @@ void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu, ulong dar,
 	kvmppc_set_dsisr(vcpu, flags);
 	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE, 0);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_queue_data_storage);
 
 void kvmppc_core_queue_inst_storage(struct kvm_vcpu *vcpu, ulong flags)
 {
 	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_INST_STORAGE, flags);
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_queue_inst_storage);
 
 static int kvmppc_book3s_irqprio_deliver(struct kvm_vcpu *vcpu,
 					 unsigned int priority)
@@ -428,7 +419,6 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvmppc_core_prepare_to_enter);
 
 kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
 			bool *writable)
@@ -454,7 +444,6 @@ kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
 
 	return gfn_to_pfn_prot(vcpu->kvm, gfn, writing, writable);
 }
-EXPORT_SYMBOL_GPL(kvmppc_gpa_to_pfn);
 
 int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr, enum xlate_instdata xlid,
 		 enum xlate_readwrite xlrw, struct kvmppc_pte *pte)
@@ -501,7 +490,6 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 	else
 		return EMULATE_AGAIN;
 }
-EXPORT_SYMBOL_GPL(kvmppc_load_last_inst);
 
 int kvmppc_subarch_vcpu_init(struct kvm_vcpu *vcpu)
 {
@@ -788,7 +776,6 @@ void kvmppc_set_msr(struct kvm_vcpu *vcpu, u64 msr)
 {
 	vcpu->kvm->arch.kvm_ops->set_msr(vcpu, msr);
 }
-EXPORT_SYMBOL_GPL(kvmppc_set_msr);
 
 int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 {
@@ -964,7 +951,6 @@ int kvmppc_h_logical_ci_load(struct kvm_vcpu *vcpu)
 
 	return H_SUCCESS;
 }
-EXPORT_SYMBOL_GPL(kvmppc_h_logical_ci_load);
 
 int kvmppc_h_logical_ci_store(struct kvm_vcpu *vcpu)
 {
@@ -1004,7 +990,6 @@ int kvmppc_h_logical_ci_store(struct kvm_vcpu *vcpu)
 
 	return H_SUCCESS;
 }
-EXPORT_SYMBOL_GPL(kvmppc_h_logical_ci_store);
 
 int kvmppc_core_check_processor_compat(void)
 {
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index b5905ae4377c..f354ccfed56d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -81,7 +81,6 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(__kvmhv_copy_tofrom_guest_radix);
 
 static long kvmhv_copy_tofrom_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr,
 					  void *to, void *from, unsigned long n)
@@ -117,14 +116,12 @@ long kvmhv_copy_from_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr, void *to,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvmhv_copy_from_guest_radix);
 
 long kvmhv_copy_to_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr, void *from,
 			       unsigned long n)
 {
 	return kvmhv_copy_tofrom_guest_radix(vcpu, eaddr, NULL, from, n);
 }
-EXPORT_SYMBOL_GPL(kvmhv_copy_to_guest_radix);
 
 int kvmppc_mmu_walk_radix_tree(struct kvm_vcpu *vcpu, gva_t eaddr,
 			       struct kvmppc_pte *gpte, u64 root,
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 8da93fdfa59e..5e717512d9c4 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -606,7 +606,6 @@ long kvmppc_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvmppc_h_put_tce);
 
 long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		unsigned long liobn, unsigned long ioba,
@@ -703,7 +702,6 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvmppc_h_put_tce_indirect);
 
 long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
 		unsigned long liobn, unsigned long ioba,
@@ -752,4 +750,3 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kvmppc_h_stuff_tce);
diff --git a/arch/powerpc/kvm/book3s_rtas.c b/arch/powerpc/kvm/book3s_rtas.c
index 0f847f1e5ddd..91094dfb9bc4 100644
--- a/arch/powerpc/kvm/book3s_rtas.c
+++ b/arch/powerpc/kvm/book3s_rtas.c
@@ -294,7 +294,6 @@ int kvmppc_rtas_hcall(struct kvm_vcpu *vcpu)
 	 */
 	return rc;
 }
-EXPORT_SYMBOL_GPL(kvmppc_rtas_hcall);
 
 void kvmppc_rtas_tokens_free(struct kvm *kvm)
 {
diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 303e3cb096db..234a80c958f1 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -870,7 +870,6 @@ int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall)
 
 	return H_SUCCESS;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xics_rm_complete);
 
 int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 {
@@ -917,7 +916,6 @@ int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 
 	return rc;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xics_hcall);
 
 
 /* -- Initialisation code etc. -- */
@@ -1498,7 +1496,6 @@ void kvmppc_xics_set_mapped(struct kvm *kvm, unsigned long irq,
 	ics->irq_state[idx].host_irq = host_irq;
 	ics->irq_state[idx].intr_cpu = -1;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xics_set_mapped);
 
 void kvmppc_xics_clr_mapped(struct kvm *kvm, unsigned long irq,
 			    unsigned long host_irq)
@@ -1513,4 +1510,3 @@ void kvmppc_xics_clr_mapped(struct kvm *kvm, unsigned long irq,
 
 	ics->irq_state[idx].host_irq = 0;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xics_clr_mapped);
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 8cfab3547494..77b350805649 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -126,7 +126,6 @@ void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu)
 			vcpu->arch.xive_esc_on = 0;
 	}
 }
-EXPORT_SYMBOL_GPL(kvmppc_xive_push_vcpu);
 
 /*
  * Pull a vcpu's context from the XIVE on guest exit.
@@ -157,7 +156,6 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.xive_pushed = 0;
 	eieio();
 }
-EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
 
 void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
 {
@@ -191,7 +189,6 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
 	}
 	mb();
 }
-EXPORT_SYMBOL_GPL(kvmppc_xive_rearm_escalation);
 
 /*
  * This is a simple trigger for a generic XIVE IRQ. This must
@@ -1016,7 +1013,6 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned long guest_irq,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xive_set_mapped);
 
 int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned long guest_irq,
 			   struct irq_desc *host_desc)
@@ -1097,7 +1093,6 @@ int kvmppc_xive_clr_mapped(struct kvm *kvm, unsigned long guest_irq,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xive_clr_mapped);
 
 void kvmppc_xive_disable_vcpu_interrupts(struct kvm_vcpu *vcpu)
 {
@@ -2169,7 +2164,6 @@ int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 
 	return H_UNSUPPORTED;
 }
-EXPORT_SYMBOL_GPL(kvmppc_xive_xics_hcall);
 
 int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
 {
diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
index ee1147c98cd8..468efa502d56 100644
--- a/arch/powerpc/kvm/emulate.c
+++ b/arch/powerpc/kvm/emulate.c
@@ -304,4 +304,3 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 
 	return emulated;
 }
-EXPORT_SYMBOL_GPL(kvmppc_emulate_instruction);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b4e6f70b97b9..b3a8853bf6ba 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -41,9 +41,7 @@
 #include "trace.h"
 
 struct kvmppc_ops *kvmppc_hv_ops;
-EXPORT_SYMBOL_GPL(kvmppc_hv_ops);
 struct kvmppc_ops *kvmppc_pr_ops;
-EXPORT_SYMBOL_GPL(kvmppc_pr_ops);
 
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
@@ -135,7 +133,6 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 	local_irq_enable();
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvmppc_prepare_to_enter);
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSIBLE)
 static void kvmppc_swab_shared(struct kvm_vcpu *vcpu)
@@ -248,7 +245,6 @@ int kvmppc_kvm_pv(struct kvm_vcpu *vcpu)
 
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvmppc_kvm_pv);
 
 int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
 {
@@ -277,7 +273,6 @@ int kvmppc_sanity_check(struct kvm_vcpu *vcpu)
 	vcpu->arch.sane = r;
 	return r ? 0 : -EINVAL;
 }
-EXPORT_SYMBOL_GPL(kvmppc_sanity_check);
 
 int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 {
@@ -319,7 +314,6 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 
 	return r;
 }
-EXPORT_SYMBOL_GPL(kvmppc_emulate_mmio);
 
 int kvmppc_st(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 	      bool data)
@@ -362,7 +356,6 @@ int kvmppc_st(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 
 	return EMULATE_DONE;
 }
-EXPORT_SYMBOL_GPL(kvmppc_st);
 
 int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 		      bool data)
@@ -411,7 +404,6 @@ int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
 
 	return EMULATE_DONE;
 }
-EXPORT_SYMBOL_GPL(kvmppc_ld);
 
 int kvm_arch_hardware_enable(void)
 {
@@ -1281,7 +1273,6 @@ int kvmppc_handle_load(struct kvm_vcpu *vcpu,
 {
 	return __kvmppc_handle_load(vcpu, rt, bytes, is_default_endian, 0);
 }
-EXPORT_SYMBOL_GPL(kvmppc_handle_load);
 
 /* Same as above, but sign extends */
 int kvmppc_handle_loads(struct kvm_vcpu *vcpu,
@@ -1378,7 +1369,6 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
 
 	return EMULATE_DO_MMIO;
 }
-EXPORT_SYMBOL_GPL(kvmppc_handle_store);
 
 #ifdef CONFIG_VSX
 static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
@@ -2478,26 +2468,22 @@ long kvmppc_alloc_lpid(void)
 
 	return lpid;
 }
-EXPORT_SYMBOL_GPL(kvmppc_alloc_lpid);
 
 void kvmppc_claim_lpid(long lpid)
 {
 	set_bit(lpid, lpid_inuse);
 }
-EXPORT_SYMBOL_GPL(kvmppc_claim_lpid);
 
 void kvmppc_free_lpid(long lpid)
 {
 	clear_bit(lpid, lpid_inuse);
 }
-EXPORT_SYMBOL_GPL(kvmppc_free_lpid);
 
 void kvmppc_init_lpid(unsigned long nr_lpids_param)
 {
 	nr_lpids = min_t(unsigned long, KVMPPC_NR_LPIDS, nr_lpids_param);
 	memset(lpid_inuse, 0, sizeof(lpid_inuse));
 }
-EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
 
 int kvm_arch_init(void *opaque)
 {
-- 
2.29.2

