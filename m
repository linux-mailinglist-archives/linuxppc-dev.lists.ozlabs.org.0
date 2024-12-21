Return-Path: <linuxppc-dev+bounces-4393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0D39FA2A3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 22:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFyc32vmrz2yDp;
	Sun, 22 Dec 2024 08:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734817763;
	cv=none; b=TrkDWRSGNdj6YSqSO7C6P4iDVjZc5pngjsHYsK9YzzgFsHibAoLCflzk3KrESVqESYniUcARAwTeCkQfYOVGri1zC+4/EgFpOKBtAO/NTmSJHsuYtRQPK4X4EMa6xww2Y45FMHOhj6zucx0MaXJDineiMGpYvm0Znp/MECXdIaHW7NP87p9gsofxOTFGoRMwMSTC1wPu05eguzGGmfHK5sIls71lfpW/mdoAZddmZijlN+VIywjhGHFDmMRq1k0r2kJFuvkUKo5c9sTKxNs9CpfZCiXTjb7n0a90QmPd1fJ6Feb2PbknkCJLcsomoB0xnZxBwPGk5VszYJIBVoyAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734817763; c=relaxed/relaxed;
	bh=X0RFyGuicx3Kj+RULGpa8guqH6E95Y93mCnLyot3rvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cZjuZqDV3OECFbxdgkliz+ZeLTl7mhzy2vCT2VKv7+DOnBpLmJckIAE9W7w5m5RiLVQdi6HZ7HoSuw0d/msCRuHlwB07jUCxRzmcKdfKP3w/9FiofOEbredFW23K2uPWYD5tHiU+hNYT7OaVE1zpkDIVuy6hjgF/eYhyS2W88TRGXBTBY/ldR3GfWvR41SdQVmyQdys54HiRW2GaCEhe8dNYA1JWBdSJOz2wLkmzKMYTRZ+JEcOC3gJloek5B0kaNGK0W+IELRBccPSLb8gOca0d6ZQ7VN2cimsbT/RHGK869/wd8iKHtrvEFSrXVvvzJ4nfysRgQnwlLxMGBkp7yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZEAOCD79; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZEAOCD79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFyc15TTCz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 08:49:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AE745C49FD;
	Sat, 21 Dec 2024 21:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DFDC4CED4;
	Sat, 21 Dec 2024 21:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817758;
	bh=yHI5c1uZo9wASg3V+MDcKAx6O9XT9w1xT0OHoB8Xdmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZEAOCD79UFBF0+NpjsuCPu2NIka/FZ7i9r5FhXWQPRvzx/OtcGAB+nvyoBcLM/8dQ
	 RVD33a83aK2GFsoDMgBHwCrQbBYQNUtMNL+KHSS79hG1VV1i8QID2mFvXQqGtWgDCm
	 YYSDtHvITvfhs0Th5z024lH8TEyB2Lq98ufwPQ5Vo6GG4bPYrDeroCxwC1/JmgBkF7
	 pf8IUSwJs9jkgWYP2GyyGHbhCOdQbJlhAKYCIzVBO3ioLg36It0G3uSj6NrOy3QDoM
	 fP3HeECxpB5Uc3yyw3JUSRMUTO8k3j40LCsCwrVresKbGeMz03vxr07xK0cB4WtEG6
	 BdtY7PrfSz/dQ==
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
Subject: [PATCH v2 3/5] powerpc: kvm: drop 32-bit booke
Date: Sat, 21 Dec 2024 22:42:21 +0100
Message-Id: <20241221214223.3046298-4-arnd@kernel.org>
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
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

KVM on PowerPC BookE was introduced in 2008 and supported IBM 44x,
Freescale e500v2 (32-bit mpc85xx, QuorIQ P1/P2), e500mc (32bit QorIQ
P2/P3/P4), e5500 (64-bit QorIQ P5/T1) and e6500 (64-bit QorIQ T2/T4).

Support for 44x was dropped in 2014 as it was seeing very little use,
but e500v2 and e500mc are still supported as most of the code is shared
with the 64-bit e5500/e6500 implementation.

The last of those 32-bit chips were introduced in 2010 but not widely
adopted when the following 64-bit PowerPC and Arm variants ended up
being more successful.

The 64-bit e5500/e6500 are still known to be used with KVM, but I could
not find any evidence of continued use of the 32-bit ones, so drop
discontinue those in order to simplify the implementation.
The changes are purely mechanical, dropping all #ifdef checks for
CONFIG_64BIT, CONFIG_KVM_E500V2, CONFIG_KVM_E500MC, CONFIG_KVM_BOOKE_HV,
CONFIG_PPC_85xx, CONFIG_PPC_FPU, CONFIG_SPE and CONFIG_SPE_POSSIBLE,
which are all known on e5500/e6500.

Support for 64-bit hosts remains unchanged, for both 32-bit and
64-bit guests.

Link: https://lore.kernel.org/lkml/Z1B1phcpbiYWLgCD@google.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
 arch/powerpc/include/asm/kvm_booke.h        |   4 -
 arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
 arch/powerpc/kernel/head_85xx.S             |  14 -
 arch/powerpc/kernel/head_booke.h            |  39 --
 arch/powerpc/kvm/Kconfig                    |  22 +-
 arch/powerpc/kvm/Makefile                   |  15 -
 arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------
 arch/powerpc/kvm/booke.c                    | 268 ----------
 arch/powerpc/kvm/booke.h                    |   8 -
 arch/powerpc/kvm/booke_emulate.c            |  44 --
 arch/powerpc/kvm/booke_interrupts.S         | 535 -------------------
 arch/powerpc/kvm/bookehv_interrupts.S       | 102 ----
 arch/powerpc/kvm/e500.c                     | 553 --------------------
 arch/powerpc/kvm/e500.h                     |  40 --
 arch/powerpc/kvm/e500_emulate.c             | 100 ----
 arch/powerpc/kvm/e500_mmu_host.c            |  54 --
 arch/powerpc/kvm/e500mc.c                   |   5 +-
 arch/powerpc/kvm/trace_booke.h              |  14 -
 19 files changed, 4 insertions(+), 2247 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/kvm_book3s_32.h
 delete mode 100644 arch/powerpc/kvm/book3s_32_mmu_host.c
 delete mode 100644 arch/powerpc/kvm/booke_interrupts.S
 delete mode 100644 arch/powerpc/kvm/e500.c

diff --git a/arch/powerpc/include/asm/kvm_book3s_32.h b/arch/powerpc/include/asm/kvm_book3s_32.h
deleted file mode 100644
index e9d2e8463105..000000000000
--- a/arch/powerpc/include/asm/kvm_book3s_32.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *
- * Copyright SUSE Linux Products GmbH 2010
- *
- * Authors: Alexander Graf <agraf@suse.de>
- */
-
-#ifndef __ASM_KVM_BOOK3S_32_H__
-#define __ASM_KVM_BOOK3S_32_H__
-
-static inline struct kvmppc_book3s_shadow_vcpu *svcpu_get(struct kvm_vcpu *vcpu)
-{
-	return vcpu->arch.shadow_vcpu;
-}
-
-static inline void svcpu_put(struct kvmppc_book3s_shadow_vcpu *svcpu)
-{
-}
-
-#define PTE_SIZE	12
-#define VSID_ALL	0
-#define SR_INVALID	0x00000001	/* VSID 1 should always be unused */
-#define SR_KP		0x20000000
-#define PTE_V		0x80000000
-#define PTE_SEC		0x00000040
-#define PTE_M		0x00000010
-#define PTE_R		0x00000100
-#define PTE_C		0x00000080
-
-#define SID_SHIFT	28
-#define ESID_MASK	0xf0000000
-#define VSID_MASK	0x00fffffff0000000ULL
-#define VPN_SHIFT	12
-
-#endif /* __ASM_KVM_BOOK3S_32_H__ */
diff --git a/arch/powerpc/include/asm/kvm_booke.h b/arch/powerpc/include/asm/kvm_booke.h
index 7c3291aa8922..59349cb5a94c 100644
--- a/arch/powerpc/include/asm/kvm_booke.h
+++ b/arch/powerpc/include/asm/kvm_booke.h
@@ -109,10 +109,6 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 static inline bool kvmppc_supports_magic_page(struct kvm_vcpu *vcpu)
 {
 	/* Magic page is only supported on e500v2 */
-#ifdef CONFIG_KVM_E500V2
-	return true;
-#else
 	return false;
-#endif
 }
 #endif /* __ASM_KVM_BOOKE_H__ */
diff --git a/arch/powerpc/include/asm/kvm_booke_hv_asm.h b/arch/powerpc/include/asm/kvm_booke_hv_asm.h
index 7487ef582121..5bc10d113575 100644
--- a/arch/powerpc/include/asm/kvm_booke_hv_asm.h
+++ b/arch/powerpc/include/asm/kvm_booke_hv_asm.h
@@ -54,14 +54,12 @@
  * Only the bolted version of TLB miss exception handlers is supported now.
  */
 .macro DO_KVM intno srr1
-#ifdef CONFIG_KVM_BOOKE_HV
 BEGIN_FTR_SECTION
 	mtocrf	0x80, r11	/* check MSR[GS] without clobbering reg */
 	bf	3, 1975f
 	b	kvmppc_handler_\intno\()_\srr1
 1975:
 END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
-#endif
 .endm
 
 #endif /*__ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index f9a73fae6464..661903d31b54 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -425,16 +425,10 @@ interrupt_base:
 	mtspr	SPRN_SPRG_WSCRATCH0, r10 /* Save some working registers */
 	mfspr	r10, SPRN_SPRG_THREAD
 	stw	r11, THREAD_NORMSAVE(0)(r10)
-#ifdef CONFIG_KVM_BOOKE_HV
-BEGIN_FTR_SECTION
-	mfspr	r11, SPRN_SRR1
-END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
-#endif
 	stw	r12, THREAD_NORMSAVE(1)(r10)
 	stw	r13, THREAD_NORMSAVE(2)(r10)
 	mfcr	r13
 	stw	r13, THREAD_NORMSAVE(3)(r10)
-	DO_KVM	BOOKE_INTERRUPT_DTLB_MISS SPRN_SRR1
 START_BTB_FLUSH_SECTION
 	mfspr r11, SPRN_SRR1
 	andi. r10,r11,MSR_PR
@@ -517,16 +511,10 @@ END_BTB_FLUSH_SECTION
 	mtspr	SPRN_SPRG_WSCRATCH0, r10 /* Save some working registers */
 	mfspr	r10, SPRN_SPRG_THREAD
 	stw	r11, THREAD_NORMSAVE(0)(r10)
-#ifdef CONFIG_KVM_BOOKE_HV
-BEGIN_FTR_SECTION
-	mfspr	r11, SPRN_SRR1
-END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
-#endif
 	stw	r12, THREAD_NORMSAVE(1)(r10)
 	stw	r13, THREAD_NORMSAVE(2)(r10)
 	mfcr	r13
 	stw	r13, THREAD_NORMSAVE(3)(r10)
-	DO_KVM	BOOKE_INTERRUPT_ITLB_MISS SPRN_SRR1
 START_BTB_FLUSH_SECTION
 	mfspr r11, SPRN_SRR1
 	andi. r10,r11,MSR_PR
@@ -660,8 +648,6 @@ END_BTB_FLUSH_SECTION
 	DEBUG_DEBUG_EXCEPTION
 	DEBUG_CRIT_EXCEPTION
 
-	GUEST_DOORBELL_EXCEPTION
-
 	CRITICAL_EXCEPTION(0, GUEST_DBELL_CRIT, CriticalGuestDoorbell, \
 			   unknown_exception)
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 0b5c1993809e..d1ffef4d05b5 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -3,8 +3,6 @@
 #define __HEAD_BOOKE_H__
 
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
-#include <asm/kvm_asm.h>
-#include <asm/kvm_booke_hv_asm.h>
 #include <asm/thread_info.h>	/* for THREAD_SHIFT */
 
 #ifdef __ASSEMBLY__
@@ -52,7 +50,6 @@ END_BTB_FLUSH_SECTION
 	stw	r13, THREAD_NORMSAVE(2)(r10);				     \
 	mfcr	r13;			/* save CR in r13 for now	   */\
 	mfspr	r11, SPRN_SRR1;		                                     \
-	DO_KVM	BOOKE_INTERRUPT_##intno SPRN_SRR1;			     \
 	andi.	r11, r11, MSR_PR;	/* check whether user or kernel    */\
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL);				\
 	mtmsr	r11;							\
@@ -114,25 +111,7 @@ END_BTB_FLUSH_SECTION
 
 .macro SYSCALL_ENTRY trapno intno srr1
 	mfspr	r10, SPRN_SPRG_THREAD
-#ifdef CONFIG_KVM_BOOKE_HV
-BEGIN_FTR_SECTION
-	mtspr	SPRN_SPRG_WSCRATCH0, r10
-	stw	r11, THREAD_NORMSAVE(0)(r10)
-	stw	r13, THREAD_NORMSAVE(2)(r10)
-	mfcr	r13			/* save CR in r13 for now	   */
-	mfspr	r11, SPRN_SRR1
-	mtocrf	0x80, r11	/* check MSR[GS] without clobbering reg */
-	bf	3, 1975f
-	b	kvmppc_handler_\intno\()_\srr1
-1975:
-	mr	r12, r13
-	lwz	r13, THREAD_NORMSAVE(2)(r10)
-FTR_SECTION_ELSE
 	mfcr	r12
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
-#else
-	mfcr	r12
-#endif
 	mfspr	r9, SPRN_SRR1
 	BOOKE_CLEAR_BTB(r11)
 	mr	r11, r1
@@ -198,7 +177,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r11,GPR11(r8);						     \
 	stw	r9,_CCR(r8);		/* save CR on stack		   */\
 	mfspr	r11,exc_level_srr1;	/* check whether user or kernel    */\
-	DO_KVM	BOOKE_INTERRUPT_##intno exc_level_srr1;		             \
 	BOOKE_CLEAR_BTB(r10)						\
 	andi.	r11,r11,MSR_PR;						     \
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE));	\
@@ -272,23 +250,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 		EXC_LEVEL_EXCEPTION_PROLOG(MC, trapno+4, MACHINE_CHECK, \
 			SPRN_MCSRR0, SPRN_MCSRR1)
 
-/*
- * Guest Doorbell -- this is a bit odd in that uses GSRR0/1 despite
- * being delivered to the host.  This exception can only happen
- * inside a KVM guest -- so we just handle up to the DO_KVM rather
- * than try to fit this into one of the existing prolog macros.
- */
-#define GUEST_DOORBELL_EXCEPTION \
-	START_EXCEPTION(GuestDoorbell);					     \
-	mtspr	SPRN_SPRG_WSCRATCH0, r10;	/* save one register */	     \
-	mfspr	r10, SPRN_SPRG_THREAD;					     \
-	stw	r11, THREAD_NORMSAVE(0)(r10);				     \
-	mfspr	r11, SPRN_SRR1;		                                     \
-	stw	r13, THREAD_NORMSAVE(2)(r10);				     \
-	mfcr	r13;			/* save CR in r13 for now	   */\
-	DO_KVM	BOOKE_INTERRUPT_GUEST_DBELL SPRN_GSRR1;			     \
-	trap
-
 /*
  * Exception vectors.
  */
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index dbfdc126bf14..e2230ea512cf 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -185,25 +185,9 @@ config KVM_EXIT_TIMING
 
 	  If unsure, say N.
 
-config KVM_E500V2
-	bool "KVM support for PowerPC E500v2 processors"
-	depends on PPC_E500 && !PPC_E500MC
-	depends on !CONTEXT_TRACKING_USER
-	select KVM
-	select KVM_MMIO
-	select KVM_GENERIC_MMU_NOTIFIER
-	help
-	  Support running unmodified E500 guest kernels in virtual machines on
-	  E500v2 host processors.
-
-	  This module provides access to the hardware capabilities through
-	  a character device node named /dev/kvm.
-
-	  If unsure, say N.
-
 config KVM_E500MC
-	bool "KVM support for PowerPC E500MC/E5500/E6500 processors"
-	depends on PPC_E500MC
+	bool "KVM support for PowerPC E5500/E6500 processors"
+	depends on PPC_E500MC && 64BIT
 	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_MMIO
@@ -211,7 +195,7 @@ config KVM_E500MC
 	select KVM_GENERIC_MMU_NOTIFIER
 	help
 	  Support running unmodified E500MC/E5500/E6500 guest kernels in
-	  virtual machines on E500MC/E5500/E6500 host processors.
+	  virtual machines on E5500/E6500 host processors.
 
 	  This module provides access to the hardware capabilities through
 	  a character device node named /dev/kvm.
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..294f27439f7f 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -11,20 +11,6 @@ common-objs-y += powerpc.o emulate_loadstore.o
 obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
 obj-$(CONFIG_KVM_BOOK3S_HANDLER) += book3s_exports.o
 
-AFLAGS_booke_interrupts.o := -I$(objtree)/$(obj)
-
-kvm-e500-objs := \
-	$(common-objs-y) \
-	emulate.o \
-	booke.o \
-	booke_emulate.o \
-	booke_interrupts.o \
-	e500.o \
-	e500_mmu.o \
-	e500_mmu_host.o \
-	e500_emulate.o
-kvm-objs-$(CONFIG_KVM_E500V2) := $(kvm-e500-objs)
-
 kvm-e500mc-objs := \
 	$(common-objs-y) \
 	emulate.o \
@@ -127,7 +113,6 @@ kvm-objs-$(CONFIG_KVM_MPIC) += mpic.o
 
 kvm-y += $(kvm-objs-m) $(kvm-objs-y)
 
-obj-$(CONFIG_KVM_E500V2) += kvm.o
 obj-$(CONFIG_KVM_E500MC) += kvm.o
 obj-$(CONFIG_KVM_BOOK3S_64) += kvm.o
 obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
deleted file mode 100644
index 5b7212edbb13..000000000000
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ /dev/null
@@ -1,396 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2010 SUSE Linux Products GmbH. All rights reserved.
- *
- * Authors:
- *     Alexander Graf <agraf@suse.de>
- */
-
-#include <linux/kvm_host.h>
-
-#include <asm/kvm_ppc.h>
-#include <asm/kvm_book3s.h>
-#include <asm/book3s/32/mmu-hash.h>
-#include <asm/machdep.h>
-#include <asm/mmu_context.h>
-#include <asm/hw_irq.h>
-#include "book3s.h"
-
-/* #define DEBUG_MMU */
-/* #define DEBUG_SR */
-
-#ifdef DEBUG_MMU
-#define dprintk_mmu(a, ...) printk(KERN_INFO a, __VA_ARGS__)
-#else
-#define dprintk_mmu(a, ...) do { } while(0)
-#endif
-
-#ifdef DEBUG_SR
-#define dprintk_sr(a, ...) printk(KERN_INFO a, __VA_ARGS__)
-#else
-#define dprintk_sr(a, ...) do { } while(0)
-#endif
-
-#if PAGE_SHIFT != 12
-#error Unknown page size
-#endif
-
-#ifdef CONFIG_SMP
-#error XXX need to grab mmu_hash_lock
-#endif
-
-#ifdef CONFIG_PTE_64BIT
-#error Only 32 bit pages are supported for now
-#endif
-
-static ulong htab;
-static u32 htabmask;
-
-void kvmppc_mmu_invalidate_pte(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
-{
-	volatile u32 *pteg;
-
-	/* Remove from host HTAB */
-	pteg = (u32*)pte->slot;
-	pteg[0] = 0;
-
-	/* And make sure it's gone from the TLB too */
-	asm volatile ("sync");
-	asm volatile ("tlbie %0" : : "r" (pte->pte.eaddr) : "memory");
-	asm volatile ("sync");
-	asm volatile ("tlbsync");
-}
-
-/* We keep 512 gvsid->hvsid entries, mapping the guest ones to the array using
- * a hash, so we don't waste cycles on looping */
-static u16 kvmppc_sid_hash(struct kvm_vcpu *vcpu, u64 gvsid)
-{
-	return (u16)(((gvsid >> (SID_MAP_BITS * 7)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 6)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 5)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 4)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 3)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 2)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 1)) & SID_MAP_MASK) ^
-		     ((gvsid >> (SID_MAP_BITS * 0)) & SID_MAP_MASK));
-}
-
-
-static struct kvmppc_sid_map *find_sid_vsid(struct kvm_vcpu *vcpu, u64 gvsid)
-{
-	struct kvmppc_sid_map *map;
-	u16 sid_map_mask;
-
-	if (kvmppc_get_msr(vcpu) & MSR_PR)
-		gvsid |= VSID_PR;
-
-	sid_map_mask = kvmppc_sid_hash(vcpu, gvsid);
-	map = &to_book3s(vcpu)->sid_map[sid_map_mask];
-	if (map->guest_vsid == gvsid) {
-		dprintk_sr("SR: Searching 0x%llx -> 0x%llx\n",
-			    gvsid, map->host_vsid);
-		return map;
-	}
-
-	map = &to_book3s(vcpu)->sid_map[SID_MAP_MASK - sid_map_mask];
-	if (map->guest_vsid == gvsid) {
-		dprintk_sr("SR: Searching 0x%llx -> 0x%llx\n",
-			    gvsid, map->host_vsid);
-		return map;
-	}
-
-	dprintk_sr("SR: Searching 0x%llx -> not found\n", gvsid);
-	return NULL;
-}
-
-static u32 *kvmppc_mmu_get_pteg(struct kvm_vcpu *vcpu, u32 vsid, u32 eaddr,
-				bool primary)
-{
-	u32 page, hash;
-	ulong pteg = htab;
-
-	page = (eaddr & ~ESID_MASK) >> 12;
-
-	hash = ((vsid ^ page) << 6);
-	if (!primary)
-		hash = ~hash;
-
-	hash &= htabmask;
-
-	pteg |= hash;
-
-	dprintk_mmu("htab: %lx | hash: %x | htabmask: %x | pteg: %lx\n",
-		htab, hash, htabmask, pteg);
-
-	return (u32*)pteg;
-}
-
-extern char etext[];
-
-int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
-			bool iswrite)
-{
-	struct page *page;
-	kvm_pfn_t hpaddr;
-	u64 vpn;
-	u64 vsid;
-	struct kvmppc_sid_map *map;
-	volatile u32 *pteg;
-	u32 eaddr = orig_pte->eaddr;
-	u32 pteg0, pteg1;
-	register int rr = 0;
-	bool primary = false;
-	bool evict = false;
-	struct hpte_cache *pte;
-	int r = 0;
-	bool writable;
-
-	/* Get host physical address for gpa */
-	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
-	if (is_error_noslot_pfn(hpaddr)) {
-		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
-				 orig_pte->raddr);
-		r = -EINVAL;
-		goto out;
-	}
-	hpaddr <<= PAGE_SHIFT;
-
-	/* and write the mapping ea -> hpa into the pt */
-	vcpu->arch.mmu.esid_to_vsid(vcpu, orig_pte->eaddr >> SID_SHIFT, &vsid);
-	map = find_sid_vsid(vcpu, vsid);
-	if (!map) {
-		kvmppc_mmu_map_segment(vcpu, eaddr);
-		map = find_sid_vsid(vcpu, vsid);
-	}
-	BUG_ON(!map);
-
-	vsid = map->host_vsid;
-	vpn = (vsid << (SID_SHIFT - VPN_SHIFT)) |
-		((eaddr & ~ESID_MASK) >> VPN_SHIFT);
-next_pteg:
-	if (rr == 16) {
-		primary = !primary;
-		evict = true;
-		rr = 0;
-	}
-
-	pteg = kvmppc_mmu_get_pteg(vcpu, vsid, eaddr, primary);
-
-	/* not evicting yet */
-	if (!evict && (pteg[rr] & PTE_V)) {
-		rr += 2;
-		goto next_pteg;
-	}
-
-	dprintk_mmu("KVM: old PTEG: %p (%d)\n", pteg, rr);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[0], pteg[1]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[2], pteg[3]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[4], pteg[5]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[6], pteg[7]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[8], pteg[9]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[10], pteg[11]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[12], pteg[13]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[14], pteg[15]);
-
-	pteg0 = ((eaddr & 0x0fffffff) >> 22) | (vsid << 7) | PTE_V |
-		(primary ? 0 : PTE_SEC);
-	pteg1 = hpaddr | PTE_M | PTE_R | PTE_C;
-
-	if (orig_pte->may_write && writable) {
-		pteg1 |= PP_RWRW;
-		mark_page_dirty(vcpu->kvm, orig_pte->raddr >> PAGE_SHIFT);
-	} else {
-		pteg1 |= PP_RWRX;
-	}
-
-	if (orig_pte->may_execute)
-		kvmppc_mmu_flush_icache(hpaddr >> PAGE_SHIFT);
-
-	local_irq_disable();
-
-	if (pteg[rr]) {
-		pteg[rr] = 0;
-		asm volatile ("sync");
-	}
-	pteg[rr + 1] = pteg1;
-	pteg[rr] = pteg0;
-	asm volatile ("sync");
-
-	local_irq_enable();
-
-	dprintk_mmu("KVM: new PTEG: %p\n", pteg);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[0], pteg[1]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[2], pteg[3]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[4], pteg[5]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[6], pteg[7]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[8], pteg[9]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[10], pteg[11]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[12], pteg[13]);
-	dprintk_mmu("KVM:   %08x - %08x\n", pteg[14], pteg[15]);
-
-
-	/* Now tell our Shadow PTE code about the new page */
-
-	pte = kvmppc_mmu_hpte_cache_next(vcpu);
-	if (!pte) {
-		kvm_release_page_unused(page);
-		r = -EAGAIN;
-		goto out;
-	}
-
-	dprintk_mmu("KVM: %c%c Map 0x%llx: [%lx] 0x%llx (0x%llx) -> %lx\n",
-		    orig_pte->may_write ? 'w' : '-',
-		    orig_pte->may_execute ? 'x' : '-',
-		    orig_pte->eaddr, (ulong)pteg, vpn,
-		    orig_pte->vpage, hpaddr);
-
-	pte->slot = (ulong)&pteg[rr];
-	pte->host_vpn = vpn;
-	pte->pte = *orig_pte;
-	pte->pfn = hpaddr >> PAGE_SHIFT;
-
-	kvmppc_mmu_hpte_cache_map(vcpu, pte);
-
-	kvm_release_page_clean(page);
-out:
-	return r;
-}
-
-void kvmppc_mmu_unmap_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
-{
-	kvmppc_mmu_pte_vflush(vcpu, pte->vpage, 0xfffffffffULL);
-}
-
-static struct kvmppc_sid_map *create_sid_map(struct kvm_vcpu *vcpu, u64 gvsid)
-{
-	struct kvmppc_sid_map *map;
-	struct kvmppc_vcpu_book3s *vcpu_book3s = to_book3s(vcpu);
-	u16 sid_map_mask;
-	static int backwards_map = 0;
-
-	if (kvmppc_get_msr(vcpu) & MSR_PR)
-		gvsid |= VSID_PR;
-
-	/* We might get collisions that trap in preceding order, so let's
-	   map them differently */
-
-	sid_map_mask = kvmppc_sid_hash(vcpu, gvsid);
-	if (backwards_map)
-		sid_map_mask = SID_MAP_MASK - sid_map_mask;
-
-	map = &to_book3s(vcpu)->sid_map[sid_map_mask];
-
-	/* Make sure we're taking the other map next time */
-	backwards_map = !backwards_map;
-
-	/* Uh-oh ... out of mappings. Let's flush! */
-	if (vcpu_book3s->vsid_next >= VSID_POOL_SIZE) {
-		vcpu_book3s->vsid_next = 0;
-		memset(vcpu_book3s->sid_map, 0,
-		       sizeof(struct kvmppc_sid_map) * SID_MAP_NUM);
-		kvmppc_mmu_pte_flush(vcpu, 0, 0);
-		kvmppc_mmu_flush_segments(vcpu);
-	}
-	map->host_vsid = vcpu_book3s->vsid_pool[vcpu_book3s->vsid_next];
-	vcpu_book3s->vsid_next++;
-
-	map->guest_vsid = gvsid;
-	map->valid = true;
-
-	return map;
-}
-
-int kvmppc_mmu_map_segment(struct kvm_vcpu *vcpu, ulong eaddr)
-{
-	u32 esid = eaddr >> SID_SHIFT;
-	u64 gvsid;
-	u32 sr;
-	struct kvmppc_sid_map *map;
-	struct kvmppc_book3s_shadow_vcpu *svcpu = svcpu_get(vcpu);
-	int r = 0;
-
-	if (vcpu->arch.mmu.esid_to_vsid(vcpu, esid, &gvsid)) {
-		/* Invalidate an entry */
-		svcpu->sr[esid] = SR_INVALID;
-		r = -ENOENT;
-		goto out;
-	}
-
-	map = find_sid_vsid(vcpu, gvsid);
-	if (!map)
-		map = create_sid_map(vcpu, gvsid);
-
-	map->guest_esid = esid;
-	sr = map->host_vsid | SR_KP;
-	svcpu->sr[esid] = sr;
-
-	dprintk_sr("MMU: mtsr %d, 0x%x\n", esid, sr);
-
-out:
-	svcpu_put(svcpu);
-	return r;
-}
-
-void kvmppc_mmu_flush_segments(struct kvm_vcpu *vcpu)
-{
-	int i;
-	struct kvmppc_book3s_shadow_vcpu *svcpu = svcpu_get(vcpu);
-
-	dprintk_sr("MMU: flushing all segments (%d)\n", ARRAY_SIZE(svcpu->sr));
-	for (i = 0; i < ARRAY_SIZE(svcpu->sr); i++)
-		svcpu->sr[i] = SR_INVALID;
-
-	svcpu_put(svcpu);
-}
-
-void kvmppc_mmu_destroy_pr(struct kvm_vcpu *vcpu)
-{
-	int i;
-
-	kvmppc_mmu_hpte_destroy(vcpu);
-	preempt_disable();
-	for (i = 0; i < SID_CONTEXTS; i++)
-		__destroy_context(to_book3s(vcpu)->context_id[i]);
-	preempt_enable();
-}
-
-int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu)
-{
-	struct kvmppc_vcpu_book3s *vcpu3s = to_book3s(vcpu);
-	int err;
-	ulong sdr1;
-	int i;
-	int j;
-
-	for (i = 0; i < SID_CONTEXTS; i++) {
-		err = __init_new_context();
-		if (err < 0)
-			goto init_fail;
-		vcpu3s->context_id[i] = err;
-
-		/* Remember context id for this combination */
-		for (j = 0; j < 16; j++)
-			vcpu3s->vsid_pool[(i * 16) + j] = CTX_TO_VSID(err, j);
-	}
-
-	vcpu3s->vsid_next = 0;
-
-	/* Remember where the HTAB is */
-	asm ( "mfsdr1 %0" : "=r"(sdr1) );
-	htabmask = ((sdr1 & 0x1FF) << 16) | 0xFFC0;
-	htab = (ulong)__va(sdr1 & 0xffff0000);
-
-	kvmppc_mmu_hpte_init(vcpu);
-
-	return 0;
-
-init_fail:
-	for (j = 0; j < i; j++) {
-		if (!vcpu3s->context_id[j])
-			continue;
-
-		__destroy_context(to_book3s(vcpu)->context_id[j]);
-	}
-
-	return -1;
-}
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6a5be025a8af..1e3a7e0456b9 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -34,8 +34,6 @@
 #define CREATE_TRACE_POINTS
 #include "trace_booke.h"
 
-unsigned long kvmppc_booke_handlers;
-
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
 	STATS_DESC_ICOUNTER(VM, num_2M_pages),
@@ -109,42 +107,6 @@ void kvmppc_dump_vcpu(struct kvm_vcpu *vcpu)
 	}
 }
 
-#ifdef CONFIG_SPE
-void kvmppc_vcpu_disable_spe(struct kvm_vcpu *vcpu)
-{
-	preempt_disable();
-	enable_kernel_spe();
-	kvmppc_save_guest_spe(vcpu);
-	disable_kernel_spe();
-	vcpu->arch.shadow_msr &= ~MSR_SPE;
-	preempt_enable();
-}
-
-static void kvmppc_vcpu_enable_spe(struct kvm_vcpu *vcpu)
-{
-	preempt_disable();
-	enable_kernel_spe();
-	kvmppc_load_guest_spe(vcpu);
-	disable_kernel_spe();
-	vcpu->arch.shadow_msr |= MSR_SPE;
-	preempt_enable();
-}
-
-static void kvmppc_vcpu_sync_spe(struct kvm_vcpu *vcpu)
-{
-	if (vcpu->arch.shared->msr & MSR_SPE) {
-		if (!(vcpu->arch.shadow_msr & MSR_SPE))
-			kvmppc_vcpu_enable_spe(vcpu);
-	} else if (vcpu->arch.shadow_msr & MSR_SPE) {
-		kvmppc_vcpu_disable_spe(vcpu);
-	}
-}
-#else
-static void kvmppc_vcpu_sync_spe(struct kvm_vcpu *vcpu)
-{
-}
-#endif
-
 /*
  * Load up guest vcpu FP state if it's needed.
  * It also set the MSR_FP in thread so that host know
@@ -156,7 +118,6 @@ static void kvmppc_vcpu_sync_spe(struct kvm_vcpu *vcpu)
  */
 static inline void kvmppc_load_guest_fp(struct kvm_vcpu *vcpu)
 {
-#ifdef CONFIG_PPC_FPU
 	if (!(current->thread.regs->msr & MSR_FP)) {
 		enable_kernel_fp();
 		load_fp_state(&vcpu->arch.fp);
@@ -164,7 +125,6 @@ static inline void kvmppc_load_guest_fp(struct kvm_vcpu *vcpu)
 		current->thread.fp_save_area = &vcpu->arch.fp;
 		current->thread.regs->msr |= MSR_FP;
 	}
-#endif
 }
 
 /*
@@ -173,21 +133,9 @@ static inline void kvmppc_load_guest_fp(struct kvm_vcpu *vcpu)
  */
 static inline void kvmppc_save_guest_fp(struct kvm_vcpu *vcpu)
 {
-#ifdef CONFIG_PPC_FPU
 	if (current->thread.regs->msr & MSR_FP)
 		giveup_fpu(current);
 	current->thread.fp_save_area = NULL;
-#endif
-}
-
-static void kvmppc_vcpu_sync_fpu(struct kvm_vcpu *vcpu)
-{
-#if defined(CONFIG_PPC_FPU) && !defined(CONFIG_KVM_BOOKE_HV)
-	/* We always treat the FP bit as enabled from the host
-	   perspective, so only need to adjust the shadow MSR */
-	vcpu->arch.shadow_msr &= ~MSR_FP;
-	vcpu->arch.shadow_msr |= vcpu->arch.shared->msr & MSR_FP;
-#endif
 }
 
 /*
@@ -228,23 +176,16 @@ static inline void kvmppc_save_guest_altivec(struct kvm_vcpu *vcpu)
 static void kvmppc_vcpu_sync_debug(struct kvm_vcpu *vcpu)
 {
 	/* Synchronize guest's desire to get debug interrupts into shadow MSR */
-#ifndef CONFIG_KVM_BOOKE_HV
 	vcpu->arch.shadow_msr &= ~MSR_DE;
 	vcpu->arch.shadow_msr |= vcpu->arch.shared->msr & MSR_DE;
-#endif
 
 	/* Force enable debug interrupts when user space wants to debug */
 	if (vcpu->guest_debug) {
-#ifdef CONFIG_KVM_BOOKE_HV
 		/*
 		 * Since there is no shadow MSR, sync MSR_DE into the guest
 		 * visible MSR.
 		 */
 		vcpu->arch.shared->msr |= MSR_DE;
-#else
-		vcpu->arch.shadow_msr |= MSR_DE;
-		vcpu->arch.shared->msr &= ~MSR_DE;
-#endif
 	}
 }
 
@@ -256,15 +197,11 @@ void kvmppc_set_msr(struct kvm_vcpu *vcpu, u32 new_msr)
 {
 	u32 old_msr = vcpu->arch.shared->msr;
 
-#ifdef CONFIG_KVM_BOOKE_HV
 	new_msr |= MSR_GS;
-#endif
 
 	vcpu->arch.shared->msr = new_msr;
 
 	kvmppc_mmu_msr_notify(vcpu, old_msr);
-	kvmppc_vcpu_sync_spe(vcpu);
-	kvmppc_vcpu_sync_fpu(vcpu);
 	kvmppc_vcpu_sync_debug(vcpu);
 }
 
@@ -457,11 +394,6 @@ static int kvmppc_booke_irqprio_deliver(struct kvm_vcpu *vcpu,
 	case BOOKE_IRQPRIO_ITLB_MISS:
 	case BOOKE_IRQPRIO_SYSCALL:
 	case BOOKE_IRQPRIO_FP_UNAVAIL:
-#ifdef CONFIG_SPE_POSSIBLE
-	case BOOKE_IRQPRIO_SPE_UNAVAIL:
-	case BOOKE_IRQPRIO_SPE_FP_DATA:
-	case BOOKE_IRQPRIO_SPE_FP_ROUND:
-#endif
 #ifdef CONFIG_ALTIVEC
 	case BOOKE_IRQPRIO_ALTIVEC_UNAVAIL:
 	case BOOKE_IRQPRIO_ALTIVEC_ASSIST:
@@ -543,17 +475,14 @@ static int kvmppc_booke_irqprio_deliver(struct kvm_vcpu *vcpu,
 		}
 
 		new_msr &= msr_mask;
-#if defined(CONFIG_64BIT)
 		if (vcpu->arch.epcr & SPRN_EPCR_ICM)
 			new_msr |= MSR_CM;
-#endif
 		kvmppc_set_msr(vcpu, new_msr);
 
 		if (!keep_irq)
 			clear_bit(priority, &vcpu->arch.pending_exceptions);
 	}
 
-#ifdef CONFIG_KVM_BOOKE_HV
 	/*
 	 * If an interrupt is pending but masked, raise a guest doorbell
 	 * so that we are notified when the guest enables the relevant
@@ -565,7 +494,6 @@ static int kvmppc_booke_irqprio_deliver(struct kvm_vcpu *vcpu,
 		kvmppc_set_pending_interrupt(vcpu, INT_CLASS_CRIT);
 	if (vcpu->arch.pending_exceptions & BOOKE_IRQPRIO_MACHINE_CHECK)
 		kvmppc_set_pending_interrupt(vcpu, INT_CLASS_MC);
-#endif
 
 	return allowed;
 }
@@ -737,10 +665,8 @@ int kvmppc_core_check_requests(struct kvm_vcpu *vcpu)
 
 	if (kvm_check_request(KVM_REQ_PENDING_TIMER, vcpu))
 		update_timer_ints(vcpu);
-#if defined(CONFIG_KVM_E500V2) || defined(CONFIG_KVM_E500MC)
 	if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
 		kvmppc_core_flush_tlb(vcpu);
-#endif
 
 	if (kvm_check_request(KVM_REQ_WATCHDOG, vcpu)) {
 		vcpu->run->exit_reason = KVM_EXIT_WATCHDOG;
@@ -774,7 +700,6 @@ int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 	}
 	/* interrupts now hard-disabled */
 
-#ifdef CONFIG_PPC_FPU
 	/* Save userspace FPU state in stack */
 	enable_kernel_fp();
 
@@ -783,7 +708,6 @@ int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 	 * as always using the FPU.
 	 */
 	kvmppc_load_guest_fp(vcpu);
-#endif
 
 #ifdef CONFIG_ALTIVEC
 	/* Save userspace AltiVec state in stack */
@@ -814,9 +738,7 @@ int kvmppc_vcpu_run(struct kvm_vcpu *vcpu)
 	switch_booke_debug_regs(&debug);
 	current->thread.debug = debug;
 
-#ifdef CONFIG_PPC_FPU
 	kvmppc_save_guest_fp(vcpu);
-#endif
 
 #ifdef CONFIG_ALTIVEC
 	kvmppc_save_guest_altivec(vcpu);
@@ -948,12 +870,10 @@ static void kvmppc_restart_interrupt(struct kvm_vcpu *vcpu,
 		kvmppc_fill_pt_regs(&regs);
 		timer_interrupt(&regs);
 		break;
-#if defined(CONFIG_PPC_DOORBELL)
 	case BOOKE_INTERRUPT_DOORBELL:
 		kvmppc_fill_pt_regs(&regs);
 		doorbell_exception(&regs);
 		break;
-#endif
 	case BOOKE_INTERRUPT_MACHINE_CHECK:
 		/* FIXME */
 		break;
@@ -1172,49 +1092,6 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		r = RESUME_GUEST;
 		break;
 
-#ifdef CONFIG_SPE
-	case BOOKE_INTERRUPT_SPE_UNAVAIL: {
-		if (vcpu->arch.shared->msr & MSR_SPE)
-			kvmppc_vcpu_enable_spe(vcpu);
-		else
-			kvmppc_booke_queue_irqprio(vcpu,
-						   BOOKE_IRQPRIO_SPE_UNAVAIL);
-		r = RESUME_GUEST;
-		break;
-	}
-
-	case BOOKE_INTERRUPT_SPE_FP_DATA:
-		kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_SPE_FP_DATA);
-		r = RESUME_GUEST;
-		break;
-
-	case BOOKE_INTERRUPT_SPE_FP_ROUND:
-		kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_SPE_FP_ROUND);
-		r = RESUME_GUEST;
-		break;
-#elif defined(CONFIG_SPE_POSSIBLE)
-	case BOOKE_INTERRUPT_SPE_UNAVAIL:
-		/*
-		 * Guest wants SPE, but host kernel doesn't support it.  Send
-		 * an "unimplemented operation" program check to the guest.
-		 */
-		kvmppc_core_queue_program(vcpu, ESR_PUO | ESR_SPV);
-		r = RESUME_GUEST;
-		break;
-
-	/*
-	 * These really should never happen without CONFIG_SPE,
-	 * as we should never enable the real MSR[SPE] in the guest.
-	 */
-	case BOOKE_INTERRUPT_SPE_FP_DATA:
-	case BOOKE_INTERRUPT_SPE_FP_ROUND:
-		printk(KERN_CRIT "%s: unexpected SPE interrupt %u at %08lx\n",
-		       __func__, exit_nr, vcpu->arch.regs.nip);
-		run->hw.hardware_exit_reason = exit_nr;
-		r = RESUME_HOST;
-		break;
-#endif /* CONFIG_SPE_POSSIBLE */
-
 /*
  * On cores with Vector category, KVM is loaded only if CONFIG_ALTIVEC,
  * see kvmppc_e500mc_check_processor_compat().
@@ -1250,7 +1127,6 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		r = RESUME_GUEST;
 		break;
 
-#ifdef CONFIG_KVM_BOOKE_HV
 	case BOOKE_INTERRUPT_HV_SYSCALL:
 		if (!(vcpu->arch.shared->msr & MSR_PR)) {
 			kvmppc_set_gpr(vcpu, 3, kvmppc_kvm_pv(vcpu));
@@ -1264,21 +1140,6 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 
 		r = RESUME_GUEST;
 		break;
-#else
-	case BOOKE_INTERRUPT_SYSCALL:
-		if (!(vcpu->arch.shared->msr & MSR_PR) &&
-		    (((u32)kvmppc_get_gpr(vcpu, 0)) == KVM_SC_MAGIC_R0)) {
-			/* KVM PV hypercalls */
-			kvmppc_set_gpr(vcpu, 3, kvmppc_kvm_pv(vcpu));
-			r = RESUME_GUEST;
-		} else {
-			/* Guest syscalls */
-			kvmppc_booke_queue_irqprio(vcpu, BOOKE_IRQPRIO_SYSCALL);
-		}
-		kvmppc_account_exit(vcpu, SYSCALL_EXITS);
-		r = RESUME_GUEST;
-		break;
-#endif
 
 	case BOOKE_INTERRUPT_DTLB_MISS: {
 		unsigned long eaddr = vcpu->arch.fault_dear;
@@ -1286,17 +1147,6 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		gpa_t gpaddr;
 		gfn_t gfn;
 
-#ifdef CONFIG_KVM_E500V2
-		if (!(vcpu->arch.shared->msr & MSR_PR) &&
-		    (eaddr & PAGE_MASK) == vcpu->arch.magic_page_ea) {
-			kvmppc_map_magic(vcpu);
-			kvmppc_account_exit(vcpu, DTLB_VIRT_MISS_EXITS);
-			r = RESUME_GUEST;
-
-			break;
-		}
-#endif
-
 		/* Check the guest TLB. */
 		gtlb_index = kvmppc_mmu_dtlb_index(vcpu, eaddr);
 		if (gtlb_index < 0) {
@@ -1680,14 +1530,6 @@ int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_IAC2:
 		*val = get_reg_val(id, vcpu->arch.dbg_reg.iac2);
 		break;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-	case KVM_REG_PPC_IAC3:
-		*val = get_reg_val(id, vcpu->arch.dbg_reg.iac3);
-		break;
-	case KVM_REG_PPC_IAC4:
-		*val = get_reg_val(id, vcpu->arch.dbg_reg.iac4);
-		break;
-#endif
 	case KVM_REG_PPC_DAC1:
 		*val = get_reg_val(id, vcpu->arch.dbg_reg.dac1);
 		break;
@@ -1699,11 +1541,9 @@ int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, epr);
 		break;
 	}
-#if defined(CONFIG_64BIT)
 	case KVM_REG_PPC_EPCR:
 		*val = get_reg_val(id, vcpu->arch.epcr);
 		break;
-#endif
 	case KVM_REG_PPC_TCR:
 		*val = get_reg_val(id, vcpu->arch.tcr);
 		break;
@@ -1736,14 +1576,6 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_IAC2:
 		vcpu->arch.dbg_reg.iac2 = set_reg_val(id, *val);
 		break;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-	case KVM_REG_PPC_IAC3:
-		vcpu->arch.dbg_reg.iac3 = set_reg_val(id, *val);
-		break;
-	case KVM_REG_PPC_IAC4:
-		vcpu->arch.dbg_reg.iac4 = set_reg_val(id, *val);
-		break;
-#endif
 	case KVM_REG_PPC_DAC1:
 		vcpu->arch.dbg_reg.dac1 = set_reg_val(id, *val);
 		break;
@@ -1755,13 +1587,11 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 		kvmppc_set_epr(vcpu, new_epr);
 		break;
 	}
-#if defined(CONFIG_64BIT)
 	case KVM_REG_PPC_EPCR: {
 		u32 new_epcr = set_reg_val(id, *val);
 		kvmppc_set_epcr(vcpu, new_epcr);
 		break;
 	}
-#endif
 	case KVM_REG_PPC_OR_TSR: {
 		u32 tsr_bits = set_reg_val(id, *val);
 		kvmppc_set_tsr_bits(vcpu, tsr_bits);
@@ -1849,14 +1679,10 @@ void kvmppc_core_flush_memslot(struct kvm *kvm, struct kvm_memory_slot *memslot)
 
 void kvmppc_set_epcr(struct kvm_vcpu *vcpu, u32 new_epcr)
 {
-#if defined(CONFIG_64BIT)
 	vcpu->arch.epcr = new_epcr;
-#ifdef CONFIG_KVM_BOOKE_HV
 	vcpu->arch.shadow_epcr &= ~SPRN_EPCR_GICM;
 	if (vcpu->arch.epcr  & SPRN_EPCR_ICM)
 		vcpu->arch.shadow_epcr |= SPRN_EPCR_GICM;
-#endif
-#endif
 }
 
 void kvmppc_set_tcr(struct kvm_vcpu *vcpu, u32 new_tcr)
@@ -1910,16 +1736,6 @@ static int kvmppc_booke_add_breakpoint(struct debug_reg *dbg_reg,
 		dbg_reg->dbcr0 |= DBCR0_IAC2;
 		dbg_reg->iac2 = addr;
 		break;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-	case 2:
-		dbg_reg->dbcr0 |= DBCR0_IAC3;
-		dbg_reg->iac3 = addr;
-		break;
-	case 3:
-		dbg_reg->dbcr0 |= DBCR0_IAC4;
-		dbg_reg->iac4 = addr;
-		break;
-#endif
 	default:
 		return -EINVAL;
 	}
@@ -1956,8 +1772,6 @@ static int kvmppc_booke_add_watchpoint(struct debug_reg *dbg_reg, uint64_t addr,
 static void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap,
 				  bool set)
 {
-	/* XXX: Add similar MSR protection for BookE-PR */
-#ifdef CONFIG_KVM_BOOKE_HV
 	BUG_ON(prot_bitmap & ~(MSRP_UCLEP | MSRP_DEP | MSRP_PMMP));
 	if (set) {
 		if (prot_bitmap & MSR_UCLE)
@@ -1974,7 +1788,6 @@ static void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap,
 		if (prot_bitmap & MSR_PMM)
 			vcpu->arch.shadow_msrp &= ~MSRP_PMMP;
 	}
-#endif
 }
 
 int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr, enum xlate_instdata xlid,
@@ -1983,21 +1796,6 @@ int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr, enum xlate_instdata xlid,
 	int gtlb_index;
 	gpa_t gpaddr;
 
-#ifdef CONFIG_KVM_E500V2
-	if (!(vcpu->arch.shared->msr & MSR_PR) &&
-	    (eaddr & PAGE_MASK) == vcpu->arch.magic_page_ea) {
-		pte->eaddr = eaddr;
-		pte->raddr = (vcpu->arch.magic_page_pa & PAGE_MASK) |
-			     (eaddr & ~PAGE_MASK);
-		pte->vpage = eaddr >> PAGE_SHIFT;
-		pte->may_read = true;
-		pte->may_write = true;
-		pte->may_execute = true;
-
-		return 0;
-	}
-#endif
-
 	/* Check the guest TLB. */
 	switch (xlid) {
 	case XLATE_INST:
@@ -2054,23 +1852,12 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	/* Code below handles only HW breakpoints */
 	dbg_reg = &(vcpu->arch.dbg_reg);
 
-#ifdef CONFIG_KVM_BOOKE_HV
 	/*
 	 * On BookE-HV (e500mc) the guest is always executed with MSR.GS=1
 	 * DBCR1 and DBCR2 are set to trigger debug events when MSR.PR is 0
 	 */
 	dbg_reg->dbcr1 = 0;
 	dbg_reg->dbcr2 = 0;
-#else
-	/*
-	 * On BookE-PR (e500v2) the guest is always executed with MSR.PR=1
-	 * We set DBCR1 and DBCR2 to only trigger debug events when MSR.PR
-	 * is set.
-	 */
-	dbg_reg->dbcr1 = DBCR1_IAC1US | DBCR1_IAC2US | DBCR1_IAC3US |
-			  DBCR1_IAC4US;
-	dbg_reg->dbcr2 = DBCR2_DAC1US | DBCR2_DAC2US;
-#endif
 
 	if (!(vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP))
 		goto out;
@@ -2141,12 +1928,6 @@ int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu)
 	kvmppc_set_gpr(vcpu, 1, (16<<20) - 8); /* -8 for the callee-save LR slot */
 	kvmppc_set_msr(vcpu, 0);
 
-#ifndef CONFIG_KVM_BOOKE_HV
-	vcpu->arch.shadow_msr = MSR_USER | MSR_IS | MSR_DS;
-	vcpu->arch.shadow_pid = 1;
-	vcpu->arch.shared->msr = 0;
-#endif
-
 	/* Eye-catching numbers so we know if the guest takes an interrupt
 	 * before it's programmed its own IVPR/IVORs. */
 	vcpu->arch.ivpr = 0x55550000;
@@ -2184,59 +1965,10 @@ void kvmppc_core_vcpu_put(struct kvm_vcpu *vcpu)
 
 int __init kvmppc_booke_init(void)
 {
-#ifndef CONFIG_KVM_BOOKE_HV
-	unsigned long ivor[16];
-	unsigned long *handler = kvmppc_booke_handler_addr;
-	unsigned long max_ivor = 0;
-	unsigned long handler_len;
-	int i;
-
-	/* We install our own exception handlers by hijacking IVPR. IVPR must
-	 * be 16-bit aligned, so we need a 64KB allocation. */
-	kvmppc_booke_handlers = __get_free_pages(GFP_KERNEL | __GFP_ZERO,
-	                                         VCPU_SIZE_ORDER);
-	if (!kvmppc_booke_handlers)
-		return -ENOMEM;
-
-	/* XXX make sure our handlers are smaller than Linux's */
-
-	/* Copy our interrupt handlers to match host IVORs. That way we don't
-	 * have to swap the IVORs on every guest/host transition. */
-	ivor[0] = mfspr(SPRN_IVOR0);
-	ivor[1] = mfspr(SPRN_IVOR1);
-	ivor[2] = mfspr(SPRN_IVOR2);
-	ivor[3] = mfspr(SPRN_IVOR3);
-	ivor[4] = mfspr(SPRN_IVOR4);
-	ivor[5] = mfspr(SPRN_IVOR5);
-	ivor[6] = mfspr(SPRN_IVOR6);
-	ivor[7] = mfspr(SPRN_IVOR7);
-	ivor[8] = mfspr(SPRN_IVOR8);
-	ivor[9] = mfspr(SPRN_IVOR9);
-	ivor[10] = mfspr(SPRN_IVOR10);
-	ivor[11] = mfspr(SPRN_IVOR11);
-	ivor[12] = mfspr(SPRN_IVOR12);
-	ivor[13] = mfspr(SPRN_IVOR13);
-	ivor[14] = mfspr(SPRN_IVOR14);
-	ivor[15] = mfspr(SPRN_IVOR15);
-
-	for (i = 0; i < 16; i++) {
-		if (ivor[i] > max_ivor)
-			max_ivor = i;
-
-		handler_len = handler[i + 1] - handler[i];
-		memcpy((void *)kvmppc_booke_handlers + ivor[i],
-		       (void *)handler[i], handler_len);
-	}
-
-	handler_len = handler[max_ivor + 1] - handler[max_ivor];
-	flush_icache_range(kvmppc_booke_handlers, kvmppc_booke_handlers +
-			   ivor[max_ivor] + handler_len);
-#endif /* !BOOKE_HV */
 	return 0;
 }
 
 void __exit kvmppc_booke_exit(void)
 {
-	free_pages(kvmppc_booke_handlers, VCPU_SIZE_ORDER);
 	kvm_exit();
 }
diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
index 9c5b8e76014f..72a8d2a0b0a2 100644
--- a/arch/powerpc/kvm/booke.h
+++ b/arch/powerpc/kvm/booke.h
@@ -21,15 +21,8 @@
 #define BOOKE_IRQPRIO_ALIGNMENT 2
 #define BOOKE_IRQPRIO_PROGRAM 3
 #define BOOKE_IRQPRIO_FP_UNAVAIL 4
-#ifdef CONFIG_SPE_POSSIBLE
-#define BOOKE_IRQPRIO_SPE_UNAVAIL 5
-#define BOOKE_IRQPRIO_SPE_FP_DATA 6
-#define BOOKE_IRQPRIO_SPE_FP_ROUND 7
-#endif
-#ifdef CONFIG_PPC_E500MC
 #define BOOKE_IRQPRIO_ALTIVEC_UNAVAIL 5
 #define BOOKE_IRQPRIO_ALTIVEC_ASSIST 6
-#endif
 #define BOOKE_IRQPRIO_SYSCALL 8
 #define BOOKE_IRQPRIO_AP_UNAVAIL 9
 #define BOOKE_IRQPRIO_DTLB_MISS 10
@@ -59,7 +52,6 @@
 			  (1 << BOOKE_IRQPRIO_WATCHDOG) | \
 			  (1 << BOOKE_IRQPRIO_CRITICAL))
 
-extern unsigned long kvmppc_booke_handlers;
 extern unsigned long kvmppc_booke_handler_addr[];
 
 void kvmppc_set_msr(struct kvm_vcpu *vcpu, u32 new_msr);
diff --git a/arch/powerpc/kvm/booke_emulate.c b/arch/powerpc/kvm/booke_emulate.c
index d8d38aca71bd..131159caa0ec 100644
--- a/arch/powerpc/kvm/booke_emulate.c
+++ b/arch/powerpc/kvm/booke_emulate.c
@@ -163,30 +163,6 @@ int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 		debug_inst = true;
 		vcpu->arch.dbg_reg.iac2 = spr_val;
 		break;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-	case SPRN_IAC3:
-		/*
-		 * If userspace is debugging guest then guest
-		 * can not access debug registers.
-		 */
-		if (vcpu->guest_debug)
-			break;
-
-		debug_inst = true;
-		vcpu->arch.dbg_reg.iac3 = spr_val;
-		break;
-	case SPRN_IAC4:
-		/*
-		 * If userspace is debugging guest then guest
-		 * can not access debug registers.
-		 */
-		if (vcpu->guest_debug)
-			break;
-
-		debug_inst = true;
-		vcpu->arch.dbg_reg.iac4 = spr_val;
-		break;
-#endif
 	case SPRN_DAC1:
 		/*
 		 * If userspace is debugging guest then guest
@@ -296,9 +272,7 @@ int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 
 	case SPRN_IVPR:
 		vcpu->arch.ivpr = spr_val;
-#ifdef CONFIG_KVM_BOOKE_HV
 		mtspr(SPRN_GIVPR, spr_val);
-#endif
 		break;
 	case SPRN_IVOR0:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_CRITICAL] = spr_val;
@@ -308,9 +282,7 @@ int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 		break;
 	case SPRN_IVOR2:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_DATA_STORAGE] = spr_val;
-#ifdef CONFIG_KVM_BOOKE_HV
 		mtspr(SPRN_GIVOR2, spr_val);
-#endif
 		break;
 	case SPRN_IVOR3:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_INST_STORAGE] = spr_val;
@@ -329,9 +301,7 @@ int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 		break;
 	case SPRN_IVOR8:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_SYSCALL] = spr_val;
-#ifdef CONFIG_KVM_BOOKE_HV
 		mtspr(SPRN_GIVOR8, spr_val);
-#endif
 		break;
 	case SPRN_IVOR9:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_AP_UNAVAIL] = spr_val;
@@ -357,14 +327,10 @@ int kvmppc_booke_emulate_mtspr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 	case SPRN_MCSR:
 		vcpu->arch.mcsr &= ~spr_val;
 		break;
-#if defined(CONFIG_64BIT)
 	case SPRN_EPCR:
 		kvmppc_set_epcr(vcpu, spr_val);
-#ifdef CONFIG_KVM_BOOKE_HV
 		mtspr(SPRN_EPCR, vcpu->arch.shadow_epcr);
-#endif
 		break;
-#endif
 	default:
 		emulated = EMULATE_FAIL;
 	}
@@ -411,14 +377,6 @@ int kvmppc_booke_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val)
 	case SPRN_IAC2:
 		*spr_val = vcpu->arch.dbg_reg.iac2;
 		break;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-	case SPRN_IAC3:
-		*spr_val = vcpu->arch.dbg_reg.iac3;
-		break;
-	case SPRN_IAC4:
-		*spr_val = vcpu->arch.dbg_reg.iac4;
-		break;
-#endif
 	case SPRN_DAC1:
 		*spr_val = vcpu->arch.dbg_reg.dac1;
 		break;
@@ -497,11 +455,9 @@ int kvmppc_booke_emulate_mfspr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val)
 	case SPRN_MCSR:
 		*spr_val = vcpu->arch.mcsr;
 		break;
-#if defined(CONFIG_64BIT)
 	case SPRN_EPCR:
 		*spr_val = vcpu->arch.epcr;
 		break;
-#endif
 
 	default:
 		emulated = EMULATE_FAIL;
diff --git a/arch/powerpc/kvm/booke_interrupts.S b/arch/powerpc/kvm/booke_interrupts.S
deleted file mode 100644
index 205545d820a1..000000000000
--- a/arch/powerpc/kvm/booke_interrupts.S
+++ /dev/null
@@ -1,535 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *
- * Copyright IBM Corp. 2007
- * Copyright 2011 Freescale Semiconductor, Inc.
- *
- * Authors: Hollis Blanchard <hollisb@us.ibm.com>
- */
-
-#include <asm/ppc_asm.h>
-#include <asm/kvm_asm.h>
-#include <asm/reg.h>
-#include <asm/page.h>
-#include <asm/asm-offsets.h>
-
-/* The host stack layout: */
-#define HOST_R1         0 /* Implied by stwu. */
-#define HOST_CALLEE_LR  4
-#define HOST_RUN        8
-/* r2 is special: it holds 'current', and it made nonvolatile in the
- * kernel with the -ffixed-r2 gcc option. */
-#define HOST_R2         12
-#define HOST_CR         16
-#define HOST_NV_GPRS    20
-#define __HOST_NV_GPR(n)  (HOST_NV_GPRS + ((n - 14) * 4))
-#define HOST_NV_GPR(n)  __HOST_NV_GPR(__REG_##n)
-#define HOST_MIN_STACK_SIZE (HOST_NV_GPR(R31) + 4)
-#define HOST_STACK_SIZE (((HOST_MIN_STACK_SIZE + 15) / 16) * 16) /* Align. */
-#define HOST_STACK_LR   (HOST_STACK_SIZE + 4) /* In caller stack frame. */
-
-#define NEED_INST_MASK ((1<<BOOKE_INTERRUPT_PROGRAM) | \
-                        (1<<BOOKE_INTERRUPT_DTLB_MISS) | \
-                        (1<<BOOKE_INTERRUPT_DEBUG))
-
-#define NEED_DEAR_MASK ((1<<BOOKE_INTERRUPT_DATA_STORAGE) | \
-                        (1<<BOOKE_INTERRUPT_DTLB_MISS) | \
-                        (1<<BOOKE_INTERRUPT_ALIGNMENT))
-
-#define NEED_ESR_MASK ((1<<BOOKE_INTERRUPT_DATA_STORAGE) | \
-                       (1<<BOOKE_INTERRUPT_INST_STORAGE) | \
-                       (1<<BOOKE_INTERRUPT_PROGRAM) | \
-                       (1<<BOOKE_INTERRUPT_DTLB_MISS) | \
-                       (1<<BOOKE_INTERRUPT_ALIGNMENT))
-
-.macro __KVM_HANDLER ivor_nr scratch srr0
-	/* Get pointer to vcpu and record exit number. */
-	mtspr	\scratch , r4
-	mfspr   r4, SPRN_SPRG_THREAD
-	lwz     r4, THREAD_KVM_VCPU(r4)
-	stw	r3, VCPU_GPR(R3)(r4)
-	stw	r5, VCPU_GPR(R5)(r4)
-	stw	r6, VCPU_GPR(R6)(r4)
-	mfspr	r3, \scratch
-	mfctr	r5
-	stw	r3, VCPU_GPR(R4)(r4)
-	stw	r5, VCPU_CTR(r4)
-	mfspr	r3, \srr0
-	lis	r6, kvmppc_resume_host@h
-	stw	r3, VCPU_PC(r4)
-	li	r5, \ivor_nr
-	ori	r6, r6, kvmppc_resume_host@l
-	mtctr	r6
-	bctr
-.endm
-
-.macro KVM_HANDLER ivor_nr scratch srr0
-_GLOBAL(kvmppc_handler_\ivor_nr)
-	__KVM_HANDLER \ivor_nr \scratch \srr0
-.endm
-
-.macro KVM_DBG_HANDLER ivor_nr scratch srr0
-_GLOBAL(kvmppc_handler_\ivor_nr)
-	mtspr   \scratch, r4
-	mfspr	r4, SPRN_SPRG_THREAD
-	lwz	r4, THREAD_KVM_VCPU(r4)
-	stw	r3, VCPU_CRIT_SAVE(r4)
-	mfcr	r3
-	mfspr	r4, SPRN_CSRR1
-	andi.	r4, r4, MSR_PR
-	bne	1f
-	/* debug interrupt happened in enter/exit path */
-	mfspr   r4, SPRN_CSRR1
-	rlwinm  r4, r4, 0, ~MSR_DE
-	mtspr   SPRN_CSRR1, r4
-	lis	r4, 0xffff
-	ori	r4, r4, 0xffff
-	mtspr	SPRN_DBSR, r4
-	mfspr	r4, SPRN_SPRG_THREAD
-	lwz	r4, THREAD_KVM_VCPU(r4)
-	mtcr	r3
-	lwz     r3, VCPU_CRIT_SAVE(r4)
-	mfspr   r4, \scratch
-	rfci
-1:	/* debug interrupt happened in guest */
-	mtcr	r3
-	mfspr	r4, SPRN_SPRG_THREAD
-	lwz	r4, THREAD_KVM_VCPU(r4)
-	lwz     r3, VCPU_CRIT_SAVE(r4)
-	mfspr   r4, \scratch
-	__KVM_HANDLER \ivor_nr \scratch \srr0
-.endm
-
-.macro KVM_HANDLER_ADDR ivor_nr
-	.long	kvmppc_handler_\ivor_nr
-.endm
-
-.macro KVM_HANDLER_END
-	.long	kvmppc_handlers_end
-.endm
-
-_GLOBAL(kvmppc_handlers_start)
-KVM_HANDLER BOOKE_INTERRUPT_CRITICAL SPRN_SPRG_RSCRATCH_CRIT SPRN_CSRR0
-KVM_HANDLER BOOKE_INTERRUPT_MACHINE_CHECK  SPRN_SPRG_RSCRATCH_MC SPRN_MCSRR0
-KVM_HANDLER BOOKE_INTERRUPT_DATA_STORAGE SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_INST_STORAGE SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_EXTERNAL SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_ALIGNMENT SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_PROGRAM SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_FP_UNAVAIL SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_SYSCALL SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_AP_UNAVAIL SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_DECREMENTER SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_FIT SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_WATCHDOG SPRN_SPRG_RSCRATCH_CRIT SPRN_CSRR0
-KVM_HANDLER BOOKE_INTERRUPT_DTLB_MISS SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_ITLB_MISS SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_DBG_HANDLER BOOKE_INTERRUPT_DEBUG SPRN_SPRG_RSCRATCH_CRIT SPRN_CSRR0
-KVM_HANDLER BOOKE_INTERRUPT_SPE_UNAVAIL SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_SPE_FP_DATA SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-KVM_HANDLER BOOKE_INTERRUPT_SPE_FP_ROUND SPRN_SPRG_RSCRATCH0 SPRN_SRR0
-_GLOBAL(kvmppc_handlers_end)
-
-/* Registers:
- *  SPRG_SCRATCH0: guest r4
- *  r4: vcpu pointer
- *  r5: KVM exit number
- */
-_GLOBAL(kvmppc_resume_host)
-	mfcr	r3
-	stw	r3, VCPU_CR(r4)
-	stw	r7, VCPU_GPR(R7)(r4)
-	stw	r8, VCPU_GPR(R8)(r4)
-	stw	r9, VCPU_GPR(R9)(r4)
-
-	li	r6, 1
-	slw	r6, r6, r5
-
-#ifdef CONFIG_KVM_EXIT_TIMING
-	/* save exit time */
-1:
-	mfspr	r7, SPRN_TBRU
-	mfspr	r8, SPRN_TBRL
-	mfspr	r9, SPRN_TBRU
-	cmpw	r9, r7
-	bne	1b
-	stw	r8, VCPU_TIMING_EXIT_TBL(r4)
-	stw	r9, VCPU_TIMING_EXIT_TBU(r4)
-#endif
-
-	/* Save the faulting instruction and all GPRs for emulation. */
-	andi.	r7, r6, NEED_INST_MASK
-	beq	..skip_inst_copy
-	mfspr	r9, SPRN_SRR0
-	mfmsr	r8
-	ori	r7, r8, MSR_DS
-	mtmsr	r7
-	isync
-	lwz	r9, 0(r9)
-	mtmsr	r8
-	isync
-	stw	r9, VCPU_LAST_INST(r4)
-
-	stw	r15, VCPU_GPR(R15)(r4)
-	stw	r16, VCPU_GPR(R16)(r4)
-	stw	r17, VCPU_GPR(R17)(r4)
-	stw	r18, VCPU_GPR(R18)(r4)
-	stw	r19, VCPU_GPR(R19)(r4)
-	stw	r20, VCPU_GPR(R20)(r4)
-	stw	r21, VCPU_GPR(R21)(r4)
-	stw	r22, VCPU_GPR(R22)(r4)
-	stw	r23, VCPU_GPR(R23)(r4)
-	stw	r24, VCPU_GPR(R24)(r4)
-	stw	r25, VCPU_GPR(R25)(r4)
-	stw	r26, VCPU_GPR(R26)(r4)
-	stw	r27, VCPU_GPR(R27)(r4)
-	stw	r28, VCPU_GPR(R28)(r4)
-	stw	r29, VCPU_GPR(R29)(r4)
-	stw	r30, VCPU_GPR(R30)(r4)
-	stw	r31, VCPU_GPR(R31)(r4)
-..skip_inst_copy:
-
-	/* Also grab DEAR and ESR before the host can clobber them. */
-
-	andi.	r7, r6, NEED_DEAR_MASK
-	beq	..skip_dear
-	mfspr	r9, SPRN_DEAR
-	stw	r9, VCPU_FAULT_DEAR(r4)
-..skip_dear:
-
-	andi.	r7, r6, NEED_ESR_MASK
-	beq	..skip_esr
-	mfspr	r9, SPRN_ESR
-	stw	r9, VCPU_FAULT_ESR(r4)
-..skip_esr:
-
-	/* Save remaining volatile guest register state to vcpu. */
-	stw	r0, VCPU_GPR(R0)(r4)
-	stw	r1, VCPU_GPR(R1)(r4)
-	stw	r2, VCPU_GPR(R2)(r4)
-	stw	r10, VCPU_GPR(R10)(r4)
-	stw	r11, VCPU_GPR(R11)(r4)
-	stw	r12, VCPU_GPR(R12)(r4)
-	stw	r13, VCPU_GPR(R13)(r4)
-	stw	r14, VCPU_GPR(R14)(r4) /* We need a NV GPR below. */
-	mflr	r3
-	stw	r3, VCPU_LR(r4)
-	mfxer	r3
-	stw	r3, VCPU_XER(r4)
-
-	/* Restore host stack pointer and PID before IVPR, since the host
-	 * exception handlers use them. */
-	lwz	r1, VCPU_HOST_STACK(r4)
-	lwz	r3, VCPU_HOST_PID(r4)
-	mtspr	SPRN_PID, r3
-
-#ifdef CONFIG_PPC_85xx
-	/* we cheat and know that Linux doesn't use PID1 which is always 0 */
-	lis	r3, 0
-	mtspr	SPRN_PID1, r3
-#endif
-
-	/* Restore host IVPR before re-enabling interrupts. We cheat and know
-	 * that Linux IVPR is always 0xc0000000. */
-	lis	r3, 0xc000
-	mtspr	SPRN_IVPR, r3
-
-	/* Switch to kernel stack and jump to handler. */
-	LOAD_REG_ADDR(r3, kvmppc_handle_exit)
-	mtctr	r3
-	mr	r3, r4
-	lwz	r2, HOST_R2(r1)
-	mr	r14, r4 /* Save vcpu pointer. */
-
-	bctrl	/* kvmppc_handle_exit() */
-
-	/* Restore vcpu pointer and the nonvolatiles we used. */
-	mr	r4, r14
-	lwz	r14, VCPU_GPR(R14)(r4)
-
-	/* Sometimes instruction emulation must restore complete GPR state. */
-	andi.	r5, r3, RESUME_FLAG_NV
-	beq	..skip_nv_load
-	lwz	r15, VCPU_GPR(R15)(r4)
-	lwz	r16, VCPU_GPR(R16)(r4)
-	lwz	r17, VCPU_GPR(R17)(r4)
-	lwz	r18, VCPU_GPR(R18)(r4)
-	lwz	r19, VCPU_GPR(R19)(r4)
-	lwz	r20, VCPU_GPR(R20)(r4)
-	lwz	r21, VCPU_GPR(R21)(r4)
-	lwz	r22, VCPU_GPR(R22)(r4)
-	lwz	r23, VCPU_GPR(R23)(r4)
-	lwz	r24, VCPU_GPR(R24)(r4)
-	lwz	r25, VCPU_GPR(R25)(r4)
-	lwz	r26, VCPU_GPR(R26)(r4)
-	lwz	r27, VCPU_GPR(R27)(r4)
-	lwz	r28, VCPU_GPR(R28)(r4)
-	lwz	r29, VCPU_GPR(R29)(r4)
-	lwz	r30, VCPU_GPR(R30)(r4)
-	lwz	r31, VCPU_GPR(R31)(r4)
-..skip_nv_load:
-
-	/* Should we return to the guest? */
-	andi.	r5, r3, RESUME_FLAG_HOST
-	beq	lightweight_exit
-
-	srawi	r3, r3, 2 /* Shift -ERR back down. */
-
-heavyweight_exit:
-	/* Not returning to guest. */
-
-#ifdef CONFIG_SPE
-	/* save guest SPEFSCR and load host SPEFSCR */
-	mfspr	r9, SPRN_SPEFSCR
-	stw	r9, VCPU_SPEFSCR(r4)
-	lwz	r9, VCPU_HOST_SPEFSCR(r4)
-	mtspr	SPRN_SPEFSCR, r9
-#endif
-
-	/* We already saved guest volatile register state; now save the
-	 * non-volatiles. */
-	stw	r15, VCPU_GPR(R15)(r4)
-	stw	r16, VCPU_GPR(R16)(r4)
-	stw	r17, VCPU_GPR(R17)(r4)
-	stw	r18, VCPU_GPR(R18)(r4)
-	stw	r19, VCPU_GPR(R19)(r4)
-	stw	r20, VCPU_GPR(R20)(r4)
-	stw	r21, VCPU_GPR(R21)(r4)
-	stw	r22, VCPU_GPR(R22)(r4)
-	stw	r23, VCPU_GPR(R23)(r4)
-	stw	r24, VCPU_GPR(R24)(r4)
-	stw	r25, VCPU_GPR(R25)(r4)
-	stw	r26, VCPU_GPR(R26)(r4)
-	stw	r27, VCPU_GPR(R27)(r4)
-	stw	r28, VCPU_GPR(R28)(r4)
-	stw	r29, VCPU_GPR(R29)(r4)
-	stw	r30, VCPU_GPR(R30)(r4)
-	stw	r31, VCPU_GPR(R31)(r4)
-
-	/* Load host non-volatile register state from host stack. */
-	lwz	r14, HOST_NV_GPR(R14)(r1)
-	lwz	r15, HOST_NV_GPR(R15)(r1)
-	lwz	r16, HOST_NV_GPR(R16)(r1)
-	lwz	r17, HOST_NV_GPR(R17)(r1)
-	lwz	r18, HOST_NV_GPR(R18)(r1)
-	lwz	r19, HOST_NV_GPR(R19)(r1)
-	lwz	r20, HOST_NV_GPR(R20)(r1)
-	lwz	r21, HOST_NV_GPR(R21)(r1)
-	lwz	r22, HOST_NV_GPR(R22)(r1)
-	lwz	r23, HOST_NV_GPR(R23)(r1)
-	lwz	r24, HOST_NV_GPR(R24)(r1)
-	lwz	r25, HOST_NV_GPR(R25)(r1)
-	lwz	r26, HOST_NV_GPR(R26)(r1)
-	lwz	r27, HOST_NV_GPR(R27)(r1)
-	lwz	r28, HOST_NV_GPR(R28)(r1)
-	lwz	r29, HOST_NV_GPR(R29)(r1)
-	lwz	r30, HOST_NV_GPR(R30)(r1)
-	lwz	r31, HOST_NV_GPR(R31)(r1)
-
-	/* Return to kvm_vcpu_run(). */
-	lwz	r4, HOST_STACK_LR(r1)
-	lwz	r5, HOST_CR(r1)
-	addi	r1, r1, HOST_STACK_SIZE
-	mtlr	r4
-	mtcr	r5
-	/* r3 still contains the return code from kvmppc_handle_exit(). */
-	blr
-
-
-/* Registers:
- *  r3: vcpu pointer
- */
-_GLOBAL(__kvmppc_vcpu_run)
-	stwu	r1, -HOST_STACK_SIZE(r1)
-	stw	r1, VCPU_HOST_STACK(r3)	/* Save stack pointer to vcpu. */
-
-	/* Save host state to stack. */
-	mr	r4, r3
-	mflr	r3
-	stw	r3, HOST_STACK_LR(r1)
-	mfcr	r5
-	stw	r5, HOST_CR(r1)
-
-	/* Save host non-volatile register state to stack. */
-	stw	r14, HOST_NV_GPR(R14)(r1)
-	stw	r15, HOST_NV_GPR(R15)(r1)
-	stw	r16, HOST_NV_GPR(R16)(r1)
-	stw	r17, HOST_NV_GPR(R17)(r1)
-	stw	r18, HOST_NV_GPR(R18)(r1)
-	stw	r19, HOST_NV_GPR(R19)(r1)
-	stw	r20, HOST_NV_GPR(R20)(r1)
-	stw	r21, HOST_NV_GPR(R21)(r1)
-	stw	r22, HOST_NV_GPR(R22)(r1)
-	stw	r23, HOST_NV_GPR(R23)(r1)
-	stw	r24, HOST_NV_GPR(R24)(r1)
-	stw	r25, HOST_NV_GPR(R25)(r1)
-	stw	r26, HOST_NV_GPR(R26)(r1)
-	stw	r27, HOST_NV_GPR(R27)(r1)
-	stw	r28, HOST_NV_GPR(R28)(r1)
-	stw	r29, HOST_NV_GPR(R29)(r1)
-	stw	r30, HOST_NV_GPR(R30)(r1)
-	stw	r31, HOST_NV_GPR(R31)(r1)
-
-	/* Load guest non-volatiles. */
-	lwz	r14, VCPU_GPR(R14)(r4)
-	lwz	r15, VCPU_GPR(R15)(r4)
-	lwz	r16, VCPU_GPR(R16)(r4)
-	lwz	r17, VCPU_GPR(R17)(r4)
-	lwz	r18, VCPU_GPR(R18)(r4)
-	lwz	r19, VCPU_GPR(R19)(r4)
-	lwz	r20, VCPU_GPR(R20)(r4)
-	lwz	r21, VCPU_GPR(R21)(r4)
-	lwz	r22, VCPU_GPR(R22)(r4)
-	lwz	r23, VCPU_GPR(R23)(r4)
-	lwz	r24, VCPU_GPR(R24)(r4)
-	lwz	r25, VCPU_GPR(R25)(r4)
-	lwz	r26, VCPU_GPR(R26)(r4)
-	lwz	r27, VCPU_GPR(R27)(r4)
-	lwz	r28, VCPU_GPR(R28)(r4)
-	lwz	r29, VCPU_GPR(R29)(r4)
-	lwz	r30, VCPU_GPR(R30)(r4)
-	lwz	r31, VCPU_GPR(R31)(r4)
-
-#ifdef CONFIG_SPE
-	/* save host SPEFSCR and load guest SPEFSCR */
-	mfspr	r3, SPRN_SPEFSCR
-	stw	r3, VCPU_HOST_SPEFSCR(r4)
-	lwz	r3, VCPU_SPEFSCR(r4)
-	mtspr	SPRN_SPEFSCR, r3
-#endif
-
-lightweight_exit:
-	stw	r2, HOST_R2(r1)
-
-	mfspr	r3, SPRN_PID
-	stw	r3, VCPU_HOST_PID(r4)
-	lwz	r3, VCPU_SHADOW_PID(r4)
-	mtspr	SPRN_PID, r3
-
-#ifdef CONFIG_PPC_85xx
-	lwz	r3, VCPU_SHADOW_PID1(r4)
-	mtspr	SPRN_PID1, r3
-#endif
-
-	/* Load some guest volatiles. */
-	lwz	r0, VCPU_GPR(R0)(r4)
-	lwz	r2, VCPU_GPR(R2)(r4)
-	lwz	r9, VCPU_GPR(R9)(r4)
-	lwz	r10, VCPU_GPR(R10)(r4)
-	lwz	r11, VCPU_GPR(R11)(r4)
-	lwz	r12, VCPU_GPR(R12)(r4)
-	lwz	r13, VCPU_GPR(R13)(r4)
-	lwz	r3, VCPU_LR(r4)
-	mtlr	r3
-	lwz	r3, VCPU_XER(r4)
-	mtxer	r3
-
-	/* Switch the IVPR. XXX If we take a TLB miss after this we're screwed,
-	 * so how do we make sure vcpu won't fault? */
-	lis	r8, kvmppc_booke_handlers@ha
-	lwz	r8, kvmppc_booke_handlers@l(r8)
-	mtspr	SPRN_IVPR, r8
-
-	lwz	r5, VCPU_SHARED(r4)
-
-	/* Can't switch the stack pointer until after IVPR is switched,
-	 * because host interrupt handlers would get confused. */
-	lwz	r1, VCPU_GPR(R1)(r4)
-
-	/*
-	 * Host interrupt handlers may have clobbered these
-	 * guest-readable SPRGs, or the guest kernel may have
-	 * written directly to the shared area, so we
-	 * need to reload them here with the guest's values.
-	 */
-	PPC_LD(r3, VCPU_SHARED_SPRG4, r5)
-	mtspr	SPRN_SPRG4W, r3
-	PPC_LD(r3, VCPU_SHARED_SPRG5, r5)
-	mtspr	SPRN_SPRG5W, r3
-	PPC_LD(r3, VCPU_SHARED_SPRG6, r5)
-	mtspr	SPRN_SPRG6W, r3
-	PPC_LD(r3, VCPU_SHARED_SPRG7, r5)
-	mtspr	SPRN_SPRG7W, r3
-
-#ifdef CONFIG_KVM_EXIT_TIMING
-	/* save enter time */
-1:
-	mfspr	r6, SPRN_TBRU
-	mfspr	r7, SPRN_TBRL
-	mfspr	r8, SPRN_TBRU
-	cmpw	r8, r6
-	bne	1b
-	stw	r7, VCPU_TIMING_LAST_ENTER_TBL(r4)
-	stw	r8, VCPU_TIMING_LAST_ENTER_TBU(r4)
-#endif
-
-	/* Finish loading guest volatiles and jump to guest. */
-	lwz	r3, VCPU_CTR(r4)
-	lwz	r5, VCPU_CR(r4)
-	lwz	r6, VCPU_PC(r4)
-	lwz	r7, VCPU_SHADOW_MSR(r4)
-	mtctr	r3
-	mtcr	r5
-	mtsrr0	r6
-	mtsrr1	r7
-	lwz	r5, VCPU_GPR(R5)(r4)
-	lwz	r6, VCPU_GPR(R6)(r4)
-	lwz	r7, VCPU_GPR(R7)(r4)
-	lwz	r8, VCPU_GPR(R8)(r4)
-
-	/* Clear any debug events which occurred since we disabled MSR[DE].
-	 * XXX This gives us a 3-instruction window in which a breakpoint
-	 * intended for guest context could fire in the host instead. */
-	lis	r3, 0xffff
-	ori	r3, r3, 0xffff
-	mtspr	SPRN_DBSR, r3
-
-	lwz	r3, VCPU_GPR(R3)(r4)
-	lwz	r4, VCPU_GPR(R4)(r4)
-	rfi
-
-	.data
-	.align	4
-	.globl	kvmppc_booke_handler_addr
-kvmppc_booke_handler_addr:
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_CRITICAL
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_MACHINE_CHECK
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_DATA_STORAGE
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_INST_STORAGE
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_EXTERNAL
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_ALIGNMENT
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_PROGRAM
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_FP_UNAVAIL
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_SYSCALL
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_AP_UNAVAIL
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_DECREMENTER
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_FIT
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_WATCHDOG
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_DTLB_MISS
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_ITLB_MISS
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_DEBUG
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_SPE_UNAVAIL
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_SPE_FP_DATA
-KVM_HANDLER_ADDR BOOKE_INTERRUPT_SPE_FP_ROUND
-KVM_HANDLER_END /*Always keep this in end*/
-
-#ifdef CONFIG_SPE
-_GLOBAL(kvmppc_save_guest_spe)
-	cmpi	0,r3,0
-	beqlr-
-	SAVE_32EVRS(0, r4, r3, VCPU_EVR)
-	evxor   evr6, evr6, evr6
-	evmwumiaa evr6, evr6, evr6
-	li	r4,VCPU_ACC
-	evstddx evr6, r4, r3		/* save acc */
-	blr
-
-_GLOBAL(kvmppc_load_guest_spe)
-	cmpi	0,r3,0
-	beqlr-
-	li      r4,VCPU_ACC
-	evlddx  evr6,r4,r3
-	evmra   evr6,evr6		/* load acc */
-	REST_32EVRS(0, r4, r3, VCPU_EVR)
-	blr
-#endif
diff --git a/arch/powerpc/kvm/bookehv_interrupts.S b/arch/powerpc/kvm/bookehv_interrupts.S
index 8b4a402217ba..c75350fc449e 100644
--- a/arch/powerpc/kvm/bookehv_interrupts.S
+++ b/arch/powerpc/kvm/bookehv_interrupts.S
@@ -18,13 +18,9 @@
 #include <asm/asm-offsets.h>
 #include <asm/bitsperlong.h>
 
-#ifdef CONFIG_64BIT
 #include <asm/exception-64e.h>
 #include <asm/hw_irq.h>
 #include <asm/irqflags.h>
-#else
-#include "../kernel/head_booke.h" /* for THREAD_NORMSAVE() */
-#endif
 
 #define LONGBYTES		(BITS_PER_LONG / 8)
 
@@ -155,7 +151,6 @@ END_BTB_FLUSH_SECTION
 	b	kvmppc_resume_host
 .endm
 
-#ifdef CONFIG_64BIT
 /* Exception types */
 #define EX_GEN			1
 #define EX_GDBELL		2
@@ -273,99 +268,6 @@ kvm_handler BOOKE_INTERRUPT_DEBUG, EX_PARAMS(CRIT), \
 	SPRN_CSRR0, SPRN_CSRR1, 0
 kvm_handler BOOKE_INTERRUPT_LRAT_ERROR, EX_PARAMS(GEN), \
 	SPRN_SRR0, SPRN_SRR1, (NEED_EMU | NEED_DEAR | NEED_ESR)
-#else
-/*
- * For input register values, see arch/powerpc/include/asm/kvm_booke_hv_asm.h
- */
-.macro kvm_handler intno srr0, srr1, flags
-_GLOBAL(kvmppc_handler_\intno\()_\srr1)
-	PPC_LL	r11, THREAD_KVM_VCPU(r10)
-	PPC_STL r3, VCPU_GPR(R3)(r11)
-	mfspr	r3, SPRN_SPRG_RSCRATCH0
-	PPC_STL	r4, VCPU_GPR(R4)(r11)
-	PPC_LL	r4, THREAD_NORMSAVE(0)(r10)
-	PPC_STL	r5, VCPU_GPR(R5)(r11)
-	PPC_STL	r13, VCPU_CR(r11)
-	mfspr	r5, \srr0
-	PPC_STL	r3, VCPU_GPR(R10)(r11)
-	PPC_LL	r3, THREAD_NORMSAVE(2)(r10)
-	PPC_STL	r6, VCPU_GPR(R6)(r11)
-	PPC_STL	r4, VCPU_GPR(R11)(r11)
-	mfspr	r6, \srr1
-	PPC_STL	r7, VCPU_GPR(R7)(r11)
-	PPC_STL	r8, VCPU_GPR(R8)(r11)
-	PPC_STL	r9, VCPU_GPR(R9)(r11)
-	PPC_STL r3, VCPU_GPR(R13)(r11)
-	mfctr	r7
-	PPC_STL	r12, VCPU_GPR(R12)(r11)
-	PPC_STL	r7, VCPU_CTR(r11)
-	mr	r4, r11
-	kvm_handler_common \intno, \srr0, \flags
-.endm
-
-.macro kvm_lvl_handler intno scratch srr0, srr1, flags
-_GLOBAL(kvmppc_handler_\intno\()_\srr1)
-	mfspr	r10, SPRN_SPRG_THREAD
-	PPC_LL	r11, THREAD_KVM_VCPU(r10)
-	PPC_STL r3, VCPU_GPR(R3)(r11)
-	mfspr	r3, \scratch
-	PPC_STL	r4, VCPU_GPR(R4)(r11)
-	PPC_LL	r4, GPR9(r8)
-	PPC_STL	r5, VCPU_GPR(R5)(r11)
-	PPC_STL	r9, VCPU_CR(r11)
-	mfspr	r5, \srr0
-	PPC_STL	r3, VCPU_GPR(R8)(r11)
-	PPC_LL	r3, GPR10(r8)
-	PPC_STL	r6, VCPU_GPR(R6)(r11)
-	PPC_STL	r4, VCPU_GPR(R9)(r11)
-	mfspr	r6, \srr1
-	PPC_LL	r4, GPR11(r8)
-	PPC_STL	r7, VCPU_GPR(R7)(r11)
-	PPC_STL r3, VCPU_GPR(R10)(r11)
-	mfctr	r7
-	PPC_STL	r12, VCPU_GPR(R12)(r11)
-	PPC_STL r13, VCPU_GPR(R13)(r11)
-	PPC_STL	r4, VCPU_GPR(R11)(r11)
-	PPC_STL	r7, VCPU_CTR(r11)
-	mr	r4, r11
-	kvm_handler_common \intno, \srr0, \flags
-.endm
-
-kvm_lvl_handler BOOKE_INTERRUPT_CRITICAL, \
-	SPRN_SPRG_RSCRATCH_CRIT, SPRN_CSRR0, SPRN_CSRR1, 0
-kvm_lvl_handler BOOKE_INTERRUPT_MACHINE_CHECK, \
-	SPRN_SPRG_RSCRATCH_MC, SPRN_MCSRR0, SPRN_MCSRR1, 0
-kvm_handler BOOKE_INTERRUPT_DATA_STORAGE, \
-	SPRN_SRR0, SPRN_SRR1, (NEED_EMU | NEED_DEAR | NEED_ESR)
-kvm_handler BOOKE_INTERRUPT_INST_STORAGE, SPRN_SRR0, SPRN_SRR1, NEED_ESR
-kvm_handler BOOKE_INTERRUPT_EXTERNAL, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_ALIGNMENT, \
-	SPRN_SRR0, SPRN_SRR1, (NEED_DEAR | NEED_ESR)
-kvm_handler BOOKE_INTERRUPT_PROGRAM, SPRN_SRR0, SPRN_SRR1, (NEED_ESR | NEED_EMU)
-kvm_handler BOOKE_INTERRUPT_FP_UNAVAIL, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_SYSCALL, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_AP_UNAVAIL, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_DECREMENTER, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_FIT, SPRN_SRR0, SPRN_SRR1, 0
-kvm_lvl_handler BOOKE_INTERRUPT_WATCHDOG, \
-	SPRN_SPRG_RSCRATCH_CRIT, SPRN_CSRR0, SPRN_CSRR1, 0
-kvm_handler BOOKE_INTERRUPT_DTLB_MISS, \
-	SPRN_SRR0, SPRN_SRR1, (NEED_EMU | NEED_DEAR | NEED_ESR)
-kvm_handler BOOKE_INTERRUPT_ITLB_MISS, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_PERFORMANCE_MONITOR, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_DOORBELL, SPRN_SRR0, SPRN_SRR1, 0
-kvm_lvl_handler BOOKE_INTERRUPT_DOORBELL_CRITICAL, \
-	SPRN_SPRG_RSCRATCH_CRIT, SPRN_CSRR0, SPRN_CSRR1, 0
-kvm_handler BOOKE_INTERRUPT_HV_PRIV, SPRN_SRR0, SPRN_SRR1, NEED_EMU
-kvm_handler BOOKE_INTERRUPT_HV_SYSCALL, SPRN_SRR0, SPRN_SRR1, 0
-kvm_handler BOOKE_INTERRUPT_GUEST_DBELL, SPRN_GSRR0, SPRN_GSRR1, 0
-kvm_lvl_handler BOOKE_INTERRUPT_GUEST_DBELL_CRIT, \
-	SPRN_SPRG_RSCRATCH_CRIT, SPRN_CSRR0, SPRN_CSRR1, 0
-kvm_lvl_handler BOOKE_INTERRUPT_DEBUG, \
-	SPRN_SPRG_RSCRATCH_CRIT, SPRN_CSRR0, SPRN_CSRR1, 0
-kvm_lvl_handler BOOKE_INTERRUPT_DEBUG, \
-	SPRN_SPRG_RSCRATCH_DBG, SPRN_DSRR0, SPRN_DSRR1, 0
-#endif
 
 /* Registers:
  *  SPRG_SCRATCH0: guest r10
@@ -382,17 +284,13 @@ _GLOBAL(kvmppc_resume_host)
 	PPC_STL	r5, VCPU_LR(r4)
 	mfspr	r7, SPRN_SPRG5
 	stw	r3, VCPU_VRSAVE(r4)
-#ifdef CONFIG_64BIT
 	PPC_LL	r3, PACA_SPRG_VDSO(r13)
-#endif
 	mfspr	r5, SPRN_SPRG9
 	PPC_STD(r6, VCPU_SHARED_SPRG4, r11)
 	mfspr	r8, SPRN_SPRG6
 	PPC_STD(r7, VCPU_SHARED_SPRG5, r11)
 	mfspr	r9, SPRN_SPRG7
-#ifdef CONFIG_64BIT
 	mtspr	SPRN_SPRG_VDSO_WRITE, r3
-#endif
 	PPC_STD(r5, VCPU_SPRG9, r4)
 	PPC_STD(r8, VCPU_SHARED_SPRG6, r11)
 	mfxer	r3
diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
deleted file mode 100644
index b0f695428733..000000000000
--- a/arch/powerpc/kvm/e500.c
+++ /dev/null
@@ -1,553 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2008-2011 Freescale Semiconductor, Inc. All rights reserved.
- *
- * Author: Yu Liu, <yu.liu@freescale.com>
- *
- * Description:
- * This file is derived from arch/powerpc/kvm/44x.c,
- * by Hollis Blanchard <hollisb@us.ibm.com>.
- */
-
-#include <linux/kvm_host.h>
-#include <linux/slab.h>
-#include <linux/err.h>
-#include <linux/export.h>
-#include <linux/module.h>
-#include <linux/miscdevice.h>
-
-#include <asm/reg.h>
-#include <asm/cputable.h>
-#include <asm/kvm_ppc.h>
-
-#include "../mm/mmu_decl.h"
-#include "booke.h"
-#include "e500.h"
-
-struct id {
-	unsigned long val;
-	struct id **pentry;
-};
-
-#define NUM_TIDS 256
-
-/*
- * This table provide mappings from:
- * (guestAS,guestTID,guestPR) --> ID of physical cpu
- * guestAS	[0..1]
- * guestTID	[0..255]
- * guestPR	[0..1]
- * ID		[1..255]
- * Each vcpu keeps one vcpu_id_table.
- */
-struct vcpu_id_table {
-	struct id id[2][NUM_TIDS][2];
-};
-
-/*
- * This table provide reversed mappings of vcpu_id_table:
- * ID --> address of vcpu_id_table item.
- * Each physical core has one pcpu_id_table.
- */
-struct pcpu_id_table {
-	struct id *entry[NUM_TIDS];
-};
-
-static DEFINE_PER_CPU(struct pcpu_id_table, pcpu_sids);
-
-/* This variable keeps last used shadow ID on local core.
- * The valid range of shadow ID is [1..255] */
-static DEFINE_PER_CPU(unsigned long, pcpu_last_used_sid);
-
-/*
- * Allocate a free shadow id and setup a valid sid mapping in given entry.
- * A mapping is only valid when vcpu_id_table and pcpu_id_table are match.
- *
- * The caller must have preemption disabled, and keep it that way until
- * it has finished with the returned shadow id (either written into the
- * TLB or arch.shadow_pid, or discarded).
- */
-static inline int local_sid_setup_one(struct id *entry)
-{
-	unsigned long sid;
-	int ret = -1;
-
-	sid = __this_cpu_inc_return(pcpu_last_used_sid);
-	if (sid < NUM_TIDS) {
-		__this_cpu_write(pcpu_sids.entry[sid], entry);
-		entry->val = sid;
-		entry->pentry = this_cpu_ptr(&pcpu_sids.entry[sid]);
-		ret = sid;
-	}
-
-	/*
-	 * If sid == NUM_TIDS, we've run out of sids.  We return -1, and
-	 * the caller will invalidate everything and start over.
-	 *
-	 * sid > NUM_TIDS indicates a race, which we disable preemption to
-	 * avoid.
-	 */
-	WARN_ON(sid > NUM_TIDS);
-
-	return ret;
-}
-
-/*
- * Check if given entry contain a valid shadow id mapping.
- * An ID mapping is considered valid only if
- * both vcpu and pcpu know this mapping.
- *
- * The caller must have preemption disabled, and keep it that way until
- * it has finished with the returned shadow id (either written into the
- * TLB or arch.shadow_pid, or discarded).
- */
-static inline int local_sid_lookup(struct id *entry)
-{
-	if (entry && entry->val != 0 &&
-	    __this_cpu_read(pcpu_sids.entry[entry->val]) == entry &&
-	    entry->pentry == this_cpu_ptr(&pcpu_sids.entry[entry->val]))
-		return entry->val;
-	return -1;
-}
-
-/* Invalidate all id mappings on local core -- call with preempt disabled */
-static inline void local_sid_destroy_all(void)
-{
-	__this_cpu_write(pcpu_last_used_sid, 0);
-	memset(this_cpu_ptr(&pcpu_sids), 0, sizeof(pcpu_sids));
-}
-
-static void *kvmppc_e500_id_table_alloc(struct kvmppc_vcpu_e500 *vcpu_e500)
-{
-	vcpu_e500->idt = kzalloc(sizeof(struct vcpu_id_table), GFP_KERNEL);
-	return vcpu_e500->idt;
-}
-
-static void kvmppc_e500_id_table_free(struct kvmppc_vcpu_e500 *vcpu_e500)
-{
-	kfree(vcpu_e500->idt);
-	vcpu_e500->idt = NULL;
-}
-
-/* Map guest pid to shadow.
- * We use PID to keep shadow of current guest non-zero PID,
- * and use PID1 to keep shadow of guest zero PID.
- * So that guest tlbe with TID=0 can be accessed at any time */
-static void kvmppc_e500_recalc_shadow_pid(struct kvmppc_vcpu_e500 *vcpu_e500)
-{
-	preempt_disable();
-	vcpu_e500->vcpu.arch.shadow_pid = kvmppc_e500_get_sid(vcpu_e500,
-			get_cur_as(&vcpu_e500->vcpu),
-			get_cur_pid(&vcpu_e500->vcpu),
-			get_cur_pr(&vcpu_e500->vcpu), 1);
-	vcpu_e500->vcpu.arch.shadow_pid1 = kvmppc_e500_get_sid(vcpu_e500,
-			get_cur_as(&vcpu_e500->vcpu), 0,
-			get_cur_pr(&vcpu_e500->vcpu), 1);
-	preempt_enable();
-}
-
-/* Invalidate all mappings on vcpu */
-static void kvmppc_e500_id_table_reset_all(struct kvmppc_vcpu_e500 *vcpu_e500)
-{
-	memset(vcpu_e500->idt, 0, sizeof(struct vcpu_id_table));
-
-	/* Update shadow pid when mappings are changed */
-	kvmppc_e500_recalc_shadow_pid(vcpu_e500);
-}
-
-/* Invalidate one ID mapping on vcpu */
-static inline void kvmppc_e500_id_table_reset_one(
-			       struct kvmppc_vcpu_e500 *vcpu_e500,
-			       int as, int pid, int pr)
-{
-	struct vcpu_id_table *idt = vcpu_e500->idt;
-
-	BUG_ON(as >= 2);
-	BUG_ON(pid >= NUM_TIDS);
-	BUG_ON(pr >= 2);
-
-	idt->id[as][pid][pr].val = 0;
-	idt->id[as][pid][pr].pentry = NULL;
-
-	/* Update shadow pid when mappings are changed */
-	kvmppc_e500_recalc_shadow_pid(vcpu_e500);
-}
-
-/*
- * Map guest (vcpu,AS,ID,PR) to physical core shadow id.
- * This function first lookup if a valid mapping exists,
- * if not, then creates a new one.
- *
- * The caller must have preemption disabled, and keep it that way until
- * it has finished with the returned shadow id (either written into the
- * TLB or arch.shadow_pid, or discarded).
- */
-unsigned int kvmppc_e500_get_sid(struct kvmppc_vcpu_e500 *vcpu_e500,
-				 unsigned int as, unsigned int gid,
-				 unsigned int pr, int avoid_recursion)
-{
-	struct vcpu_id_table *idt = vcpu_e500->idt;
-	int sid;
-
-	BUG_ON(as >= 2);
-	BUG_ON(gid >= NUM_TIDS);
-	BUG_ON(pr >= 2);
-
-	sid = local_sid_lookup(&idt->id[as][gid][pr]);
-
-	while (sid <= 0) {
-		/* No mapping yet */
-		sid = local_sid_setup_one(&idt->id[as][gid][pr]);
-		if (sid <= 0) {
-			_tlbil_all();
-			local_sid_destroy_all();
-		}
-
-		/* Update shadow pid when mappings are changed */
-		if (!avoid_recursion)
-			kvmppc_e500_recalc_shadow_pid(vcpu_e500);
-	}
-
-	return sid;
-}
-
-unsigned int kvmppc_e500_get_tlb_stid(struct kvm_vcpu *vcpu,
-				      struct kvm_book3e_206_tlb_entry *gtlbe)
-{
-	return kvmppc_e500_get_sid(to_e500(vcpu), get_tlb_ts(gtlbe),
-				   get_tlb_tid(gtlbe), get_cur_pr(vcpu), 0);
-}
-
-void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 pid)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-
-	if (vcpu->arch.pid != pid) {
-		vcpu_e500->pid[0] = vcpu->arch.pid = pid;
-		kvmppc_e500_recalc_shadow_pid(vcpu_e500);
-	}
-}
-
-/* gtlbe must not be mapped by more than one host tlbe */
-void kvmppc_e500_tlbil_one(struct kvmppc_vcpu_e500 *vcpu_e500,
-                           struct kvm_book3e_206_tlb_entry *gtlbe)
-{
-	struct vcpu_id_table *idt = vcpu_e500->idt;
-	unsigned int pr, tid, ts;
-	int pid;
-	u32 val, eaddr;
-	unsigned long flags;
-
-	ts = get_tlb_ts(gtlbe);
-	tid = get_tlb_tid(gtlbe);
-
-	preempt_disable();
-
-	/* One guest ID may be mapped to two shadow IDs */
-	for (pr = 0; pr < 2; pr++) {
-		/*
-		 * The shadow PID can have a valid mapping on at most one
-		 * host CPU.  In the common case, it will be valid on this
-		 * CPU, in which case we do a local invalidation of the
-		 * specific address.
-		 *
-		 * If the shadow PID is not valid on the current host CPU,
-		 * we invalidate the entire shadow PID.
-		 */
-		pid = local_sid_lookup(&idt->id[ts][tid][pr]);
-		if (pid <= 0) {
-			kvmppc_e500_id_table_reset_one(vcpu_e500, ts, tid, pr);
-			continue;
-		}
-
-		/*
-		 * The guest is invalidating a 4K entry which is in a PID
-		 * that has a valid shadow mapping on this host CPU.  We
-		 * search host TLB to invalidate it's shadow TLB entry,
-		 * similar to __tlbil_va except that we need to look in AS1.
-		 */
-		val = (pid << MAS6_SPID_SHIFT) | MAS6_SAS;
-		eaddr = get_tlb_eaddr(gtlbe);
-
-		local_irq_save(flags);
-
-		mtspr(SPRN_MAS6, val);
-		asm volatile("tlbsx 0, %[eaddr]" : : [eaddr] "r" (eaddr));
-		val = mfspr(SPRN_MAS1);
-		if (val & MAS1_VALID) {
-			mtspr(SPRN_MAS1, val & ~MAS1_VALID);
-			asm volatile("tlbwe");
-		}
-
-		local_irq_restore(flags);
-	}
-
-	preempt_enable();
-}
-
-void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *vcpu_e500)
-{
-	kvmppc_e500_id_table_reset_all(vcpu_e500);
-}
-
-void kvmppc_mmu_msr_notify(struct kvm_vcpu *vcpu, u32 old_msr)
-{
-	/* Recalc shadow pid since MSR changes */
-	kvmppc_e500_recalc_shadow_pid(to_e500(vcpu));
-}
-
-static void kvmppc_core_vcpu_load_e500(struct kvm_vcpu *vcpu, int cpu)
-{
-	kvmppc_booke_vcpu_load(vcpu, cpu);
-
-	/* Shadow PID may be expired on local core */
-	kvmppc_e500_recalc_shadow_pid(to_e500(vcpu));
-}
-
-static void kvmppc_core_vcpu_put_e500(struct kvm_vcpu *vcpu)
-{
-#ifdef CONFIG_SPE
-	if (vcpu->arch.shadow_msr & MSR_SPE)
-		kvmppc_vcpu_disable_spe(vcpu);
-#endif
-
-	kvmppc_booke_vcpu_put(vcpu);
-}
-
-static int kvmppc_e500_check_processor_compat(void)
-{
-	int r;
-
-	if (strcmp(cur_cpu_spec->cpu_name, "e500v2") == 0)
-		r = 0;
-	else
-		r = -ENOTSUPP;
-
-	return r;
-}
-
-static void kvmppc_e500_tlb_setup(struct kvmppc_vcpu_e500 *vcpu_e500)
-{
-	struct kvm_book3e_206_tlb_entry *tlbe;
-
-	/* Insert large initial mapping for guest. */
-	tlbe = get_entry(vcpu_e500, 1, 0);
-	tlbe->mas1 = MAS1_VALID | MAS1_TSIZE(BOOK3E_PAGESZ_256M);
-	tlbe->mas2 = 0;
-	tlbe->mas7_3 = E500_TLB_SUPER_PERM_MASK;
-
-	/* 4K map for serial output. Used by kernel wrapper. */
-	tlbe = get_entry(vcpu_e500, 1, 1);
-	tlbe->mas1 = MAS1_VALID | MAS1_TSIZE(BOOK3E_PAGESZ_4K);
-	tlbe->mas2 = (0xe0004500 & 0xFFFFF000) | MAS2_I | MAS2_G;
-	tlbe->mas7_3 = (0xe0004500 & 0xFFFFF000) | E500_TLB_SUPER_PERM_MASK;
-}
-
-int kvmppc_core_vcpu_setup(struct kvm_vcpu *vcpu)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-
-	kvmppc_e500_tlb_setup(vcpu_e500);
-
-	/* Registers init */
-	vcpu->arch.pvr = mfspr(SPRN_PVR);
-	vcpu_e500->svr = mfspr(SPRN_SVR);
-
-	vcpu->arch.cpu_type = KVM_CPU_E500V2;
-
-	return 0;
-}
-
-static int kvmppc_core_get_sregs_e500(struct kvm_vcpu *vcpu,
-				      struct kvm_sregs *sregs)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-
-	sregs->u.e.features |= KVM_SREGS_E_ARCH206_MMU | KVM_SREGS_E_SPE |
-	                       KVM_SREGS_E_PM;
-	sregs->u.e.impl_id = KVM_SREGS_E_IMPL_FSL;
-
-	sregs->u.e.impl.fsl.features = 0;
-	sregs->u.e.impl.fsl.svr = vcpu_e500->svr;
-	sregs->u.e.impl.fsl.hid0 = vcpu_e500->hid0;
-	sregs->u.e.impl.fsl.mcar = vcpu_e500->mcar;
-
-	sregs->u.e.ivor_high[0] = vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_UNAVAIL];
-	sregs->u.e.ivor_high[1] = vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_DATA];
-	sregs->u.e.ivor_high[2] = vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_ROUND];
-	sregs->u.e.ivor_high[3] =
-		vcpu->arch.ivor[BOOKE_IRQPRIO_PERFORMANCE_MONITOR];
-
-	kvmppc_get_sregs_ivor(vcpu, sregs);
-	kvmppc_get_sregs_e500_tlb(vcpu, sregs);
-	return 0;
-}
-
-static int kvmppc_core_set_sregs_e500(struct kvm_vcpu *vcpu,
-				      struct kvm_sregs *sregs)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-	int ret;
-
-	if (sregs->u.e.impl_id == KVM_SREGS_E_IMPL_FSL) {
-		vcpu_e500->svr = sregs->u.e.impl.fsl.svr;
-		vcpu_e500->hid0 = sregs->u.e.impl.fsl.hid0;
-		vcpu_e500->mcar = sregs->u.e.impl.fsl.mcar;
-	}
-
-	ret = kvmppc_set_sregs_e500_tlb(vcpu, sregs);
-	if (ret < 0)
-		return ret;
-
-	if (!(sregs->u.e.features & KVM_SREGS_E_IVOR))
-		return 0;
-
-	if (sregs->u.e.features & KVM_SREGS_E_SPE) {
-		vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_UNAVAIL] =
-			sregs->u.e.ivor_high[0];
-		vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_DATA] =
-			sregs->u.e.ivor_high[1];
-		vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_ROUND] =
-			sregs->u.e.ivor_high[2];
-	}
-
-	if (sregs->u.e.features & KVM_SREGS_E_PM) {
-		vcpu->arch.ivor[BOOKE_IRQPRIO_PERFORMANCE_MONITOR] =
-			sregs->u.e.ivor_high[3];
-	}
-
-	return kvmppc_set_sregs_ivor(vcpu, sregs);
-}
-
-static int kvmppc_get_one_reg_e500(struct kvm_vcpu *vcpu, u64 id,
-				   union kvmppc_one_reg *val)
-{
-	int r = kvmppc_get_one_reg_e500_tlb(vcpu, id, val);
-	return r;
-}
-
-static int kvmppc_set_one_reg_e500(struct kvm_vcpu *vcpu, u64 id,
-				   union kvmppc_one_reg *val)
-{
-	int r = kvmppc_get_one_reg_e500_tlb(vcpu, id, val);
-	return r;
-}
-
-static int kvmppc_core_vcpu_create_e500(struct kvm_vcpu *vcpu)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500;
-	int err;
-
-	BUILD_BUG_ON(offsetof(struct kvmppc_vcpu_e500, vcpu) != 0);
-	vcpu_e500 = to_e500(vcpu);
-
-	if (kvmppc_e500_id_table_alloc(vcpu_e500) == NULL)
-		return -ENOMEM;
-
-	err = kvmppc_e500_tlb_init(vcpu_e500);
-	if (err)
-		goto uninit_id;
-
-	vcpu->arch.shared = (void*)__get_free_page(GFP_KERNEL|__GFP_ZERO);
-	if (!vcpu->arch.shared) {
-		err = -ENOMEM;
-		goto uninit_tlb;
-	}
-
-	return 0;
-
-uninit_tlb:
-	kvmppc_e500_tlb_uninit(vcpu_e500);
-uninit_id:
-	kvmppc_e500_id_table_free(vcpu_e500);
-	return err;
-}
-
-static void kvmppc_core_vcpu_free_e500(struct kvm_vcpu *vcpu)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-
-	free_page((unsigned long)vcpu->arch.shared);
-	kvmppc_e500_tlb_uninit(vcpu_e500);
-	kvmppc_e500_id_table_free(vcpu_e500);
-}
-
-static int kvmppc_core_init_vm_e500(struct kvm *kvm)
-{
-	return 0;
-}
-
-static void kvmppc_core_destroy_vm_e500(struct kvm *kvm)
-{
-}
-
-static struct kvmppc_ops kvm_ops_e500 = {
-	.get_sregs = kvmppc_core_get_sregs_e500,
-	.set_sregs = kvmppc_core_set_sregs_e500,
-	.get_one_reg = kvmppc_get_one_reg_e500,
-	.set_one_reg = kvmppc_set_one_reg_e500,
-	.vcpu_load   = kvmppc_core_vcpu_load_e500,
-	.vcpu_put    = kvmppc_core_vcpu_put_e500,
-	.vcpu_create = kvmppc_core_vcpu_create_e500,
-	.vcpu_free   = kvmppc_core_vcpu_free_e500,
-	.init_vm = kvmppc_core_init_vm_e500,
-	.destroy_vm = kvmppc_core_destroy_vm_e500,
-	.emulate_op = kvmppc_core_emulate_op_e500,
-	.emulate_mtspr = kvmppc_core_emulate_mtspr_e500,
-	.emulate_mfspr = kvmppc_core_emulate_mfspr_e500,
-	.create_vcpu_debugfs = kvmppc_create_vcpu_debugfs_e500,
-};
-
-static int __init kvmppc_e500_init(void)
-{
-	int r, i;
-	unsigned long ivor[3];
-	/* Process remaining handlers above the generic first 16 */
-	unsigned long *handler = &kvmppc_booke_handler_addr[16];
-	unsigned long handler_len;
-	unsigned long max_ivor = 0;
-
-	r = kvmppc_e500_check_processor_compat();
-	if (r)
-		goto err_out;
-
-	r = kvmppc_booke_init();
-	if (r)
-		goto err_out;
-
-	/* copy extra E500 exception handlers */
-	ivor[0] = mfspr(SPRN_IVOR32);
-	ivor[1] = mfspr(SPRN_IVOR33);
-	ivor[2] = mfspr(SPRN_IVOR34);
-	for (i = 0; i < 3; i++) {
-		if (ivor[i] > ivor[max_ivor])
-			max_ivor = i;
-
-		handler_len = handler[i + 1] - handler[i];
-		memcpy((void *)kvmppc_booke_handlers + ivor[i],
-		       (void *)handler[i], handler_len);
-	}
-	handler_len = handler[max_ivor + 1] - handler[max_ivor];
-	flush_icache_range(kvmppc_booke_handlers, kvmppc_booke_handlers +
-			   ivor[max_ivor] + handler_len);
-
-	r = kvm_init(sizeof(struct kvmppc_vcpu_e500), 0, THIS_MODULE);
-	if (r)
-		goto err_out;
-	kvm_ops_e500.owner = THIS_MODULE;
-	kvmppc_pr_ops = &kvm_ops_e500;
-
-err_out:
-	return r;
-}
-
-static void __exit kvmppc_e500_exit(void)
-{
-	kvmppc_pr_ops = NULL;
-	kvmppc_booke_exit();
-}
-
-module_init(kvmppc_e500_init);
-module_exit(kvmppc_e500_exit);
-MODULE_ALIAS_MISCDEV(KVM_MINOR);
-MODULE_ALIAS("devname:kvm");
diff --git a/arch/powerpc/kvm/e500.h b/arch/powerpc/kvm/e500.h
index 6d0d329cbb35..325c190cc771 100644
--- a/arch/powerpc/kvm/e500.h
+++ b/arch/powerpc/kvm/e500.h
@@ -46,10 +46,6 @@ struct tlbe_priv {
 	struct tlbe_ref ref;
 };
 
-#ifdef CONFIG_KVM_E500V2
-struct vcpu_id_table;
-#endif
-
 struct kvmppc_e500_tlb_params {
 	int entries, ways, sets;
 };
@@ -88,13 +84,6 @@ struct kvmppc_vcpu_e500 {
 	/* Minimum and maximum address mapped my TLB1 */
 	unsigned long tlb1_min_eaddr;
 	unsigned long tlb1_max_eaddr;
-
-#ifdef CONFIG_KVM_E500V2
-	u32 pid[E500_PID_NUM];
-
-	/* vcpu id table */
-	struct vcpu_id_table *idt;
-#endif
 };
 
 static inline struct kvmppc_vcpu_e500 *to_e500(struct kvm_vcpu *vcpu)
@@ -140,12 +129,6 @@ int kvmppc_get_one_reg_e500_tlb(struct kvm_vcpu *vcpu, u64 id,
 int kvmppc_set_one_reg_e500_tlb(struct kvm_vcpu *vcpu, u64 id,
 			       union kvmppc_one_reg *val);
 
-#ifdef CONFIG_KVM_E500V2
-unsigned int kvmppc_e500_get_sid(struct kvmppc_vcpu_e500 *vcpu_e500,
-				 unsigned int as, unsigned int gid,
-				 unsigned int pr, int avoid_recursion);
-#endif
-
 /* TLB helper functions */
 static inline unsigned int
 get_tlb_size(const struct kvm_book3e_206_tlb_entry *tlbe)
@@ -257,13 +240,6 @@ static inline int tlbe_is_host_safe(const struct kvm_vcpu *vcpu,
 	if (!get_tlb_v(tlbe))
 		return 0;
 
-#ifndef CONFIG_KVM_BOOKE_HV
-	/* Does it match current guest AS? */
-	/* XXX what about IS != DS? */
-	if (get_tlb_ts(tlbe) != !!(vcpu->arch.shared->msr & MSR_IS))
-		return 0;
-#endif
-
 	gpa = get_tlb_raddr(tlbe);
 	if (!gfn_to_memslot(vcpu->kvm, gpa >> PAGE_SHIFT))
 		/* Mapping is not for RAM. */
@@ -283,7 +259,6 @@ void kvmppc_e500_tlbil_one(struct kvmppc_vcpu_e500 *vcpu_e500,
 			   struct kvm_book3e_206_tlb_entry *gtlbe);
 void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *vcpu_e500);
 
-#ifdef CONFIG_KVM_BOOKE_HV
 #define kvmppc_e500_get_tlb_stid(vcpu, gtlbe)       get_tlb_tid(gtlbe)
 #define get_tlbmiss_tid(vcpu)           get_cur_pid(vcpu)
 #define get_tlb_sts(gtlbe)              (gtlbe->mas1 & MAS1_TS)
@@ -306,21 +281,6 @@ static inline int get_lpid(struct kvm_vcpu *vcpu)
 {
 	return get_thread_specific_lpid(vcpu->kvm->arch.lpid);
 }
-#else
-unsigned int kvmppc_e500_get_tlb_stid(struct kvm_vcpu *vcpu,
-				      struct kvm_book3e_206_tlb_entry *gtlbe);
-
-static inline unsigned int get_tlbmiss_tid(struct kvm_vcpu *vcpu)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-	unsigned int tidseld = (vcpu->arch.shared->mas4 >> 16) & 0xf;
-
-	return vcpu_e500->pid[tidseld];
-}
-
-/* Force TS=1 for all guest mappings. */
-#define get_tlb_sts(gtlbe)              (MAS1_TS)
-#endif /* !BOOKE_HV */
 
 static inline bool has_feature(const struct kvm_vcpu *vcpu,
 			       enum vcpu_ftr ftr)
diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emulate.c
index 051102d50c31..0173eea26b83 100644
--- a/arch/powerpc/kvm/e500_emulate.c
+++ b/arch/powerpc/kvm/e500_emulate.c
@@ -28,7 +28,6 @@
 #define XOP_TLBILX  18
 #define XOP_EHPRIV  270
 
-#ifdef CONFIG_KVM_E500MC
 static int dbell2prio(ulong param)
 {
 	int msg = param & PPC_DBELL_TYPE_MASK;
@@ -81,7 +80,6 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *vcpu, int rb)
 
 	return EMULATE_DONE;
 }
-#endif
 
 static int kvmppc_e500_emul_ehpriv(struct kvm_vcpu *vcpu,
 				   unsigned int inst, int *advance)
@@ -142,7 +140,6 @@ int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
 			emulated = kvmppc_e500_emul_dcbtls(vcpu);
 			break;
 
-#ifdef CONFIG_KVM_E500MC
 		case XOP_MSGSND:
 			emulated = kvmppc_e500_emul_msgsnd(vcpu, rb);
 			break;
@@ -150,7 +147,6 @@ int kvmppc_core_emulate_op_e500(struct kvm_vcpu *vcpu,
 		case XOP_MSGCLR:
 			emulated = kvmppc_e500_emul_msgclr(vcpu, rb);
 			break;
-#endif
 
 		case XOP_TLBRE:
 			emulated = kvmppc_e500_emul_tlbre(vcpu);
@@ -207,44 +203,6 @@ int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn, ulong spr_va
 	int emulated = EMULATE_DONE;
 
 	switch (sprn) {
-#ifndef CONFIG_KVM_BOOKE_HV
-	case SPRN_PID:
-		kvmppc_set_pid(vcpu, spr_val);
-		break;
-	case SPRN_PID1:
-		if (spr_val != 0)
-			return EMULATE_FAIL;
-		vcpu_e500->pid[1] = spr_val;
-		break;
-	case SPRN_PID2:
-		if (spr_val != 0)
-			return EMULATE_FAIL;
-		vcpu_e500->pid[2] = spr_val;
-		break;
-	case SPRN_MAS0:
-		vcpu->arch.shared->mas0 = spr_val;
-		break;
-	case SPRN_MAS1:
-		vcpu->arch.shared->mas1 = spr_val;
-		break;
-	case SPRN_MAS2:
-		vcpu->arch.shared->mas2 = spr_val;
-		break;
-	case SPRN_MAS3:
-		vcpu->arch.shared->mas7_3 &= ~(u64)0xffffffff;
-		vcpu->arch.shared->mas7_3 |= spr_val;
-		break;
-	case SPRN_MAS4:
-		vcpu->arch.shared->mas4 = spr_val;
-		break;
-	case SPRN_MAS6:
-		vcpu->arch.shared->mas6 = spr_val;
-		break;
-	case SPRN_MAS7:
-		vcpu->arch.shared->mas7_3 &= (u64)0xffffffff;
-		vcpu->arch.shared->mas7_3 |= (u64)spr_val << 32;
-		break;
-#endif
 	case SPRN_L1CSR0:
 		vcpu_e500->l1csr0 = spr_val;
 		vcpu_e500->l1csr0 &= ~(L1CSR0_DCFI | L1CSR0_CLFC);
@@ -281,17 +239,6 @@ int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn, ulong spr_va
 		break;
 
 	/* extra exceptions */
-#ifdef CONFIG_SPE_POSSIBLE
-	case SPRN_IVOR32:
-		vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_UNAVAIL] = spr_val;
-		break;
-	case SPRN_IVOR33:
-		vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_DATA] = spr_val;
-		break;
-	case SPRN_IVOR34:
-		vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_ROUND] = spr_val;
-		break;
-#endif
 #ifdef CONFIG_ALTIVEC
 	case SPRN_IVOR32:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_ALTIVEC_UNAVAIL] = spr_val;
@@ -303,14 +250,12 @@ int kvmppc_core_emulate_mtspr_e500(struct kvm_vcpu *vcpu, int sprn, ulong spr_va
 	case SPRN_IVOR35:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_PERFORMANCE_MONITOR] = spr_val;
 		break;
-#ifdef CONFIG_KVM_BOOKE_HV
 	case SPRN_IVOR36:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_DBELL] = spr_val;
 		break;
 	case SPRN_IVOR37:
 		vcpu->arch.ivor[BOOKE_IRQPRIO_DBELL_CRIT] = spr_val;
 		break;
-#endif
 	default:
 		emulated = kvmppc_booke_emulate_mtspr(vcpu, sprn, spr_val);
 	}
@@ -324,38 +269,6 @@ int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn, ulong *spr_v
 	int emulated = EMULATE_DONE;
 
 	switch (sprn) {
-#ifndef CONFIG_KVM_BOOKE_HV
-	case SPRN_PID:
-		*spr_val = vcpu_e500->pid[0];
-		break;
-	case SPRN_PID1:
-		*spr_val = vcpu_e500->pid[1];
-		break;
-	case SPRN_PID2:
-		*spr_val = vcpu_e500->pid[2];
-		break;
-	case SPRN_MAS0:
-		*spr_val = vcpu->arch.shared->mas0;
-		break;
-	case SPRN_MAS1:
-		*spr_val = vcpu->arch.shared->mas1;
-		break;
-	case SPRN_MAS2:
-		*spr_val = vcpu->arch.shared->mas2;
-		break;
-	case SPRN_MAS3:
-		*spr_val = (u32)vcpu->arch.shared->mas7_3;
-		break;
-	case SPRN_MAS4:
-		*spr_val = vcpu->arch.shared->mas4;
-		break;
-	case SPRN_MAS6:
-		*spr_val = vcpu->arch.shared->mas6;
-		break;
-	case SPRN_MAS7:
-		*spr_val = vcpu->arch.shared->mas7_3 >> 32;
-		break;
-#endif
 	case SPRN_DECAR:
 		*spr_val = vcpu->arch.decar;
 		break;
@@ -413,17 +326,6 @@ int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn, ulong *spr_v
 		break;
 
 	/* extra exceptions */
-#ifdef CONFIG_SPE_POSSIBLE
-	case SPRN_IVOR32:
-		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_UNAVAIL];
-		break;
-	case SPRN_IVOR33:
-		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_DATA];
-		break;
-	case SPRN_IVOR34:
-		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_SPE_FP_ROUND];
-		break;
-#endif
 #ifdef CONFIG_ALTIVEC
 	case SPRN_IVOR32:
 		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_ALTIVEC_UNAVAIL];
@@ -435,14 +337,12 @@ int kvmppc_core_emulate_mfspr_e500(struct kvm_vcpu *vcpu, int sprn, ulong *spr_v
 	case SPRN_IVOR35:
 		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_PERFORMANCE_MONITOR];
 		break;
-#ifdef CONFIG_KVM_BOOKE_HV
 	case SPRN_IVOR36:
 		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_DBELL];
 		break;
 	case SPRN_IVOR37:
 		*spr_val = vcpu->arch.ivor[BOOKE_IRQPRIO_DBELL_CRIT];
 		break;
-#endif
 	default:
 		emulated = kvmppc_booke_emulate_mfspr(vcpu, sprn, spr_val);
 	}
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..f808fdc4bb85 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -50,16 +50,6 @@ static inline u32 e500_shadow_mas3_attrib(u32 mas3, int usermode)
 	/* Mask off reserved bits. */
 	mas3 &= MAS3_ATTRIB_MASK;
 
-#ifndef CONFIG_KVM_BOOKE_HV
-	if (!usermode) {
-		/* Guest is in supervisor mode,
-		 * so we need to translate guest
-		 * supervisor permissions into user permissions. */
-		mas3 &= ~E500_TLB_USER_PERM_MASK;
-		mas3 |= (mas3 & E500_TLB_SUPER_PERM_MASK) << 1;
-	}
-	mas3 |= E500_TLB_SUPER_PERM_MASK;
-#endif
 	return mas3;
 }
 
@@ -78,16 +68,12 @@ static inline void __write_host_tlbe(struct kvm_book3e_206_tlb_entry *stlbe,
 	mtspr(SPRN_MAS2, (unsigned long)stlbe->mas2);
 	mtspr(SPRN_MAS3, (u32)stlbe->mas7_3);
 	mtspr(SPRN_MAS7, (u32)(stlbe->mas7_3 >> 32));
-#ifdef CONFIG_KVM_BOOKE_HV
 	mtspr(SPRN_MAS8, MAS8_TGS | get_thread_specific_lpid(lpid));
-#endif
 	asm volatile("isync; tlbwe" : : : "memory");
 
-#ifdef CONFIG_KVM_BOOKE_HV
 	/* Must clear mas8 for other host tlbwe's */
 	mtspr(SPRN_MAS8, 0);
 	isync();
-#endif
 	local_irq_restore(flags);
 
 	trace_kvm_booke206_stlb_write(mas0, stlbe->mas8, stlbe->mas1,
@@ -153,34 +139,6 @@ static void write_stlbe(struct kvmppc_vcpu_e500 *vcpu_e500,
 	preempt_enable();
 }
 
-#ifdef CONFIG_KVM_E500V2
-/* XXX should be a hook in the gva2hpa translation */
-void kvmppc_map_magic(struct kvm_vcpu *vcpu)
-{
-	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
-	struct kvm_book3e_206_tlb_entry magic;
-	ulong shared_page = ((ulong)vcpu->arch.shared) & PAGE_MASK;
-	unsigned int stid;
-	kvm_pfn_t pfn;
-
-	pfn = (kvm_pfn_t)virt_to_phys((void *)shared_page) >> PAGE_SHIFT;
-	get_page(pfn_to_page(pfn));
-
-	preempt_disable();
-	stid = kvmppc_e500_get_sid(vcpu_e500, 0, 0, 0, 0);
-
-	magic.mas1 = MAS1_VALID | MAS1_TS | MAS1_TID(stid) |
-		     MAS1_TSIZE(BOOK3E_PAGESZ_4K);
-	magic.mas2 = vcpu->arch.magic_page_ea | MAS2_M;
-	magic.mas7_3 = ((u64)pfn << PAGE_SHIFT) |
-		       MAS3_SW | MAS3_SR | MAS3_UW | MAS3_UR;
-	magic.mas8 = 0;
-
-	__write_host_tlbe(&magic, MAS0_TLBSEL(1) | MAS0_ESEL(tlbcam_index), 0);
-	preempt_enable();
-}
-#endif
-
 void inval_gtlbe_on_host(struct kvmppc_vcpu_e500 *vcpu_e500, int tlbsel,
 			 int esel)
 {
@@ -616,7 +574,6 @@ void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 eaddr, gpa_t gpaddr,
 	}
 }
 
-#ifdef CONFIG_KVM_BOOKE_HV
 int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 		enum instruction_fetch_type type, unsigned long *instr)
 {
@@ -646,11 +603,7 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 	mas1 = mfspr(SPRN_MAS1);
 	mas2 = mfspr(SPRN_MAS2);
 	mas3 = mfspr(SPRN_MAS3);
-#ifdef CONFIG_64BIT
 	mas7_mas3 = mfspr(SPRN_MAS7_MAS3);
-#else
-	mas7_mas3 = ((u64)mfspr(SPRN_MAS7) << 32) | mas3;
-#endif
 	local_irq_restore(flags);
 
 	/*
@@ -706,13 +659,6 @@ int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
 
 	return EMULATE_DONE;
 }
-#else
-int kvmppc_load_last_inst(struct kvm_vcpu *vcpu,
-		enum instruction_fetch_type type, unsigned long *instr)
-{
-	return EMULATE_AGAIN;
-}
-#endif
 
 /************* MMU Notifiers *************/
 
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index e476e107a932..844b2d6b6b49 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -202,10 +202,7 @@ int kvmppc_core_vcpu_setup(struct kvm_vcpu *vcpu)
 	struct kvmppc_vcpu_e500 *vcpu_e500 = to_e500(vcpu);
 
 	vcpu->arch.shadow_epcr = SPRN_EPCR_DSIGS | SPRN_EPCR_DGTMI | \
-				 SPRN_EPCR_DUVD;
-#ifdef CONFIG_64BIT
-	vcpu->arch.shadow_epcr |= SPRN_EPCR_ICM;
-#endif
+				 SPRN_EPCR_DUVD | SPRN_EPCR_ICM;
 	vcpu->arch.shadow_msrp = MSRP_UCLEP | MSRP_PMMP;
 
 	vcpu->arch.pvr = mfspr(SPRN_PVR);
diff --git a/arch/powerpc/kvm/trace_booke.h b/arch/powerpc/kvm/trace_booke.h
index eff6e82dbcd4..dbc54059327f 100644
--- a/arch/powerpc/kvm/trace_booke.h
+++ b/arch/powerpc/kvm/trace_booke.h
@@ -135,25 +135,11 @@ TRACE_EVENT(kvm_booke206_ref_release,
 		__entry->pfn, __entry->flags)
 );
 
-#ifdef CONFIG_SPE_POSSIBLE
-#define kvm_trace_symbol_irqprio_spe \
-	{BOOKE_IRQPRIO_SPE_UNAVAIL, "SPE_UNAVAIL"}, \
-	{BOOKE_IRQPRIO_SPE_FP_DATA, "SPE_FP_DATA"}, \
-	{BOOKE_IRQPRIO_SPE_FP_ROUND, "SPE_FP_ROUND"},
-#else
-#define kvm_trace_symbol_irqprio_spe
-#endif
-
-#ifdef CONFIG_PPC_E500MC
 #define kvm_trace_symbol_irqprio_e500mc \
 	{BOOKE_IRQPRIO_ALTIVEC_UNAVAIL, "ALTIVEC_UNAVAIL"}, \
 	{BOOKE_IRQPRIO_ALTIVEC_ASSIST, "ALTIVEC_ASSIST"},
-#else
-#define kvm_trace_symbol_irqprio_e500mc
-#endif
 
 #define kvm_trace_symbol_irqprio \
-	kvm_trace_symbol_irqprio_spe \
 	kvm_trace_symbol_irqprio_e500mc \
 	{BOOKE_IRQPRIO_DATA_STORAGE, "DATA_STORAGE"}, \
 	{BOOKE_IRQPRIO_INST_STORAGE, "INST_STORAGE"}, \
-- 
2.39.5


