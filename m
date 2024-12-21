Return-Path: <linuxppc-dev+bounces-4392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8F9FA2A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 22:49:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFybx4SCRz2yJ5;
	Sun, 22 Dec 2024 08:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734817757;
	cv=none; b=RmlOcSbryk9Gt6WrRLBKKH7OrxrPb7XxY5MHiIon84mIMxjOuaJMbAo/SHiBfKXqPXTJwo1sETcVZfN5H9FAGDOIGdWKYG2v7SqRAJd6EPH2RRAfjaonfUurRnm63nLDUaoUUoZWf8fBYLNJlnKzSR7975TQNsCEhIvv2ibhPAynqTVDtCDfLwmJBKEgS3P+92d9gbpNks6Mfsvwh5EFUrijfbQsMiN+FGMG7qMyO74SngWSPGpvyzyop1oG+iLgydAgBq1G7+hjE984ybKDtsMrRaeoZSOsbJuR2OFX+kiOlAT+9M+TufLbNMqiil/NdsZIVC66wh1S4n9fNLVkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734817757; c=relaxed/relaxed;
	bh=MsydR7sv8F1ysD/oDuX/iQ2/8qXbeteQVkXdwCqUCcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hx0QeLgthM/SKWYlbgUhnX8q1lkazmA5sk34ykYIWi9dM6IIj+saPFV8xGLZ2j4vCZWbJsZU1j3rrV4asjhr34yBsuUaXSoHQcHBJ8juCBiM+hWDxbhMv1N6k8GieYRh+T371lJ4iNiuueDlCfjcL86SrEbBmtr5NQXPsnTacUWbqM47Mt55s874/cKyLl6tj31yPaLjzuOFfdva9/Po0CotSwW/rRsdWc0Gf4L4Aw06Y77gKdJx7Gm9AeQFnElcuCUStgvjyEq7emjPR1WSaoVYvbcwPXLUZpb7NDuE/+C4JV6jjZWIZJ6rBLYmOQh4l9/Efw9epS8CPkiU9r5qFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RhBbWiB2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RhBbWiB2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFybw3Lr9z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 08:49:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88DC95C54A9;
	Sat, 21 Dec 2024 21:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08437C4CEDD;
	Sat, 21 Dec 2024 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817752;
	bh=A4Xal2bu7XHZMDN53ywR1+Edqh6+h/uUgPJL7FdzLJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhBbWiB2K3h0H4KG9s3j2ERKII4rPWBfqYRhJrKOeihQGpgDyaDW2oLUWp/arJ6qT
	 ZbrZfYbnpDOVUU7x9VV3/dCWblx8Us0N96SiFssHetG6h+LUjeg09vNpo1b515eqsq
	 2dnUHztgK4/raIq5VJ2VURXxICNZQMjhhkMSAG5W/C+XDRU5arOAfOR3wEPsftljlz
	 8gdfMnCuSoJ30ry8fru1FIP9/CJdl/X5Mtr+vN545UaJ7AbLYVj4J5qjIfa4Shfn/u
	 FPcl2CBb/XjEVutdEtGLVaCJtnooAoDnVY+GPDpbcqjJVJ2EGp5ZIy+FVcyzUHk4nW
	 x7PdjxrwyE3CA==
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
Subject: [PATCH v2 2/5] riscv: kvm: drop 32-bit host support
Date: Sat, 21 Dec 2024 22:42:20 +0100
Message-Id: <20241221214223.3046298-3-arnd@kernel.org>
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

KVM support on RISC-V includes both 32-bit and 64-bit host mode, but in
practice, all RISC-V SoCs that may use this are 64-bit:

As of linux-6.13, there is no mainline Linux support for any specific
32-bit SoC in arch/riscv/, although the generic qemu model should work.

The available RV32 CPU implementations are mostly built for
microcontroller applications and are lacking a memory management
unit. There are a few CPU cores with an MMU, but those still lack the
hypervisor extensions needed for running KVM.

This is unlikely to change in the future, so remove the 32-bit host
code and simplify the test matrix.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/kvm/Kconfig            |   2 +-
 arch/riscv/kvm/aia.c              | 105 ------------------------------
 arch/riscv/kvm/aia_imsic.c        |  34 ----------
 arch/riscv/kvm/mmu.c              |   8 ---
 arch/riscv/kvm/vcpu_exit.c        |   4 --
 arch/riscv/kvm/vcpu_insn.c        |  12 ----
 arch/riscv/kvm/vcpu_sbi_pmu.c     |   8 ---
 arch/riscv/kvm/vcpu_sbi_replace.c |   4 --
 arch/riscv/kvm/vcpu_sbi_v01.c     |   4 --
 arch/riscv/kvm/vcpu_timer.c       |  20 ------
 10 files changed, 1 insertion(+), 200 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 0c3cbb0915ff..7405722e4433 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -19,7 +19,7 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
-	depends on RISCV_SBI && MMU
+	depends on RISCV_SBI && MMU && 64BIT
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 19afd1f23537..a399a5a9af0e 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -66,33 +66,6 @@ static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
 	return hvictl;
 }
 
-#ifdef CONFIG_32BIT
-void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
-{
-	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
-	unsigned long mask, val;
-
-	if (!kvm_riscv_aia_available())
-		return;
-
-	if (READ_ONCE(vcpu->arch.irqs_pending_mask[1])) {
-		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[1], 0);
-		val = READ_ONCE(vcpu->arch.irqs_pending[1]) & mask;
-
-		csr->hviph &= ~mask;
-		csr->hviph |= val;
-	}
-}
-
-void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
-{
-	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
-
-	if (kvm_riscv_aia_available())
-		csr->vsieh = ncsr_read(CSR_VSIEH);
-}
-#endif
-
 bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
 	int hgei;
@@ -101,12 +74,6 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	if (!kvm_riscv_aia_available())
 		return false;
 
-#ifdef CONFIG_32BIT
-	if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
-	    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask)))
-		return true;
-#endif
-
 	seip = vcpu->arch.guest_csr.vsie;
 	seip &= (unsigned long)mask;
 	seip &= BIT(IRQ_S_EXT);
@@ -128,9 +95,6 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
 	if (!kvm_riscv_aia_available())
 		return;
 
-#ifdef CONFIG_32BIT
-	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
-#endif
 	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
 }
 
@@ -147,22 +111,10 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
 		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
 		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
-#ifdef CONFIG_32BIT
-		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
-		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
-		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
-		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
-#endif
 	} else {
 		csr_write(CSR_VSISELECT, csr->vsiselect);
 		csr_write(CSR_HVIPRIO1, csr->hviprio1);
 		csr_write(CSR_HVIPRIO2, csr->hviprio2);
-#ifdef CONFIG_32BIT
-		csr_write(CSR_VSIEH, csr->vsieh);
-		csr_write(CSR_HVIPH, csr->hviph);
-		csr_write(CSR_HVIPRIO1H, csr->hviprio1h);
-		csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
-#endif
 	}
 }
 
@@ -179,22 +131,10 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 		csr->vsiselect = nacl_csr_read(nsh, CSR_VSISELECT);
 		csr->hviprio1 = nacl_csr_read(nsh, CSR_HVIPRIO1);
 		csr->hviprio2 = nacl_csr_read(nsh, CSR_HVIPRIO2);
-#ifdef CONFIG_32BIT
-		csr->vsieh = nacl_csr_read(nsh, CSR_VSIEH);
-		csr->hviph = nacl_csr_read(nsh, CSR_HVIPH);
-		csr->hviprio1h = nacl_csr_read(nsh, CSR_HVIPRIO1H);
-		csr->hviprio2h = nacl_csr_read(nsh, CSR_HVIPRIO2H);
-#endif
 	} else {
 		csr->vsiselect = csr_read(CSR_VSISELECT);
 		csr->hviprio1 = csr_read(CSR_HVIPRIO1);
 		csr->hviprio2 = csr_read(CSR_HVIPRIO2);
-#ifdef CONFIG_32BIT
-		csr->vsieh = csr_read(CSR_VSIEH);
-		csr->hviph = csr_read(CSR_HVIPH);
-		csr->hviprio1h = csr_read(CSR_HVIPRIO1H);
-		csr->hviprio2h = csr_read(CSR_HVIPRIO2H);
-#endif
 	}
 }
 
@@ -226,10 +166,6 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 	if (kvm_riscv_aia_available()) {
 		((unsigned long *)csr)[reg_num] = val;
 
-#ifdef CONFIG_32BIT
-		if (reg_num == KVM_REG_RISCV_CSR_AIA_REG(siph))
-			WRITE_ONCE(vcpu->arch.irqs_pending_mask[1], 0);
-#endif
 	}
 
 	return 0;
@@ -282,19 +218,8 @@ static u8 aia_get_iprio8(struct kvm_vcpu *vcpu, unsigned int irq)
 		hviprio = ncsr_read(CSR_HVIPRIO1);
 		break;
 	case 1:
-#ifndef CONFIG_32BIT
 		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
-#else
-		hviprio = ncsr_read(CSR_HVIPRIO1H);
-		break;
-	case 2:
-		hviprio = ncsr_read(CSR_HVIPRIO2);
-		break;
-	case 3:
-		hviprio = ncsr_read(CSR_HVIPRIO2H);
-		break;
-#endif
 	default:
 		return 0;
 	}
@@ -315,19 +240,8 @@ static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 		hviprio = ncsr_read(CSR_HVIPRIO1);
 		break;
 	case 1:
-#ifndef CONFIG_32BIT
-		hviprio = ncsr_read(CSR_HVIPRIO2);
-		break;
-#else
-		hviprio = ncsr_read(CSR_HVIPRIO1H);
-		break;
-	case 2:
 		hviprio = ncsr_read(CSR_HVIPRIO2);
 		break;
-	case 3:
-		hviprio = ncsr_read(CSR_HVIPRIO2H);
-		break;
-#endif
 	default:
 		return;
 	}
@@ -340,19 +254,8 @@ static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
 		ncsr_write(CSR_HVIPRIO1, hviprio);
 		break;
 	case 1:
-#ifndef CONFIG_32BIT
 		ncsr_write(CSR_HVIPRIO2, hviprio);
 		break;
-#else
-		ncsr_write(CSR_HVIPRIO1H, hviprio);
-		break;
-	case 2:
-		ncsr_write(CSR_HVIPRIO2, hviprio);
-		break;
-	case 3:
-		ncsr_write(CSR_HVIPRIO2H, hviprio);
-		break;
-#endif
 	default:
 		return;
 	}
@@ -366,10 +269,8 @@ static int aia_rmw_iprio(struct kvm_vcpu *vcpu, unsigned int isel,
 	unsigned long old_val;
 	u8 prio;
 
-#ifndef CONFIG_32BIT
 	if (isel & 0x1)
 		return KVM_INSN_ILLEGAL_TRAP;
-#endif
 
 	nirqs = 4 * (BITS_PER_LONG / 32);
 	first_irq = (isel - ISELECT_IPRIO0) * 4;
@@ -577,12 +478,6 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
-#ifdef CONFIG_32BIT
-	csr_write(CSR_HVIPH, 0x0);
-	csr_write(CSR_HIDELEGH, 0x0);
-	csr_write(CSR_HVIPRIO1H, 0x0);
-	csr_write(CSR_HVIPRIO2H, 0x0);
-#endif
 
 	/* Enable per-CPU SGEI interrupt */
 	enable_percpu_irq(hgei_parent_irq,
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index a8085cd8215e..16c44b10ee97 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -258,13 +258,7 @@ static u32 imsic_mrif_topei(struct imsic_mrif *mrif, u32 nr_eix, u32 nr_msis)
 		eix = &mrif->eix[ei];
 		eipend[0] = imsic_mrif_atomic_read(mrif, &eix->eie[0]) &
 			    imsic_mrif_atomic_read(mrif, &eix->eip[0]);
-#ifdef CONFIG_32BIT
-		eipend[1] = imsic_mrif_atomic_read(mrif, &eix->eie[1]) &
-			    imsic_mrif_atomic_read(mrif, &eix->eip[1]);
-		if (!eipend[0] && !eipend[1])
-#else
 		if (!eipend[0])
-#endif
 			continue;
 
 		imin = ei * BITS_PER_TYPE(u64);
@@ -296,10 +290,8 @@ static int imsic_mrif_isel_check(u32 nr_eix, unsigned long isel)
 	default:
 		return -ENOENT;
 	}
-#ifndef CONFIG_32BIT
 	if (num & 0x1)
 		return -EINVAL;
-#endif
 	if ((num / 2) >= nr_eix)
 		return -EINVAL;
 
@@ -337,13 +329,9 @@ static int imsic_mrif_rmw(struct imsic_mrif *mrif, u32 nr_eix,
 			return -EINVAL;
 		eix = &mrif->eix[num / 2];
 
-#ifndef CONFIG_32BIT
 		if (num & 0x1)
 			return -EINVAL;
 		ei = (pend) ? &eix->eip[0] : &eix->eie[0];
-#else
-		ei = (pend) ? &eix->eip[num & 0x1] : &eix->eie[num & 0x1];
-#endif
 
 		/* Bit0 of EIP0 or EIE0 is read-only */
 		if (!num)
@@ -395,10 +383,6 @@ static void imsic_vsfile_local_read(void *data)
 			eix = &mrif->eix[i];
 			eix->eip[0] = imsic_eix_swap(IMSIC_EIP0 + i * 2, 0);
 			eix->eie[0] = imsic_eix_swap(IMSIC_EIE0 + i * 2, 0);
-#ifdef CONFIG_32BIT
-			eix->eip[1] = imsic_eix_swap(IMSIC_EIP0 + i * 2 + 1, 0);
-			eix->eie[1] = imsic_eix_swap(IMSIC_EIE0 + i * 2 + 1, 0);
-#endif
 		}
 	} else {
 		mrif->eidelivery = imsic_vs_csr_read(IMSIC_EIDELIVERY);
@@ -407,10 +391,6 @@ static void imsic_vsfile_local_read(void *data)
 			eix = &mrif->eix[i];
 			eix->eip[0] = imsic_eix_read(IMSIC_EIP0 + i * 2);
 			eix->eie[0] = imsic_eix_read(IMSIC_EIE0 + i * 2);
-#ifdef CONFIG_32BIT
-			eix->eip[1] = imsic_eix_read(IMSIC_EIP0 + i * 2 + 1);
-			eix->eie[1] = imsic_eix_read(IMSIC_EIE0 + i * 2 + 1);
-#endif
 		}
 	}
 
@@ -469,10 +449,8 @@ static void imsic_vsfile_local_rw(void *data)
 		break;
 	case IMSIC_EIP0 ... IMSIC_EIP63:
 	case IMSIC_EIE0 ... IMSIC_EIE63:
-#ifndef CONFIG_32BIT
 		if (idata->isel & 0x1)
 			break;
-#endif
 		if (idata->write)
 			imsic_eix_write(idata->isel, idata->val);
 		else
@@ -536,10 +514,6 @@ static void imsic_vsfile_local_clear(int vsfile_hgei, u32 nr_eix)
 	for (i = 0; i < nr_eix; i++) {
 		imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
 		imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
-#ifdef CONFIG_32BIT
-		imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
-		imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
-#endif
 	}
 
 	csr_write(CSR_HSTATUS, old_hstatus);
@@ -573,10 +547,6 @@ static void imsic_vsfile_local_update(int vsfile_hgei, u32 nr_eix,
 		eix = &mrif->eix[i];
 		imsic_eix_set(IMSIC_EIP0 + i * 2, eix->eip[0]);
 		imsic_eix_set(IMSIC_EIE0 + i * 2, eix->eie[0]);
-#ifdef CONFIG_32BIT
-		imsic_eix_set(IMSIC_EIP0 + i * 2 + 1, eix->eip[1]);
-		imsic_eix_set(IMSIC_EIE0 + i * 2 + 1, eix->eie[1]);
-#endif
 	}
 	imsic_vs_csr_write(IMSIC_EITHRESHOLD, mrif->eithreshold);
 	imsic_vs_csr_write(IMSIC_EIDELIVERY, mrif->eidelivery);
@@ -667,10 +637,6 @@ static void imsic_swfile_update(struct kvm_vcpu *vcpu,
 		eix = &mrif->eix[i];
 		imsic_mrif_atomic_or(smrif, &seix->eip[0], eix->eip[0]);
 		imsic_mrif_atomic_or(smrif, &seix->eie[0], eix->eie[0]);
-#ifdef CONFIG_32BIT
-		imsic_mrif_atomic_or(smrif, &seix->eip[1], eix->eip[1]);
-		imsic_mrif_atomic_or(smrif, &seix->eie[1], eix->eie[1]);
-#endif
 	}
 
 	imsic_swfile_extirq_update(vcpu);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..2aee1100d450 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -19,15 +19,9 @@
 #include <asm/page.h>
 #include <asm/pgtable.h>
 
-#ifdef CONFIG_64BIT
 static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
 static unsigned long gstage_pgd_levels __ro_after_init = 3;
 #define gstage_index_bits	9
-#else
-static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels __ro_after_init = 2;
-#define gstage_index_bits	10
-#endif
 
 #define gstage_pgd_xbits	2
 #define gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + gstage_pgd_xbits))
@@ -739,7 +733,6 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 
 void __init kvm_riscv_gstage_mode_detect(void)
 {
-#ifdef CONFIG_64BIT
 	/* Try Sv57x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
@@ -758,7 +751,6 @@ void __init kvm_riscv_gstage_mode_detect(void)
 
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
-#endif
 }
 
 unsigned long __init kvm_riscv_gstage_mode(void)
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index fa98e5c024b2..f5d598f6acfc 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -107,11 +107,7 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 			".option push\n"
 			".option norvc\n"
 			"add %[ttmp], %[taddr], 0\n"
-#ifdef CONFIG_64BIT
 			HLV_D(%[val], %[addr])
-#else
-			HLV_W(%[val], %[addr])
-#endif
 			".option pop"
 		: [val] "=&r" (val),
 		  [taddr] "+&r" (taddr), [ttmp] "+&r" (ttmp)
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..913c454bee26 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -78,11 +78,7 @@
 
 #define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
 
-#ifdef CONFIG_64BIT
 #define LOG_REGBYTES		3
-#else
-#define LOG_REGBYTES		2
-#endif
 #define REGBYTES		(1 << LOG_REGBYTES)
 
 #define SH_RD			7
@@ -522,19 +518,16 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
 		len = 1;
 		shift = 8 * (sizeof(ulong) - len);
-#ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
 	} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
 		len = 4;
-#endif
 	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
 		len = 2;
 		shift = 8 * (sizeof(ulong) - len);
 	} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
 		len = 2;
-#ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
@@ -543,7 +536,6 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		   ((insn >> SH_RD) & 0x1f)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-#endif
 	} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
@@ -645,13 +637,10 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		len = 4;
 	} else if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
 		len = 1;
-#ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
 		len = 8;
-#endif
 	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
 		len = 2;
-#ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
 		len = 8;
 		data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
@@ -659,7 +648,6 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		   ((insn >> SH_RD) & 0x1f)) {
 		len = 8;
 		data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
-#endif
 	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
 		len = 4;
 		data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..0871265416fa 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -35,11 +35,7 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
 		break;
 	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
-#if defined(CONFIG_32BIT)
-		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
-#else
 		temp = cp->a4;
-#endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
 		 * No need to forward the error to userspace and exit the guest.
@@ -50,11 +46,7 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 						       cp->a2, cp->a3, temp, retdata);
 		break;
 	case SBI_EXT_PMU_COUNTER_START:
-#if defined(CONFIG_32BIT)
-		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
-#else
 		temp = cp->a3;
-#endif
 		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
 						   temp, retdata);
 		break;
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 9c2ab3dfa93a..9276140644d1 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -26,11 +26,7 @@ static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 
 	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_SET_TIMER);
-#if __riscv_xlen == 32
-	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
-#else
 	next_cycle = (u64)cp->a0;
-#endif
 	kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
 
 	return 0;
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 8f4c4fa16227..e06ba01392d6 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -35,11 +35,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		retdata->uexit = true;
 		break;
 	case SBI_EXT_0_1_SET_TIMER:
-#if __riscv_xlen == 32
-		next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
-#else
 		next_cycle = (u64)cp->a0;
-#endif
 		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
 		break;
 	case SBI_EXT_0_1_CLEAR_IPI:
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 96e7a4e463f7..fc32338b8cf8 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -71,12 +71,7 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
-#if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
-	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
-#else
 	ncsr_write(CSR_VSTIMECMP, ncycles);
-#endif
 	return 0;
 }
 
@@ -288,12 +283,7 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 {
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
-#if defined(CONFIG_32BIT)
-	ncsr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
-	ncsr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
-#else
 	ncsr_write(CSR_HTIMEDELTA, gt->time_delta);
-#endif
 }
 
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
@@ -305,12 +295,7 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	if (!t->sstc_enabled)
 		return;
 
-#if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
-	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
-#else
 	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
-#endif
 
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
@@ -326,12 +311,7 @@ void kvm_riscv_vcpu_timer_sync(struct kvm_vcpu *vcpu)
 	if (!t->sstc_enabled)
 		return;
 
-#if defined(CONFIG_32BIT)
 	t->next_cycles = ncsr_read(CSR_VSTIMECMP);
-	t->next_cycles |= (u64)ncsr_read(CSR_VSTIMECMPH) << 32;
-#else
-	t->next_cycles = ncsr_read(CSR_VSTIMECMP);
-#endif
 }
 
 void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
-- 
2.39.5


