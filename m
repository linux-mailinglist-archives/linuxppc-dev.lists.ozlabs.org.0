Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED767A2CC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:53:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=a/NS0SYy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXbx31Tvz3gbh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:53:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=a/NS0SYy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ivcezqykdlstfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7c4C4xz3dJX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:32:12 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c4375c1406so10019505ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824331; x=1695429131; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XQKt9ip81eNaA/ioPgL3dH9e9vr3TzqljSeTBinzyVo=;
        b=a/NS0SYyvbZYTKQpXPzME2NfZ3HjCgc53mWIL2jhdKwxvJDGuDXbzqn42VZo79lcRC
         v80Gjy91D1o3peJflLC/HbSFP9VFeehQts3SMK4ARwrhoMpgsNTN1nhg8LOBK/rH1zI1
         XczL6R7unTjepZSoY/jfGq4FLjpAItYyd6LX6bFUIIHHHKtXWQINqLu8UBQA36+PZ1zF
         S++W+2R6h+bGjAIfcd6skfgeOVvwpVbUj+ZaP7pXyJDb11CtX945ke8cQl97LUKELtPB
         hY0hL1Oh8dGqUG0WnDYHfwMnQ5ngH0e6o2bS9BAMvPUgnnCXXFJlLvAZ4fv+Oz+R8o4e
         DEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824331; x=1695429131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQKt9ip81eNaA/ioPgL3dH9e9vr3TzqljSeTBinzyVo=;
        b=gZibjQ21hiIahxzr9CocMcBYMnVVwP0Hf6AfcemiMPthRz1/IT/Q5Gl+iTbnUZ9i5n
         K7y9dEJB0kacPNTuiTL97dTfEIVqL/eONrY5hXI+LzNCq6cq0Dy/5TTorrbyp1kFgRGp
         YFKR8xApVDuAZZCHM9BoCBuMBc+kDFhEuC5AUfCiqslODZjequ+Qpy7pqrQWkVVj9L/u
         5VQ9FxQjjmRI1G3TrsUimNN2Vt8o1UAcKAhvRCo7fnZWx9RS7laUh0WdlJbLbzfTTPMN
         N4jhK4EC5gK9UsJc3Z5tV8LD4nNPGb1+HHCnfRxzlklLcicaOzFC5AlU6el+tU3XvYI4
         CGdQ==
X-Gm-Message-State: AOJu0YyWgJMuKR0/wC0XDGpJUcgDtwxausClQICjHGoDgxRIHhOfNHo5
	E1RaSy18SCClVWXaJsrNP/LK3/MYb/w=
X-Google-Smtp-Source: AGHT+IGF/tpivhdzzMxCzu4p2COJ/tsujORVDRvqtMyofX9ypz/OjlCrOXRz/aOj6KmZJ7FZTcTX3ecEuUc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4c7:b0:1bc:5182:1de2 with SMTP id
 o7-20020a170902d4c700b001bc51821de2mr81466plg.1.1694824330917; Fri, 15 Sep
 2023 17:32:10 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:17 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-26-seanjc@google.com>
Subject: [PATCH 25/26] KVM: PPC: Rearrange code in kvm_ppc.h to isolate
 "public" information
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move all declarations and definitions in kvm_ppc.h that are consumed by
things other than KVM to the top of the file.  This will allow wrapping
the parts of kvm_ppc.h that are intended only for KVM, i.e. are intended
to be "private" to KVM, with an #ifdef to hide KVM's internal details from
the kernel at-large.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 302 +++++++++++++++--------------
 1 file changed, 153 insertions(+), 149 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 72fee202d3ec..ead2ad892ebc 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -30,6 +30,159 @@
 #endif
 #include <asm/inst.h>
 
+struct openpic;
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+extern void kvm_cma_reserve(void) __init;
+static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
+{
+	paca_ptrs[cpu]->kvm_hstate.xics_phys = (void __iomem *)addr;
+}
+
+static inline void kvmppc_set_xive_tima(int cpu,
+					unsigned long phys_addr,
+					void __iomem *virt_addr)
+{
+	paca_ptrs[cpu]->kvm_hstate.xive_tima_phys = (void __iomem *)phys_addr;
+	paca_ptrs[cpu]->kvm_hstate.xive_tima_virt = virt_addr;
+}
+
+static inline u32 kvmppc_get_xics_latch(void)
+{
+	u32 xirr;
+
+	xirr = get_paca()->kvm_hstate.saved_xirr;
+	get_paca()->kvm_hstate.saved_xirr = 0;
+	return xirr;
+}
+
+/*
+ * To avoid the need to unnecessarily exit fully to the host kernel, an IPI to
+ * a CPU thread that's running/napping inside of a guest is by default regarded
+ * as a request to wake the CPU (if needed) and continue execution within the
+ * guest, potentially to process new state like externally-generated
+ * interrupts or IPIs sent from within the guest itself (e.g. H_PROD/H_IPI).
+ *
+ * To force an exit to the host kernel, kvmppc_set_host_ipi() must be called
+ * prior to issuing the IPI to set the corresponding 'host_ipi' flag in the
+ * target CPU's PACA. To avoid unnecessary exits to the host, this flag should
+ * be immediately cleared via kvmppc_clear_host_ipi() by the IPI handler on
+ * the receiving side prior to processing the IPI work.
+ *
+ * NOTE:
+ *
+ * We currently issue an smp_mb() at the beginning of kvmppc_set_host_ipi().
+ * This is to guard against sequences such as the following:
+ *
+ *      CPU
+ *        X: smp_muxed_ipi_set_message():
+ *        X:   smp_mb()
+ *        X:   message[RESCHEDULE] = 1
+ *        X: doorbell_global_ipi(42):
+ *        X:   kvmppc_set_host_ipi(42)
+ *        X:   ppc_msgsnd_sync()/smp_mb()
+ *        X:   ppc_msgsnd() -> 42
+ *       42: doorbell_exception(): // from CPU X
+ *       42:   ppc_msgsync()
+ *      105: smp_muxed_ipi_set_message():
+ *      105:   smb_mb()
+ *           // STORE DEFERRED DUE TO RE-ORDERING
+ *    --105:   message[CALL_FUNCTION] = 1
+ *    | 105: doorbell_global_ipi(42):
+ *    | 105:   kvmppc_set_host_ipi(42)
+ *    |  42:   kvmppc_clear_host_ipi(42)
+ *    |  42: smp_ipi_demux_relaxed()
+ *    |  42: // returns to executing guest
+ *    |      // RE-ORDERED STORE COMPLETES
+ *    ->105:   message[CALL_FUNCTION] = 1
+ *      105:   ppc_msgsnd_sync()/smp_mb()
+ *      105:   ppc_msgsnd() -> 42
+ *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
+ *      105: // hangs waiting on 42 to process messages/call_single_queue
+ *
+ * We also issue an smp_mb() at the end of kvmppc_clear_host_ipi(). This is
+ * to guard against sequences such as the following (as well as to create
+ * a read-side pairing with the barrier in kvmppc_set_host_ipi()):
+ *
+ *      CPU
+ *        X: smp_muxed_ipi_set_message():
+ *        X:   smp_mb()
+ *        X:   message[RESCHEDULE] = 1
+ *        X: doorbell_global_ipi(42):
+ *        X:   kvmppc_set_host_ipi(42)
+ *        X:   ppc_msgsnd_sync()/smp_mb()
+ *        X:   ppc_msgsnd() -> 42
+ *       42: doorbell_exception(): // from CPU X
+ *       42:   ppc_msgsync()
+ *           // STORE DEFERRED DUE TO RE-ORDERING
+ *    -- 42:   kvmppc_clear_host_ipi(42)
+ *    |  42: smp_ipi_demux_relaxed()
+ *    | 105: smp_muxed_ipi_set_message():
+ *    | 105:   smb_mb()
+ *    | 105:   message[CALL_FUNCTION] = 1
+ *    | 105: doorbell_global_ipi(42):
+ *    | 105:   kvmppc_set_host_ipi(42)
+ *    |      // RE-ORDERED STORE COMPLETES
+ *    -> 42:   kvmppc_clear_host_ipi(42)
+ *       42: // returns to executing guest
+ *      105:   ppc_msgsnd_sync()/smp_mb()
+ *      105:   ppc_msgsnd() -> 42
+ *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
+ *      105: // hangs waiting on 42 to process messages/call_single_queue
+ */
+static inline void kvmppc_set_host_ipi(int cpu)
+{
+	/*
+	 * order stores of IPI messages vs. setting of host_ipi flag
+	 *
+	 * pairs with the barrier in kvmppc_clear_host_ipi()
+	 */
+	smp_mb();
+	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
+}
+
+static inline void kvmppc_clear_host_ipi(int cpu)
+{
+	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
+	/*
+	 * order clearing of host_ipi flag vs. processing of IPI messages
+	 *
+	 * pairs with the barrier in kvmppc_set_host_ipi()
+	 */
+	smp_mb();
+}
+
+extern void kvmppc_xics_ipi_action(void);
+
+extern void kvm_hv_vm_activated(void);
+extern void kvm_hv_vm_deactivated(void);
+extern bool kvm_hv_mode_active(void);
+#else
+static inline void __init kvm_cma_reserve(void)
+{}
+
+static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
+{}
+
+static inline void kvmppc_set_xive_tima(int cpu,
+					unsigned long phys_addr,
+					void __iomem *virt_addr)
+{}
+
+static inline u32 kvmppc_get_xics_latch(void)
+{
+	return 0;
+}
+
+static inline void kvmppc_set_host_ipi(int cpu)
+{}
+
+static inline void kvmppc_clear_host_ipi(int cpu)
+{}
+
+static inline bool kvm_hv_mode_active(void)		{ return false; }
+#endif
+
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
  * for supporting software breakpoint.
@@ -443,166 +596,18 @@ void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 pid);
 struct openpic;
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-extern void kvm_cma_reserve(void) __init;
-static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
-{
-	paca_ptrs[cpu]->kvm_hstate.xics_phys = (void __iomem *)addr;
-}
-
-static inline void kvmppc_set_xive_tima(int cpu,
-					unsigned long phys_addr,
-					void __iomem *virt_addr)
-{
-	paca_ptrs[cpu]->kvm_hstate.xive_tima_phys = (void __iomem *)phys_addr;
-	paca_ptrs[cpu]->kvm_hstate.xive_tima_virt = virt_addr;
-}
-
-static inline u32 kvmppc_get_xics_latch(void)
-{
-	u32 xirr;
-
-	xirr = get_paca()->kvm_hstate.saved_xirr;
-	get_paca()->kvm_hstate.saved_xirr = 0;
-	return xirr;
-}
-
-/*
- * To avoid the need to unnecessarily exit fully to the host kernel, an IPI to
- * a CPU thread that's running/napping inside of a guest is by default regarded
- * as a request to wake the CPU (if needed) and continue execution within the
- * guest, potentially to process new state like externally-generated
- * interrupts or IPIs sent from within the guest itself (e.g. H_PROD/H_IPI).
- *
- * To force an exit to the host kernel, kvmppc_set_host_ipi() must be called
- * prior to issuing the IPI to set the corresponding 'host_ipi' flag in the
- * target CPU's PACA. To avoid unnecessary exits to the host, this flag should
- * be immediately cleared via kvmppc_clear_host_ipi() by the IPI handler on
- * the receiving side prior to processing the IPI work.
- *
- * NOTE:
- *
- * We currently issue an smp_mb() at the beginning of kvmppc_set_host_ipi().
- * This is to guard against sequences such as the following:
- *
- *      CPU
- *        X: smp_muxed_ipi_set_message():
- *        X:   smp_mb()
- *        X:   message[RESCHEDULE] = 1
- *        X: doorbell_global_ipi(42):
- *        X:   kvmppc_set_host_ipi(42)
- *        X:   ppc_msgsnd_sync()/smp_mb()
- *        X:   ppc_msgsnd() -> 42
- *       42: doorbell_exception(): // from CPU X
- *       42:   ppc_msgsync()
- *      105: smp_muxed_ipi_set_message():
- *      105:   smb_mb()
- *           // STORE DEFERRED DUE TO RE-ORDERING
- *    --105:   message[CALL_FUNCTION] = 1
- *    | 105: doorbell_global_ipi(42):
- *    | 105:   kvmppc_set_host_ipi(42)
- *    |  42:   kvmppc_clear_host_ipi(42)
- *    |  42: smp_ipi_demux_relaxed()
- *    |  42: // returns to executing guest
- *    |      // RE-ORDERED STORE COMPLETES
- *    ->105:   message[CALL_FUNCTION] = 1
- *      105:   ppc_msgsnd_sync()/smp_mb()
- *      105:   ppc_msgsnd() -> 42
- *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
- *      105: // hangs waiting on 42 to process messages/call_single_queue
- *
- * We also issue an smp_mb() at the end of kvmppc_clear_host_ipi(). This is
- * to guard against sequences such as the following (as well as to create
- * a read-side pairing with the barrier in kvmppc_set_host_ipi()):
- *
- *      CPU
- *        X: smp_muxed_ipi_set_message():
- *        X:   smp_mb()
- *        X:   message[RESCHEDULE] = 1
- *        X: doorbell_global_ipi(42):
- *        X:   kvmppc_set_host_ipi(42)
- *        X:   ppc_msgsnd_sync()/smp_mb()
- *        X:   ppc_msgsnd() -> 42
- *       42: doorbell_exception(): // from CPU X
- *       42:   ppc_msgsync()
- *           // STORE DEFERRED DUE TO RE-ORDERING
- *    -- 42:   kvmppc_clear_host_ipi(42)
- *    |  42: smp_ipi_demux_relaxed()
- *    | 105: smp_muxed_ipi_set_message():
- *    | 105:   smb_mb()
- *    | 105:   message[CALL_FUNCTION] = 1
- *    | 105: doorbell_global_ipi(42):
- *    | 105:   kvmppc_set_host_ipi(42)
- *    |      // RE-ORDERED STORE COMPLETES
- *    -> 42:   kvmppc_clear_host_ipi(42)
- *       42: // returns to executing guest
- *      105:   ppc_msgsnd_sync()/smp_mb()
- *      105:   ppc_msgsnd() -> 42
- *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
- *      105: // hangs waiting on 42 to process messages/call_single_queue
- */
-static inline void kvmppc_set_host_ipi(int cpu)
-{
-	/*
-	 * order stores of IPI messages vs. setting of host_ipi flag
-	 *
-	 * pairs with the barrier in kvmppc_clear_host_ipi()
-	 */
-	smp_mb();
-	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
-}
-
-static inline void kvmppc_clear_host_ipi(int cpu)
-{
-	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
-	/*
-	 * order clearing of host_ipi flag vs. processing of IPI messages
-	 *
-	 * pairs with the barrier in kvmppc_set_host_ipi()
-	 */
-	smp_mb();
-}
-
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
 {
 	vcpu->kvm->arch.kvm_ops->fast_vcpu_kick(vcpu);
 }
 
-extern void kvm_hv_vm_activated(void);
-extern void kvm_hv_vm_deactivated(void);
-extern bool kvm_hv_mode_active(void);
-
 extern void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu);
 
 #else
-static inline void __init kvm_cma_reserve(void)
-{}
-
-static inline void kvmppc_set_xics_phys(int cpu, unsigned long addr)
-{}
-
-static inline void kvmppc_set_xive_tima(int cpu,
-					unsigned long phys_addr,
-					void __iomem *virt_addr)
-{}
-
-static inline u32 kvmppc_get_xics_latch(void)
-{
-	return 0;
-}
-
-static inline void kvmppc_set_host_ipi(int cpu)
-{}
-
-static inline void kvmppc_clear_host_ipi(int cpu)
-{}
-
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
 {
 	kvm_vcpu_kick(vcpu);
 }
-
-static inline bool kvm_hv_mode_active(void)		{ return false; }
-
 #endif
 
 #ifdef CONFIG_PPC_PSERIES
@@ -642,7 +647,6 @@ extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
 extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
 extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
 			struct kvm_vcpu *vcpu, u32 cpu);
-extern void kvmppc_xics_ipi_action(void);
 extern void kvmppc_xics_set_mapped(struct kvm *kvm, unsigned long guest_irq,
 				   unsigned long host_irq);
 extern void kvmppc_xics_clr_mapped(struct kvm *kvm, unsigned long guest_irq,
-- 
2.42.0.459.ge4e396fd5e-goog

