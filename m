Return-Path: <linuxppc-dev+bounces-4395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC29FA2A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 22:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFycH5kXYz2yVD;
	Sun, 22 Dec 2024 08:49:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734817775;
	cv=none; b=B8M6zXEraKnr9aX2SkTTRZiodwAmjR+Cy2j4IBHz6U12jSk2rHRRHfti9AFUA5xBo7EbSmBtmEP9p4Ep3D2GdMrUmueWOgorN9bt6qt2/iii0P818uocszCs4xES+qzwJ8pRnw9t4mrjTFt6Qv8BFrLhJbjrJvpXqOSm0Q8EChiKlyJDiQEMygW54C/HPtFX0W9PdGrGvryAlb9KsPzMnj9udpo+6A3/xxfQouA+Tx2r//ycZX5klx74Hn9CMJ1Yf6ryclX/s1xKIPzESRelkGKF3YFZ6w9SLhFMpelSYthCU9vAVcVuYk2IZFIRlsSYuzlXO6VEcQoEhd2KihupUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734817775; c=relaxed/relaxed;
	bh=8K3UbrUjYCxizzMI4fVygDigwNBdChHYEqIo5iVgz0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nyMLq+SKBFyMJbqwgy0hVM/l4oTKy0Mcahr+88p0yDQScvre1PvIosMiZnyl3F5xQF/tKmyQM8eypUo5wm8pDzMBjhcquxiwNlCoCE5qW83hLyItmhiOLE/XfJtutn3F68lpj+c8jxYmna1dQNieO6tC1CMkmgEigzVZ926Yplg/xnAT9okSMqUlydbzg3WT3zSarYsCFWVuKHciHMGkSVgD87SpAUQVW3p+9ZjSGnjwPjAuzf1arj4sDAMULjVXGf5872SGwaRboPX+SS9gqo+mPEoKfjX/aEuUGYBRDsMsI/lnxO2q3xC5kcaL5+5guot5762mg+gXaEdfyAKvVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPe8D4sJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPe8D4sJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFycG1kW8z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 08:49:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 470925C54B1;
	Sat, 21 Dec 2024 21:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72D4C4CEDE;
	Sat, 21 Dec 2024 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817772;
	bh=nnqmeZoUp1liE8GiJArWi5yrYo/PFuINuPjABgG2II8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FPe8D4sJNk88VR5favRr3SUzhvfYsO8+Bb3zVap0f6r955r4B0uzGueicvMSy25GS
	 lpYxRgz7dCsV7AAOrsoV5dsuQYCRaB6GT7K1O+KRzNkjmU6zrDvJXEUV+0dOQgT1SA
	 NeLl7T3G8RNxl7D4dhiwwzBt8p/Koiep25DBryaXdEi+Uqq4m38OhG7+eZIiV2uazl
	 V//YBInhPebHq8Ne1uC2xnL3G+tMv2IwqTQwmbmUvfpphgvSMgRkyebkWyUL8I+Vhm
	 xV+w+oFVLyxJqoR6SRg+2o9KMEuUSC4mTZAurKhljY+EBwlniCmJjICdFTUXKbB/hS
	 zl+9idMNou0yQ==
From: Arnd Bergmann <arnd@kernel.org>
To: kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>,
	Crystal Wood <crwood@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Marc Zyngier <maz@kernel.org>,
	"A. Wilcox" <AWilcox@Wilcox-Tech.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/5] x86: kvm drop 32-bit host support
Date: Sat, 21 Dec 2024 22:42:23 +0100
Message-Id: <20241221214223.3046298-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241221214223.3046298-1-arnd@kernel.org>
References: <20241221214223.3046298-1-arnd@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

There are very few 32-bit machines that support KVM, the main exceptions
are the "Yonah" Generation Xeon-LV and Core Duo from 2006 and the Atom
Z5xx "Silverthorne" from 2008 that were all released just before their
64-bit counterparts.

The main usecase for KVM in x86-32 kernels these days is to verify
that 32-bit KVM is still working, by running it on 64-bit hardware.
With KVM support on other 32-bit architectures going away, and x86-32
kernels on 64-bit hardware becoming more limited in available RAM,
this usecase becomes much less interesting.

Remove this support to make KVM exclusive to 64-bit hosts on all
architectures, and stop testing 32-bit host mode.

Link: https://lore.kernel.org/all/Z1B1phcpbiYWLgCD@google.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kvm/Kconfig            |   6 +-
 arch/x86/kvm/Makefile           |   4 +-
 arch/x86/kvm/cpuid.c            |   2 +-
 arch/x86/kvm/emulate.c          |  34 ++------
 arch/x86/kvm/fpu.h              |   4 -
 arch/x86/kvm/hyperv.c           |   5 +-
 arch/x86/kvm/i8254.c            |   4 -
 arch/x86/kvm/kvm_cache_regs.h   |   2 -
 arch/x86/kvm/kvm_emulate.h      |   8 --
 arch/x86/kvm/lapic.c            |   4 -
 arch/x86/kvm/mmu.h              |   4 -
 arch/x86/kvm/mmu/mmu.c          | 134 --------------------------------
 arch/x86/kvm/mmu/mmu_internal.h |   9 ---
 arch/x86/kvm/mmu/paging_tmpl.h  |   9 ---
 arch/x86/kvm/mmu/spte.h         |   5 --
 arch/x86/kvm/mmu/tdp_mmu.h      |   4 -
 arch/x86/kvm/smm.c              |  19 -----
 arch/x86/kvm/svm/sev.c          |   2 -
 arch/x86/kvm/svm/svm.c          |  23 +-----
 arch/x86/kvm/svm/vmenter.S      |  20 -----
 arch/x86/kvm/trace.h            |   4 -
 arch/x86/kvm/vmx/main.c         |   2 -
 arch/x86/kvm/vmx/nested.c       |  24 +-----
 arch/x86/kvm/vmx/vmcs.h         |   2 -
 arch/x86/kvm/vmx/vmenter.S      |  25 +-----
 arch/x86/kvm/vmx/vmx.c          | 117 +---------------------------
 arch/x86/kvm/vmx/vmx.h          |  23 +-----
 arch/x86/kvm/vmx/vmx_ops.h      |   7 --
 arch/x86/kvm/vmx/x86_ops.h      |   2 -
 arch/x86/kvm/x86.c              |  74 ++----------------
 arch/x86/kvm/x86.h              |   4 -
 arch/x86/kvm/xen.c              |  61 ++++++---------
 32 files changed, 53 insertions(+), 594 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ea2c4f21c1ca..7bdc7639aa8d 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -7,6 +7,7 @@ source "virt/kvm/Kconfig"
 
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
+	depends on X86_64
 	default y
 	help
 	  Say Y here to get to see options for using your Linux host to run other
@@ -50,7 +51,6 @@ config KVM_X86
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
-	depends on X86_LOCAL_APIC
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
@@ -82,7 +82,7 @@ config KVM_WERROR
 config KVM_SW_PROTECTED_VM
 	bool "Enable support for KVM software-protected VMs"
 	depends on EXPERT
-	depends on KVM && X86_64
+	depends on KVM
 	help
 	  Enable support for KVM software-protected VMs.  Currently, software-
 	  protected VMs are purely a development and testing vehicle for
@@ -141,7 +141,7 @@ config KVM_AMD
 config KVM_AMD_SEV
 	bool "AMD Secure Encrypted Virtualization (SEV) support"
 	default y
-	depends on KVM_AMD && X86_64
+	depends on KVM_AMD
 	depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
 	select ARCH_HAS_CC_PLATFORM
 	select KVM_GENERIC_PRIVATE_MEM
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index f9dddb8cb466..46654dc0428f 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -8,9 +8,7 @@ include $(srctree)/virt/kvm/Makefile.kvm
 kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
 			   i8254.o ioapic.o irq_comm.o cpuid.o pmu.o mtrr.o \
 			   debugfs.o mmu/mmu.o mmu/page_track.o \
-			   mmu/spte.o
-
-kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
+			   mmu/spte.o mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_HYPERV) += hyperv.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index edef30359c19..819b3ff2afc3 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1085,7 +1085,7 @@ void kvm_set_cpu_caps(void)
 		F(3DNOW),
 	);
 
-	if (!tdp_enabled && IS_ENABLED(CONFIG_X86_64))
+	if (!tdp_enabled)
 		kvm_cpu_cap_set(X86_FEATURE_GBPAGES);
 
 	kvm_cpu_cap_init(CPUID_8000_0007_EDX,
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 60986f67c35a..ebac76a10fbd 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -265,12 +265,6 @@ static void invalidate_registers(struct x86_emulate_ctxt *ctxt)
 #define EFLAGS_MASK (X86_EFLAGS_OF|X86_EFLAGS_SF|X86_EFLAGS_ZF|X86_EFLAGS_AF|\
 		     X86_EFLAGS_PF|X86_EFLAGS_CF)
 
-#ifdef CONFIG_X86_64
-#define ON64(x) x
-#else
-#define ON64(x)
-#endif
-
 /*
  * fastop functions have a special calling convention:
  *
@@ -341,7 +335,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOP1E(op##b, al) \
 	FOP1E(op##w, ax) \
 	FOP1E(op##l, eax) \
-	ON64(FOP1E(op##q, rax))	\
+	FOP1E(op##q, rax) \
 	FOP_END
 
 /* 1-operand, using src2 (for MUL/DIV r/m) */
@@ -350,7 +344,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOP1E(op, cl) \
 	FOP1E(op, cx) \
 	FOP1E(op, ecx) \
-	ON64(FOP1E(op, rcx)) \
+	FOP1E(op, rcx) \
 	FOP_END
 
 /* 1-operand, using src2 (for MUL/DIV r/m), with exceptions */
@@ -359,7 +353,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOP1EEX(op, cl) \
 	FOP1EEX(op, cx) \
 	FOP1EEX(op, ecx) \
-	ON64(FOP1EEX(op, rcx)) \
+	FOP1EEX(op, rcx) \
 	FOP_END
 
 #define FOP2E(op,  dst, src)	   \
@@ -372,7 +366,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOP2E(op##b, al, dl) \
 	FOP2E(op##w, ax, dx) \
 	FOP2E(op##l, eax, edx) \
-	ON64(FOP2E(op##q, rax, rdx)) \
+	FOP2E(op##q, rax, rdx) \
 	FOP_END
 
 /* 2 operand, word only */
@@ -381,7 +375,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOPNOP() \
 	FOP2E(op##w, ax, dx) \
 	FOP2E(op##l, eax, edx) \
-	ON64(FOP2E(op##q, rax, rdx)) \
+	FOP2E(op##q, rax, rdx) \
 	FOP_END
 
 /* 2 operand, src is CL */
@@ -390,7 +384,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOP2E(op##b, al, cl) \
 	FOP2E(op##w, ax, cl) \
 	FOP2E(op##l, eax, cl) \
-	ON64(FOP2E(op##q, rax, cl)) \
+	FOP2E(op##q, rax, cl) \
 	FOP_END
 
 /* 2 operand, src and dest are reversed */
@@ -399,7 +393,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOP2E(op##b, dl, al) \
 	FOP2E(op##w, dx, ax) \
 	FOP2E(op##l, edx, eax) \
-	ON64(FOP2E(op##q, rdx, rax)) \
+	FOP2E(op##q, rdx, rax) \
 	FOP_END
 
 #define FOP3E(op,  dst, src, src2) \
@@ -413,7 +407,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop);
 	FOPNOP() \
 	FOP3E(op##w, ax, dx, cl) \
 	FOP3E(op##l, eax, edx, cl) \
-	ON64(FOP3E(op##q, rax, rdx, cl)) \
+	FOP3E(op##q, rax, rdx, cl) \
 	FOP_END
 
 /* Special case for SETcc - 1 instruction per cc */
@@ -1508,7 +1502,6 @@ static int get_descriptor_ptr(struct x86_emulate_ctxt *ctxt,
 
 	addr = dt.address + index * 8;
 
-#ifdef CONFIG_X86_64
 	if (addr >> 32 != 0) {
 		u64 efer = 0;
 
@@ -1516,7 +1509,6 @@ static int get_descriptor_ptr(struct x86_emulate_ctxt *ctxt,
 		if (!(efer & EFER_LMA))
 			addr &= (u32)-1;
 	}
-#endif
 
 	*desc_addr_p = addr;
 	return X86EMUL_CONTINUE;
@@ -2399,7 +2391,6 @@ static int em_syscall(struct x86_emulate_ctxt *ctxt)
 
 	*reg_write(ctxt, VCPU_REGS_RCX) = ctxt->_eip;
 	if (efer & EFER_LMA) {
-#ifdef CONFIG_X86_64
 		*reg_write(ctxt, VCPU_REGS_R11) = ctxt->eflags;
 
 		ops->get_msr(ctxt,
@@ -2410,7 +2401,6 @@ static int em_syscall(struct x86_emulate_ctxt *ctxt)
 		ops->get_msr(ctxt, MSR_SYSCALL_MASK, &msr_data);
 		ctxt->eflags &= ~msr_data;
 		ctxt->eflags |= X86_EFLAGS_FIXED;
-#endif
 	} else {
 		/* legacy mode */
 		ops->get_msr(ctxt, MSR_STAR, &msr_data);
@@ -2575,9 +2565,7 @@ static bool emulator_io_port_access_allowed(struct x86_emulate_ctxt *ctxt,
 	if (desc_limit_scaled(&tr_seg) < 103)
 		return false;
 	base = get_desc_base(&tr_seg);
-#ifdef CONFIG_X86_64
 	base |= ((u64)base3) << 32;
-#endif
 	r = ops->read_std(ctxt, base + 102, &io_bitmap_ptr, 2, NULL, true);
 	if (r != X86EMUL_CONTINUE)
 		return false;
@@ -2612,7 +2600,6 @@ static void string_registers_quirk(struct x86_emulate_ctxt *ctxt)
 	 * Intel CPUs mask the counter and pointers in quite strange
 	 * manner when ECX is zero due to REP-string optimizations.
 	 */
-#ifdef CONFIG_X86_64
 	u32 eax, ebx, ecx, edx;
 
 	if (ctxt->ad_bytes != 4)
@@ -2634,7 +2621,6 @@ static void string_registers_quirk(struct x86_emulate_ctxt *ctxt)
 	case 0xab:	/* stosd/w */
 		*reg_rmw(ctxt, VCPU_REGS_RDI) &= (u32)-1;
 	}
-#endif
 }
 
 static void save_state_to_tss16(struct x86_emulate_ctxt *ctxt,
@@ -3641,11 +3627,9 @@ static int em_lahf(struct x86_emulate_ctxt *ctxt)
 static int em_bswap(struct x86_emulate_ctxt *ctxt)
 {
 	switch (ctxt->op_bytes) {
-#ifdef CONFIG_X86_64
 	case 8:
 		asm("bswap %0" : "+r"(ctxt->dst.val));
 		break;
-#endif
 	default:
 		asm("bswap %0" : "+r"(*(u32 *)&ctxt->dst.val));
 		break;
@@ -4767,12 +4751,10 @@ int x86_decode_insn(struct x86_emulate_ctxt *ctxt, void *insn, int insn_len, int
 	case X86EMUL_MODE_PROT32:
 		def_op_bytes = def_ad_bytes = 4;
 		break;
-#ifdef CONFIG_X86_64
 	case X86EMUL_MODE_PROT64:
 		def_op_bytes = 4;
 		def_ad_bytes = 8;
 		break;
-#endif
 	default:
 		return EMULATION_FAILED;
 	}
diff --git a/arch/x86/kvm/fpu.h b/arch/x86/kvm/fpu.h
index 3ba12888bf66..56a402dbf24a 100644
--- a/arch/x86/kvm/fpu.h
+++ b/arch/x86/kvm/fpu.h
@@ -26,7 +26,6 @@ static inline void _kvm_read_sse_reg(int reg, sse128_t *data)
 	case 5: asm("movdqa %%xmm5, %0" : "=m"(*data)); break;
 	case 6: asm("movdqa %%xmm6, %0" : "=m"(*data)); break;
 	case 7: asm("movdqa %%xmm7, %0" : "=m"(*data)); break;
-#ifdef CONFIG_X86_64
 	case 8: asm("movdqa %%xmm8, %0" : "=m"(*data)); break;
 	case 9: asm("movdqa %%xmm9, %0" : "=m"(*data)); break;
 	case 10: asm("movdqa %%xmm10, %0" : "=m"(*data)); break;
@@ -35,7 +34,6 @@ static inline void _kvm_read_sse_reg(int reg, sse128_t *data)
 	case 13: asm("movdqa %%xmm13, %0" : "=m"(*data)); break;
 	case 14: asm("movdqa %%xmm14, %0" : "=m"(*data)); break;
 	case 15: asm("movdqa %%xmm15, %0" : "=m"(*data)); break;
-#endif
 	default: BUG();
 	}
 }
@@ -51,7 +49,6 @@ static inline void _kvm_write_sse_reg(int reg, const sse128_t *data)
 	case 5: asm("movdqa %0, %%xmm5" : : "m"(*data)); break;
 	case 6: asm("movdqa %0, %%xmm6" : : "m"(*data)); break;
 	case 7: asm("movdqa %0, %%xmm7" : : "m"(*data)); break;
-#ifdef CONFIG_X86_64
 	case 8: asm("movdqa %0, %%xmm8" : : "m"(*data)); break;
 	case 9: asm("movdqa %0, %%xmm9" : : "m"(*data)); break;
 	case 10: asm("movdqa %0, %%xmm10" : : "m"(*data)); break;
@@ -60,7 +57,6 @@ static inline void _kvm_write_sse_reg(int reg, const sse128_t *data)
 	case 13: asm("movdqa %0, %%xmm13" : : "m"(*data)); break;
 	case 14: asm("movdqa %0, %%xmm14" : : "m"(*data)); break;
 	case 15: asm("movdqa %0, %%xmm15" : : "m"(*data)); break;
-#endif
 	default: BUG();
 	}
 }
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 6a6dd5a84f22..bc78cca5a57b 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -2532,14 +2532,11 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
 		return 1;
 	}
 
-#ifdef CONFIG_X86_64
 	if (is_64_bit_hypercall(vcpu)) {
 		hc.param = kvm_rcx_read(vcpu);
 		hc.ingpa = kvm_rdx_read(vcpu);
 		hc.outgpa = kvm_r8_read(vcpu);
-	} else
-#endif
-	{
+	} else {
 		hc.param = ((u64)kvm_rdx_read(vcpu) << 32) |
 			    (kvm_rax_read(vcpu) & 0xffffffff);
 		hc.ingpa = ((u64)kvm_rbx_read(vcpu) << 32) |
diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index d7ab8780ab9e..f50a7b386c0a 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -40,11 +40,7 @@
 #include "i8254.h"
 #include "x86.h"
 
-#ifndef CONFIG_X86_64
-#define mod_64(x, y) ((x) - (y) * div64_u64(x, y))
-#else
 #define mod_64(x, y) ((x) % (y))
-#endif
 
 #define RW_STATE_LSB 1
 #define RW_STATE_MSB 2
diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index 36a8786db291..66d12dc5b243 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -32,7 +32,6 @@ BUILD_KVM_GPR_ACCESSORS(rdx, RDX)
 BUILD_KVM_GPR_ACCESSORS(rbp, RBP)
 BUILD_KVM_GPR_ACCESSORS(rsi, RSI)
 BUILD_KVM_GPR_ACCESSORS(rdi, RDI)
-#ifdef CONFIG_X86_64
 BUILD_KVM_GPR_ACCESSORS(r8,  R8)
 BUILD_KVM_GPR_ACCESSORS(r9,  R9)
 BUILD_KVM_GPR_ACCESSORS(r10, R10)
@@ -41,7 +40,6 @@ BUILD_KVM_GPR_ACCESSORS(r12, R12)
 BUILD_KVM_GPR_ACCESSORS(r13, R13)
 BUILD_KVM_GPR_ACCESSORS(r14, R14)
 BUILD_KVM_GPR_ACCESSORS(r15, R15)
-#endif
 
 /*
  * Using the register cache from interrupt context is generally not allowed, as
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 73072585e164..36e1d61ae56d 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -307,11 +307,7 @@ typedef void (*fastop_t)(struct fastop *);
  * also uses _eip, RIP cannot be a register operand nor can it be an operand in
  * a ModRM or SIB byte.
  */
-#ifdef CONFIG_X86_64
 #define NR_EMULATOR_GPRS	16
-#else
-#define NR_EMULATOR_GPRS	8
-#endif
 
 struct x86_emulate_ctxt {
 	void *vcpu;
@@ -503,11 +499,7 @@ enum x86_intercept {
 };
 
 /* Host execution mode. */
-#if defined(CONFIG_X86_32)
-#define X86EMUL_MODE_HOST X86EMUL_MODE_PROT32
-#elif defined(CONFIG_X86_64)
 #define X86EMUL_MODE_HOST X86EMUL_MODE_PROT64
-#endif
 
 int x86_decode_insn(struct x86_emulate_ctxt *ctxt, void *insn, int insn_len, int emulation_type);
 bool x86_page_table_writing_insn(struct x86_emulate_ctxt *ctxt);
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 010129582ef4..430974a17e5f 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -46,11 +46,7 @@
 #include "hyperv.h"
 #include "smm.h"
 
-#ifndef CONFIG_X86_64
-#define mod_64(x, y) ((x) - (y) * div64_u64(x, y))
-#else
 #define mod_64(x, y) ((x) % (y))
-#endif
 
 /* 14 is the version for Xeon and Pentium 8.4.8*/
 #define APIC_VERSION			0x14UL
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index caec3d11638d..f6014b7963ed 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -238,11 +238,7 @@ static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
 	return smp_load_acquire(&kvm->arch.shadow_root_allocated);
 }
 
-#ifdef CONFIG_X86_64
 extern bool tdp_mmu_enabled;
-#else
-#define tdp_mmu_enabled false
-#endif
 
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 74fa38ebddbf..f5b839251a7d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -107,10 +107,8 @@ bool tdp_enabled = false;
 
 static bool __ro_after_init tdp_mmu_allowed;
 
-#ifdef CONFIG_X86_64
 bool __read_mostly tdp_mmu_enabled = true;
 module_param_named(tdp_mmu, tdp_mmu_enabled, bool, 0444);
-#endif
 
 static int max_huge_page_level __read_mostly;
 static int tdp_root_level __read_mostly;
@@ -332,7 +330,6 @@ static int is_cpuid_PSE36(void)
 	return 1;
 }
 
-#ifdef CONFIG_X86_64
 static void __set_spte(u64 *sptep, u64 spte)
 {
 	KVM_MMU_WARN_ON(is_ept_ve_possible(spte));
@@ -355,122 +352,6 @@ static u64 __get_spte_lockless(u64 *sptep)
 {
 	return READ_ONCE(*sptep);
 }
-#else
-union split_spte {
-	struct {
-		u32 spte_low;
-		u32 spte_high;
-	};
-	u64 spte;
-};
-
-static void count_spte_clear(u64 *sptep, u64 spte)
-{
-	struct kvm_mmu_page *sp =  sptep_to_sp(sptep);
-
-	if (is_shadow_present_pte(spte))
-		return;
-
-	/* Ensure the spte is completely set before we increase the count */
-	smp_wmb();
-	sp->clear_spte_count++;
-}
-
-static void __set_spte(u64 *sptep, u64 spte)
-{
-	union split_spte *ssptep, sspte;
-
-	ssptep = (union split_spte *)sptep;
-	sspte = (union split_spte)spte;
-
-	ssptep->spte_high = sspte.spte_high;
-
-	/*
-	 * If we map the spte from nonpresent to present, We should store
-	 * the high bits firstly, then set present bit, so cpu can not
-	 * fetch this spte while we are setting the spte.
-	 */
-	smp_wmb();
-
-	WRITE_ONCE(ssptep->spte_low, sspte.spte_low);
-}
-
-static void __update_clear_spte_fast(u64 *sptep, u64 spte)
-{
-	union split_spte *ssptep, sspte;
-
-	ssptep = (union split_spte *)sptep;
-	sspte = (union split_spte)spte;
-
-	WRITE_ONCE(ssptep->spte_low, sspte.spte_low);
-
-	/*
-	 * If we map the spte from present to nonpresent, we should clear
-	 * present bit firstly to avoid vcpu fetch the old high bits.
-	 */
-	smp_wmb();
-
-	ssptep->spte_high = sspte.spte_high;
-	count_spte_clear(sptep, spte);
-}
-
-static u64 __update_clear_spte_slow(u64 *sptep, u64 spte)
-{
-	union split_spte *ssptep, sspte, orig;
-
-	ssptep = (union split_spte *)sptep;
-	sspte = (union split_spte)spte;
-
-	/* xchg acts as a barrier before the setting of the high bits */
-	orig.spte_low = xchg(&ssptep->spte_low, sspte.spte_low);
-	orig.spte_high = ssptep->spte_high;
-	ssptep->spte_high = sspte.spte_high;
-	count_spte_clear(sptep, spte);
-
-	return orig.spte;
-}
-
-/*
- * The idea using the light way get the spte on x86_32 guest is from
- * gup_get_pte (mm/gup.c).
- *
- * An spte tlb flush may be pending, because they are coalesced and
- * we are running out of the MMU lock.  Therefore
- * we need to protect against in-progress updates of the spte.
- *
- * Reading the spte while an update is in progress may get the old value
- * for the high part of the spte.  The race is fine for a present->non-present
- * change (because the high part of the spte is ignored for non-present spte),
- * but for a present->present change we must reread the spte.
- *
- * All such changes are done in two steps (present->non-present and
- * non-present->present), hence it is enough to count the number of
- * present->non-present updates: if it changed while reading the spte,
- * we might have hit the race.  This is done using clear_spte_count.
- */
-static u64 __get_spte_lockless(u64 *sptep)
-{
-	struct kvm_mmu_page *sp =  sptep_to_sp(sptep);
-	union split_spte spte, *orig = (union split_spte *)sptep;
-	int count;
-
-retry:
-	count = sp->clear_spte_count;
-	smp_rmb();
-
-	spte.spte_low = orig->spte_low;
-	smp_rmb();
-
-	spte.spte_high = orig->spte_high;
-	smp_rmb();
-
-	if (unlikely(spte.spte_low != orig->spte_low ||
-	      count != sp->clear_spte_count))
-		goto retry;
-
-	return spte.spte;
-}
-#endif
 
 /* Rules for using mmu_spte_set:
  * Set the sptep from nonpresent to present.
@@ -3919,7 +3800,6 @@ static int mmu_alloc_special_roots(struct kvm_vcpu *vcpu)
 	if (!pae_root)
 		return -ENOMEM;
 
-#ifdef CONFIG_X86_64
 	pml4_root = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
 	if (!pml4_root)
 		goto err_pml4;
@@ -3929,7 +3809,6 @@ static int mmu_alloc_special_roots(struct kvm_vcpu *vcpu)
 		if (!pml5_root)
 			goto err_pml5;
 	}
-#endif
 
 	mmu->pae_root = pae_root;
 	mmu->pml4_root = pml4_root;
@@ -3937,13 +3816,11 @@ static int mmu_alloc_special_roots(struct kvm_vcpu *vcpu)
 
 	return 0;
 
-#ifdef CONFIG_X86_64
 err_pml5:
 	free_page((unsigned long)pml4_root);
 err_pml4:
 	free_page((unsigned long)pae_root);
 	return -ENOMEM;
-#endif
 }
 
 static bool is_unsync_root(hpa_t root)
@@ -4572,11 +4449,6 @@ int kvm_handle_page_fault(struct kvm_vcpu *vcpu, u64 error_code,
 	int r = 1;
 	u32 flags = vcpu->arch.apf.host_apf_flags;
 
-#ifndef CONFIG_X86_64
-	/* A 64-bit CR2 should be impossible on 32-bit KVM. */
-	if (WARN_ON_ONCE(fault_address >> 32))
-		return -EFAULT;
-#endif
 	/*
 	 * Legacy #PF exception only have a 32-bit error code.  Simply drop the
 	 * upper bits as KVM doesn't use them for #PF (because they are never
@@ -4610,7 +4482,6 @@ int kvm_handle_page_fault(struct kvm_vcpu *vcpu, u64 error_code,
 }
 EXPORT_SYMBOL_GPL(kvm_handle_page_fault);
 
-#ifdef CONFIG_X86_64
 static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 				  struct kvm_page_fault *fault)
 {
@@ -4644,7 +4515,6 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	read_unlock(&vcpu->kvm->mmu_lock);
 	return r;
 }
-#endif
 
 bool kvm_mmu_may_ignore_guest_pat(void)
 {
@@ -4661,10 +4531,8 @@ bool kvm_mmu_may_ignore_guest_pat(void)
 
 int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
-#ifdef CONFIG_X86_64
 	if (tdp_mmu_enabled)
 		return kvm_tdp_mmu_page_fault(vcpu, fault);
-#endif
 
 	return direct_page_fault(vcpu, fault);
 }
@@ -6237,9 +6105,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 	tdp_root_level = tdp_forced_root_level;
 	max_tdp_level = tdp_max_root_level;
 
-#ifdef CONFIG_X86_64
 	tdp_mmu_enabled = tdp_mmu_allowed && tdp_enabled;
-#endif
 	/*
 	 * max_huge_page_level reflects KVM's MMU capabilities irrespective
 	 * of kernel support, e.g. KVM may be capable of using 1GB pages when
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 72de71f4bc8b..5eed5653d977 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -116,21 +116,12 @@ struct kvm_mmu_page {
 	 * isn't properly aligned, etc...
 	 */
 	struct list_head possible_nx_huge_page_link;
-#ifdef CONFIG_X86_32
-	/*
-	 * Used out of the mmu-lock to avoid reading spte values while an
-	 * update is in progress; see the comments in __get_spte_lockless().
-	 */
-	int clear_spte_count;
-#endif
 
 	/* Number of writes since the last time traversal visited this page.  */
 	atomic_t write_flooding_count;
 
-#ifdef CONFIG_X86_64
 	/* Used for freeing the page asynchronously if it is a TDP MMU page. */
 	struct rcu_head rcu_head;
-#endif
 };
 
 extern struct kmem_cache *mmu_page_header_cache;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index f4711674c47b..fa6493641429 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -29,11 +29,7 @@
 	#define PT_GUEST_DIRTY_SHIFT PT_DIRTY_SHIFT
 	#define PT_GUEST_ACCESSED_SHIFT PT_ACCESSED_SHIFT
 	#define PT_HAVE_ACCESSED_DIRTY(mmu) true
-	#ifdef CONFIG_X86_64
 	#define PT_MAX_FULL_LEVELS PT64_ROOT_MAX_LEVEL
-	#else
-	#define PT_MAX_FULL_LEVELS 2
-	#endif
 #elif PTTYPE == 32
 	#define pt_element_t u32
 	#define guest_walker guest_walker32
@@ -862,11 +858,6 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 	gpa_t gpa = INVALID_GPA;
 	int r;
 
-#ifndef CONFIG_X86_64
-	/* A 64-bit GVA should be impossible on 32-bit KVM. */
-	WARN_ON_ONCE((addr >> 32) && mmu == vcpu->arch.walk_mmu);
-#endif
-
 	r = FNAME(walk_addr_generic)(&walker, vcpu, mmu, addr, access);
 
 	if (r) {
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index af10bc0380a3..6806ca4553a4 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -160,13 +160,8 @@ static_assert(MMIO_SPTE_GEN_LOW_BITS == 8 && MMIO_SPTE_GEN_HIGH_BITS == 11);
  * For VMX EPT, bit 63 is ignored if #VE is disabled. (EPT_VIOLATION_VE=0)
  *              bit 63 is #VE suppress if #VE is enabled. (EPT_VIOLATION_VE=1)
  */
-#ifdef CONFIG_X86_64
 #define SHADOW_NONPRESENT_VALUE	BIT_ULL(63)
 static_assert(!(SHADOW_NONPRESENT_VALUE & SPTE_MMU_PRESENT_MASK));
-#else
-#define SHADOW_NONPRESENT_VALUE	0ULL
-#endif
-
 
 /*
  * True if A/D bits are supported in hardware and are enabled by KVM.  When
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index f03ca0dd13d9..c137fdd6b347 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -67,10 +67,6 @@ int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, gfn_t gfn,
 					u64 *spte);
 
-#ifdef CONFIG_X86_64
 static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return sp->tdp_mmu_page; }
-#else
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
-#endif
 
 #endif /* __KVM_X86_MMU_TDP_MMU_H */
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index e0ab7df27b66..e1187a5b43c0 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -165,7 +165,6 @@ static void enter_smm_save_seg_32(struct kvm_vcpu *vcpu,
 	state->flags = enter_smm_get_segment_flags(&seg);
 }
 
-#ifdef CONFIG_X86_64
 static void enter_smm_save_seg_64(struct kvm_vcpu *vcpu,
 				  struct kvm_smm_seg_state_64 *state,
 				  int n)
@@ -178,7 +177,6 @@ static void enter_smm_save_seg_64(struct kvm_vcpu *vcpu,
 	state->limit = seg.limit;
 	state->base = seg.base;
 }
-#endif
 
 static void enter_smm_save_state_32(struct kvm_vcpu *vcpu,
 				    struct kvm_smram_state_32 *smram)
@@ -223,7 +221,6 @@ static void enter_smm_save_state_32(struct kvm_vcpu *vcpu,
 	smram->int_shadow = kvm_x86_call(get_interrupt_shadow)(vcpu);
 }
 
-#ifdef CONFIG_X86_64
 static void enter_smm_save_state_64(struct kvm_vcpu *vcpu,
 				    struct kvm_smram_state_64 *smram)
 {
@@ -269,7 +266,6 @@ static void enter_smm_save_state_64(struct kvm_vcpu *vcpu,
 
 	smram->int_shadow = kvm_x86_call(get_interrupt_shadow)(vcpu);
 }
-#endif
 
 void enter_smm(struct kvm_vcpu *vcpu)
 {
@@ -282,11 +278,9 @@ void enter_smm(struct kvm_vcpu *vcpu)
 
 	memset(smram.bytes, 0, sizeof(smram.bytes));
 
-#ifdef CONFIG_X86_64
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_LM))
 		enter_smm_save_state_64(vcpu, &smram.smram64);
 	else
-#endif
 		enter_smm_save_state_32(vcpu, &smram.smram32);
 
 	/*
@@ -352,11 +346,9 @@ void enter_smm(struct kvm_vcpu *vcpu)
 	kvm_set_segment(vcpu, &ds, VCPU_SREG_GS);
 	kvm_set_segment(vcpu, &ds, VCPU_SREG_SS);
 
-#ifdef CONFIG_X86_64
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_LM))
 		if (kvm_x86_call(set_efer)(vcpu, 0))
 			goto error;
-#endif
 
 	kvm_update_cpuid_runtime(vcpu);
 	kvm_mmu_reset_context(vcpu);
@@ -394,8 +386,6 @@ static int rsm_load_seg_32(struct kvm_vcpu *vcpu,
 	return X86EMUL_CONTINUE;
 }
 
-#ifdef CONFIG_X86_64
-
 static int rsm_load_seg_64(struct kvm_vcpu *vcpu,
 			   const struct kvm_smm_seg_state_64 *state,
 			   int n)
@@ -409,7 +399,6 @@ static int rsm_load_seg_64(struct kvm_vcpu *vcpu,
 	kvm_set_segment(vcpu, &desc, n);
 	return X86EMUL_CONTINUE;
 }
-#endif
 
 static int rsm_enter_protected_mode(struct kvm_vcpu *vcpu,
 				    u64 cr0, u64 cr3, u64 cr4)
@@ -507,7 +496,6 @@ static int rsm_load_state_32(struct x86_emulate_ctxt *ctxt,
 	return r;
 }
 
-#ifdef CONFIG_X86_64
 static int rsm_load_state_64(struct x86_emulate_ctxt *ctxt,
 			     const struct kvm_smram_state_64 *smstate)
 {
@@ -559,7 +547,6 @@ static int rsm_load_state_64(struct x86_emulate_ctxt *ctxt,
 
 	return X86EMUL_CONTINUE;
 }
-#endif
 
 int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 {
@@ -585,7 +572,6 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 	 * CR0/CR3/CR4/EFER.  It's all a bit more complicated if the vCPU
 	 * supports long mode.
 	 */
-#ifdef CONFIG_X86_64
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_LM)) {
 		struct kvm_segment cs_desc;
 		unsigned long cr4;
@@ -601,14 +587,12 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 		cs_desc.s = cs_desc.g = cs_desc.present = 1;
 		kvm_set_segment(vcpu, &cs_desc, VCPU_SREG_CS);
 	}
-#endif
 
 	/* For the 64-bit case, this will clear EFER.LMA.  */
 	cr0 = kvm_read_cr0(vcpu);
 	if (cr0 & X86_CR0_PE)
 		kvm_set_cr0(vcpu, cr0 & ~(X86_CR0_PG | X86_CR0_PE));
 
-#ifdef CONFIG_X86_64
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_LM)) {
 		unsigned long cr4, efer;
 
@@ -621,7 +605,6 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 		efer = 0;
 		kvm_set_msr(vcpu, MSR_EFER, efer);
 	}
-#endif
 
 	/*
 	 * FIXME: When resuming L2 (a.k.a. guest mode), the transition to guest
@@ -633,11 +616,9 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 	if (kvm_x86_call(leave_smm)(vcpu, &smram))
 		return X86EMUL_UNHANDLEABLE;
 
-#ifdef CONFIG_X86_64
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_LM))
 		ret = rsm_load_state_64(ctxt, &smram.smram64);
 	else
-#endif
 		ret = rsm_load_state_32(ctxt, &smram.smram32);
 
 	/*
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 4b0ef13c7496..bb22b87235ca 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -830,7 +830,6 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 	save->rbp = svm->vcpu.arch.regs[VCPU_REGS_RBP];
 	save->rsi = svm->vcpu.arch.regs[VCPU_REGS_RSI];
 	save->rdi = svm->vcpu.arch.regs[VCPU_REGS_RDI];
-#ifdef CONFIG_X86_64
 	save->r8  = svm->vcpu.arch.regs[VCPU_REGS_R8];
 	save->r9  = svm->vcpu.arch.regs[VCPU_REGS_R9];
 	save->r10 = svm->vcpu.arch.regs[VCPU_REGS_R10];
@@ -839,7 +838,6 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 	save->r13 = svm->vcpu.arch.regs[VCPU_REGS_R13];
 	save->r14 = svm->vcpu.arch.regs[VCPU_REGS_R14];
 	save->r15 = svm->vcpu.arch.regs[VCPU_REGS_R15];
-#endif
 	save->rip = svm->vcpu.arch.regs[VCPU_REGS_RIP];
 
 	/* Sync some non-GPR registers before encrypting */
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 78daedf6697b..305a6716f6eb 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -89,14 +89,12 @@ static const struct svm_direct_access_msrs {
 	{ .index = MSR_IA32_SYSENTER_CS,		.always = true  },
 	{ .index = MSR_IA32_SYSENTER_EIP,		.always = false },
 	{ .index = MSR_IA32_SYSENTER_ESP,		.always = false },
-#ifdef CONFIG_X86_64
 	{ .index = MSR_GS_BASE,				.always = true  },
 	{ .index = MSR_FS_BASE,				.always = true  },
 	{ .index = MSR_KERNEL_GS_BASE,			.always = true  },
 	{ .index = MSR_LSTAR,				.always = true  },
 	{ .index = MSR_CSTAR,				.always = true  },
 	{ .index = MSR_SYSCALL_MASK,			.always = true  },
-#endif
 	{ .index = MSR_IA32_SPEC_CTRL,			.always = false },
 	{ .index = MSR_IA32_PRED_CMD,			.always = false },
 	{ .index = MSR_IA32_FLUSH_CMD,			.always = false },
@@ -286,11 +284,7 @@ u32 svm_msrpm_offset(u32 msr)
 
 static int get_npt_level(void)
 {
-#ifdef CONFIG_X86_64
 	return pgtable_l5_enabled() ? PT64_ROOT_5LEVEL : PT64_ROOT_4LEVEL;
-#else
-	return PT32E_ROOT_LEVEL;
-#endif
 }
 
 int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
@@ -1858,7 +1852,6 @@ void svm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 	u64 hcr0 = cr0;
 	bool old_paging = is_paging(vcpu);
 
-#ifdef CONFIG_X86_64
 	if (vcpu->arch.efer & EFER_LME) {
 		if (!is_paging(vcpu) && (cr0 & X86_CR0_PG)) {
 			vcpu->arch.efer |= EFER_LMA;
@@ -1872,7 +1865,6 @@ void svm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 				svm->vmcb->save.efer &= ~(EFER_LMA | EFER_LME);
 		}
 	}
-#endif
 	vcpu->arch.cr0 = cr0;
 
 	if (!npt_enabled) {
@@ -2866,7 +2858,6 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_STAR:
 		msr_info->data = svm->vmcb01.ptr->save.star;
 		break;
-#ifdef CONFIG_X86_64
 	case MSR_LSTAR:
 		msr_info->data = svm->vmcb01.ptr->save.lstar;
 		break;
@@ -2885,7 +2876,6 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_SYSCALL_MASK:
 		msr_info->data = svm->vmcb01.ptr->save.sfmask;
 		break;
-#endif
 	case MSR_IA32_SYSENTER_CS:
 		msr_info->data = svm->vmcb01.ptr->save.sysenter_cs;
 		break;
@@ -3097,7 +3087,6 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 	case MSR_STAR:
 		svm->vmcb01.ptr->save.star = data;
 		break;
-#ifdef CONFIG_X86_64
 	case MSR_LSTAR:
 		svm->vmcb01.ptr->save.lstar = data;
 		break;
@@ -3116,7 +3105,6 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 	case MSR_SYSCALL_MASK:
 		svm->vmcb01.ptr->save.sfmask = data;
 		break;
-#endif
 	case MSR_IA32_SYSENTER_CS:
 		svm->vmcb01.ptr->save.sysenter_cs = data;
 		break;
@@ -5321,14 +5309,6 @@ static __init int svm_hardware_setup(void)
 		kvm_enable_efer_bits(EFER_SVME | EFER_LMSLE);
 	}
 
-	/*
-	 * KVM's MMU doesn't support using 2-level paging for itself, and thus
-	 * NPT isn't supported if the host is using 2-level paging since host
-	 * CR4 is unchanged on VMRUN.
-	 */
-	if (!IS_ENABLED(CONFIG_X86_64) && !IS_ENABLED(CONFIG_X86_PAE))
-		npt_enabled = false;
-
 	if (!boot_cpu_has(X86_FEATURE_NPT))
 		npt_enabled = false;
 
@@ -5376,8 +5356,7 @@ static __init int svm_hardware_setup(void)
 
 	if (vls) {
 		if (!npt_enabled ||
-		    !boot_cpu_has(X86_FEATURE_V_VMSAVE_VMLOAD) ||
-		    !IS_ENABLED(CONFIG_X86_64)) {
+		    !boot_cpu_has(X86_FEATURE_V_VMSAVE_VMLOAD)) {
 			vls = false;
 		} else {
 			pr_info("Virtual VMLOAD VMSAVE supported\n");
diff --git a/arch/x86/kvm/svm/vmenter.S b/arch/x86/kvm/svm/vmenter.S
index 2ed80aea3bb1..2e8c0f5a238a 100644
--- a/arch/x86/kvm/svm/vmenter.S
+++ b/arch/x86/kvm/svm/vmenter.S
@@ -19,7 +19,6 @@
 #define VCPU_RSI	(SVM_vcpu_arch_regs + __VCPU_REGS_RSI * WORD_SIZE)
 #define VCPU_RDI	(SVM_vcpu_arch_regs + __VCPU_REGS_RDI * WORD_SIZE)
 
-#ifdef CONFIG_X86_64
 #define VCPU_R8		(SVM_vcpu_arch_regs + __VCPU_REGS_R8  * WORD_SIZE)
 #define VCPU_R9		(SVM_vcpu_arch_regs + __VCPU_REGS_R9  * WORD_SIZE)
 #define VCPU_R10	(SVM_vcpu_arch_regs + __VCPU_REGS_R10 * WORD_SIZE)
@@ -28,7 +27,6 @@
 #define VCPU_R13	(SVM_vcpu_arch_regs + __VCPU_REGS_R13 * WORD_SIZE)
 #define VCPU_R14	(SVM_vcpu_arch_regs + __VCPU_REGS_R14 * WORD_SIZE)
 #define VCPU_R15	(SVM_vcpu_arch_regs + __VCPU_REGS_R15 * WORD_SIZE)
-#endif
 
 #define SVM_vmcb01_pa	(SVM_vmcb01 + KVM_VMCB_pa)
 
@@ -101,15 +99,10 @@
 SYM_FUNC_START(__svm_vcpu_run)
 	push %_ASM_BP
 	mov  %_ASM_SP, %_ASM_BP
-#ifdef CONFIG_X86_64
 	push %r15
 	push %r14
 	push %r13
 	push %r12
-#else
-	push %edi
-	push %esi
-#endif
 	push %_ASM_BX
 
 	/*
@@ -157,7 +150,6 @@ SYM_FUNC_START(__svm_vcpu_run)
 	mov VCPU_RBX(%_ASM_DI), %_ASM_BX
 	mov VCPU_RBP(%_ASM_DI), %_ASM_BP
 	mov VCPU_RSI(%_ASM_DI), %_ASM_SI
-#ifdef CONFIG_X86_64
 	mov VCPU_R8 (%_ASM_DI),  %r8
 	mov VCPU_R9 (%_ASM_DI),  %r9
 	mov VCPU_R10(%_ASM_DI), %r10
@@ -166,7 +158,6 @@ SYM_FUNC_START(__svm_vcpu_run)
 	mov VCPU_R13(%_ASM_DI), %r13
 	mov VCPU_R14(%_ASM_DI), %r14
 	mov VCPU_R15(%_ASM_DI), %r15
-#endif
 	mov VCPU_RDI(%_ASM_DI), %_ASM_DI
 
 	/* Enter guest mode */
@@ -186,7 +177,6 @@ SYM_FUNC_START(__svm_vcpu_run)
 	mov %_ASM_BP,   VCPU_RBP(%_ASM_AX)
 	mov %_ASM_SI,   VCPU_RSI(%_ASM_AX)
 	mov %_ASM_DI,   VCPU_RDI(%_ASM_AX)
-#ifdef CONFIG_X86_64
 	mov %r8,  VCPU_R8 (%_ASM_AX)
 	mov %r9,  VCPU_R9 (%_ASM_AX)
 	mov %r10, VCPU_R10(%_ASM_AX)
@@ -195,7 +185,6 @@ SYM_FUNC_START(__svm_vcpu_run)
 	mov %r13, VCPU_R13(%_ASM_AX)
 	mov %r14, VCPU_R14(%_ASM_AX)
 	mov %r15, VCPU_R15(%_ASM_AX)
-#endif
 
 	/* @svm can stay in RDI from now on.  */
 	mov %_ASM_AX, %_ASM_DI
@@ -239,7 +228,6 @@ SYM_FUNC_START(__svm_vcpu_run)
 	xor %ebp, %ebp
 	xor %esi, %esi
 	xor %edi, %edi
-#ifdef CONFIG_X86_64
 	xor %r8d,  %r8d
 	xor %r9d,  %r9d
 	xor %r10d, %r10d
@@ -248,22 +236,16 @@ SYM_FUNC_START(__svm_vcpu_run)
 	xor %r13d, %r13d
 	xor %r14d, %r14d
 	xor %r15d, %r15d
-#endif
 
 	/* "Pop" @spec_ctrl_intercepted.  */
 	pop %_ASM_BX
 
 	pop %_ASM_BX
 
-#ifdef CONFIG_X86_64
 	pop %r12
 	pop %r13
 	pop %r14
 	pop %r15
-#else
-	pop %esi
-	pop %edi
-#endif
 	pop %_ASM_BP
 	RET
 
@@ -293,7 +275,6 @@ SYM_FUNC_END(__svm_vcpu_run)
 #ifdef CONFIG_KVM_AMD_SEV
 
 
-#ifdef CONFIG_X86_64
 #define SEV_ES_GPRS_BASE 0x300
 #define SEV_ES_RBX	(SEV_ES_GPRS_BASE + __VCPU_REGS_RBX * WORD_SIZE)
 #define SEV_ES_RBP	(SEV_ES_GPRS_BASE + __VCPU_REGS_RBP * WORD_SIZE)
@@ -303,7 +284,6 @@ SYM_FUNC_END(__svm_vcpu_run)
 #define SEV_ES_R13	(SEV_ES_GPRS_BASE + __VCPU_REGS_R13 * WORD_SIZE)
 #define SEV_ES_R14	(SEV_ES_GPRS_BASE + __VCPU_REGS_R14 * WORD_SIZE)
 #define SEV_ES_R15	(SEV_ES_GPRS_BASE + __VCPU_REGS_R15 * WORD_SIZE)
-#endif
 
 /**
  * __svm_sev_es_vcpu_run - Run a SEV-ES vCPU via a transition to SVM guest mode
diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
index 0b844cb97978..d11cf415d3f5 100644
--- a/arch/x86/kvm/trace.h
+++ b/arch/x86/kvm/trace.h
@@ -908,8 +908,6 @@ TRACE_EVENT(kvm_write_tsc_offset,
 		  __entry->previous_tsc_offset, __entry->next_tsc_offset)
 );
 
-#ifdef CONFIG_X86_64
-
 #define host_clocks					\
 	{VDSO_CLOCKMODE_NONE, "none"},			\
 	{VDSO_CLOCKMODE_TSC,  "tsc"}			\
@@ -966,8 +964,6 @@ TRACE_EVENT(kvm_track_tsc,
 		  __print_symbolic(__entry->host_clock, host_clocks))
 );
 
-#endif /* CONFIG_X86_64 */
-
 /*
  * Tracepoint for PML full VMEXIT.
  */
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 3d31ea1ab3e3..60c0733623d9 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -134,10 +134,8 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.pi_update_irte = vmx_pi_update_irte,
 	.pi_start_assignment = vmx_pi_start_assignment,
 
-#ifdef CONFIG_X86_64
 	.set_hv_timer = vmx_set_hv_timer,
 	.cancel_hv_timer = vmx_cancel_hv_timer,
-#endif
 
 	.setup_mce = vmx_setup_mce,
 
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 864bd97cc5c5..242bde903b16 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -86,11 +86,7 @@ static void init_vmcs_shadow_fields(void)
 
 		clear_bit(field, vmx_vmread_bitmap);
 		if (field & 1)
-#ifdef CONFIG_X86_64
 			continue;
-#else
-			entry.offset += sizeof(u32);
-#endif
 		shadow_read_only_fields[j++] = entry;
 	}
 	max_shadow_read_only_fields = j;
@@ -134,11 +130,7 @@ static void init_vmcs_shadow_fields(void)
 		clear_bit(field, vmx_vmwrite_bitmap);
 		clear_bit(field, vmx_vmread_bitmap);
 		if (field & 1)
-#ifdef CONFIG_X86_64
 			continue;
-#else
-			entry.offset += sizeof(u32);
-#endif
 		shadow_read_write_fields[j++] = entry;
 	}
 	max_shadow_read_write_fields = j;
@@ -283,10 +275,8 @@ static void vmx_sync_vmcs_host_state(struct vcpu_vmx *vmx,
 
 	vmx_set_host_fs_gs(dest, src->fs_sel, src->gs_sel, src->fs_base, src->gs_base);
 	dest->ldt_sel = src->ldt_sel;
-#ifdef CONFIG_X86_64
 	dest->ds_sel = src->ds_sel;
 	dest->es_sel = src->es_sel;
-#endif
 }
 
 static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
@@ -695,7 +685,6 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	 * Always check vmcs01's bitmap to honor userspace MSR filters and any
 	 * other runtime changes to vmcs01's bitmap, e.g. dynamic pass-through.
 	 */
-#ifdef CONFIG_X86_64
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_FS_BASE, MSR_TYPE_RW);
 
@@ -704,7 +693,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
-#endif
+
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
 
@@ -2375,11 +2364,9 @@ static void prepare_vmcs02_early(struct vcpu_vmx *vmx, struct loaded_vmcs *vmcs0
 	vmx->nested.l1_tpr_threshold = -1;
 	if (exec_control & CPU_BASED_TPR_SHADOW)
 		vmcs_write32(TPR_THRESHOLD, vmcs12->tpr_threshold);
-#ifdef CONFIG_X86_64
 	else
 		exec_control |= CPU_BASED_CR8_LOAD_EXITING |
 				CPU_BASED_CR8_STORE_EXITING;
-#endif
 
 	/*
 	 * A vmexit (to either L1 hypervisor or L0 userspace) is always needed
@@ -3002,11 +2989,10 @@ static int nested_vmx_check_controls(struct kvm_vcpu *vcpu,
 static int nested_vmx_check_address_space_size(struct kvm_vcpu *vcpu,
 				       struct vmcs12 *vmcs12)
 {
-#ifdef CONFIG_X86_64
 	if (CC(!!(vmcs12->vm_exit_controls & VM_EXIT_HOST_ADDR_SPACE_SIZE) !=
 		!!(vcpu->arch.efer & EFER_LMA)))
 		return -EINVAL;
-#endif
+
 	return 0;
 }
 
@@ -6995,9 +6981,7 @@ static void nested_vmx_setup_exit_ctls(struct vmcs_config *vmcs_conf,
 
 	msrs->exit_ctls_high = vmcs_conf->vmexit_ctrl;
 	msrs->exit_ctls_high &=
-#ifdef CONFIG_X86_64
 		VM_EXIT_HOST_ADDR_SPACE_SIZE |
-#endif
 		VM_EXIT_LOAD_IA32_PAT | VM_EXIT_SAVE_IA32_PAT |
 		VM_EXIT_CLEAR_BNDCFGS;
 	msrs->exit_ctls_high |=
@@ -7018,9 +7002,7 @@ static void nested_vmx_setup_entry_ctls(struct vmcs_config *vmcs_conf,
 
 	msrs->entry_ctls_high = vmcs_conf->vmentry_ctrl;
 	msrs->entry_ctls_high &=
-#ifdef CONFIG_X86_64
 		VM_ENTRY_IA32E_MODE |
-#endif
 		VM_ENTRY_LOAD_IA32_PAT | VM_ENTRY_LOAD_BNDCFGS;
 	msrs->entry_ctls_high |=
 		(VM_ENTRY_ALWAYSON_WITHOUT_TRUE_MSR | VM_ENTRY_LOAD_IA32_EFER |
@@ -7043,9 +7025,7 @@ static void nested_vmx_setup_cpubased_ctls(struct vmcs_config *vmcs_conf,
 		CPU_BASED_HLT_EXITING | CPU_BASED_INVLPG_EXITING |
 		CPU_BASED_MWAIT_EXITING | CPU_BASED_CR3_LOAD_EXITING |
 		CPU_BASED_CR3_STORE_EXITING |
-#ifdef CONFIG_X86_64
 		CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING |
-#endif
 		CPU_BASED_MOV_DR_EXITING | CPU_BASED_UNCOND_IO_EXITING |
 		CPU_BASED_USE_IO_BITMAPS | CPU_BASED_MONITOR_TRAP_FLAG |
 		CPU_BASED_MONITOR_EXITING | CPU_BASED_RDPMC_EXITING |
diff --git a/arch/x86/kvm/vmx/vmcs.h b/arch/x86/kvm/vmx/vmcs.h
index b25625314658..487137da7860 100644
--- a/arch/x86/kvm/vmx/vmcs.h
+++ b/arch/x86/kvm/vmx/vmcs.h
@@ -39,9 +39,7 @@ struct vmcs_host_state {
 	unsigned long rsp;
 
 	u16           fs_sel, gs_sel, ldt_sel;
-#ifdef CONFIG_X86_64
 	u16           ds_sel, es_sel;
-#endif
 };
 
 struct vmcs_controls_shadow {
diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
index f6986dee6f8c..5a548724ca1f 100644
--- a/arch/x86/kvm/vmx/vmenter.S
+++ b/arch/x86/kvm/vmx/vmenter.S
@@ -20,7 +20,6 @@
 #define VCPU_RSI	__VCPU_REGS_RSI * WORD_SIZE
 #define VCPU_RDI	__VCPU_REGS_RDI * WORD_SIZE
 
-#ifdef CONFIG_X86_64
 #define VCPU_R8		__VCPU_REGS_R8  * WORD_SIZE
 #define VCPU_R9		__VCPU_REGS_R9  * WORD_SIZE
 #define VCPU_R10	__VCPU_REGS_R10 * WORD_SIZE
@@ -29,7 +28,6 @@
 #define VCPU_R13	__VCPU_REGS_R13 * WORD_SIZE
 #define VCPU_R14	__VCPU_REGS_R14 * WORD_SIZE
 #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
-#endif
 
 .macro VMX_DO_EVENT_IRQOFF call_insn call_target
 	/*
@@ -40,7 +38,6 @@
 	push %_ASM_BP
 	mov %_ASM_SP, %_ASM_BP
 
-#ifdef CONFIG_X86_64
 	/*
 	 * Align RSP to a 16-byte boundary (to emulate CPU behavior) before
 	 * creating the synthetic interrupt stack frame for the IRQ/NMI.
@@ -48,7 +45,6 @@
 	and  $-16, %rsp
 	push $__KERNEL_DS
 	push %rbp
-#endif
 	pushf
 	push $__KERNEL_CS
 	\call_insn \call_target
@@ -79,15 +75,10 @@
 SYM_FUNC_START(__vmx_vcpu_run)
 	push %_ASM_BP
 	mov  %_ASM_SP, %_ASM_BP
-#ifdef CONFIG_X86_64
 	push %r15
 	push %r14
 	push %r13
 	push %r12
-#else
-	push %edi
-	push %esi
-#endif
 	push %_ASM_BX
 
 	/* Save @vmx for SPEC_CTRL handling */
@@ -148,7 +139,6 @@ SYM_FUNC_START(__vmx_vcpu_run)
 	mov VCPU_RBP(%_ASM_AX), %_ASM_BP
 	mov VCPU_RSI(%_ASM_AX), %_ASM_SI
 	mov VCPU_RDI(%_ASM_AX), %_ASM_DI
-#ifdef CONFIG_X86_64
 	mov VCPU_R8 (%_ASM_AX),  %r8
 	mov VCPU_R9 (%_ASM_AX),  %r9
 	mov VCPU_R10(%_ASM_AX), %r10
@@ -157,7 +147,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
 	mov VCPU_R13(%_ASM_AX), %r13
 	mov VCPU_R14(%_ASM_AX), %r14
 	mov VCPU_R15(%_ASM_AX), %r15
-#endif
+
 	/* Load guest RAX.  This kills the @regs pointer! */
 	mov VCPU_RAX(%_ASM_AX), %_ASM_AX
 
@@ -210,7 +200,6 @@ SYM_INNER_LABEL_ALIGN(vmx_vmexit, SYM_L_GLOBAL)
 	mov %_ASM_BP, VCPU_RBP(%_ASM_AX)
 	mov %_ASM_SI, VCPU_RSI(%_ASM_AX)
 	mov %_ASM_DI, VCPU_RDI(%_ASM_AX)
-#ifdef CONFIG_X86_64
 	mov %r8,  VCPU_R8 (%_ASM_AX)
 	mov %r9,  VCPU_R9 (%_ASM_AX)
 	mov %r10, VCPU_R10(%_ASM_AX)
@@ -219,7 +208,6 @@ SYM_INNER_LABEL_ALIGN(vmx_vmexit, SYM_L_GLOBAL)
 	mov %r13, VCPU_R13(%_ASM_AX)
 	mov %r14, VCPU_R14(%_ASM_AX)
 	mov %r15, VCPU_R15(%_ASM_AX)
-#endif
 
 	/* Clear return value to indicate VM-Exit (as opposed to VM-Fail). */
 	xor %ebx, %ebx
@@ -244,7 +232,6 @@ SYM_INNER_LABEL_ALIGN(vmx_vmexit, SYM_L_GLOBAL)
 	xor %ebp, %ebp
 	xor %esi, %esi
 	xor %edi, %edi
-#ifdef CONFIG_X86_64
 	xor %r8d,  %r8d
 	xor %r9d,  %r9d
 	xor %r10d, %r10d
@@ -253,7 +240,6 @@ SYM_INNER_LABEL_ALIGN(vmx_vmexit, SYM_L_GLOBAL)
 	xor %r13d, %r13d
 	xor %r14d, %r14d
 	xor %r15d, %r15d
-#endif
 
 	/*
 	 * IMPORTANT: RSB filling and SPEC_CTRL handling must be done before
@@ -281,15 +267,10 @@ SYM_INNER_LABEL_ALIGN(vmx_vmexit, SYM_L_GLOBAL)
 	mov %_ASM_BX, %_ASM_AX
 
 	pop %_ASM_BX
-#ifdef CONFIG_X86_64
 	pop %r12
 	pop %r13
 	pop %r14
 	pop %r15
-#else
-	pop %esi
-	pop %edi
-#endif
 	pop %_ASM_BP
 	RET
 
@@ -325,14 +306,12 @@ SYM_FUNC_START(vmread_error_trampoline)
 	push %_ASM_AX
 	push %_ASM_CX
 	push %_ASM_DX
-#ifdef CONFIG_X86_64
 	push %rdi
 	push %rsi
 	push %r8
 	push %r9
 	push %r10
 	push %r11
-#endif
 
 	/* Load @field and @fault to arg1 and arg2 respectively. */
 	mov 3*WORD_SIZE(%_ASM_BP), %_ASM_ARG2
@@ -343,14 +322,12 @@ SYM_FUNC_START(vmread_error_trampoline)
 	/* Zero out @fault, which will be popped into the result register. */
 	_ASM_MOV $0, 3*WORD_SIZE(%_ASM_BP)
 
-#ifdef CONFIG_X86_64
 	pop %r11
 	pop %r10
 	pop %r9
 	pop %r8
 	pop %rsi
 	pop %rdi
-#endif
 	pop %_ASM_DX
 	pop %_ASM_CX
 	pop %_ASM_AX
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 990c266aa754..c64acbf79217 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -140,9 +140,7 @@ module_param(dump_invalid_vmcs, bool, 0644);
 /* Guest_tsc -> host_tsc conversion requires 64-bit division.  */
 static int __read_mostly cpu_preemption_timer_multi;
 static bool __read_mostly enable_preemption_timer = 1;
-#ifdef CONFIG_X86_64
 module_param_named(preemption_timer, enable_preemption_timer, bool, S_IRUGO);
-#endif
 
 extern bool __read_mostly allow_smaller_maxphyaddr;
 module_param(allow_smaller_maxphyaddr, bool, S_IRUGO);
@@ -172,13 +170,11 @@ static u32 vmx_possible_passthrough_msrs[MAX_POSSIBLE_PASSTHROUGH_MSRS] = {
 	MSR_IA32_PRED_CMD,
 	MSR_IA32_FLUSH_CMD,
 	MSR_IA32_TSC,
-#ifdef CONFIG_X86_64
 	MSR_FS_BASE,
 	MSR_GS_BASE,
 	MSR_KERNEL_GS_BASE,
 	MSR_IA32_XFD,
 	MSR_IA32_XFD_ERR,
-#endif
 	MSR_IA32_SYSENTER_CS,
 	MSR_IA32_SYSENTER_ESP,
 	MSR_IA32_SYSENTER_EIP,
@@ -1108,12 +1104,10 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
 	 * LMA and LME handled by hardware; SCE meaningless outside long mode.
 	 */
 	ignore_bits |= EFER_SCE;
-#ifdef CONFIG_X86_64
 	ignore_bits |= EFER_LMA | EFER_LME;
 	/* SCE is meaningful only in long mode on Intel */
 	if (guest_efer & EFER_LMA)
 		ignore_bits &= ~(u64)EFER_SCE;
-#endif
 
 	/*
 	 * On EPT, we can't emulate NX, so we must switch EFER atomically.
@@ -1147,35 +1141,6 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
 	return true;
 }
 
-#ifdef CONFIG_X86_32
-/*
- * On 32-bit kernels, VM exits still load the FS and GS bases from the
- * VMCS rather than the segment table.  KVM uses this helper to figure
- * out the current bases to poke them into the VMCS before entry.
- */
-static unsigned long segment_base(u16 selector)
-{
-	struct desc_struct *table;
-	unsigned long v;
-
-	if (!(selector & ~SEGMENT_RPL_MASK))
-		return 0;
-
-	table = get_current_gdt_ro();
-
-	if ((selector & SEGMENT_TI_MASK) == SEGMENT_LDT) {
-		u16 ldt_selector = kvm_read_ldt();
-
-		if (!(ldt_selector & ~SEGMENT_RPL_MASK))
-			return 0;
-
-		table = (struct desc_struct *)segment_base(ldt_selector);
-	}
-	v = get_desc_base(&table[selector >> 3]);
-	return v;
-}
-#endif
-
 static inline bool pt_can_write_msr(struct vcpu_vmx *vmx)
 {
 	return vmx_pt_mode_is_host_guest() &&
@@ -1282,9 +1247,7 @@ void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	struct vmcs_host_state *host_state;
-#ifdef CONFIG_X86_64
 	int cpu = raw_smp_processor_id();
-#endif
 	unsigned long fs_base, gs_base;
 	u16 fs_sel, gs_sel;
 	int i;
@@ -1320,7 +1283,6 @@ void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
 	 */
 	host_state->ldt_sel = kvm_read_ldt();
 
-#ifdef CONFIG_X86_64
 	savesegment(ds, host_state->ds_sel);
 	savesegment(es, host_state->es_sel);
 
@@ -1339,12 +1301,6 @@ void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
 	}
 
 	wrmsrl(MSR_KERNEL_GS_BASE, vmx->msr_guest_kernel_gs_base);
-#else
-	savesegment(fs, fs_sel);
-	savesegment(gs, gs_sel);
-	fs_base = segment_base(fs_sel);
-	gs_base = segment_base(gs_sel);
-#endif
 
 	vmx_set_host_fs_gs(host_state, fs_sel, gs_sel, fs_base, gs_base);
 	vmx->guest_state_loaded = true;
@@ -1361,35 +1317,24 @@ static void vmx_prepare_switch_to_host(struct vcpu_vmx *vmx)
 
 	++vmx->vcpu.stat.host_state_reload;
 
-#ifdef CONFIG_X86_64
 	rdmsrl(MSR_KERNEL_GS_BASE, vmx->msr_guest_kernel_gs_base);
-#endif
 	if (host_state->ldt_sel || (host_state->gs_sel & 7)) {
 		kvm_load_ldt(host_state->ldt_sel);
-#ifdef CONFIG_X86_64
 		load_gs_index(host_state->gs_sel);
-#else
-		loadsegment(gs, host_state->gs_sel);
-#endif
 	}
 	if (host_state->fs_sel & 7)
 		loadsegment(fs, host_state->fs_sel);
-#ifdef CONFIG_X86_64
 	if (unlikely(host_state->ds_sel | host_state->es_sel)) {
 		loadsegment(ds, host_state->ds_sel);
 		loadsegment(es, host_state->es_sel);
 	}
-#endif
 	invalidate_tss_limit();
-#ifdef CONFIG_X86_64
 	wrmsrl(MSR_KERNEL_GS_BASE, vmx->msr_host_kernel_gs_base);
-#endif
 	load_fixmap_gdt(raw_smp_processor_id());
 	vmx->guest_state_loaded = false;
 	vmx->guest_uret_msrs_loaded = false;
 }
 
-#ifdef CONFIG_X86_64
 static u64 vmx_read_guest_kernel_gs_base(struct vcpu_vmx *vmx)
 {
 	preempt_disable();
@@ -1407,7 +1352,6 @@ static void vmx_write_guest_kernel_gs_base(struct vcpu_vmx *vmx, u64 data)
 	preempt_enable();
 	vmx->msr_guest_kernel_gs_base = data;
 }
-#endif
 
 static void grow_ple_window(struct kvm_vcpu *vcpu)
 {
@@ -1498,7 +1442,7 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
 			    (unsigned long)&get_cpu_entry_area(cpu)->tss.x86_tss);
 		vmcs_writel(HOST_GDTR_BASE, (unsigned long)gdt);   /* 22.2.4 */
 
-		if (IS_ENABLED(CONFIG_IA32_EMULATION) || IS_ENABLED(CONFIG_X86_32)) {
+		if (IS_ENABLED(CONFIG_IA32_EMULATION)) {
 			/* 22.2.3 */
 			vmcs_writel(HOST_IA32_SYSENTER_ESP,
 				    (unsigned long)(cpu_entry_stack(cpu) + 1));
@@ -1757,7 +1701,6 @@ static int skip_emulated_instruction(struct kvm_vcpu *vcpu)
 
 		orig_rip = kvm_rip_read(vcpu);
 		rip = orig_rip + instr_len;
-#ifdef CONFIG_X86_64
 		/*
 		 * We need to mask out the high 32 bits of RIP if not in 64-bit
 		 * mode, but just finding out that we are in 64-bit mode is
@@ -1765,7 +1708,7 @@ static int skip_emulated_instruction(struct kvm_vcpu *vcpu)
 		 */
 		if (unlikely(((rip ^ orig_rip) >> 31) == 3) && !is_64_bit_mode(vcpu))
 			rip = (u32)rip;
-#endif
+
 		kvm_rip_write(vcpu, rip);
 	} else {
 		if (!kvm_emulate_instruction(vcpu, EMULTYPE_SKIP))
@@ -1898,7 +1841,6 @@ static void vmx_setup_uret_msr(struct vcpu_vmx *vmx, unsigned int msr,
  */
 static void vmx_setup_uret_msrs(struct vcpu_vmx *vmx)
 {
-#ifdef CONFIG_X86_64
 	bool load_syscall_msrs;
 
 	/*
@@ -1911,7 +1853,6 @@ static void vmx_setup_uret_msrs(struct vcpu_vmx *vmx)
 	vmx_setup_uret_msr(vmx, MSR_STAR, load_syscall_msrs);
 	vmx_setup_uret_msr(vmx, MSR_LSTAR, load_syscall_msrs);
 	vmx_setup_uret_msr(vmx, MSR_SYSCALL_MASK, load_syscall_msrs);
-#endif
 	vmx_setup_uret_msr(vmx, MSR_EFER, update_transition_efer(vmx));
 
 	vmx_setup_uret_msr(vmx, MSR_TSC_AUX,
@@ -2026,7 +1967,6 @@ int vmx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	u32 index;
 
 	switch (msr_info->index) {
-#ifdef CONFIG_X86_64
 	case MSR_FS_BASE:
 		msr_info->data = vmcs_readl(GUEST_FS_BASE);
 		break;
@@ -2036,7 +1976,6 @@ int vmx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_KERNEL_GS_BASE:
 		msr_info->data = vmx_read_guest_kernel_gs_base(vmx);
 		break;
-#endif
 	case MSR_EFER:
 		return kvm_get_msr_common(vcpu, msr_info);
 	case MSR_IA32_TSX_CTRL:
@@ -2173,10 +2112,8 @@ int vmx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 static u64 nested_vmx_truncate_sysenter_addr(struct kvm_vcpu *vcpu,
 						    u64 data)
 {
-#ifdef CONFIG_X86_64
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_LM))
 		return (u32)data;
-#endif
 	return (unsigned long)data;
 }
 
@@ -2213,7 +2150,6 @@ int vmx_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_EFER:
 		ret = kvm_set_msr_common(vcpu, msr_info);
 		break;
-#ifdef CONFIG_X86_64
 	case MSR_FS_BASE:
 		vmx_segment_cache_clear(vmx);
 		vmcs_writel(GUEST_FS_BASE, data);
@@ -2243,7 +2179,6 @@ int vmx_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			vmx_update_exception_bitmap(vcpu);
 		}
 		break;
-#endif
 	case MSR_IA32_SYSENTER_CS:
 		if (is_guest_mode(vcpu))
 			get_vmcs12(vcpu)->guest_sysenter_cs = data;
@@ -2628,12 +2563,6 @@ static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	if (!IS_ENABLED(CONFIG_KVM_INTEL_PROVE_VE))
 		_cpu_based_2nd_exec_control &= ~SECONDARY_EXEC_EPT_VIOLATION_VE;
 
-#ifndef CONFIG_X86_64
-	if (!(_cpu_based_2nd_exec_control &
-				SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES))
-		_cpu_based_exec_control &= ~CPU_BASED_TPR_SHADOW;
-#endif
-
 	if (!(_cpu_based_exec_control & CPU_BASED_TPR_SHADOW))
 		_cpu_based_2nd_exec_control &= ~(
 				SECONDARY_EXEC_APIC_REGISTER_VIRT |
@@ -2741,7 +2670,6 @@ static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	if (vmx_basic_vmcs_size(basic_msr) > PAGE_SIZE)
 		return -EIO;
 
-#ifdef CONFIG_X86_64
 	/*
 	 * KVM expects to be able to shove all legal physical addresses into
 	 * VMCS fields for 64-bit kernels, and per the SDM, "This bit is always
@@ -2749,7 +2677,6 @@ static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	 */
 	if (basic_msr & VMX_BASIC_32BIT_PHYS_ADDR_ONLY)
 		return -EIO;
-#endif
 
 	/* Require Write-Back (WB) memory type for VMCS accesses. */
 	if (vmx_basic_vmcs_mem_type(basic_msr) != X86_MEMTYPE_WB)
@@ -3156,22 +3083,15 @@ int vmx_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 		return 0;
 
 	vcpu->arch.efer = efer;
-#ifdef CONFIG_X86_64
 	if (efer & EFER_LMA)
 		vm_entry_controls_setbit(vmx, VM_ENTRY_IA32E_MODE);
 	else
 		vm_entry_controls_clearbit(vmx, VM_ENTRY_IA32E_MODE);
-#else
-	if (KVM_BUG_ON(efer & EFER_LMA, vcpu->kvm))
-		return 1;
-#endif
 
 	vmx_setup_uret_msrs(vmx);
 	return 0;
 }
 
-#ifdef CONFIG_X86_64
-
 static void enter_lmode(struct kvm_vcpu *vcpu)
 {
 	u32 guest_tr_ar;
@@ -3194,8 +3114,6 @@ static void exit_lmode(struct kvm_vcpu *vcpu)
 	vmx_set_efer(vcpu, vcpu->arch.efer & ~EFER_LMA);
 }
 
-#endif
-
 void vmx_flush_tlb_all(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -3335,14 +3253,12 @@ void vmx_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 	vcpu->arch.cr0 = cr0;
 	kvm_register_mark_available(vcpu, VCPU_EXREG_CR0);
 
-#ifdef CONFIG_X86_64
 	if (vcpu->arch.efer & EFER_LME) {
 		if (!old_cr0_pg && (cr0 & X86_CR0_PG))
 			enter_lmode(vcpu);
 		else if (old_cr0_pg && !(cr0 & X86_CR0_PG))
 			exit_lmode(vcpu);
 	}
-#endif
 
 	if (enable_ept && !enable_unrestricted_guest) {
 		/*
@@ -4349,7 +4265,6 @@ void vmx_set_constant_host_state(struct vcpu_vmx *vmx)
 	vmx->loaded_vmcs->host_state.cr4 = cr4;
 
 	vmcs_write16(HOST_CS_SELECTOR, __KERNEL_CS);  /* 22.2.4 */
-#ifdef CONFIG_X86_64
 	/*
 	 * Load null selectors, so we can avoid reloading them in
 	 * vmx_prepare_switch_to_host(), in case userspace uses
@@ -4357,10 +4272,6 @@ void vmx_set_constant_host_state(struct vcpu_vmx *vmx)
 	 */
 	vmcs_write16(HOST_DS_SELECTOR, 0);
 	vmcs_write16(HOST_ES_SELECTOR, 0);
-#else
-	vmcs_write16(HOST_DS_SELECTOR, __KERNEL_DS);  /* 22.2.4 */
-	vmcs_write16(HOST_ES_SELECTOR, __KERNEL_DS);  /* 22.2.4 */
-#endif
 	vmcs_write16(HOST_SS_SELECTOR, __KERNEL_DS);  /* 22.2.4 */
 	vmcs_write16(HOST_TR_SELECTOR, GDT_ENTRY_TSS*8);  /* 22.2.4 */
 
@@ -4377,7 +4288,7 @@ void vmx_set_constant_host_state(struct vcpu_vmx *vmx)
 	 * vmx_vcpu_load_vmcs loads it with the per-CPU entry stack (and may
 	 * have already done so!).
 	 */
-	if (!IS_ENABLED(CONFIG_IA32_EMULATION) && !IS_ENABLED(CONFIG_X86_32))
+	if (!IS_ENABLED(CONFIG_IA32_EMULATION))
 		vmcs_writel(HOST_IA32_SYSENTER_ESP, 0);
 
 	rdmsrl(MSR_IA32_SYSENTER_EIP, tmpl);
@@ -4511,14 +4422,13 @@ static u32 vmx_exec_control(struct vcpu_vmx *vmx)
 	if (!cpu_need_tpr_shadow(&vmx->vcpu))
 		exec_control &= ~CPU_BASED_TPR_SHADOW;
 
-#ifdef CONFIG_X86_64
 	if (exec_control & CPU_BASED_TPR_SHADOW)
 		exec_control &= ~(CPU_BASED_CR8_LOAD_EXITING |
 				  CPU_BASED_CR8_STORE_EXITING);
 	else
 		exec_control |= CPU_BASED_CR8_STORE_EXITING |
 				CPU_BASED_CR8_LOAD_EXITING;
-#endif
+
 	/* No need to intercept CR3 access or INVPLG when using EPT. */
 	if (enable_ept)
 		exec_control &= ~(CPU_BASED_CR3_LOAD_EXITING |
@@ -7451,19 +7361,6 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, bool force_immediate_exit)
 	if (vmx->host_debugctlmsr)
 		update_debugctlmsr(vmx->host_debugctlmsr);
 
-#ifndef CONFIG_X86_64
-	/*
-	 * The sysexit path does not restore ds/es, so we must set them to
-	 * a reasonable value ourselves.
-	 *
-	 * We can't defer this to vmx_prepare_switch_to_host() since that
-	 * function may be executed in interrupt context, which saves and
-	 * restore segments around it, nullifying its effect.
-	 */
-	loadsegment(ds, __USER_DS);
-	loadsegment(es, __USER_DS);
-#endif
-
 	pt_guest_exit(vmx);
 
 	kvm_load_host_xsave_state(vcpu);
@@ -7573,11 +7470,9 @@ int vmx_vcpu_create(struct kvm_vcpu *vcpu)
 	bitmap_fill(vmx->shadow_msr_intercept.write, MAX_POSSIBLE_PASSTHROUGH_MSRS);
 
 	vmx_disable_intercept_for_msr(vcpu, MSR_IA32_TSC, MSR_TYPE_R);
-#ifdef CONFIG_X86_64
 	vmx_disable_intercept_for_msr(vcpu, MSR_FS_BASE, MSR_TYPE_RW);
 	vmx_disable_intercept_for_msr(vcpu, MSR_GS_BASE, MSR_TYPE_RW);
 	vmx_disable_intercept_for_msr(vcpu, MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
-#endif
 	vmx_disable_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_CS, MSR_TYPE_RW);
 	vmx_disable_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_ESP, MSR_TYPE_RW);
 	vmx_disable_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_EIP, MSR_TYPE_RW);
@@ -8097,7 +7992,6 @@ int vmx_check_intercept(struct kvm_vcpu *vcpu,
 	return X86EMUL_UNHANDLEABLE;
 }
 
-#ifdef CONFIG_X86_64
 /* (a << shift) / divisor, return 1 if overflow otherwise 0 */
 static inline int u64_shl_div_u64(u64 a, unsigned int shift,
 				  u64 divisor, u64 *result)
@@ -8160,7 +8054,6 @@ void vmx_cancel_hv_timer(struct kvm_vcpu *vcpu)
 {
 	to_vmx(vcpu)->hv_deadline_tsc = -1;
 }
-#endif
 
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
 {
@@ -8354,9 +8247,7 @@ static __init void vmx_setup_user_return_msrs(void)
 	 * into hardware and is here purely for emulation purposes.
 	 */
 	const u32 vmx_uret_msrs_list[] = {
-	#ifdef CONFIG_X86_64
 		MSR_SYSCALL_MASK, MSR_LSTAR, MSR_CSTAR,
-	#endif
 		MSR_EFER, MSR_TSC_AUX, MSR_STAR,
 		MSR_IA32_TSX_CTRL,
 	};
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 892302022094..01669880344d 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -19,11 +19,7 @@
 
 #define X2APIC_MSR(r) (APIC_BASE_MSR + ((r) >> 4))
 
-#ifdef CONFIG_X86_64
 #define MAX_NR_USER_RETURN_MSRS	7
-#else
-#define MAX_NR_USER_RETURN_MSRS	4
-#endif
 
 #define MAX_NR_LOADSTORE_MSRS	8
 
@@ -273,10 +269,8 @@ struct vcpu_vmx {
 	 */
 	struct vmx_uret_msr   guest_uret_msrs[MAX_NR_USER_RETURN_MSRS];
 	bool                  guest_uret_msrs_loaded;
-#ifdef CONFIG_X86_64
 	u64		      msr_host_kernel_gs_base;
 	u64		      msr_guest_kernel_gs_base;
-#endif
 
 	u64		      spec_ctrl;
 	u32		      msr_ia32_umwait_control;
@@ -471,14 +465,10 @@ static inline u8 vmx_get_rvi(void)
 
 #define __KVM_REQUIRED_VMX_VM_ENTRY_CONTROLS				\
 	(VM_ENTRY_LOAD_DEBUG_CONTROLS)
-#ifdef CONFIG_X86_64
 	#define KVM_REQUIRED_VMX_VM_ENTRY_CONTROLS			\
 		(__KVM_REQUIRED_VMX_VM_ENTRY_CONTROLS |			\
 		 VM_ENTRY_IA32E_MODE)
-#else
-	#define KVM_REQUIRED_VMX_VM_ENTRY_CONTROLS			\
-		__KVM_REQUIRED_VMX_VM_ENTRY_CONTROLS
-#endif
+
 #define KVM_OPTIONAL_VMX_VM_ENTRY_CONTROLS				\
 	(VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL |				\
 	 VM_ENTRY_LOAD_IA32_PAT |					\
@@ -490,14 +480,10 @@ static inline u8 vmx_get_rvi(void)
 #define __KVM_REQUIRED_VMX_VM_EXIT_CONTROLS				\
 	(VM_EXIT_SAVE_DEBUG_CONTROLS |					\
 	 VM_EXIT_ACK_INTR_ON_EXIT)
-#ifdef CONFIG_X86_64
 	#define KVM_REQUIRED_VMX_VM_EXIT_CONTROLS			\
 		(__KVM_REQUIRED_VMX_VM_EXIT_CONTROLS |			\
 		 VM_EXIT_HOST_ADDR_SPACE_SIZE)
-#else
-	#define KVM_REQUIRED_VMX_VM_EXIT_CONTROLS			\
-		__KVM_REQUIRED_VMX_VM_EXIT_CONTROLS
-#endif
+
 #define KVM_OPTIONAL_VMX_VM_EXIT_CONTROLS				\
 	      (VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |			\
 	       VM_EXIT_SAVE_IA32_PAT |					\
@@ -530,15 +516,10 @@ static inline u8 vmx_get_rvi(void)
 	 CPU_BASED_RDPMC_EXITING |					\
 	 CPU_BASED_INTR_WINDOW_EXITING)
 
-#ifdef CONFIG_X86_64
 	#define KVM_REQUIRED_VMX_CPU_BASED_VM_EXEC_CONTROL		\
 		(__KVM_REQUIRED_VMX_CPU_BASED_VM_EXEC_CONTROL |		\
 		 CPU_BASED_CR8_LOAD_EXITING |				\
 		 CPU_BASED_CR8_STORE_EXITING)
-#else
-	#define KVM_REQUIRED_VMX_CPU_BASED_VM_EXEC_CONTROL		\
-		__KVM_REQUIRED_VMX_CPU_BASED_VM_EXEC_CONTROL
-#endif
 
 #define KVM_OPTIONAL_VMX_CPU_BASED_VM_EXEC_CONTROL			\
 	(CPU_BASED_RDTSC_EXITING |					\
diff --git a/arch/x86/kvm/vmx/vmx_ops.h b/arch/x86/kvm/vmx/vmx_ops.h
index 633c87e2fd92..72031b669925 100644
--- a/arch/x86/kvm/vmx/vmx_ops.h
+++ b/arch/x86/kvm/vmx/vmx_ops.h
@@ -171,11 +171,7 @@ static __always_inline u64 vmcs_read64(unsigned long field)
 	vmcs_check64(field);
 	if (kvm_is_using_evmcs())
 		return evmcs_read64(field);
-#ifdef CONFIG_X86_64
 	return __vmcs_readl(field);
-#else
-	return __vmcs_readl(field) | ((u64)__vmcs_readl(field+1) << 32);
-#endif
 }
 
 static __always_inline unsigned long vmcs_readl(unsigned long field)
@@ -250,9 +246,6 @@ static __always_inline void vmcs_write64(unsigned long field, u64 value)
 		return evmcs_write64(field, value);
 
 	__vmcs_writel(field, value);
-#ifndef CONFIG_X86_64
-	__vmcs_writel(field+1, value >> 32);
-#endif
 }
 
 static __always_inline void vmcs_writel(unsigned long field, unsigned long value)
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index ce3295a67c04..9802d73fab4f 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -113,11 +113,9 @@ u64 vmx_get_l2_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_offset(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
-#ifdef CONFIG_X86_64
 int vmx_set_hv_timer(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
 		     bool *expired);
 void vmx_cancel_hv_timer(struct kvm_vcpu *vcpu);
-#endif
 void vmx_setup_mce(struct kvm_vcpu *vcpu);
 
 #endif /* __KVM_X86_VMX_X86_OPS_H */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4320647bd78a..bd5f40cf1b5e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -112,12 +112,8 @@ EXPORT_SYMBOL_GPL(kvm_host);
  * - enable syscall per default because its emulated by KVM
  * - enable LME and LMA per default on 64 bit KVM
  */
-#ifdef CONFIG_X86_64
 static
 u64 __read_mostly efer_reserved_bits = ~((u64)(EFER_SCE | EFER_LME | EFER_LMA));
-#else
-static u64 __read_mostly efer_reserved_bits = ~((u64)EFER_SCE);
-#endif
 
 #define KVM_EXIT_HYPERCALL_VALID_MASK (1 << KVM_HC_MAP_GPA_RANGE)
 
@@ -316,9 +312,7 @@ static struct kmem_cache *x86_emulator_cache;
 static const u32 msrs_to_save_base[] = {
 	MSR_IA32_SYSENTER_CS, MSR_IA32_SYSENTER_ESP, MSR_IA32_SYSENTER_EIP,
 	MSR_STAR,
-#ifdef CONFIG_X86_64
 	MSR_CSTAR, MSR_KERNEL_GS_BASE, MSR_SYSCALL_MASK, MSR_LSTAR,
-#endif
 	MSR_IA32_TSC, MSR_IA32_CR_PAT, MSR_VM_HSAVE_PA,
 	MSR_IA32_FEAT_CTL, MSR_IA32_BNDCFGS, MSR_TSC_AUX,
 	MSR_IA32_SPEC_CTRL, MSR_IA32_TSX_CTRL,
@@ -1069,10 +1063,8 @@ EXPORT_SYMBOL_GPL(load_pdptrs);
 
 static bool kvm_is_valid_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 {
-#ifdef CONFIG_X86_64
 	if (cr0 & 0xffffffff00000000UL)
 		return false;
-#endif
 
 	if ((cr0 & X86_CR0_NW) && !(cr0 & X86_CR0_CD))
 		return false;
@@ -1132,7 +1124,6 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 	/* Write to CR0 reserved bits are ignored, even on Intel. */
 	cr0 &= ~CR0_RESERVED_BITS;
 
-#ifdef CONFIG_X86_64
 	if ((vcpu->arch.efer & EFER_LME) && !is_paging(vcpu) &&
 	    (cr0 & X86_CR0_PG)) {
 		int cs_db, cs_l;
@@ -1143,7 +1134,7 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 		if (cs_l)
 			return 1;
 	}
-#endif
+
 	if (!(vcpu->arch.efer & EFER_LME) && (cr0 & X86_CR0_PG) &&
 	    is_pae(vcpu) && ((cr0 ^ old_cr0) & X86_CR0_PDPTR_BITS) &&
 	    !load_pdptrs(vcpu, kvm_read_cr3(vcpu)))
@@ -1216,12 +1207,10 @@ void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvm_load_host_xsave_state);
 
-#ifdef CONFIG_X86_64
 static inline u64 kvm_guest_supported_xfd(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.guest_supported_xcr0 & XFEATURE_MASK_USER_DYNAMIC;
 }
-#endif
 
 static int __kvm_set_xcr(struct kvm_vcpu *vcpu, u32 index, u64 xcr)
 {
@@ -1407,13 +1396,12 @@ int kvm_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
 {
 	bool skip_tlb_flush = false;
 	unsigned long pcid = 0;
-#ifdef CONFIG_X86_64
+
 	if (kvm_is_cr4_bit_set(vcpu, X86_CR4_PCIDE)) {
 		skip_tlb_flush = cr3 & X86_CR3_PCID_NOFLUSH;
 		cr3 &= ~X86_CR3_PCID_NOFLUSH;
 		pcid = cr3 & X86_CR3_PCID_MASK;
 	}
-#endif
 
 	/* PDPTRs are always reloaded for PAE paging. */
 	if (cr3 == kvm_read_cr3(vcpu) && !is_pae_paging(vcpu))
@@ -2202,7 +2190,6 @@ static int do_set_msr(struct kvm_vcpu *vcpu, unsigned index, u64 *data)
 	return kvm_set_msr_ignored_check(vcpu, index, *data, true);
 }
 
-#ifdef CONFIG_X86_64
 struct pvclock_clock {
 	int vclock_mode;
 	u64 cycle_last;
@@ -2260,13 +2247,6 @@ static s64 get_kvmclock_base_ns(void)
 	/* Count up from boot time, but with the frequency of the raw clock.  */
 	return ktime_to_ns(ktime_add(ktime_get_raw(), pvclock_gtod_data.offs_boot));
 }
-#else
-static s64 get_kvmclock_base_ns(void)
-{
-	/* Master clock not used, so we can just use CLOCK_BOOTTIME.  */
-	return ktime_get_boottime_ns();
-}
-#endif
 
 static void kvm_write_wall_clock(struct kvm *kvm, gpa_t wall_clock, int sec_hi_ofs)
 {
@@ -2368,9 +2348,7 @@ static void kvm_get_time_scale(uint64_t scaled_hz, uint64_t base_hz,
 	*pmultiplier = div_frac(scaled64, tps32);
 }
 
-#ifdef CONFIG_X86_64
 static atomic_t kvm_guest_has_master_clock = ATOMIC_INIT(0);
-#endif
 
 static DEFINE_PER_CPU(unsigned long, cpu_tsc_khz);
 static unsigned long max_tsc_khz;
@@ -2463,16 +2441,13 @@ static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
 	return tsc;
 }
 
-#ifdef CONFIG_X86_64
 static inline bool gtod_is_based_on_tsc(int mode)
 {
 	return mode == VDSO_CLOCKMODE_TSC || mode == VDSO_CLOCKMODE_HVCLOCK;
 }
-#endif
 
 static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 {
-#ifdef CONFIG_X86_64
 	struct kvm_arch *ka = &vcpu->kvm->arch;
 	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
 
@@ -2498,7 +2473,6 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 	trace_kvm_track_tsc(vcpu->vcpu_id, ka->nr_vcpus_matched_tsc,
 			    atomic_read(&vcpu->kvm->online_vcpus),
 		            ka->use_master_clock, gtod->clock.vclock_mode);
-#endif
 }
 
 /*
@@ -2609,14 +2583,13 @@ static void kvm_vcpu_write_tsc_multiplier(struct kvm_vcpu *vcpu, u64 l1_multipli
 
 static inline bool kvm_check_tsc_unstable(void)
 {
-#ifdef CONFIG_X86_64
 	/*
 	 * TSC is marked unstable when we're running on Hyper-V,
 	 * 'TSC page' clocksource is good.
 	 */
 	if (pvclock_gtod_data.clock.vclock_mode == VDSO_CLOCKMODE_HVCLOCK)
 		return false;
-#endif
+
 	return check_tsc_unstable();
 }
 
@@ -2758,8 +2731,6 @@ static inline void adjust_tsc_offset_host(struct kvm_vcpu *vcpu, s64 adjustment)
 	adjust_tsc_offset_guest(vcpu, adjustment);
 }
 
-#ifdef CONFIG_X86_64
-
 static u64 read_tsc(void)
 {
 	u64 ret = (u64)rdtsc_ordered();
@@ -2927,7 +2898,6 @@ static bool kvm_get_walltime_and_clockread(struct timespec64 *ts,
 
 	return gtod_is_based_on_tsc(do_realtime(ts, tsc_timestamp));
 }
-#endif
 
 /*
  *
@@ -2972,7 +2942,6 @@ static bool kvm_get_walltime_and_clockread(struct timespec64 *ts,
 
 static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 {
-#ifdef CONFIG_X86_64
 	struct kvm_arch *ka = &kvm->arch;
 	int vclock_mode;
 	bool host_tsc_clocksource, vcpus_matched;
@@ -2999,7 +2968,6 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 	vclock_mode = pvclock_gtod_data.clock.vclock_mode;
 	trace_kvm_update_master_clock(ka->use_master_clock, vclock_mode,
 					vcpus_matched);
-#endif
 }
 
 static void kvm_make_mclock_inprogress_request(struct kvm *kvm)
@@ -3073,15 +3041,13 @@ static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 	data->flags = 0;
 	if (ka->use_master_clock &&
 	    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
-#ifdef CONFIG_X86_64
 		struct timespec64 ts;
 
 		if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
 			data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
 			data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
 		} else
-#endif
-		data->host_tsc = rdtsc();
+			data->host_tsc = rdtsc();
 
 		data->flags |= KVM_CLOCK_TSC_STABLE;
 		hv_clock.tsc_timestamp = ka->master_cycle_now;
@@ -3303,7 +3269,6 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
  */
 uint64_t kvm_get_wall_clock_epoch(struct kvm *kvm)
 {
-#ifdef CONFIG_X86_64
 	struct pvclock_vcpu_time_info hv_clock;
 	struct kvm_arch *ka = &kvm->arch;
 	unsigned long seq, local_tsc_khz;
@@ -3354,7 +3319,6 @@ uint64_t kvm_get_wall_clock_epoch(struct kvm *kvm)
 		return ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec -
 			__pvclock_read_cycles(&hv_clock, host_tsc);
 	}
-#endif
 	return ktime_get_real_ns() - get_kvmclock_ns(kvm);
 }
 
@@ -4084,7 +4048,6 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			return 1;
 		vcpu->arch.msr_misc_features_enables = data;
 		break;
-#ifdef CONFIG_X86_64
 	case MSR_IA32_XFD:
 		if (!msr_info->host_initiated &&
 		    !guest_cpu_cap_has(vcpu, X86_FEATURE_XFD))
@@ -4105,7 +4068,6 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 
 		vcpu->arch.guest_fpu.xfd_err = data;
 		break;
-#endif
 	default:
 		if (kvm_pmu_is_valid_msr(vcpu, msr))
 			return kvm_pmu_set_msr(vcpu, msr_info);
@@ -4439,7 +4401,6 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_K7_HWCR:
 		msr_info->data = vcpu->arch.msr_hwcr;
 		break;
-#ifdef CONFIG_X86_64
 	case MSR_IA32_XFD:
 		if (!msr_info->host_initiated &&
 		    !guest_cpu_cap_has(vcpu, X86_FEATURE_XFD))
@@ -4454,7 +4415,6 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 
 		msr_info->data = vcpu->arch.guest_fpu.xfd_err;
 		break;
-#endif
 	default:
 		if (kvm_pmu_is_valid_msr(vcpu, msr_info->index))
 			return kvm_pmu_get_msr(vcpu, msr_info);
@@ -8371,10 +8331,8 @@ static bool emulator_get_segment(struct x86_emulate_ctxt *ctxt, u16 *selector,
 		var.limit >>= 12;
 	set_desc_limit(desc, var.limit);
 	set_desc_base(desc, (unsigned long)var.base);
-#ifdef CONFIG_X86_64
 	if (base3)
 		*base3 = var.base >> 32;
-#endif
 	desc->type = var.type;
 	desc->s = var.s;
 	desc->dpl = var.dpl;
@@ -8396,9 +8354,7 @@ static void emulator_set_segment(struct x86_emulate_ctxt *ctxt, u16 selector,
 
 	var.selector = selector;
 	var.base = get_desc_base(desc);
-#ifdef CONFIG_X86_64
 	var.base |= ((u64)base3) << 32;
-#endif
 	var.limit = get_desc_limit(desc);
 	if (desc->g)
 		var.limit = (var.limit << 12) | 0xfff;
@@ -9422,7 +9378,6 @@ static void tsc_khz_changed(void *data)
 	__this_cpu_write(cpu_tsc_khz, khz);
 }
 
-#ifdef CONFIG_X86_64
 static void kvm_hyperv_tsc_notifier(void)
 {
 	struct kvm *kvm;
@@ -9450,7 +9405,6 @@ static void kvm_hyperv_tsc_notifier(void)
 
 	mutex_unlock(&kvm_lock);
 }
-#endif
 
 static void __kvmclock_cpufreq_notifier(struct cpufreq_freqs *freq, int cpu)
 {
@@ -9582,7 +9536,6 @@ static void kvm_timer_init(void)
 	}
 }
 
-#ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
 	struct kvm *kvm;
@@ -9636,7 +9589,6 @@ static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
 static struct notifier_block pvclock_gtod_notifier = {
 	.notifier_call = pvclock_gtod_notify,
 };
-#endif
 
 static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 {
@@ -9780,12 +9732,10 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 
 	if (pi_inject_timer == -1)
 		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
-#ifdef CONFIG_X86_64
 	pvclock_gtod_register_notifier(&pvclock_gtod_notifier);
 
 	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
-#endif
 
 	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
 
@@ -9827,10 +9777,9 @@ void kvm_x86_vendor_exit(void)
 {
 	kvm_unregister_perf_callbacks();
 
-#ifdef CONFIG_X86_64
 	if (hypervisor_is_type(X86_HYPER_MS_HYPERV))
 		clear_hv_tscchange_cb();
-#endif
+
 	kvm_lapic_exit();
 
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
@@ -9838,11 +9787,10 @@ void kvm_x86_vendor_exit(void)
 					    CPUFREQ_TRANSITION_NOTIFIER);
 		cpuhp_remove_state_nocalls(CPUHP_AP_X86_KVM_CLK_ONLINE);
 	}
-#ifdef CONFIG_X86_64
+
 	pvclock_gtod_unregister_notifier(&pvclock_gtod_notifier);
 	irq_work_sync(&pvclock_irq_work);
 	cancel_work_sync(&pvclock_gtod_work);
-#endif
 	kvm_x86_call(hardware_unsetup)();
 	kvm_mmu_vendor_module_exit();
 	free_percpu(user_return_msrs);
@@ -9857,7 +9805,6 @@ void kvm_x86_vendor_exit(void)
 }
 EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
 
-#ifdef CONFIG_X86_64
 static int kvm_pv_clock_pairing(struct kvm_vcpu *vcpu, gpa_t paddr,
 			        unsigned long clock_type)
 {
@@ -9892,7 +9839,6 @@ static int kvm_pv_clock_pairing(struct kvm_vcpu *vcpu, gpa_t paddr,
 
 	return ret;
 }
-#endif
 
 /*
  * kvm_pv_kick_cpu_op:  Kick a vcpu.
@@ -10037,11 +9983,9 @@ unsigned long __kvm_emulate_hypercall(struct kvm_vcpu *vcpu, unsigned long nr,
 		kvm_sched_yield(vcpu, a1);
 		ret = 0;
 		break;
-#ifdef CONFIG_X86_64
 	case KVM_HC_CLOCK_PAIRING:
 		ret = kvm_pv_clock_pairing(vcpu, a0, a1);
 		break;
-#endif
 	case KVM_HC_SEND_IPI:
 		if (!guest_pv_has(vcpu, KVM_FEATURE_PV_SEND_IPI))
 			break;
@@ -11610,7 +11554,6 @@ static void __get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	regs->rdi = kvm_rdi_read(vcpu);
 	regs->rsp = kvm_rsp_read(vcpu);
 	regs->rbp = kvm_rbp_read(vcpu);
-#ifdef CONFIG_X86_64
 	regs->r8 = kvm_r8_read(vcpu);
 	regs->r9 = kvm_r9_read(vcpu);
 	regs->r10 = kvm_r10_read(vcpu);
@@ -11619,8 +11562,6 @@ static void __get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	regs->r13 = kvm_r13_read(vcpu);
 	regs->r14 = kvm_r14_read(vcpu);
 	regs->r15 = kvm_r15_read(vcpu);
-#endif
-
 	regs->rip = kvm_rip_read(vcpu);
 	regs->rflags = kvm_get_rflags(vcpu);
 }
@@ -11650,7 +11591,6 @@ static void __set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	kvm_rdi_write(vcpu, regs->rdi);
 	kvm_rsp_write(vcpu, regs->rsp);
 	kvm_rbp_write(vcpu, regs->rbp);
-#ifdef CONFIG_X86_64
 	kvm_r8_write(vcpu, regs->r8);
 	kvm_r9_write(vcpu, regs->r9);
 	kvm_r10_write(vcpu, regs->r10);
@@ -11659,8 +11599,6 @@ static void __set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	kvm_r13_write(vcpu, regs->r13);
 	kvm_r14_write(vcpu, regs->r14);
 	kvm_r15_write(vcpu, regs->r15);
-#endif
-
 	kvm_rip_write(vcpu, regs->rip);
 	kvm_set_rflags(vcpu, regs->rflags | X86_EFLAGS_FIXED);
 
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 7a87c5fc57f1..82db7880c9f3 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -166,11 +166,7 @@ static inline bool is_protmode(struct kvm_vcpu *vcpu)
 
 static inline bool is_long_mode(struct kvm_vcpu *vcpu)
 {
-#ifdef CONFIG_X86_64
 	return !!(vcpu->arch.efer & EFER_LMA);
-#else
-	return false;
-#endif
 }
 
 static inline bool is_64_bit_mode(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index a909b817b9c0..9f6115da02ea 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -67,19 +67,16 @@ static int kvm_xen_shared_info_init(struct kvm *kvm)
 	BUILD_BUG_ON(offsetof(struct compat_shared_info, arch.wc_sec_hi) != 0x924);
 	BUILD_BUG_ON(offsetof(struct pvclock_vcpu_time_info, version) != 0);
 
-#ifdef CONFIG_X86_64
 	/* Paranoia checks on the 64-bit struct layout */
 	BUILD_BUG_ON(offsetof(struct shared_info, wc) != 0xc00);
 	BUILD_BUG_ON(offsetof(struct shared_info, wc_sec_hi) != 0xc0c);
 
-	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
+	if (kvm->arch.xen.long_mode) {
 		struct shared_info *shinfo = gpc->khva;
 
 		wc_sec_hi = &shinfo->wc_sec_hi;
 		wc = &shinfo->wc;
-	} else
-#endif
-	{
+	} else {
 		struct compat_shared_info *shinfo = gpc->khva;
 
 		wc_sec_hi = &shinfo->arch.wc_sec_hi;
@@ -177,8 +174,7 @@ static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
 	    static_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
 		uint64_t host_tsc, guest_tsc;
 
-		if (!IS_ENABLED(CONFIG_64BIT) ||
-		    !kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
+		if (!kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
 			/*
 			 * Don't fall back to get_kvmclock_ns() because it's
 			 * broken; it has a systemic error in its results
@@ -288,7 +284,6 @@ static void kvm_xen_update_runstate_guest(struct kvm_vcpu *v, bool atomic)
 	BUILD_BUG_ON(offsetof(struct vcpu_runstate_info, state) != 0);
 	BUILD_BUG_ON(offsetof(struct compat_vcpu_runstate_info, state) != 0);
 	BUILD_BUG_ON(sizeof(struct compat_vcpu_runstate_info) != 0x2c);
-#ifdef CONFIG_X86_64
 	/*
 	 * The 64-bit structure has 4 bytes of padding before 'state_entry_time'
 	 * so each subsequent field is shifted by 4, and it's 4 bytes longer.
@@ -298,7 +293,6 @@ static void kvm_xen_update_runstate_guest(struct kvm_vcpu *v, bool atomic)
 	BUILD_BUG_ON(offsetof(struct vcpu_runstate_info, time) !=
 		     offsetof(struct compat_vcpu_runstate_info, time) + 4);
 	BUILD_BUG_ON(sizeof(struct vcpu_runstate_info) != 0x2c + 4);
-#endif
 	/*
 	 * The state field is in the same place at the start of both structs,
 	 * and is the same size (int) as vx->current_runstate.
@@ -335,7 +329,7 @@ static void kvm_xen_update_runstate_guest(struct kvm_vcpu *v, bool atomic)
 	BUILD_BUG_ON(sizeof_field(struct vcpu_runstate_info, time) !=
 		     sizeof(vx->runstate_times));
 
-	if (IS_ENABLED(CONFIG_64BIT) && v->kvm->arch.xen.long_mode) {
+	if (v->kvm->arch.xen.long_mode) {
 		user_len = sizeof(struct vcpu_runstate_info);
 		times_ofs = offsetof(struct vcpu_runstate_info,
 				     state_entry_time);
@@ -472,13 +466,11 @@ static void kvm_xen_update_runstate_guest(struct kvm_vcpu *v, bool atomic)
 					sizeof(uint64_t) - 1 - user_len1;
 		}
 
-#ifdef CONFIG_X86_64
 		/*
 		 * Don't leak kernel memory through the padding in the 64-bit
 		 * version of the struct.
 		 */
 		memset(&rs, 0, offsetof(struct vcpu_runstate_info, state_entry_time));
-#endif
 	}
 
 	/*
@@ -606,7 +598,7 @@ void kvm_xen_inject_pending_events(struct kvm_vcpu *v)
 	}
 
 	/* Now gpc->khva is a valid kernel address for the vcpu_info */
-	if (IS_ENABLED(CONFIG_64BIT) && v->kvm->arch.xen.long_mode) {
+	if (v->kvm->arch.xen.long_mode) {
 		struct vcpu_info *vi = gpc->khva;
 
 		asm volatile(LOCK_PREFIX "orq %0, %1\n"
@@ -695,22 +687,18 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 
 	switch (data->type) {
 	case KVM_XEN_ATTR_TYPE_LONG_MODE:
-		if (!IS_ENABLED(CONFIG_64BIT) && data->u.long_mode) {
-			r = -EINVAL;
-		} else {
-			mutex_lock(&kvm->arch.xen.xen_lock);
-			kvm->arch.xen.long_mode = !!data->u.long_mode;
+		mutex_lock(&kvm->arch.xen.xen_lock);
+		kvm->arch.xen.long_mode = !!data->u.long_mode;
 
-			/*
-			 * Re-initialize shared_info to put the wallclock in the
-			 * correct place. Whilst it's not necessary to do this
-			 * unless the mode is actually changed, it does no harm
-			 * to make the call anyway.
-			 */
-			r = kvm->arch.xen.shinfo_cache.active ?
-				kvm_xen_shared_info_init(kvm) : 0;
-			mutex_unlock(&kvm->arch.xen.xen_lock);
-		}
+		/*
+		 * Re-initialize shared_info to put the wallclock in the
+		 * correct place. Whilst it's not necessary to do this
+		 * unless the mode is actually changed, it does no harm
+		 * to make the call anyway.
+		 */
+		r = kvm->arch.xen.shinfo_cache.active ?
+			kvm_xen_shared_info_init(kvm) : 0;
+		mutex_unlock(&kvm->arch.xen.xen_lock);
 		break;
 
 	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
@@ -923,7 +911,7 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 		 * address, that's actually OK. kvm_xen_update_runstate_guest()
 		 * will cope.
 		 */
-		if (IS_ENABLED(CONFIG_64BIT) && vcpu->kvm->arch.xen.long_mode)
+		if (vcpu->kvm->arch.xen.long_mode)
 			sz = sizeof(struct vcpu_runstate_info);
 		else
 			sz = sizeof(struct compat_vcpu_runstate_info);
@@ -1360,7 +1348,7 @@ static int kvm_xen_hypercall_complete_userspace(struct kvm_vcpu *vcpu)
 
 static inline int max_evtchn_port(struct kvm *kvm)
 {
-	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode)
+	if (kvm->arch.xen.long_mode)
 		return EVTCHN_2L_NR_CHANNELS;
 	else
 		return COMPAT_EVTCHN_2L_NR_CHANNELS;
@@ -1382,7 +1370,7 @@ static bool wait_pending_event(struct kvm_vcpu *vcpu, int nr_ports,
 		goto out_rcu;
 
 	ret = false;
-	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
+	if (kvm->arch.xen.long_mode) {
 		struct shared_info *shinfo = gpc->khva;
 		pending_bits = (unsigned long *)&shinfo->evtchn_pending;
 	} else {
@@ -1416,7 +1404,7 @@ static bool kvm_xen_schedop_poll(struct kvm_vcpu *vcpu, bool longmode,
 	    !(vcpu->kvm->arch.xen_hvm_config.flags & KVM_XEN_HVM_CONFIG_EVTCHN_SEND))
 		return false;
 
-	if (IS_ENABLED(CONFIG_64BIT) && !longmode) {
+	if (!longmode) {
 		struct compat_sched_poll sp32;
 
 		/* Sanity check that the compat struct definition is correct */
@@ -1629,9 +1617,7 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
 		params[3] = (u32)kvm_rsi_read(vcpu);
 		params[4] = (u32)kvm_rdi_read(vcpu);
 		params[5] = (u32)kvm_rbp_read(vcpu);
-	}
-#ifdef CONFIG_X86_64
-	else {
+	} else {
 		params[0] = (u64)kvm_rdi_read(vcpu);
 		params[1] = (u64)kvm_rsi_read(vcpu);
 		params[2] = (u64)kvm_rdx_read(vcpu);
@@ -1639,7 +1625,6 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
 		params[4] = (u64)kvm_r8_read(vcpu);
 		params[5] = (u64)kvm_r9_read(vcpu);
 	}
-#endif
 	cpl = kvm_x86_call(get_cpl)(vcpu);
 	trace_kvm_xen_hypercall(cpl, input, params[0], params[1], params[2],
 				params[3], params[4], params[5]);
@@ -1756,7 +1741,7 @@ int kvm_xen_set_evtchn_fast(struct kvm_xen_evtchn *xe, struct kvm *kvm)
 	if (!kvm_gpc_check(gpc, PAGE_SIZE))
 		goto out_rcu;
 
-	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
+	if (kvm->arch.xen.long_mode) {
 		struct shared_info *shinfo = gpc->khva;
 		pending_bits = (unsigned long *)&shinfo->evtchn_pending;
 		mask_bits = (unsigned long *)&shinfo->evtchn_mask;
@@ -1797,7 +1782,7 @@ int kvm_xen_set_evtchn_fast(struct kvm_xen_evtchn *xe, struct kvm *kvm)
 			goto out_rcu;
 		}
 
-		if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
+		if (kvm->arch.xen.long_mode) {
 			struct vcpu_info *vcpu_info = gpc->khva;
 			if (!test_and_set_bit(port_word_bit, &vcpu_info->evtchn_pending_sel)) {
 				WRITE_ONCE(vcpu_info->evtchn_upcall_pending, 1);
-- 
2.39.5


