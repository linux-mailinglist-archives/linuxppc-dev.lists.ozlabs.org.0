Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCE6D0155
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 12:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnKYg4gmkz3fYS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 21:35:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l+0z0T6c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnKW12NdJz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:32:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l+0z0T6c;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PnKVw5hgtz4xFh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:32:40 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PnKVw5cz5z4xFg; Thu, 30 Mar 2023 21:32:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l+0z0T6c;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PnKVw5CGDz4xFd;
	Thu, 30 Mar 2023 21:32:40 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso6095882pjf.0;
        Thu, 30 Mar 2023 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680172358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUabCs8Zto9c6pT5/xcZLmLqLiCqRse6OqYy5e1mDF8=;
        b=l+0z0T6cQBL84vj4ettXCJ/b4gIDgps5/UEI9/UgJQPy2Vb/vSt34E98CwJ7n0b/hm
         WBkkf9///yHnsiR8NJWEAf/UjLZVijCQ0FzlnmG2NOJVWKeZfe6Hult+GOiRsXbHs/LL
         YkCrcKPUNzMkixbu+2hOOCTFLPTmBwrsoYT8RVMFyfbya5JzL0Pz3QGD23hq+yw1CRet
         hQe4epqkaRj6yDila2THpubmIq7kAWNtiBineFpPJmeYCTDzyqvqVgi1KEU46umxIaoE
         wqqx9pXV8ey1aT/4w/hLGpN5FNu3/ZP3bzNesLISApegY3aEZS285wkqVyz5FLzGuQdY
         nUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680172358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUabCs8Zto9c6pT5/xcZLmLqLiCqRse6OqYy5e1mDF8=;
        b=MzlTP3vX7k4U2TQ5tJfeAA1EqW+9xeVyfBfPfqIuUprporunjobO+i9zJZuR927OtE
         d1FIw2oNJjSJxHuHase0jJRa8vQsnXcBzx+C481lkXe5jKBC7gCrn2TRAc47da1lf658
         g5a1ZLycFRIdz2VcgFa4BJffTDDT26Padmdkah6/Wu9cqvEoKgMCzpBKhX35i/+VEmh6
         3sYjjsVZHtxj70n7j3lJnebP8FRqmneCJQxRDIWex194Ql3zp3eY7hu7MVjtJVfs0H3d
         c/GIxuJNRC0FQ3X8D8EDREJdz1Hqksn/DM1/uZG3KVdEJjpS/4L4i/zaQIWlMV/ZOlXn
         HwWw==
X-Gm-Message-State: AAQBX9cKWrz9j5npLGYXr5zJe+d2ZgR0n1oRRDiY941NL88dg9RElrQp
	lJX7loFCz42M325vJkwuu51jNG8RM6M=
X-Google-Smtp-Source: AKy350YM/nPCQD2hXk+d13EeYLBYhBy0TGVTDc1TBE28q2GMhntOqTQa6K/ItZOzGcY8ANeealtyAg==
X-Received: by 2002:a17:90a:52:b0:23d:9a3:f571 with SMTP id 18-20020a17090a005200b0023d09a3f571mr25234160pjb.20.1680172358254;
        Thu, 30 Mar 2023 03:32:38 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.177.81])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a08c600b0023440af7aafsm2895219pjn.9.2023.03.30.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 03:32:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 1/2] KVM: PPC: Permit SRR1 flags in more injected interrupt types
Date: Thu, 30 Mar 2023 20:32:23 +1000
Message-Id: <20230330103224.3589928-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230330103224.3589928-1-npiggin@gmail.com>
References: <20230330103224.3589928-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Michael Neuling <mikey@neuling.org>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The prefix architecture in ISA v3.1 introduces a prefixed bit in SRR1
for many types of synchronous interrupts which is set when the interrupt
is caused by a prefixed instruction.

This requires KVM to be able to set this bit when injecting interrupts
into a guest. Plumb through the SRR1 "flags" argument to the core_queue
APIs where it's missing for this. For now they are set to 0, which is
no change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h     | 27 ++++++++++++++--------
 arch/powerpc/kvm/book3s.c              | 32 +++++++++++++-------------
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  8 +++----
 arch/powerpc/kvm/book3s_hv.c           |  4 ++--
 arch/powerpc/kvm/book3s_hv_nested.c    |  4 ++--
 arch/powerpc/kvm/book3s_pr.c           |  4 ++--
 arch/powerpc/kvm/booke.c               | 13 +++++++----
 arch/powerpc/kvm/emulate_loadstore.c   |  6 ++---
 arch/powerpc/kvm/powerpc.c             |  3 ++-
 9 files changed, 57 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 52e7964e4301..bc57d058ad5b 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -128,25 +128,34 @@ extern void kvmppc_core_vcpu_put(struct kvm_vcpu *vcpu);
 
 extern int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_pending_dec(struct kvm_vcpu *vcpu);
-extern void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu, ulong flags);
+
+extern void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu,
+					    ulong srr1_flags);
 extern void kvmppc_core_queue_syscall(struct kvm_vcpu *vcpu);
-extern void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong flags);
-extern void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu);
-extern void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu);
-extern void kvmppc_core_queue_vsx_unavail(struct kvm_vcpu *vcpu);
+extern void kvmppc_core_queue_program(struct kvm_vcpu *vcpu,
+				      ulong srr1_flags);
+extern void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu,
+					ulong srr1_flags);
+extern void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu,
+					  ulong srr1_flags);
+extern void kvmppc_core_queue_vsx_unavail(struct kvm_vcpu *vcpu,
+					  ulong srr1_flags);
 extern void kvmppc_core_queue_dec(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_dequeue_dec(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_queue_external(struct kvm_vcpu *vcpu,
                                        struct kvm_interrupt *irq);
 extern void kvmppc_core_dequeue_external(struct kvm_vcpu *vcpu);
-extern void kvmppc_core_queue_dtlb_miss(struct kvm_vcpu *vcpu, ulong dear_flags,
+extern void kvmppc_core_queue_dtlb_miss(struct kvm_vcpu *vcpu,
+					ulong dear_flags,
 					ulong esr_flags);
 extern void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu,
-					   ulong dear_flags,
-					   ulong esr_flags);
+					   ulong srr1_flags,
+					   ulong dar,
+					   ulong dsisr);
 extern void kvmppc_core_queue_itlb_miss(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_queue_inst_storage(struct kvm_vcpu *vcpu,
-					   ulong esr_flags);
+					   ulong srr1_flags);
+
 extern void kvmppc_core_flush_tlb(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_check_requests(struct kvm_vcpu *vcpu);
 
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 85d6a60f4db5..686d8d9eda3e 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -188,10 +188,10 @@ void kvmppc_book3s_queue_irqprio(struct kvm_vcpu *vcpu, unsigned int vec)
 }
 EXPORT_SYMBOL_GPL(kvmppc_book3s_queue_irqprio);
 
-void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu, ulong flags)
+void kvmppc_core_queue_machine_check(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
 	/* might as well deliver this straight away */
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_MACHINE_CHECK, flags);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_MACHINE_CHECK, srr1_flags);
 }
 EXPORT_SYMBOL_GPL(kvmppc_core_queue_machine_check);
 
@@ -201,29 +201,29 @@ void kvmppc_core_queue_syscall(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL(kvmppc_core_queue_syscall);
 
-void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong flags)
+void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
 	/* might as well deliver this straight away */
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_PROGRAM, flags);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_PROGRAM, srr1_flags);
 }
 EXPORT_SYMBOL_GPL(kvmppc_core_queue_program);
 
-void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu)
+void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
 	/* might as well deliver this straight away */
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_FP_UNAVAIL, 0);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_FP_UNAVAIL, srr1_flags);
 }
 
-void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu)
+void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
 	/* might as well deliver this straight away */
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_ALTIVEC, 0);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_ALTIVEC, srr1_flags);
 }
 
-void kvmppc_core_queue_vsx_unavail(struct kvm_vcpu *vcpu)
+void kvmppc_core_queue_vsx_unavail(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
 	/* might as well deliver this straight away */
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_VSX, 0);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_VSX, srr1_flags);
 }
 
 void kvmppc_core_queue_dec(struct kvm_vcpu *vcpu)
@@ -278,18 +278,18 @@ void kvmppc_core_dequeue_external(struct kvm_vcpu *vcpu)
 	kvmppc_book3s_dequeue_irqprio(vcpu, BOOK3S_INTERRUPT_EXTERNAL);
 }
 
-void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu, ulong dar,
-				    ulong flags)
+void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu, ulong srr1_flags,
+				    ulong dar, ulong dsisr)
 {
 	kvmppc_set_dar(vcpu, dar);
-	kvmppc_set_dsisr(vcpu, flags);
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE, 0);
+	kvmppc_set_dsisr(vcpu, dsisr);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_DATA_STORAGE, srr1_flags);
 }
 EXPORT_SYMBOL_GPL(kvmppc_core_queue_data_storage);
 
-void kvmppc_core_queue_inst_storage(struct kvm_vcpu *vcpu, ulong flags)
+void kvmppc_core_queue_inst_storage(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
-	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_INST_STORAGE, flags);
+	kvmppc_inject_interrupt(vcpu, BOOK3S_INTERRUPT_INST_STORAGE, srr1_flags);
 }
 EXPORT_SYMBOL_GPL(kvmppc_core_queue_inst_storage);
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 9d3743ca16d5..215a6b5ba104 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -954,7 +954,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	if (dsisr & DSISR_BADACCESS) {
 		/* Reflect to the guest as DSI */
 		pr_err("KVM: Got radix HV page fault with DSISR=%lx\n", dsisr);
-		kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
+		kvmppc_core_queue_data_storage(vcpu, 0, ea, dsisr);
 		return RESUME_GUEST;
 	}
 
@@ -979,7 +979,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 			 * Bad address in guest page table tree, or other
 			 * unusual error - reflect it to the guest as DSI.
 			 */
-			kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
+			kvmppc_core_queue_data_storage(vcpu, 0, ea, dsisr);
 			return RESUME_GUEST;
 		}
 		return kvmppc_hv_emulate_mmio(vcpu, gpa, ea, writing);
@@ -988,8 +988,8 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	if (memslot->flags & KVM_MEM_READONLY) {
 		if (writing) {
 			/* give the guest a DSI */
-			kvmppc_core_queue_data_storage(vcpu, ea, DSISR_ISSTORE |
-						       DSISR_PROTFAULT);
+			kvmppc_core_queue_data_storage(vcpu, 0, ea,
+					DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
 		kvm_ro = true;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c5b24ab90fb2..16ea0ffb7976 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1741,7 +1741,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		}
 
 		if (!(vcpu->arch.fault_dsisr & (DSISR_NOHPTE | DSISR_PROTFAULT))) {
-			kvmppc_core_queue_data_storage(vcpu,
+			kvmppc_core_queue_data_storage(vcpu, 0,
 				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
 			r = RESUME_GUEST;
 			break;
@@ -1759,7 +1759,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		} else if (err == -1 || err == -2) {
 			r = RESUME_PAGE_FAULT;
 		} else {
-			kvmppc_core_queue_data_storage(vcpu,
+			kvmppc_core_queue_data_storage(vcpu, 0,
 				vcpu->arch.fault_dar, err);
 			r = RESUME_GUEST;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 5a64a1341e6f..2c9db6119d89 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1560,7 +1560,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (!memslot || (memslot->flags & KVM_MEMSLOT_INVALID)) {
 		if (dsisr & (DSISR_PRTABLE_FAULT | DSISR_BADACCESS)) {
 			/* unusual error -> reflect to the guest as a DSI */
-			kvmppc_core_queue_data_storage(vcpu, ea, dsisr);
+			kvmppc_core_queue_data_storage(vcpu, 0, ea, dsisr);
 			return RESUME_GUEST;
 		}
 
@@ -1570,7 +1570,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (memslot->flags & KVM_MEM_READONLY) {
 		if (writing) {
 			/* Give the guest a DSI */
-			kvmppc_core_queue_data_storage(vcpu, ea,
+			kvmppc_core_queue_data_storage(vcpu, 0, ea,
 					DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index fa010d92a8d2..da0e888e2521 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -759,7 +759,7 @@ static int kvmppc_handle_pagefault(struct kvm_vcpu *vcpu,
 			flags = DSISR_NOHPTE;
 		if (data) {
 			flags |= vcpu->arch.fault_dsisr & DSISR_ISSTORE;
-			kvmppc_core_queue_data_storage(vcpu, eaddr, flags);
+			kvmppc_core_queue_data_storage(vcpu, 0, eaddr, flags);
 		} else {
 			kvmppc_core_queue_inst_storage(vcpu, flags);
 		}
@@ -1238,7 +1238,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 			r = kvmppc_handle_pagefault(vcpu, dar, exit_nr);
 			srcu_read_unlock(&vcpu->kvm->srcu, idx);
 		} else {
-			kvmppc_core_queue_data_storage(vcpu, dar, fault_dsisr);
+			kvmppc_core_queue_data_storage(vcpu, 0, dar, fault_dsisr);
 			r = RESUME_GUEST;
 		}
 		break;
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 8b10f1660263..1062ed4af238 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -283,9 +283,10 @@ void kvmppc_core_queue_dtlb_miss(struct kvm_vcpu *vcpu,
 	kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_DTLB_MISS);
 }
 
-void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu,
+void kvmppc_core_queue_data_storage(struct kvm_vcpu *vcpu, ulong srr1_flags,
 				    ulong dear_flags, ulong esr_flags)
 {
+	WARN_ON_ONCE(srr1_flags);
 	vcpu->arch.queued_dear = dear_flags;
 	vcpu->arch.queued_esr = esr_flags;
 	kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_DATA_STORAGE);
@@ -316,14 +317,16 @@ void kvmppc_core_queue_program(struct kvm_vcpu *vcpu, ulong esr_flags)
 	kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_PROGRAM);
 }
 
-void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu)
+void kvmppc_core_queue_fpunavail(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
+	WARN_ON_ONCE(srr1_flags);
 	kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_FP_UNAVAIL);
 }
 
 #ifdef CONFIG_ALTIVEC
-void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu)
+void kvmppc_core_queue_vec_unavail(struct kvm_vcpu *vcpu, ulong srr1_flags)
 {
+	WARN_ON_ONCE(srr1_flags);
 	kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_ALTIVEC_UNAVAIL);
 }
 #endif
@@ -1229,7 +1232,7 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 #endif
 
 	case BOOKE_INTERRUPT_DATA_STORAGE:
-		kvmppc_core_queue_data_storage(vcpu, vcpu->arch.fault_dear,
+		kvmppc_core_queue_data_storage(vcpu, 0, vcpu->arch.fault_dear,
 		                               vcpu->arch.fault_esr);
 		kvmppc_account_exit(vcpu, DSI_EXITS);
 		r = RESUME_GUEST;
@@ -1242,7 +1245,7 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		break;
 
 	case BOOKE_INTERRUPT_ALIGNMENT:
-		kvmppc_core_queue_alignment(vcpu, vcpu->arch.fault_dear,
+		kvmppc_core_queue_alignment(vcpu, 0, vcpu->arch.fault_dear,
 		                            vcpu->arch.fault_esr);
 		r = RESUME_GUEST;
 		break;
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 7716d04f329c..5666d69e202a 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -28,7 +28,7 @@
 static bool kvmppc_check_fp_disabled(struct kvm_vcpu *vcpu)
 {
 	if (!(kvmppc_get_msr(vcpu) & MSR_FP)) {
-		kvmppc_core_queue_fpunavail(vcpu);
+		kvmppc_core_queue_fpunavail(vcpu, 0);
 		return true;
 	}
 
@@ -40,7 +40,7 @@ static bool kvmppc_check_fp_disabled(struct kvm_vcpu *vcpu)
 static bool kvmppc_check_vsx_disabled(struct kvm_vcpu *vcpu)
 {
 	if (!(kvmppc_get_msr(vcpu) & MSR_VSX)) {
-		kvmppc_core_queue_vsx_unavail(vcpu);
+		kvmppc_core_queue_vsx_unavail(vcpu, 0);
 		return true;
 	}
 
@@ -52,7 +52,7 @@ static bool kvmppc_check_vsx_disabled(struct kvm_vcpu *vcpu)
 static bool kvmppc_check_altivec_disabled(struct kvm_vcpu *vcpu)
 {
 	if (!(kvmppc_get_msr(vcpu) & MSR_VEC)) {
-		kvmppc_core_queue_vec_unavail(vcpu);
+		kvmppc_core_queue_vec_unavail(vcpu, 0);
 		return true;
 	}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 3fe6c3cd0209..9478bbd873c6 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -321,7 +321,8 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
 			if (vcpu->mmio_is_write)
 				dsisr |= DSISR_ISSTORE;
 
-			kvmppc_core_queue_data_storage(vcpu, vcpu->arch.vaddr_accessed, dsisr);
+			kvmppc_core_queue_data_storage(vcpu, 0,
+					vcpu->arch.vaddr_accessed, dsisr);
 		} else {
 			/*
 			 * BookE does not send a SIGBUS on a bad
-- 
2.37.2

