Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1648A205351
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 15:22:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rn4Z3PsGzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 23:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.45;
 helo=out30-45.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rmvq6NpCzDqGp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:14:31 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=38; SR=0;
 TI=SMTPD_---0U0WFL-I_1592918062; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U0WFL-I_1592918062) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 23 Jun 2020 21:14:23 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
Subject: [PATCH v6 5/5] KVM: MIPS: clean up redundant kvm_run parameters in
 assembly
Date: Tue, 23 Jun 2020 21:14:18 +0800
Message-Id: <20200623131418.31473-6-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
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
Cc: linux-s390@vger.kernel.org, tianjia.zhang@linux.alibaba.com,
 kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
structure. For historical reasons, many kvm-related function parameters
retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
patch does a unified cleanup of these remaining redundant parameters.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/kvm_host.h |  4 ++--
 arch/mips/kvm/entry.c            | 21 ++++++++-------------
 arch/mips/kvm/mips.c             |  3 ++-
 arch/mips/kvm/trap_emul.c        |  2 +-
 arch/mips/kvm/vz.c               |  2 +-
 5 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 157fc876feca..01efa635fa73 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -352,7 +352,7 @@ struct kvm_mmu_memory_cache {
 #define KVM_MIPS_GUEST_TLB_SIZE	64
 struct kvm_vcpu_arch {
 	void *guest_ebase;
-	int (*vcpu_run)(struct kvm_run *run, struct kvm_vcpu *vcpu);
+	int (*vcpu_run)(struct kvm_vcpu *vcpu);
 
 	/* Host registers preserved across guest mode execution */
 	unsigned long host_stack;
@@ -863,7 +863,7 @@ int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks);
 /* Debug: dump vcpu state */
 int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
 
-extern int kvm_mips_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu);
+extern int kvm_mips_handle_exit(struct kvm_vcpu *vcpu);
 
 /* Building of entry/exception code */
 int kvm_mips_entry_setup(void);
diff --git a/arch/mips/kvm/entry.c b/arch/mips/kvm/entry.c
index fd716942e302..832475bf2055 100644
--- a/arch/mips/kvm/entry.c
+++ b/arch/mips/kvm/entry.c
@@ -205,7 +205,7 @@ static inline void build_set_exc_base(u32 **p, unsigned int reg)
  * Assemble the start of the vcpu_run function to run a guest VCPU. The function
  * conforms to the following prototype:
  *
- * int vcpu_run(struct kvm_run *run, struct kvm_vcpu *vcpu);
+ * int vcpu_run(struct kvm_vcpu *vcpu);
  *
  * The exit from the guest and return to the caller is handled by the code
  * generated by kvm_mips_build_ret_to_host().
@@ -218,8 +218,7 @@ void *kvm_mips_build_vcpu_run(void *addr)
 	unsigned int i;
 
 	/*
-	 * A0: run
-	 * A1: vcpu
+	 * A0: vcpu
 	 */
 
 	/* k0/k1 not being used in host kernel context */
@@ -238,10 +237,10 @@ void *kvm_mips_build_vcpu_run(void *addr)
 	kvm_mips_build_save_scratch(&p, V1, K1);
 
 	/* VCPU scratch register has pointer to vcpu */
-	UASM_i_MTC0(&p, A1, scratch_vcpu[0], scratch_vcpu[1]);
+	UASM_i_MTC0(&p, A0, scratch_vcpu[0], scratch_vcpu[1]);
 
 	/* Offset into vcpu->arch */
-	UASM_i_ADDIU(&p, K1, A1, offsetof(struct kvm_vcpu, arch));
+	UASM_i_ADDIU(&p, K1, A0, offsetof(struct kvm_vcpu, arch));
 
 	/*
 	 * Save the host stack to VCPU, used for exception processing
@@ -645,10 +644,7 @@ void *kvm_mips_build_exit(void *addr)
 	/* Now that context has been saved, we can use other registers */
 
 	/* Restore vcpu */
-	UASM_i_MFC0(&p, S1, scratch_vcpu[0], scratch_vcpu[1]);
-
-	/* Restore run (vcpu->run) */
-	UASM_i_LW(&p, S0, offsetof(struct kvm_vcpu, run), S1);
+	UASM_i_MFC0(&p, S0, scratch_vcpu[0], scratch_vcpu[1]);
 
 	/*
 	 * Save Host level EPC, BadVaddr and Cause to VCPU, useful to process
@@ -810,7 +806,6 @@ void *kvm_mips_build_exit(void *addr)
 	 * with this in the kernel
 	 */
 	uasm_i_move(&p, A0, S0);
-	uasm_i_move(&p, A1, S1);
 	UASM_i_LA(&p, T9, (unsigned long)kvm_mips_handle_exit);
 	uasm_i_jalr(&p, RA, T9);
 	 UASM_i_ADDIU(&p, SP, SP, -CALLFRAME_SIZ);
@@ -852,7 +847,7 @@ static void *kvm_mips_build_ret_from_exit(void *addr)
 	 * guest, reload k1
 	 */
 
-	uasm_i_move(&p, K1, S1);
+	uasm_i_move(&p, K1, S0);
 	UASM_i_ADDIU(&p, K1, K1, offsetof(struct kvm_vcpu, arch));
 
 	/*
@@ -886,8 +881,8 @@ static void *kvm_mips_build_ret_to_guest(void *addr)
 {
 	u32 *p = addr;
 
-	/* Put the saved pointer to vcpu (s1) back into the scratch register */
-	UASM_i_MTC0(&p, S1, scratch_vcpu[0], scratch_vcpu[1]);
+	/* Put the saved pointer to vcpu (s0) back into the scratch register */
+	UASM_i_MTC0(&p, S0, scratch_vcpu[0], scratch_vcpu[1]);
 
 	/* Load up the Guest EBASE to minimize the window where BEV is set */
 	UASM_i_LW(&p, T0, offsetof(struct kvm_vcpu_arch, guest_ebase), K1);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index f5ba393472e3..21bfbf414d2c 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1195,8 +1195,9 @@ static void kvm_mips_set_c0_status(void)
 /*
  * Return value is in the form (errcode<<2 | RESUME_FLAG_HOST | RESUME_FLAG_NV)
  */
-int kvm_mips_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
+int kvm_mips_handle_exit(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	u32 cause = vcpu->arch.host_cp0_cause;
 	u32 exccode = (cause >> CAUSEB_EXCCODE) & 0x1f;
 	u32 __user *opc = (u32 __user *) vcpu->arch.pc;
diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index f8cba51e1054..0788c00d7e94 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -1241,7 +1241,7 @@ static int kvm_trap_emul_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	kvm_mips_suspend_mm(cpu);
 
-	r = vcpu->arch.vcpu_run(vcpu->run, vcpu);
+	r = vcpu->arch.vcpu_run(vcpu);
 
 	/* We may have migrated while handling guest exits */
 	cpu = smp_processor_id();
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index 9e58c479ee20..9ca6a879f222 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -3265,7 +3265,7 @@ static int kvm_vz_vcpu_run(struct kvm_vcpu *vcpu)
 	kvm_vz_vcpu_load_tlb(vcpu, cpu);
 	kvm_vz_vcpu_load_wired(vcpu);
 
-	r = vcpu->arch.vcpu_run(vcpu->run, vcpu);
+	r = vcpu->arch.vcpu_run(vcpu);
 
 	kvm_vz_vcpu_save_wired(vcpu);
 
-- 
2.17.1

