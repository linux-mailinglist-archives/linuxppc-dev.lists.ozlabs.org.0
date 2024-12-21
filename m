Return-Path: <linuxppc-dev+bounces-4394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06879FA2A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 22:49:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFyc92rCSz2yGZ;
	Sun, 22 Dec 2024 08:49:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734817769;
	cv=none; b=ePe+mfB5Jq5rcMsduJcoM8oNH4tL7YX5IuugcfpnQxAa7ANfZ5jra2x1UFui3+bxcrTJECNR3b3h/6V525Ec8gyvkRcpM81M1LAjGQoe+OqPErAjsibwTCHgxTo+LOx8twwi4WxzkuOY9DQnef91MVzp13glskT0edebSrBhu6k3dhzfKzDXy2eoQkoP0zPN5uFF374cyi5oxU/eFr7+que7R86FjYN+jzGOEAznrPiO8o8KaruN5DQ7njrdOBeqzkOku8e5ghMsfdFcXhqexooFRKUPWsd3PfVO3r48KKqSwlJn6WSEYaWXYFImaxjl75BXJzl7Z2Qq9s9DWvnkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734817769; c=relaxed/relaxed;
	bh=kkdC90bNpQeDBcNmNM+pkR/JSScEwb/syFcsEfFqxTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iaaNS/ufBH02PblBC5LmLsNs8L+GQ4FP9LSiFzYV1yeiMPX+2gE4FiddmGfJ0z3+qM79tuohnAuVh1ahBo+kuj2kHktb30R6vZN9M5P9O8rcqjUQ16ja4ZqadgVfzC5LfElyYQYTY4KawA7i0lqtO45BmHnaZ9G+wXhOlPNglL5sc8aBOI5wnFzmJhFnzqskrfMEQfxcOVjEBLJv6pP+FBgue1rwEdKgJCKrcn9JXcYU4fj38t7iYTFqfibeU+WzmJ5EiTtQVzqKRmU/GWQkakKDZxH2zTBd+ka/hIPJN7gTJpCp4DJag2MInaPFzZnZMncXeXtAyAUud4if/3tTmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oaRHzSK9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oaRHzSK9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFyc74Wvrz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 08:49:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF6695C54A3;
	Sat, 21 Dec 2024 21:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5365BC4CEDF;
	Sat, 21 Dec 2024 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817765;
	bh=CUEt8JQGXZh9edKOatlcP6ut0POOnJqyWwIIdYtz2sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oaRHzSK9EMiwmOF7DCcsQDKEkGuupn3sKGNoWt747480L7rX3ea5NtFCGs1qEdnsX
	 LLlnR/C4vqe8lwB8+PoKTyvBIBR2tHiVCJvdo9eTUFOuwOd43/jlYDwwJqaYQtCbEh
	 EUw3FLaauaKTtBCJKKR1omx8x0TNA9KyAKu3DsmSNYyljk24ZL+RszBSGH+HbChsSu
	 nWRetmQu/s3Rry9F1WLFo38pdTiSbtbOKjzzGaWJIGhY0HzkrhozjYu8TpWyfAHpmC
	 f2OO+85gDMMPNe3wboi2TgdSo5vyP8+77e8zIzIA0XYKAu4jt96qnv2e6I1JQ8HMav
	 Jo62QLcvXAa5w==
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
Subject: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
Date: Sat, 21 Dec 2024 22:42:22 +0100
Message-Id: <20241221214223.3046298-5-arnd@kernel.org>
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

Support for KVM on 32-bit Book III-s implementations was added in 2010
and supports PowerMac, CHRP, and embedded platforms using the Freescale G4
(mpc74xx), e300 (mpc83xx) and e600 (mpc86xx) CPUs from 2003 to 2009.

Earlier 603/604/750 machines might work but would be even more limited
by their available memory.

The only likely users of KVM on any of these were the final Apple
PowerMac/PowerBook/iBook G4 models with 2GB of RAM that were at the high
end 20 years ago but are just as obsolete as their x86-32 counterparts.
The code has been orphaned since 2023.

There is still a need to support 32-bit guests in order to better
debug problems on ppc32 kernels. This should work in theory on both
64-bit booke and on 64-bit book3s hosts, but it would be good to
confirm that this is still the case before the known working option
gets removed.

Link: https://lore.kernel.org/lkml/CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com/
Cc: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                               |   2 +-
 arch/powerpc/include/asm/kvm_book3s.h     |  17 ---
 arch/powerpc/include/asm/kvm_book3s_asm.h |  10 --
 arch/powerpc/include/asm/kvm_host.h       |   2 +-
 arch/powerpc/include/asm/kvm_ppc.h        |   2 +-
 arch/powerpc/include/asm/processor.h      |   3 -
 arch/powerpc/kernel/asm-offsets.c         |  21 +---
 arch/powerpc/kernel/head_32.h             |  10 --
 arch/powerpc/kernel/head_book3s_32.S      |   5 -
 arch/powerpc/kvm/Kconfig                  |  22 ----
 arch/powerpc/kvm/Makefile                 |  15 ---
 arch/powerpc/kvm/book3s.c                 |  18 ----
 arch/powerpc/kvm/book3s_emulate.c         |  37 -------
 arch/powerpc/kvm/book3s_interrupts.S      |  11 --
 arch/powerpc/kvm/book3s_mmu_hpte.c        |  12 ---
 arch/powerpc/kvm/book3s_pr.c              | 122 +---------------------
 arch/powerpc/kvm/book3s_rmhandlers.S      | 110 -------------------
 arch/powerpc/kvm/book3s_segment.S         |  30 +-----
 arch/powerpc/kvm/emulate.c                |   2 -
 arch/powerpc/kvm/powerpc.c                |   2 -
 20 files changed, 7 insertions(+), 446 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 52ba21efdd65..d9a20d934d95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12717,7 +12717,7 @@ L:	linuxppc-dev@lists.ozlabs.org
 L:	kvm@vger.kernel.org
 S:	Maintained (Book3S 64-bit HV)
 S:	Odd fixes (Book3S 64-bit PR)
-S:	Orphan (Book3E and 32-bit)
+S:	Orphan (Book3E)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
 F:	arch/powerpc/include/asm/kvm*
 F:	arch/powerpc/include/uapi/asm/kvm*
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index e1ff291ba891..7e13e48dbc6b 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -36,21 +36,14 @@ struct kvmppc_sid_map {
 #define SID_MAP_NUM     (1 << SID_MAP_BITS)
 #define SID_MAP_MASK    (SID_MAP_NUM - 1)
 
-#ifdef CONFIG_PPC_BOOK3S_64
 #define SID_CONTEXTS	1
-#else
-#define SID_CONTEXTS	128
-#define VSID_POOL_SIZE	(SID_CONTEXTS * 16)
-#endif
 
 struct hpte_cache {
 	struct hlist_node list_pte;
 	struct hlist_node list_pte_long;
 	struct hlist_node list_vpte;
 	struct hlist_node list_vpte_long;
-#ifdef CONFIG_PPC_BOOK3S_64
 	struct hlist_node list_vpte_64k;
-#endif
 	struct rcu_head rcu_head;
 	u64 host_vpn;
 	u64 pfn;
@@ -112,14 +105,9 @@ struct kvmppc_vcpu_book3s {
 	u64 hior;
 	u64 msr_mask;
 	u64 vtb;
-#ifdef CONFIG_PPC_BOOK3S_32
-	u32 vsid_pool[VSID_POOL_SIZE];
-	u32 vsid_next;
-#else
 	u64 proto_vsid_first;
 	u64 proto_vsid_max;
 	u64 proto_vsid_next;
-#endif
 	int context_id[SID_CONTEXTS];
 
 	bool hior_explicit;		/* HIOR is set by ioctl, not PVR */
@@ -128,9 +116,7 @@ struct kvmppc_vcpu_book3s {
 	struct hlist_head hpte_hash_pte_long[HPTEG_HASH_NUM_PTE_LONG];
 	struct hlist_head hpte_hash_vpte[HPTEG_HASH_NUM_VPTE];
 	struct hlist_head hpte_hash_vpte_long[HPTEG_HASH_NUM_VPTE_LONG];
-#ifdef CONFIG_PPC_BOOK3S_64
 	struct hlist_head hpte_hash_vpte_64k[HPTEG_HASH_NUM_VPTE_64K];
-#endif
 	int hpte_cache_count;
 	spinlock_t mmu_lock;
 };
@@ -391,9 +377,6 @@ static inline struct kvmppc_vcpu_book3s *to_book3s(struct kvm_vcpu *vcpu)
 
 /* Also add subarch specific defines */
 
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-#include <asm/kvm_book3s_32.h>
-#endif
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #include <asm/kvm_book3s_64.h>
 #endif
diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index a36797938620..98174363946e 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -113,11 +113,9 @@ struct kvmppc_host_state {
 	u64 dec_expires;
 	struct kvm_split_mode *kvm_split_mode;
 #endif
-#ifdef CONFIG_PPC_BOOK3S_64
 	u64 cfar;
 	u64 ppr;
 	u64 host_fscr;
-#endif
 };
 
 struct kvmppc_book3s_shadow_vcpu {
@@ -134,20 +132,12 @@ struct kvmppc_book3s_shadow_vcpu {
 	u32 fault_dsisr;
 	u32 last_inst;
 
-#ifdef CONFIG_PPC_BOOK3S_32
-	u32     sr[16];			/* Guest SRs */
-
-	struct kvmppc_host_state hstate;
-#endif
-
-#ifdef CONFIG_PPC_BOOK3S_64
 	u8 slb_max;			/* highest used guest slb entry */
 	struct  {
 		u64     esid;
 		u64     vsid;
 	} slb[64];			/* guest SLB */
 	u64 shadow_fscr;
-#endif
 };
 
 #endif /*__ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6e1108f8fce6..56b01a135fcb 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -793,7 +793,7 @@ struct kvm_vcpu_arch {
 	struct machine_check_event mce_evt; /* Valid if trap == 0x200 */
 
 	struct kvm_vcpu_arch_shared *shared;
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSIBLE)
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	bool shared_big_endian;
 #endif
 	unsigned long magic_page_pa; /* phys addr to map the magic page to */
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index ca3829d47ab7..001cd00d18f0 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -951,7 +951,7 @@ static inline void kvmppc_mmu_flush_icache(kvm_pfn_t pfn)
  */
 static inline bool kvmppc_shared_big_endian(struct kvm_vcpu *vcpu)
 {
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSIBLE)
+#if defined(CONFIG_KVM_BOOK3S_PR_POSSIBLE)
 	/* Only Book3S_64 PR supports bi-endian for now */
 	return vcpu->arch.shared_big_endian;
 #elif defined(CONFIG_PPC_BOOK3S_64) && defined(__LITTLE_ENDIAN__)
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 6b94de17201c..d77092554788 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -223,9 +223,6 @@ struct thread_struct {
 	struct thread_vr_state ckvr_state; /* Checkpointed VR state */
 	unsigned long	ckvrsave; /* Checkpointed VRSAVE */
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	void*		kvm_shadow_vcpu; /* KVM internal data */
-#endif /* CONFIG_KVM_BOOK3S_32_HANDLER */
 #if defined(CONFIG_KVM) && defined(CONFIG_BOOKE)
 	struct kvm_vcpu	*kvm_vcpu;
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 7a390bd4f4af..c4186061694c 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -147,9 +147,6 @@ int main(void)
 	OFFSET(THREAD_USED_SPE, thread_struct, used_spe);
 #endif /* CONFIG_SPE */
 #endif /* CONFIG_PPC64 */
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	OFFSET(THREAD_KVM_SVCPU, thread_struct, kvm_shadow_vcpu);
-#endif
 #if defined(CONFIG_KVM) && defined(CONFIG_BOOKE)
 	OFFSET(THREAD_KVM_VCPU, thread_struct, kvm_vcpu);
 #endif
@@ -401,7 +398,7 @@ int main(void)
 	OFFSET(VCPU_SHARED, kvm_vcpu, arch.shared);
 	OFFSET(VCPU_SHARED_MSR, kvm_vcpu_arch_shared, msr);
 	OFFSET(VCPU_SHADOW_MSR, kvm_vcpu, arch.shadow_msr);
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_PR_POSSIBLE)
+#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	OFFSET(VCPU_SHAREDBE, kvm_vcpu, arch.shared_big_endian);
 #endif
 
@@ -511,19 +508,13 @@ int main(void)
 	OFFSET(VCPU_TAR_TM, kvm_vcpu, arch.tar_tm);
 #endif
 
-#ifdef CONFIG_PPC_BOOK3S_64
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	OFFSET(PACA_SVCPU, paca_struct, shadow_vcpu);
 # define SVCPU_FIELD(x, f)	DEFINE(x, offsetof(struct paca_struct, shadow_vcpu.f))
 #else
 # define SVCPU_FIELD(x, f)
 #endif
-# define HSTATE_FIELD(x, f)	DEFINE(x, offsetof(struct paca_struct, kvm_hstate.f))
-#else	/* 32-bit */
-# define SVCPU_FIELD(x, f)	DEFINE(x, offsetof(struct kvmppc_book3s_shadow_vcpu, f))
-# define HSTATE_FIELD(x, f)	DEFINE(x, offsetof(struct kvmppc_book3s_shadow_vcpu, hstate.f))
-#endif
-
+#define HSTATE_FIELD(x, f)	DEFINE(x, offsetof(struct paca_struct, kvm_hstate.f))
 	SVCPU_FIELD(SVCPU_CR, cr);
 	SVCPU_FIELD(SVCPU_XER, xer);
 	SVCPU_FIELD(SVCPU_CTR, ctr);
@@ -547,14 +538,9 @@ int main(void)
 	SVCPU_FIELD(SVCPU_FAULT_DAR, fault_dar);
 	SVCPU_FIELD(SVCPU_LAST_INST, last_inst);
 	SVCPU_FIELD(SVCPU_SHADOW_SRR1, shadow_srr1);
-#ifdef CONFIG_PPC_BOOK3S_32
-	SVCPU_FIELD(SVCPU_SR, sr);
-#endif
-#ifdef CONFIG_PPC64
 	SVCPU_FIELD(SVCPU_SLB, slb);
 	SVCPU_FIELD(SVCPU_SLB_MAX, slb_max);
 	SVCPU_FIELD(SVCPU_SHADOW_FSCR, shadow_fscr);
-#endif
 
 	HSTATE_FIELD(HSTATE_HOST_R1, host_r1);
 	HSTATE_FIELD(HSTATE_HOST_R2, host_r2);
@@ -601,12 +587,9 @@ int main(void)
 	OFFSET(KVM_SPLIT_NAPPED, kvm_split_mode, napped);
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	HSTATE_FIELD(HSTATE_CFAR, cfar);
 	HSTATE_FIELD(HSTATE_PPR, ppr);
 	HSTATE_FIELD(HSTATE_HOST_FSCR, host_fscr);
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 #else /* CONFIG_PPC_BOOK3S */
 	OFFSET(VCPU_CR, kvm_vcpu, arch.regs.ccr);
 	OFFSET(VCPU_XER, kvm_vcpu, arch.regs.xer);
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 9cba7dbf58dd..6a9bf5762d72 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -168,21 +168,11 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 /*
  * Exception vectors.
  */
-#ifdef CONFIG_PPC_BOOK3S
 #define	START_EXCEPTION(n, label)		\
 	__HEAD;					\
 	. = n;					\
-	DO_KVM n;				\
 label:
 
-#else
-#define	START_EXCEPTION(n, label)		\
-	__HEAD;					\
-	. = n;					\
-label:
-
-#endif
-
 #define EXCEPTION(n, label, hdlr)		\
 	START_EXCEPTION(n, label)		\
 	EXCEPTION_PROLOG n label;		\
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index cb2bca76be53..505d0009ddc9 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -30,7 +30,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ptrace.h>
 #include <asm/bug.h>
-#include <asm/kvm_book3s_asm.h>
 #include <asm/feature-fixups.h>
 #include <asm/interrupt.h>
 
@@ -861,10 +860,6 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
 	rfi
 #endif /* CONFIG_SMP */
 
-#ifdef CONFIG_KVM_BOOK3S_HANDLER
-#include "../kvm/book3s_rmhandlers.S"
-#endif
-
 /*
  * Load stuff into the MMU.  Intended to be called with
  * IR=0 and DR=0.
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index e2230ea512cf..d0a6e2f6df81 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -27,11 +27,6 @@ config KVM
 config KVM_BOOK3S_HANDLER
 	bool
 
-config KVM_BOOK3S_32_HANDLER
-	bool
-	select KVM_BOOK3S_HANDLER
-	select KVM_MMIO
-
 config KVM_BOOK3S_64_HANDLER
 	bool
 	select KVM_BOOK3S_HANDLER
@@ -44,23 +39,6 @@ config KVM_BOOK3S_PR_POSSIBLE
 config KVM_BOOK3S_HV_POSSIBLE
 	bool
 
-config KVM_BOOK3S_32
-	tristate "KVM support for PowerPC book3s_32 processors"
-	depends on PPC_BOOK3S_32 && !SMP && !PTE_64BIT
-	depends on !CONTEXT_TRACKING_USER
-	select KVM
-	select KVM_BOOK3S_32_HANDLER
-	select KVM_BOOK3S_PR_POSSIBLE
-	select PPC_FPU
-	help
-	  Support running unmodified book3s_32 guest kernels
-	  in virtual machines on book3s_32 host processors.
-
-	  This module provides access to the hardware capabilities through
-	  a character device node named /dev/kvm.
-
-	  If unsure, say N.
-
 config KVM_BOOK3S_64
 	tristate "KVM support for PowerPC book3s_64 processors"
 	depends on PPC_BOOK3S_64
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 294f27439f7f..059b4c153d97 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -95,27 +95,12 @@ kvm-book3s_64-module-objs := \
 
 kvm-objs-$(CONFIG_KVM_BOOK3S_64) := $(kvm-book3s_64-module-objs)
 
-kvm-book3s_32-objs := \
-	$(common-objs-y) \
-	emulate.o \
-	fpu.o \
-	book3s_paired_singles.o \
-	book3s.o \
-	book3s_pr.o \
-	book3s_emulate.o \
-	book3s_interrupts.o \
-	book3s_mmu_hpte.o \
-	book3s_32_mmu_host.o \
-	book3s_32_mmu.o
-kvm-objs-$(CONFIG_KVM_BOOK3S_32) := $(kvm-book3s_32-objs)
-
 kvm-objs-$(CONFIG_KVM_MPIC) += mpic.o
 
 kvm-y += $(kvm-objs-m) $(kvm-objs-y)
 
 obj-$(CONFIG_KVM_E500MC) += kvm.o
 obj-$(CONFIG_KVM_BOOK3S_64) += kvm.o
-obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
 
 obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
 obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index d79c5d1098c0..75f4d397114f 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -898,12 +898,9 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 int kvmppc_core_init_vm(struct kvm *kvm)
 {
-
-#ifdef CONFIG_PPC64
 	INIT_LIST_HEAD_RCU(&kvm->arch.spapr_tce_tables);
 	INIT_LIST_HEAD(&kvm->arch.rtas_tokens);
 	mutex_init(&kvm->arch.rtas_token_lock);
-#endif
 
 	return kvm->arch.kvm_ops->init_vm(kvm);
 }
@@ -912,10 +909,8 @@ void kvmppc_core_destroy_vm(struct kvm *kvm)
 {
 	kvm->arch.kvm_ops->destroy_vm(kvm);
 
-#ifdef CONFIG_PPC64
 	kvmppc_rtas_tokens_free(kvm);
 	WARN_ON(!list_empty(&kvm->arch.spapr_tce_tables));
-#endif
 
 #ifdef CONFIG_KVM_XICS
 	/*
@@ -1069,10 +1064,6 @@ static int kvmppc_book3s_init(void)
 	r = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (r)
 		return r;
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	r = kvmppc_book3s_init_pr();
-#endif
-
 #ifdef CONFIG_KVM_XICS
 #ifdef CONFIG_KVM_XIVE
 	if (xics_on_xive()) {
@@ -1089,17 +1080,8 @@ static int kvmppc_book3s_init(void)
 
 static void kvmppc_book3s_exit(void)
 {
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	kvmppc_book3s_exit_pr();
-#endif
 	kvm_exit();
 }
 
 module_init(kvmppc_book3s_init);
 module_exit(kvmppc_book3s_exit);
-
-/* On 32bit this is our one and only kernel module */
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-MODULE_ALIAS_MISCDEV(KVM_MINOR);
-MODULE_ALIAS("devname:kvm");
-#endif
diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index de126d153328..30a117d6e70c 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -351,7 +351,6 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 			vcpu->arch.mmu.tlbie(vcpu, addr, large);
 			break;
 		}
-#ifdef CONFIG_PPC_BOOK3S_64
 		case OP_31_XOP_FAKE_SC1:
 		{
 			/* SC 1 papr hypercalls */
@@ -378,7 +377,6 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 			emulated = EMULATE_EXIT_USER;
 			break;
 		}
-#endif
 		case OP_31_XOP_EIOIO:
 			break;
 		case OP_31_XOP_SLBMTE:
@@ -762,7 +760,6 @@ int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 	case SPRN_GQR7:
 		to_book3s(vcpu)->gqr[sprn - SPRN_GQR0] = spr_val;
 		break;
-#ifdef CONFIG_PPC_BOOK3S_64
 	case SPRN_FSCR:
 		kvmppc_set_fscr(vcpu, spr_val);
 		break;
@@ -810,7 +807,6 @@ int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 		tm_disable();
 
 		break;
-#endif
 #endif
 	case SPRN_ICTC:
 	case SPRN_THRM1:
@@ -829,7 +825,6 @@ int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 	case SPRN_WPAR_GEKKO:
 	case SPRN_MSSSR0:
 	case SPRN_DABR:
-#ifdef CONFIG_PPC_BOOK3S_64
 	case SPRN_MMCRS:
 	case SPRN_MMCRA:
 	case SPRN_MMCR0:
@@ -839,7 +834,6 @@ int kvmppc_core_emulate_mtspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong spr_val)
 	case SPRN_UAMOR:
 	case SPRN_IAMR:
 	case SPRN_AMR:
-#endif
 		break;
 unprivileged:
 	default:
@@ -943,7 +937,6 @@ int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val
 	case SPRN_GQR7:
 		*spr_val = to_book3s(vcpu)->gqr[sprn - SPRN_GQR0];
 		break;
-#ifdef CONFIG_PPC_BOOK3S_64
 	case SPRN_FSCR:
 		*spr_val = vcpu->arch.fscr;
 		break;
@@ -978,7 +971,6 @@ int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val
 			*spr_val = mfspr(SPRN_TFIAR);
 		tm_disable();
 		break;
-#endif
 #endif
 	case SPRN_THRM1:
 	case SPRN_THRM2:
@@ -995,7 +987,6 @@ int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val
 	case SPRN_WPAR_GEKKO:
 	case SPRN_MSSSR0:
 	case SPRN_DABR:
-#ifdef CONFIG_PPC_BOOK3S_64
 	case SPRN_MMCRS:
 	case SPRN_MMCRA:
 	case SPRN_MMCR0:
@@ -1006,7 +997,6 @@ int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu, int sprn, ulong *spr_val
 	case SPRN_UAMOR:
 	case SPRN_IAMR:
 	case SPRN_AMR:
-#endif
 		*spr_val = 0;
 		break;
 	default:
@@ -1038,35 +1028,8 @@ u32 kvmppc_alignment_dsisr(struct kvm_vcpu *vcpu, unsigned int inst)
 
 ulong kvmppc_alignment_dar(struct kvm_vcpu *vcpu, unsigned int inst)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
 	/*
 	 * Linux's fix_alignment() assumes that DAR is valid, so can we
 	 */
 	return vcpu->arch.fault_dar;
-#else
-	ulong dar = 0;
-	ulong ra = get_ra(inst);
-	ulong rb = get_rb(inst);
-
-	switch (get_op(inst)) {
-	case OP_LFS:
-	case OP_LFD:
-	case OP_STFD:
-	case OP_STFS:
-		if (ra)
-			dar = kvmppc_get_gpr(vcpu, ra);
-		dar += (s32)((s16)inst);
-		break;
-	case 31:
-		if (ra)
-			dar = kvmppc_get_gpr(vcpu, ra);
-		dar += kvmppc_get_gpr(vcpu, rb);
-		break;
-	default:
-		printk(KERN_INFO "KVM: Unaligned instruction 0x%x\n", inst);
-		break;
-	}
-
-	return dar;
-#endif
 }
diff --git a/arch/powerpc/kvm/book3s_interrupts.S b/arch/powerpc/kvm/book3s_interrupts.S
index f4bec2fc51aa..c5b88d5451b7 100644
--- a/arch/powerpc/kvm/book3s_interrupts.S
+++ b/arch/powerpc/kvm/book3s_interrupts.S
@@ -14,7 +14,6 @@
 #include <asm/exception-64s.h>
 #include <asm/asm-compat.h>
 
-#if defined(CONFIG_PPC_BOOK3S_64)
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define FUNC(name) 		name
 #else
@@ -22,12 +21,6 @@
 #endif
 #define GET_SHADOW_VCPU(reg)    addi	reg, r13, PACA_SVCPU
 
-#elif defined(CONFIG_PPC_BOOK3S_32)
-#define FUNC(name)		name
-#define GET_SHADOW_VCPU(reg)	lwz     reg, (THREAD + THREAD_KVM_SVCPU)(r2)
-
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 #define VCPU_LOAD_NVGPRS(vcpu) \
 	PPC_LL	r14, VCPU_GPR(R14)(vcpu); \
 	PPC_LL	r15, VCPU_GPR(R15)(vcpu); \
@@ -89,7 +82,6 @@ kvm_start_lightweight:
 	nop
 	REST_GPR(3, r1)
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* Get the dcbz32 flag */
 	PPC_LL	r0, VCPU_HFLAGS(r3)
 	rldicl	r0, r0, 0, 63		/* r3 &= 1 */
@@ -118,7 +110,6 @@ sprg3_little_endian:
 
 after_sprg3_load:
 	mtspr	SPRN_SPRG3, r4
-#endif /* CONFIG_PPC_BOOK3S_64 */
 
 	PPC_LL	r4, VCPU_SHADOW_MSR(r3)	/* get shadow_msr */
 
@@ -157,14 +148,12 @@ after_sprg3_load:
 	bl	FUNC(kvmppc_copy_from_svcpu)
 	nop
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	/*
 	 * Reload kernel SPRG3 value.
 	 * No need to save guest value as usermode can't modify SPRG3.
 	 */
 	ld	r3, PACA_SPRG_VDSO(r13)
 	mtspr	SPRN_SPRG_VDSO_WRITE, r3
-#endif /* CONFIG_PPC_BOOK3S_64 */
 
 	/* R7 = vcpu */
 	PPC_LL	r7, GPR3(r1)
diff --git a/arch/powerpc/kvm/book3s_mmu_hpte.c b/arch/powerpc/kvm/book3s_mmu_hpte.c
index d904e13e069b..91614ca9f969 100644
--- a/arch/powerpc/kvm/book3s_mmu_hpte.c
+++ b/arch/powerpc/kvm/book3s_mmu_hpte.c
@@ -45,13 +45,11 @@ static inline u64 kvmppc_mmu_hash_vpte_long(u64 vpage)
 		       HPTEG_HASH_BITS_VPTE_LONG);
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
 static inline u64 kvmppc_mmu_hash_vpte_64k(u64 vpage)
 {
 	return hash_64((vpage & 0xffffffff0ULL) >> 4,
 		       HPTEG_HASH_BITS_VPTE_64K);
 }
-#endif
 
 void kvmppc_mmu_hpte_cache_map(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
 {
@@ -80,12 +78,10 @@ void kvmppc_mmu_hpte_cache_map(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
 	hlist_add_head_rcu(&pte->list_vpte_long,
 			   &vcpu3s->hpte_hash_vpte_long[index]);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* Add to vPTE_64k list */
 	index = kvmppc_mmu_hash_vpte_64k(pte->pte.vpage);
 	hlist_add_head_rcu(&pte->list_vpte_64k,
 			   &vcpu3s->hpte_hash_vpte_64k[index]);
-#endif
 
 	vcpu3s->hpte_cache_count++;
 
@@ -113,9 +109,7 @@ static void invalidate_pte(struct kvm_vcpu *vcpu, struct hpte_cache *pte)
 	hlist_del_init_rcu(&pte->list_pte_long);
 	hlist_del_init_rcu(&pte->list_vpte);
 	hlist_del_init_rcu(&pte->list_vpte_long);
-#ifdef CONFIG_PPC_BOOK3S_64
 	hlist_del_init_rcu(&pte->list_vpte_64k);
-#endif
 	vcpu3s->hpte_cache_count--;
 
 	spin_unlock(&vcpu3s->mmu_lock);
@@ -222,7 +216,6 @@ static void kvmppc_mmu_pte_vflush_short(struct kvm_vcpu *vcpu, u64 guest_vp)
 	rcu_read_unlock();
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
 /* Flush with mask 0xffffffff0 */
 static void kvmppc_mmu_pte_vflush_64k(struct kvm_vcpu *vcpu, u64 guest_vp)
 {
@@ -243,7 +236,6 @@ static void kvmppc_mmu_pte_vflush_64k(struct kvm_vcpu *vcpu, u64 guest_vp)
 
 	rcu_read_unlock();
 }
-#endif
 
 /* Flush with mask 0xffffff000 */
 static void kvmppc_mmu_pte_vflush_long(struct kvm_vcpu *vcpu, u64 guest_vp)
@@ -275,11 +267,9 @@ void kvmppc_mmu_pte_vflush(struct kvm_vcpu *vcpu, u64 guest_vp, u64 vp_mask)
 	case 0xfffffffffULL:
 		kvmppc_mmu_pte_vflush_short(vcpu, guest_vp);
 		break;
-#ifdef CONFIG_PPC_BOOK3S_64
 	case 0xffffffff0ULL:
 		kvmppc_mmu_pte_vflush_64k(vcpu, guest_vp);
 		break;
-#endif
 	case 0xffffff000ULL:
 		kvmppc_mmu_pte_vflush_long(vcpu, guest_vp);
 		break;
@@ -355,10 +345,8 @@ int kvmppc_mmu_hpte_init(struct kvm_vcpu *vcpu)
 				  ARRAY_SIZE(vcpu3s->hpte_hash_vpte));
 	kvmppc_mmu_hpte_init_hash(vcpu3s->hpte_hash_vpte_long,
 				  ARRAY_SIZE(vcpu3s->hpte_hash_vpte_long));
-#ifdef CONFIG_PPC_BOOK3S_64
 	kvmppc_mmu_hpte_init_hash(vcpu3s->hpte_hash_vpte_64k,
 				  ARRAY_SIZE(vcpu3s->hpte_hash_vpte_64k));
-#endif
 
 	spin_lock_init(&vcpu3s->mmu_lock);
 
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 83bcdc80ce51..36785a02b9da 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -52,17 +52,7 @@
 
 static int kvmppc_handle_ext(struct kvm_vcpu *vcpu, unsigned int exit_nr,
 			     ulong msr);
-#ifdef CONFIG_PPC_BOOK3S_64
 static int kvmppc_handle_fac(struct kvm_vcpu *vcpu, ulong fac);
-#endif
-
-/* Some compatibility defines */
-#ifdef CONFIG_PPC_BOOK3S_32
-#define MSR_USER32 MSR_USER
-#define MSR_USER64 MSR_USER
-#define HW_PAGE_SIZE PAGE_SIZE
-#define HPTE_R_M   _PAGE_COHERENT
-#endif
 
 static bool kvmppc_is_split_real(struct kvm_vcpu *vcpu)
 {
@@ -115,13 +105,11 @@ static void kvmppc_inject_interrupt_pr(struct kvm_vcpu *vcpu, int vec, u64 srr1_
 	new_msr = vcpu->arch.intr_msr;
 	new_pc = to_book3s(vcpu)->hior + vec;
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* If transactional, change to suspend mode on IRQ delivery */
 	if (MSR_TM_TRANSACTIONAL(msr))
 		new_msr |= MSR_TS_S;
 	else
 		new_msr |= msr & MSR_TS_MASK;
-#endif
 
 	kvmppc_set_srr0(vcpu, pc);
 	kvmppc_set_srr1(vcpu, (msr & SRR1_MSR_BITS) | srr1_flags);
@@ -131,7 +119,6 @@ static void kvmppc_inject_interrupt_pr(struct kvm_vcpu *vcpu, int vec, u64 srr1_
 
 static void kvmppc_core_vcpu_load_pr(struct kvm_vcpu *vcpu, int cpu)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
 	struct kvmppc_book3s_shadow_vcpu *svcpu = svcpu_get(vcpu);
 	memcpy(svcpu->slb, to_book3s(vcpu)->slb_shadow, sizeof(svcpu->slb));
 	svcpu->slb_max = to_book3s(vcpu)->slb_shadow_max;
@@ -145,12 +132,8 @@ static void kvmppc_core_vcpu_load_pr(struct kvm_vcpu *vcpu, int cpu)
 		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
 			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) & ~FSCR_SCV);
 	}
-#endif
 
 	vcpu->cpu = smp_processor_id();
-#ifdef CONFIG_PPC_BOOK3S_32
-	current->thread.kvm_shadow_vcpu = vcpu->arch.shadow_vcpu;
-#endif
 
 	if (kvmppc_is_split_real(vcpu))
 		kvmppc_fixup_split_real(vcpu);
@@ -160,7 +143,6 @@ static void kvmppc_core_vcpu_load_pr(struct kvm_vcpu *vcpu, int cpu)
 
 static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu *vcpu)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
 	struct kvmppc_book3s_shadow_vcpu *svcpu = svcpu_get(vcpu);
 	if (svcpu->in_use) {
 		kvmppc_copy_from_svcpu(vcpu);
@@ -176,7 +158,6 @@ static void kvmppc_core_vcpu_put_pr(struct kvm_vcpu *vcpu)
 		if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
 			mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) | FSCR_SCV);
 	}
-#endif
 
 	if (kvmppc_is_split_real(vcpu))
 		kvmppc_unfixup_split_real(vcpu);
@@ -212,9 +193,7 @@ void kvmppc_copy_to_svcpu(struct kvm_vcpu *vcpu)
 	svcpu->ctr = vcpu->arch.regs.ctr;
 	svcpu->lr  = vcpu->arch.regs.link;
 	svcpu->pc  = vcpu->arch.regs.nip;
-#ifdef CONFIG_PPC_BOOK3S_64
 	svcpu->shadow_fscr = vcpu->arch.shadow_fscr;
-#endif
 	/*
 	 * Now also save the current time base value. We use this
 	 * to find the guest purr and spurr value.
@@ -245,9 +224,7 @@ static void kvmppc_recalc_shadow_msr(struct kvm_vcpu *vcpu)
 	/* External providers the guest reserved */
 	smsr |= (guest_msr & vcpu->arch.guest_owned_ext);
 	/* 64-bit Process MSR values */
-#ifdef CONFIG_PPC_BOOK3S_64
 	smsr |= MSR_HV;
-#endif
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/*
 	 * in guest privileged state, we want to fail all TM transactions.
@@ -298,9 +275,7 @@ void kvmppc_copy_from_svcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.fault_dar   = svcpu->fault_dar;
 	vcpu->arch.fault_dsisr = svcpu->fault_dsisr;
 	vcpu->arch.last_inst   = svcpu->last_inst;
-#ifdef CONFIG_PPC_BOOK3S_64
 	vcpu->arch.shadow_fscr = svcpu->shadow_fscr;
-#endif
 	/*
 	 * Update purr and spurr using time base on exit.
 	 */
@@ -553,7 +528,6 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
 
 	vcpu->arch.hflags &= ~BOOK3S_HFLAG_SLB;
 	vcpu->arch.pvr = pvr;
-#ifdef CONFIG_PPC_BOOK3S_64
 	if ((pvr >= 0x330000) && (pvr < 0x70330000)) {
 		kvmppc_mmu_book3s_64_init(vcpu);
 		if (!to_book3s(vcpu)->hior_explicit)
@@ -561,7 +535,6 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
 		to_book3s(vcpu)->msr_mask = 0xffffffffffffffffULL;
 		vcpu->arch.cpu_type = KVM_CPU_3S_64;
 	} else
-#endif
 	{
 		kvmppc_mmu_book3s_32_init(vcpu);
 		if (!to_book3s(vcpu)->hior_explicit)
@@ -605,11 +578,6 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
 		break;
 	}
 
-#ifdef CONFIG_PPC_BOOK3S_32
-	/* 32 bit Book3S always has 32 byte dcbz */
-	vcpu->arch.hflags |= BOOK3S_HFLAG_DCBZ32;
-#endif
-
 	/* On some CPUs we can execute paired single operations natively */
 	asm ( "mfpvr %0" : "=r"(host_pvr));
 	switch (host_pvr) {
@@ -839,7 +807,6 @@ void kvmppc_giveup_ext(struct kvm_vcpu *vcpu, ulong msr)
 /* Give up facility (TAR / EBB / DSCR) */
 void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac)
 {
-#ifdef CONFIG_PPC_BOOK3S_64
 	if (!(vcpu->arch.shadow_fscr & (1ULL << fac))) {
 		/* Facility not available to the guest, ignore giveup request*/
 		return;
@@ -852,7 +819,6 @@ void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac)
 		vcpu->arch.shadow_fscr &= ~FSCR_TAR;
 		break;
 	}
-#endif
 }
 
 /* Handle external providers (FPU, Altivec, VSX) */
@@ -954,8 +920,6 @@ static void kvmppc_handle_lost_ext(struct kvm_vcpu *vcpu)
 	current->thread.regs->msr |= lost_ext;
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
-
 void kvmppc_trigger_fac_interrupt(struct kvm_vcpu *vcpu, ulong fac)
 {
 	/* Inject the Interrupt Cause field and trigger a guest interrupt */
@@ -1050,7 +1014,6 @@ void kvmppc_set_fscr(struct kvm_vcpu *vcpu, u64 fscr)
 
 	vcpu->arch.fscr = fscr;
 }
-#endif
 
 static void kvmppc_setup_debug(struct kvm_vcpu *vcpu)
 {
@@ -1157,24 +1120,6 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		if (kvmppc_is_split_real(vcpu))
 			kvmppc_fixup_split_real(vcpu);
 
-#ifdef CONFIG_PPC_BOOK3S_32
-		/* We set segments as unused segments when invalidating them. So
-		 * treat the respective fault as segment fault. */
-		{
-			struct kvmppc_book3s_shadow_vcpu *svcpu;
-			u32 sr;
-
-			svcpu = svcpu_get(vcpu);
-			sr = svcpu->sr[kvmppc_get_pc(vcpu) >> SID_SHIFT];
-			svcpu_put(svcpu);
-			if (sr == SR_INVALID) {
-				kvmppc_mmu_map_segment(vcpu, kvmppc_get_pc(vcpu));
-				r = RESUME_GUEST;
-				break;
-			}
-		}
-#endif
-
 		/* only care about PTEG not found errors, but leave NX alone */
 		if (shadow_srr1 & 0x40000000) {
 			int idx = srcu_read_lock(&vcpu->kvm->srcu);
@@ -1203,24 +1148,6 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		u32 fault_dsisr = vcpu->arch.fault_dsisr;
 		vcpu->stat.pf_storage++;
 
-#ifdef CONFIG_PPC_BOOK3S_32
-		/* We set segments as unused segments when invalidating them. So
-		 * treat the respective fault as segment fault. */
-		{
-			struct kvmppc_book3s_shadow_vcpu *svcpu;
-			u32 sr;
-
-			svcpu = svcpu_get(vcpu);
-			sr = svcpu->sr[dar >> SID_SHIFT];
-			svcpu_put(svcpu);
-			if (sr == SR_INVALID) {
-				kvmppc_mmu_map_segment(vcpu, dar);
-				r = RESUME_GUEST;
-				break;
-			}
-		}
-#endif
-
 		/*
 		 * We need to handle missing shadow PTEs, and
 		 * protection faults due to us mapping a page read-only
@@ -1297,12 +1224,10 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 			ulong cmd = kvmppc_get_gpr(vcpu, 3);
 			int i;
 
-#ifdef CONFIG_PPC_BOOK3S_64
 			if (kvmppc_h_pr(vcpu, cmd) == EMULATE_DONE) {
 				r = RESUME_GUEST;
 				break;
 			}
-#endif
 
 			run->papr_hcall.nr = cmd;
 			for (i = 0; i < 9; ++i) {
@@ -1395,11 +1320,9 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		r = RESUME_GUEST;
 		break;
 	}
-#ifdef CONFIG_PPC_BOOK3S_64
 	case BOOK3S_INTERRUPT_FAC_UNAVAIL:
 		r = kvmppc_handle_fac(vcpu, vcpu->arch.shadow_fscr >> 56);
 		break;
-#endif
 	case BOOK3S_INTERRUPT_MACHINE_CHECK:
 		kvmppc_book3s_queue_irqprio(vcpu, exit_nr);
 		r = RESUME_GUEST;
@@ -1488,7 +1411,6 @@ static int kvm_arch_vcpu_ioctl_set_sregs_pr(struct kvm_vcpu *vcpu,
 	kvmppc_set_pvr_pr(vcpu, sregs->pvr);
 
 	vcpu3s->sdr1 = sregs->u.s.sdr1;
-#ifdef CONFIG_PPC_BOOK3S_64
 	if (vcpu->arch.hflags & BOOK3S_HFLAG_SLB) {
 		/* Flush all SLB entries */
 		vcpu->arch.mmu.slbmte(vcpu, 0, 0);
@@ -1501,9 +1423,7 @@ static int kvm_arch_vcpu_ioctl_set_sregs_pr(struct kvm_vcpu *vcpu,
 			if (rb & SLB_ESID_V)
 				vcpu->arch.mmu.slbmte(vcpu, rs, rb);
 		}
-	} else
-#endif
-	{
+	} else {
 		for (i = 0; i < 16; i++) {
 			vcpu->arch.mmu.mtsrin(vcpu, i, sregs->u.s.ppc32.sr[i]);
 		}
@@ -1737,18 +1657,10 @@ static int kvmppc_core_vcpu_create_pr(struct kvm_vcpu *vcpu)
 		goto out;
 	vcpu->arch.book3s = vcpu_book3s;
 
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	vcpu->arch.shadow_vcpu =
-		kzalloc(sizeof(*vcpu->arch.shadow_vcpu), GFP_KERNEL);
-	if (!vcpu->arch.shadow_vcpu)
-		goto free_vcpu3s;
-#endif
-
 	p = __get_free_page(GFP_KERNEL|__GFP_ZERO);
 	if (!p)
 		goto free_shadow_vcpu;
 	vcpu->arch.shared = (void *)p;
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* Always start the shared struct in native endian mode */
 #ifdef __BIG_ENDIAN__
         vcpu->arch.shared_big_endian = true;
@@ -1765,11 +1677,6 @@ static int kvmppc_core_vcpu_create_pr(struct kvm_vcpu *vcpu)
 	if (mmu_has_feature(MMU_FTR_1T_SEGMENT))
 		vcpu->arch.pvr = mfspr(SPRN_PVR);
 	vcpu->arch.intr_msr = MSR_SF;
-#else
-	/* default to book3s_32 (750) */
-	vcpu->arch.pvr = 0x84202;
-	vcpu->arch.intr_msr = 0;
-#endif
 	kvmppc_set_pvr_pr(vcpu, vcpu->arch.pvr);
 	vcpu->arch.slb_nr = 64;
 
@@ -1784,10 +1691,6 @@ static int kvmppc_core_vcpu_create_pr(struct kvm_vcpu *vcpu)
 free_shared_page:
 	free_page((unsigned long)vcpu->arch.shared);
 free_shadow_vcpu:
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	kfree(vcpu->arch.shadow_vcpu);
-free_vcpu3s:
-#endif
 	vfree(vcpu_book3s);
 out:
 	return err;
@@ -1799,9 +1702,6 @@ static void kvmppc_core_vcpu_free_pr(struct kvm_vcpu *vcpu)
 
 	kvmppc_mmu_destroy_pr(vcpu);
 	free_page((unsigned long)vcpu->arch.shared & PAGE_MASK);
-#ifdef CONFIG_KVM_BOOK3S_32_HANDLER
-	kfree(vcpu->arch.shadow_vcpu);
-#endif
 	vfree(vcpu_book3s);
 }
 
@@ -1921,7 +1821,6 @@ static void kvmppc_core_free_memslot_pr(struct kvm_memory_slot *slot)
 	return;
 }
 
-#ifdef CONFIG_PPC64
 static int kvm_vm_ioctl_get_smmu_info_pr(struct kvm *kvm,
 					 struct kvm_ppc_smmu_info *info)
 {
@@ -1978,16 +1877,6 @@ static int kvm_configure_mmu_pr(struct kvm *kvm, struct kvm_ppc_mmuv3_cfg *cfg)
 	return 0;
 }
 
-#else
-static int kvm_vm_ioctl_get_smmu_info_pr(struct kvm *kvm,
-					 struct kvm_ppc_smmu_info *info)
-{
-	/* We should not get called */
-	BUG();
-	return 0;
-}
-#endif /* CONFIG_PPC64 */
-
 static unsigned int kvm_global_user_count = 0;
 static DEFINE_SPINLOCK(kvm_global_user_count_lock);
 
@@ -1995,10 +1884,8 @@ static int kvmppc_core_init_vm_pr(struct kvm *kvm)
 {
 	mutex_init(&kvm->arch.hpt_mutex);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* Start out with the default set of hcalls enabled */
 	kvmppc_pr_init_default_hcalls(kvm);
-#endif
 
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
 		spin_lock(&kvm_global_user_count_lock);
@@ -2011,9 +1898,7 @@ static int kvmppc_core_init_vm_pr(struct kvm *kvm)
 
 static void kvmppc_core_destroy_vm_pr(struct kvm *kvm)
 {
-#ifdef CONFIG_PPC64
 	WARN_ON(!list_empty(&kvm->arch.spapr_tce_tables));
-#endif
 
 	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
 		spin_lock(&kvm_global_user_count_lock);
@@ -2072,10 +1957,8 @@ static struct kvmppc_ops kvm_ops_pr = {
 	.emulate_mfspr = kvmppc_core_emulate_mfspr_pr,
 	.fast_vcpu_kick = kvm_vcpu_kick,
 	.arch_vm_ioctl  = kvm_arch_vm_ioctl_pr,
-#ifdef CONFIG_PPC_BOOK3S_64
 	.hcall_implemented = kvmppc_hcall_impl_pr,
 	.configure_mmu = kvm_configure_mmu_pr,
-#endif
 	.giveup_ext = kvmppc_giveup_ext,
 };
 
@@ -2104,8 +1987,6 @@ void kvmppc_book3s_exit_pr(void)
 /*
  * We only support separate modules for book3s 64
  */
-#ifdef CONFIG_PPC_BOOK3S_64
-
 module_init(kvmppc_book3s_init_pr);
 module_exit(kvmppc_book3s_exit_pr);
 
@@ -2113,4 +1994,3 @@ MODULE_DESCRIPTION("KVM on Book3S without using hypervisor mode");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(KVM_MINOR);
 MODULE_ALIAS("devname:kvm");
-#endif
diff --git a/arch/powerpc/kvm/book3s_rmhandlers.S b/arch/powerpc/kvm/book3s_rmhandlers.S
index 0a557ffca9fe..ef01e8ed2a97 100644
--- a/arch/powerpc/kvm/book3s_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_rmhandlers.S
@@ -14,9 +14,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/asm-compat.h>
 
-#ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/exception-64s.h>
-#endif
 
 /*****************************************************************************
  *                                                                           *
@@ -24,120 +22,12 @@
  *                                                                           *
  ****************************************************************************/
 
-#if defined(CONFIG_PPC_BOOK3S_64)
-
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define FUNC(name) 		name
 #else
 #define FUNC(name) 		GLUE(.,name)
 #endif
 
-#elif defined(CONFIG_PPC_BOOK3S_32)
-
-#define FUNC(name)		name
-
-#define RFI_TO_KERNEL	rfi
-#define RFI_TO_GUEST	rfi
-
-.macro INTERRUPT_TRAMPOLINE intno
-
-.global kvmppc_trampoline_\intno
-kvmppc_trampoline_\intno:
-
-	mtspr	SPRN_SPRG_SCRATCH0, r13		/* Save r13 */
-
-	/*
-	 * First thing to do is to find out if we're coming
-	 * from a KVM guest or a Linux process.
-	 *
-	 * To distinguish, we check a magic byte in the PACA/current
-	 */
-	mfspr	r13, SPRN_SPRG_THREAD
-	lwz	r13, THREAD_KVM_SVCPU(r13)
-	/* PPC32 can have a NULL pointer - let's check for that */
-	mtspr   SPRN_SPRG_SCRATCH1, r12		/* Save r12 */
-	mfcr	r12
-	cmpwi	r13, 0
-	bne	1f
-2:	mtcr	r12
-	mfspr	r12, SPRN_SPRG_SCRATCH1
-	mfspr	r13, SPRN_SPRG_SCRATCH0		/* r13 = original r13 */
-	b	kvmppc_resume_\intno		/* Get back original handler */
-
-1:	tophys(r13, r13)
-	stw	r12, HSTATE_SCRATCH1(r13)
-	mfspr	r12, SPRN_SPRG_SCRATCH1
-	stw	r12, HSTATE_SCRATCH0(r13)
-	lbz	r12, HSTATE_IN_GUEST(r13)
-	cmpwi	r12, KVM_GUEST_MODE_NONE
-	bne	..kvmppc_handler_hasmagic_\intno
-	/* No KVM guest? Then jump back to the Linux handler! */
-	lwz	r12, HSTATE_SCRATCH1(r13)
-	b	2b
-
-	/* Now we know we're handling a KVM guest */
-..kvmppc_handler_hasmagic_\intno:
-
-	/* Should we just skip the faulting instruction? */
-	cmpwi	r12, KVM_GUEST_MODE_SKIP
-	beq	kvmppc_handler_skip_ins
-
-	/* Let's store which interrupt we're handling */
-	li	r12, \intno
-
-	/* Jump into the SLB exit code that goes to the highmem handler */
-	b	kvmppc_handler_trampoline_exit
-
-.endm
-
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_SYSTEM_RESET
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_MACHINE_CHECK
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_DATA_STORAGE
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_INST_STORAGE
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_EXTERNAL
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_ALIGNMENT
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_PROGRAM
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_FP_UNAVAIL
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_DECREMENTER
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_SYSCALL
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_TRACE
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_PERFMON
-INTERRUPT_TRAMPOLINE	BOOK3S_INTERRUPT_ALTIVEC
-
-/*
- * Bring us back to the faulting code, but skip the
- * faulting instruction.
- *
- * This is a generic exit path from the interrupt
- * trampolines above.
- *
- * Input Registers:
- *
- * R12            = free
- * R13            = Shadow VCPU (PACA)
- * HSTATE.SCRATCH0 = guest R12
- * HSTATE.SCRATCH1 = guest CR
- * SPRG_SCRATCH0  = guest R13
- *
- */
-kvmppc_handler_skip_ins:
-
-	/* Patch the IP to the next instruction */
-	/* Note that prefixed instructions are disabled in PR KVM for now */
-	mfsrr0	r12
-	addi	r12, r12, 4
-	mtsrr0	r12
-
-	/* Clean up all state */
-	lwz	r12, HSTATE_SCRATCH1(r13)
-	mtcr	r12
-	PPC_LL	r12, HSTATE_SCRATCH0(r13)
-	GET_SCRATCH0(r13)
-
-	/* And get back into the code */
-	RFI_TO_KERNEL
-#endif
-
 /*
  * Call kvmppc_handler_trampoline_enter in real mode
  *
diff --git a/arch/powerpc/kvm/book3s_segment.S b/arch/powerpc/kvm/book3s_segment.S
index 202046a83fc1..eec41008d815 100644
--- a/arch/powerpc/kvm/book3s_segment.S
+++ b/arch/powerpc/kvm/book3s_segment.S
@@ -11,31 +11,16 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 
-#if defined(CONFIG_PPC_BOOK3S_64)
-
 #define GET_SHADOW_VCPU(reg)    \
 	mr	reg, r13
 
-#elif defined(CONFIG_PPC_BOOK3S_32)
-
-#define GET_SHADOW_VCPU(reg)    			\
-	tophys(reg, r2);       			\
-	lwz     reg, (THREAD + THREAD_KVM_SVCPU)(reg);	\
-	tophys(reg, reg)
-
-#endif
-
 /* Disable for nested KVM */
 #define USE_QUICK_LAST_INST
 
 
 /* Get helper functions for subarch specific functionality */
 
-#if defined(CONFIG_PPC_BOOK3S_64)
 #include "book3s_64_slb.S"
-#elif defined(CONFIG_PPC_BOOK3S_32)
-#include "book3s_32_sr.S"
-#endif
 
 /******************************************************************************
  *                                                                            *
@@ -81,7 +66,6 @@ kvmppc_handler_trampoline_enter:
 	/* Switch to guest segment. This is subarch specific. */
 	LOAD_GUEST_SEGMENTS
 
-#ifdef CONFIG_PPC_BOOK3S_64
 BEGIN_FTR_SECTION
 	/* Save host FSCR */
 	mfspr	r8, SPRN_FSCR
@@ -108,8 +92,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	mtspr   SPRN_HID5,r0
 no_dcbz32_on:
 
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 	/* Enter guest */
 
 	PPC_LL	r8, SVCPU_CTR(r3)
@@ -170,13 +152,11 @@ kvmppc_interrupt_pr:
 	 * HSTATE.SCRATCH0 = guest R12
 	 * HSTATE.SCRATCH2 = guest R9
 	 */
-#ifdef CONFIG_PPC64
 	/* Match 32-bit entry */
 	ld	r9,HSTATE_SCRATCH2(r13)
 	rotldi	r12, r12, 32		  /* Flip R12 halves for stw */
 	stw	r12, HSTATE_SCRATCH1(r13) /* CR is now in the low half */
 	srdi	r12, r12, 32		  /* shift trap into low half */
-#endif
 
 .global kvmppc_handler_trampoline_exit
 kvmppc_handler_trampoline_exit:
@@ -209,7 +189,6 @@ kvmppc_handler_trampoline_exit:
 	PPC_LL	r2, HSTATE_HOST_R2(r13)
 
 	/* Save guest PC and MSR */
-#ifdef CONFIG_PPC64
 BEGIN_FTR_SECTION
 	andi.	r0, r12, 0x2
 	cmpwi	cr1, r0, 0
@@ -219,7 +198,7 @@ BEGIN_FTR_SECTION
 	andi.	r12,r12,0x3ffd
 	b	2f
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-#endif
+
 1:	mfsrr0	r3
 	mfsrr1	r4
 2:
@@ -265,7 +244,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	beq	ld_last_prev_inst
 	cmpwi	r12, BOOK3S_INTERRUPT_ALIGNMENT
 	beq-	ld_last_inst
-#ifdef CONFIG_PPC64
 BEGIN_FTR_SECTION
 	cmpwi	r12, BOOK3S_INTERRUPT_H_EMUL_ASSIST
 	beq-	ld_last_inst
@@ -274,7 +252,6 @@ BEGIN_FTR_SECTION
 	cmpwi	r12, BOOK3S_INTERRUPT_FAC_UNAVAIL
 	beq-	ld_last_inst
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
-#endif
 
 	b	no_ld_last_inst
 
@@ -317,7 +294,6 @@ no_ld_last_inst:
 	/* Switch back to host MMU */
 	LOAD_HOST_SEGMENTS
 
-#ifdef CONFIG_PPC_BOOK3S_64
 
 	lbz	r5, HSTATE_RESTORE_HID5(r13)
 	cmpwi	r5, 0
@@ -342,8 +318,6 @@ no_fscr_save:
 	mtspr	SPRN_FSCR, r8
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 	/*
 	 * For some interrupts, we need to call the real Linux
 	 * handler, so it can do work for us. This has to happen
@@ -386,13 +360,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 #endif
 	PPC_LL	r8, HSTATE_VMHANDLER(r13)
 
-#ifdef CONFIG_PPC64
 BEGIN_FTR_SECTION
 	beq	cr1, 1f
 	mtspr	SPRN_HSRR1, r6
 	mtspr	SPRN_HSRR0, r8
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-#endif
 1:	/* Restore host msr -> SRR1 */
 	mtsrr1	r6
 	/* Load highmem handler address */
diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
index 355d5206e8aa..74508516df51 100644
--- a/arch/powerpc/kvm/emulate.c
+++ b/arch/powerpc/kvm/emulate.c
@@ -229,9 +229,7 @@ int kvmppc_emulate_instruction(struct kvm_vcpu *vcpu)
 		switch (get_xop(inst)) {
 
 		case OP_31_XOP_TRAP:
-#ifdef CONFIG_64BIT
 		case OP_31_XOP_TRAP_64:
-#endif
 #ifdef CONFIG_PPC_BOOK3S
 			kvmppc_core_queue_program(vcpu, SRR1_PROGTRAP);
 #else
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index ce1d91eed231..8059876abf23 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1163,11 +1163,9 @@ static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu)
 
 	if (vcpu->arch.mmio_sign_extend) {
 		switch (run->mmio.len) {
-#ifdef CONFIG_PPC64
 		case 4:
 			gpr = (s64)(s32)gpr;
 			break;
-#endif
 		case 2:
 			gpr = (s64)(s16)gpr;
 			break;
-- 
2.39.5


