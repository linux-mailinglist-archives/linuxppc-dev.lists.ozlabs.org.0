Return-Path: <linuxppc-dev+bounces-4390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2F9FA29E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 22:49:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFybh04J7z2xjQ;
	Sun, 22 Dec 2024 08:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734817743;
	cv=none; b=RPN2U9TCXlR3iUJxAH18K1gCDG5tEAV/XEWG4EPMMvkSncxXyBlozkKr2T5NFFzCymKobsbMvHBhO/r07TQWTHsAuZXjmfWAfGZbZcbjNk5Z4wQroFnIHGIzJfKKAdVP7v6aLwIr4JqTScL1l7vqYfmB/mh6hyYvZCeTeML5D88owwBake++sNeIHlQGoU2L7jpe26yuIuqu3nfbADZwUcSagpXaxRyutpUDrBO3CEM7WBzlXZ7CpxSEaT8IN+qq/tugWttGXUcSwWM3EBDaeIkxKvQNPE2QQcprM/6eB+xj5uZxv+iO5mhGp2b/RO6jMQSjJ0x4DSBeWF8LohuD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734817743; c=relaxed/relaxed;
	bh=KZwoqYxn/yc/FVxPzZRraVdqHt50h4CUjs8Vw3aKLvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D6hyzNRQYVd05iZXMOfE1IXGiNRV5aXB19s8LrLqJehA57H56WsSjYn5/48JBsZCuwZlUpv1/K7klif1eIMbaoznLrkPnRUj2mZHWddc458MmAeuK1iEIkRM1tas03Dy1G0rB3eIxi6wyQi/GIFSmdFh0LTGHze9X3G+3ciMX+4JJc7fa0j1qPc+eQg1T2YeH3DD0DD5GrCM2aqo8p21hEEQ3zhln7mX0WXOn667FXLRdjjyin2RNRs5QqmmfCRMu8917z7rwFUN3JR1DE072TzB82SLGfVpguLhETjTdLLiZhcTHvc2dNt0FnLE0hYKC2E7L8j5sew8nB+VXrg51A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9y2FsCZ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9y2FsCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFybf47ylz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 08:49:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 147E5A403F5;
	Sat, 21 Dec 2024 21:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA08C4CECE;
	Sat, 21 Dec 2024 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817739;
	bh=liSnJKHt137nDINsiNS8bBle3Cakfhe3aWwZ4NxRgcA=;
	h=From:To:Cc:Subject:Date:From;
	b=f9y2FsCZXSDafB5TbgOF65PJ7LnEv+LO6b/B2wnLgowdZ6Rzly5Ph9Gnu5IvLiwLr
	 Cytt5GW/+3ZIlLFHNp2Ne6ZsmfOYsIPAX5hMhGJbIIK97SehoSLQaoiM/R2ZCUQ3cm
	 XELo0Bt0XTaJR0dDn/VelQXxX4uf2TkbBZBGLg/qbnYRNSXsIgW9KHdTX6KpOeIIgY
	 2AnjB8pwrt0wr97UXs0ymdOIft+CgjBpbx5hfXbdjsgzA3Hm7yufnoAB1ROPWOwMZh
	 j2a+QU4yvoLiaM3vOHQ6x8sMcVdQM00CK2/aDqbJEs+QNpcTNHoLfoWMr9gI/Vdjqx
	 PkqvYDjziUKwQ==
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
Subject: [PATCH v2 0/5] KVM: drop 32-bit host support on all architectures
Date: Sat, 21 Dec 2024 22:42:18 +0100
Message-Id: <20241221214223.3046298-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

I've updated my RFC patches based on the feedback, changing mainly
the powerpc code. 

I submitted a patch to remove KVM support for x86-32 hosts earlier
this month, but there were still concerns that this might be useful for
testing 32-bit host in general, as that remains supported on three other
architectures. I have gone through those three now and prepared similar
patches, as all of them seem to be equally obsolete.

Support for 32-bit KVM host on Arm hardware was dropped back in 2020
because of lack of users, despite Cortex-A7/A15/A17 based SoCs being
much more widely deployed than the other virtualization capable 32-bit
CPUs (Intel Core Duo/Silverthorne, PowerPC e300/e500/e600, MIPS P5600)
combined.

I hope this can get merged through the KVM tree as a whole series.

      Arnd

---
v2 changes:
 - rebase to kvm #next branch
 - improve changelog text for x86
 - many updates for powerpc, thanks to Christophe Leroy for suggestions

Link: https://lore.kernel.org/lkml/Z1B1phcpbiYWLgCD@google.com/
Link: https://lore.kernel.org/lkml/20241212125516.467123-1-arnd@kernel.org/

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Alexander Graf <graf@amazon.com>
Cc: Crystal Wood <crwood@redhat.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Durrant <paul@xen.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org

Arnd Bergmann (5):
  mips: kvm: drop support for 32-bit hosts
  riscv: kvm: drop 32-bit host support
  powerpc: kvm: drop 32-bit booke
  powerpc: kvm: drop 32-bit book3s
  x86: kvm drop 32-bit host support

 MAINTAINERS                                 |   2 +-
 arch/mips/Kconfig                           |   3 -
 arch/mips/include/asm/kvm_host.h            |   4 -
 arch/mips/kvm/Kconfig                       |   1 +
 arch/mips/kvm/emulate.c                     |   8 -
 arch/mips/kvm/msa.S                         |  12 -
 arch/mips/kvm/vz.c                          |  22 -
 arch/powerpc/include/asm/kvm_book3s.h       |  17 -
 arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
 arch/powerpc/include/asm/kvm_book3s_asm.h   |  10 -
 arch/powerpc/include/asm/kvm_booke.h        |   4 -
 arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
 arch/powerpc/include/asm/kvm_host.h         |   2 +-
 arch/powerpc/include/asm/kvm_ppc.h          |   2 +-
 arch/powerpc/include/asm/processor.h        |   3 -
 arch/powerpc/kernel/asm-offsets.c           |  21 +-
 arch/powerpc/kernel/head_32.h               |  10 -
 arch/powerpc/kernel/head_85xx.S             |  14 -
 arch/powerpc/kernel/head_book3s_32.S        |   5 -
 arch/powerpc/kernel/head_booke.h            |  39 --
 arch/powerpc/kvm/Kconfig                    |  44 +-
 arch/powerpc/kvm/Makefile                   |  30 --
 arch/powerpc/kvm/book3s.c                   |  18 -
 arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------
 arch/powerpc/kvm/book3s_emulate.c           |  37 --
 arch/powerpc/kvm/book3s_interrupts.S        |  11 -
 arch/powerpc/kvm/book3s_mmu_hpte.c          |  12 -
 arch/powerpc/kvm/book3s_pr.c                | 122 +----
 arch/powerpc/kvm/book3s_rmhandlers.S        | 110 ----
 arch/powerpc/kvm/book3s_segment.S           |  30 +-
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
 arch/powerpc/kvm/emulate.c                  |   2 -
 arch/powerpc/kvm/powerpc.c                  |   2 -
 arch/powerpc/kvm/trace_booke.h              |  14 -
 arch/riscv/kvm/Kconfig                      |   2 +-
 arch/riscv/kvm/aia.c                        | 105 ----
 arch/riscv/kvm/aia_imsic.c                  |  34 --
 arch/riscv/kvm/mmu.c                        |   8 -
 arch/riscv/kvm/vcpu_exit.c                  |   4 -
 arch/riscv/kvm/vcpu_insn.c                  |  12 -
 arch/riscv/kvm/vcpu_sbi_pmu.c               |   8 -
 arch/riscv/kvm/vcpu_sbi_replace.c           |   4 -
 arch/riscv/kvm/vcpu_sbi_v01.c               |   4 -
 arch/riscv/kvm/vcpu_timer.c                 |  20 -
 arch/x86/kvm/Kconfig                        |   6 +-
 arch/x86/kvm/Makefile                       |   4 +-
 arch/x86/kvm/cpuid.c                        |   2 +-
 arch/x86/kvm/emulate.c                      |  34 +-
 arch/x86/kvm/fpu.h                          |   4 -
 arch/x86/kvm/hyperv.c                       |   5 +-
 arch/x86/kvm/i8254.c                        |   4 -
 arch/x86/kvm/kvm_cache_regs.h               |   2 -
 arch/x86/kvm/kvm_emulate.h                  |   8 -
 arch/x86/kvm/lapic.c                        |   4 -
 arch/x86/kvm/mmu.h                          |   4 -
 arch/x86/kvm/mmu/mmu.c                      | 134 -----
 arch/x86/kvm/mmu/mmu_internal.h             |   9 -
 arch/x86/kvm/mmu/paging_tmpl.h              |   9 -
 arch/x86/kvm/mmu/spte.h                     |   5 -
 arch/x86/kvm/mmu/tdp_mmu.h                  |   4 -
 arch/x86/kvm/smm.c                          |  19 -
 arch/x86/kvm/svm/sev.c                      |   2 -
 arch/x86/kvm/svm/svm.c                      |  23 +-
 arch/x86/kvm/svm/vmenter.S                  |  20 -
 arch/x86/kvm/trace.h                        |   4 -
 arch/x86/kvm/vmx/main.c                     |   2 -
 arch/x86/kvm/vmx/nested.c                   |  24 +-
 arch/x86/kvm/vmx/vmcs.h                     |   2 -
 arch/x86/kvm/vmx/vmenter.S                  |  25 +-
 arch/x86/kvm/vmx/vmx.c                      | 117 +----
 arch/x86/kvm/vmx/vmx.h                      |  23 +-
 arch/x86/kvm/vmx/vmx_ops.h                  |   7 -
 arch/x86/kvm/vmx/x86_ops.h                  |   2 -
 arch/x86/kvm/x86.c                          |  74 +--
 arch/x86/kvm/x86.h                          |   4 -
 arch/x86/kvm/xen.c                          |  61 +--
 85 files changed, 66 insertions(+), 3536 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/kvm_book3s_32.h
 delete mode 100644 arch/powerpc/kvm/book3s_32_mmu_host.c
 delete mode 100644 arch/powerpc/kvm/booke_interrupts.S
 delete mode 100644 arch/powerpc/kvm/e500.c

-- 
2.39.5


