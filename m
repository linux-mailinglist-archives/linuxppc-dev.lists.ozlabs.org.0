Return-Path: <linuxppc-dev+bounces-13501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C6BC1999D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 11:11:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxNLB4Y9Dz3clw;
	Wed, 29 Oct 2025 21:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761732658;
	cv=none; b=EsHBd5ZL4wvDi1fQ6kYWEfIFIah1XaM0wAYzAheyYv9EnxIku8jhg6olFjljJLTrMIYT/OdKRzoDq2TSM37nkBvn4WkMr5xzigACUftEWS7vDvka5TRGubSvvPcd8E3EonL5qpM6FMNar6obFF+OCtxSr5SqNGYeWlB4qWBgx3NGJbuMEvpUEc9WUxhemwbtczUNerUEtur2JKt25xVm1nk3vJ7Vs7Yb9Cz/4j3v/cI3MGluzvcoHDkOAQ2lLeVRGW1aSOY3MHNrjMbBUxFojnShm2XSZpwVAfSzCTGtBsqSbYY5BhMWK6r8qhudsXg4lINCXAPbshXmPhdse3ZlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761732658; c=relaxed/relaxed;
	bh=I9Pp0eaXfL0Aw6jjgmC/rM07fCjwLsckbAE00re4rq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrLSGdPAhitembzYN66Dz7C4rRrQDF7Ocq4+Gbj8n3L1AeU2j/mppmMYW0S7R8N3h0wFwBghSFZVPTWPzL5FfEwzzV1pShhSQkWw3g5wzk7Q67J42+xALlGsqg7VNLMWmn61FWyHPSakMBfBMbTf7rFwPcyr0CYJ7LFpzT+gNMrYT8uTRhdElaT/yMo7rg6nyzcNEBB53VG0m2vsaY6UMjTcHe3i564DTxnObanUzD1nynH7hgIEulgQjkpQZ/U+n2op2mvKoiyZ0LlvZ+KSuT+DwDP8/xkPM9kLAHwKKzCbtL/klW8MzjwoQtPXzZLvR79VVKiqdvS49HW51kimBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxNL94ZqKz3bfX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 21:10:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBC272BCE;
	Wed, 29 Oct 2025 03:10:09 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7CEE3F66E;
	Wed, 29 Oct 2025 03:10:12 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
Date: Wed, 29 Oct 2025 10:09:02 +0000
Message-ID: <20251029100909.3381140-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Architectures currently opt in for implementing lazy_mmu helpers by
defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.

In preparation for introducing a generic lazy_mmu layer that will
require storage in task_struct, let's switch to a cleaner approach:
instead of defining a macro, select a CONFIG option.

This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
arch select it when it implements lazy_mmu helpers.
__HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
relies on the new CONFIG instead.

On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
selected. This creates some complications in arch/x86/boot/, because
a few files manually undefine PARAVIRT* options. As a result
<asm/paravirt.h> does not define the lazy_mmu helpers, but this
breaks the build as <linux/pgtable.h> only defines them if
!CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
way out of this - let's just undefine that new CONFIG too.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/Kconfig                                 | 1 +
 arch/arm64/include/asm/pgtable.h                   | 1 -
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
 arch/powerpc/platforms/Kconfig.cputype             | 1 +
 arch/sparc/Kconfig                                 | 1 +
 arch/sparc/include/asm/tlbflush_64.h               | 2 --
 arch/x86/Kconfig                                   | 1 +
 arch/x86/boot/compressed/misc.h                    | 1 +
 arch/x86/boot/startup/sme.c                        | 1 +
 arch/x86/include/asm/paravirt.h                    | 1 -
 include/linux/pgtable.h                            | 2 +-
 mm/Kconfig                                         | 3 +++
 12 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..e6bf5c7311b5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -122,6 +122,7 @@ config ARM64
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
 	select ARCH_HAS_UBSAN
+	select ARCH_HAS_LAZY_MMU_MODE
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
 	select ARM_GIC
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0944e296dd4a..54f8d6bb6f22 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -80,7 +80,6 @@ static inline void queue_pte_barriers(void)
 	}
 }
 
-#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
 	/*
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 7704dbe8e88d..623a8a8b2d0e 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -24,8 +24,6 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 
 extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
-#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-
 static inline void arch_enter_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 7b527d18aa5e..2942d57cf59c 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -93,6 +93,7 @@ config PPC_BOOK3S_64
 	select IRQ_WORK
 	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
 	select KASAN_VMALLOC if KASAN
+	select ARCH_HAS_LAZY_MMU_MODE
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a630d373e645..2bad14744ca4 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -112,6 +112,7 @@ config SPARC64
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select ARCH_SUPPORTS_SCHED_SMT if SMP
 	select ARCH_SUPPORTS_SCHED_MC  if SMP
+	select ARCH_HAS_LAZY_MMU_MODE
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 925bb5d7a4e1..4e1036728e2f 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -39,8 +39,6 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
-#define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-
 void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
 void arch_flush_lazy_mmu_mode(void);
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa3b616af03a..ef4332d720ab 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -804,6 +804,7 @@ config PARAVIRT
 config PARAVIRT_XXL
 	bool
 	depends on X86_64
+	select ARCH_HAS_LAZY_MMU_MODE
 
 config PARAVIRT_DEBUG
 	bool "paravirt-ops debugging"
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index db1048621ea2..cdd7f692d9ee 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -11,6 +11,7 @@
 #undef CONFIG_PARAVIRT
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS
+#undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
 #undef CONFIG_KASAN
 #undef CONFIG_KASAN_GENERIC
 
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index e7ea65f3f1d6..b76a7c95dfe1 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -24,6 +24,7 @@
 #undef CONFIG_PARAVIRT
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS
+#undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
 
 /*
  * This code runs before CPU feature bits are set. By default, the
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b5e59a7ba0d0..13f9cd31c8f8 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -526,7 +526,6 @@ static inline void arch_end_context_switch(struct task_struct *next)
 	PVOP_VCALL1(cpu.end_context_switch, next);
 }
 
-#define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
 {
 	PVOP_VCALL0(mmu.lazy_mode.enter);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 32e8457ad535..9894366e768b 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
  * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
  * and the mode cannot be used in interrupt context.
  */
-#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
+#ifndef CONFIG_ARCH_HAS_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void) {}
 static inline void arch_leave_lazy_mmu_mode(void) {}
 static inline void arch_flush_lazy_mmu_mode(void) {}
diff --git a/mm/Kconfig b/mm/Kconfig
index 0e26f4fc8717..5480c9a1bfb2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1372,6 +1372,9 @@ config PT_RECLAIM
 config FIND_NORMAL_PAGE
 	def_bool n
 
+config ARCH_HAS_LAZY_MMU_MODE
+	bool
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.47.0


