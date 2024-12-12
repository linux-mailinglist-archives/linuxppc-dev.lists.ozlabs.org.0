Return-Path: <linuxppc-dev+bounces-4043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4019EE72B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 13:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8CC26Cqnz30Qy;
	Thu, 12 Dec 2024 23:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734008174;
	cv=none; b=ON8qu19GVpW5ejUCBDHbxnRwsCn1TgOtLQNqhQDMWMzwL1+tDTVC8K6ybq0HtHL9nTg5OCi/LqplNSZIanCq9UIzFOFNwsEIOB/VOOX2/TsauBbvnkRIzRK4kN3QGQ0PvrSD7wMY0etS5p6TpP53lnFTzdZ0w8A8aDTChgud9w7aIkrLBsaCQ15zDwyw2GLvrHhLAUOMdJ9wHppgMpHtBPJ8brXnnVNiRaxiOYUHoriVwES1ylNRQcI9m6fsmiZNt19gftEeHMfonakfdJ0/65NOE3vMXi91gssWb2yVRCaMeIJ6bIFEUtWnpXVtC9AfA0jlixcysMa8egsEDvXprw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734008174; c=relaxed/relaxed;
	bh=1qkPQos52r6S4DxJm6P+O0txFHrJ5ZhMv4nJhLh6NCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LZFYD8mzFSZSgJJVIxjV4JpzM4q4Ju0EfYRi9sjrnvu3KspJPYmgcP48rNSb27aGwnRCgBT/IFKaMQgMHjLZhjehxmISCe9ExouYvHv7V7cp2qS6X5Wb9WIDl4ChRJcGl7BZcEmhLC1uR0K9TJfXor+pzIjtxut3GsV6sYuIiPiCfjgK3UFGGHs6zU4ZpFDgorpVj3hE4QivbyjlZ53PNBfTnx3FF9EYAz2pemsn3EWKiJZepNkpWeKOpm2KBqcVCsH06sivKH7psy570qRIAlbIvFXx+OdiAUCT5L9f7sWqswHJPeB1az9+Zryul/HB5KZ3pJBLjbU398SaRrKquw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n+7Fj8Of; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n+7Fj8Of;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8CBz6MF0z30Qb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 23:56:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FDD25C5816;
	Thu, 12 Dec 2024 12:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1FDC4CECE;
	Thu, 12 Dec 2024 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734008168;
	bh=xxZqH/jWseGtawnTC3Mff0BVdlHl78xupLUOsVLvfIc=;
	h=From:To:Cc:Subject:Date:From;
	b=n+7Fj8Of8e5sts5EpMo7IcbPPQefDcygJTvJiXwpSImEu/euclZ6Bx4GqaPgB9BAS
	 FC4B8FUtqKk2cwlm+G4MDUFBJxlGjy+Xyf+UGEHoh7ODAHRe5iul8cwad7BmocUNUO
	 yQgv1x7MmFDwvvnAQtr0sJwLl7qC/O0URI3UfnyVQ9MTFZyjCr5vlk55V1qwVpYdi1
	 QZKderZ8s7FSi4AC3RP01v7I+mr84s09Or5FW2yiFQ/NnidTgm0la/5eUMXMidG1uo
	 huHO0dznecqL990+dZlovhbBYo/EoQ4Kvug0p3zf2r057/Y1qQayr/EDXOK4i4ZnQk
	 B8d9Wq66KI53A==
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
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 0/5] KVM: drop 32-bit host support on all architectures
Date: Thu, 12 Dec 2024 13:55:11 +0100
Message-Id: <20241212125516.467123-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

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

It probably makes sense to drop all of these at the same time, provided
there are no actual users remaining (not counting regression testing
that developers might be doing). Please let me know if you are still
using any of these machines, or think there needs to be deprecation
phase first.

      Arnd

Link: https://lore.kernel.org/lkml/Z1B1phcpbiYWLgCD@google.com/
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
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org

Arnd Bergmann (5):
  mips: kvm: drop support for 32-bit hosts
  powerpc: kvm: drop 32-bit booke
  powerpc: kvm: drop 32-bit book3s
  riscv: kvm: drop 32-bit host support
  x86: kvm drop 32-bit host support

 MAINTAINERS                                 |   2 +-
 arch/mips/Kconfig                           |   3 -
 arch/mips/include/asm/kvm_host.h            |   4 -
 arch/mips/kvm/Kconfig                       |   1 +
 arch/mips/kvm/emulate.c                     |   8 -
 arch/mips/kvm/msa.S                         |  12 -
 arch/mips/kvm/vz.c                          |  22 -
 arch/powerpc/include/asm/kvm_book3s.h       |  19 -
 arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
 arch/powerpc/include/asm/kvm_book3s_asm.h   |  10 -
 arch/powerpc/include/asm/kvm_booke.h        |   4 -
 arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
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
 arch/powerpc/kvm/booke.c                    | 264 ----------
 arch/powerpc/kvm/booke.h                    |   8 -
 arch/powerpc/kvm/booke_emulate.c            |  44 --
 arch/powerpc/kvm/booke_interrupts.S         | 535 -------------------
 arch/powerpc/kvm/bookehv_interrupts.S       |  10 -
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
 arch/x86/kvm/cpuid.c                        |   9 +-
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
 77 files changed, 63 insertions(+), 3356 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/kvm_book3s_32.h
 delete mode 100644 arch/powerpc/kvm/book3s_32_mmu_host.c
 delete mode 100644 arch/powerpc/kvm/booke_interrupts.S
 delete mode 100644 arch/powerpc/kvm/e500.c

-- 
2.39.5


