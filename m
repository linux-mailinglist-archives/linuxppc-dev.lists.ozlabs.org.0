Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EC7427AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:48:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EqR7Tkw8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iXEEhDud;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsKYC2S9Dz3bpk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 23:48:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EqR7Tkw8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iXEEhDud;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHpv5ntZz3cBY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:30:31 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 56F482187E;
	Thu, 29 Jun 2023 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQaVVKQnvfyOkViKgnextxWkU0QdRkJ4AW3iovTriNI=;
	b=EqR7Tkw8IwIDmTB8z+iT2XTTEaKaLYgBVpawbpd+rkw4+h1q6jizGoMmGNl7+yA3xcHk5j
	ZIEu0XbAO3Y00b9EHJPmVF8mMfcyHPP4+2/jU+q/N/73lhJFSxAOamyEGRzjMF+btDr5vL
	odezt9etV7x+Rw55eLEFWdGrsFz7+BI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQaVVKQnvfyOkViKgnextxWkU0QdRkJ4AW3iovTriNI=;
	b=iXEEhDudVD0ixI3+aj6ZzcuBjrm/yXCSadRDiM1tYOH+0uLfZcDvjUSOAjeTorzF9rM8Pw
	gI2G6ZFvsdSlFxDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1709513905;
	Thu, 29 Jun 2023 12:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4DC4BO52nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 06/12] arch: Declare screen_info in <asm/screen_info.h>
Date: Thu, 29 Jun 2023 13:45:45 +0200
Message-ID: <20230629121952.10559-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jun 2023 23:48:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Dave Hansen <dave.h
 ansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sami Tolvanen <samitolvanen@google.com>, Juerg Haefliger <juerg.haefliger@canonical.com>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Chris Zankel <chris@zankel.net>, Frederic Weisbecker <frederic@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Zi Yan <ziy@nvidia.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, Niklas Schnelle <schnelle@linux.ibm.com>, linux-kernel@vger
 .kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The variable screen_info does not exist on all architectures. Declare
it in <asm-generic/screen_info.h>. All architectures that do declare it
will provide it via <asm/screen_info.h>.

Add the Kconfig token ARCH_HAS_SCREEN_INFO to guard against access on
architectures that don't provide screen_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Brian Cain <bcain@quicinc.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Zi Yan <ziy@nvidia.com>
---
 arch/Kconfig                      |  6 ++++++
 arch/alpha/Kconfig                |  1 +
 arch/arm/Kconfig                  |  1 +
 arch/arm64/Kconfig                |  1 +
 arch/csky/Kconfig                 |  1 +
 arch/hexagon/Kconfig              |  1 +
 arch/ia64/Kconfig                 |  1 +
 arch/loongarch/Kconfig            |  1 +
 arch/mips/Kconfig                 |  1 +
 arch/nios2/Kconfig                |  1 +
 arch/powerpc/Kconfig              |  1 +
 arch/riscv/Kconfig                |  1 +
 arch/sh/Kconfig                   |  1 +
 arch/sparc/Kconfig                |  1 +
 arch/x86/Kconfig                  |  1 +
 arch/xtensa/Kconfig               |  1 +
 drivers/video/Kconfig             |  3 +++
 include/asm-generic/Kbuild        |  1 +
 include/asm-generic/screen_info.h | 12 ++++++++++++
 include/linux/screen_info.h       |  2 +-
 20 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/screen_info.h

diff --git a/arch/Kconfig b/arch/Kconfig
index 205fd23e0cada..2f58293fd7bcb 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1466,6 +1466,12 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_SCREEN_INFO
+	bool
+	help
+	  Selected by architectures that provide a global instance of
+	  screen_info.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index a5c2b1aa46b02..d749011d88b14 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -4,6 +4,7 @@ config ALPHA
 	default y
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_NO_PREEMPT
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0fb4b218f6658..a9d01ee67a90e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_STACKWALK
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 343e1e1cae10a..21addc4715bb3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -36,6 +36,7 @@ config ARM64
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_DEVMAP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 4df1f8c9d170b..28444e581fc1f 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -10,6 +10,7 @@ config CSKY
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 54eadf2651786..cc683c0a43d34 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -5,6 +5,7 @@ comment "Linux Kernel Configuration for Hexagon"
 config HEXAGON
 	def_bool y
 	select ARCH_32BIT_OFF_T
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_NO_PREEMPT
 	select DMA_GLOBAL_POOL
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index e79f15e32a451..8b1e785e6d53d 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -10,6 +10,7 @@ config IA64
 	bool
 	select ARCH_BINFMT_ELF_EXTRA_PHDRS
 	select ARCH_HAS_DMA_MARK_CLEAN
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_STRNCPY_FROM_USER
 	select ARCH_HAS_STRNLEN_USER
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931b..6aab2fb7753da 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -13,6 +13,7 @@ config LOONGARCH
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 675a8660cb85a..c0ae09789cb6d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -10,6 +10,7 @@ config MIPS
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE if !EVA
 	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_STRNCPY_FROM_USER
 	select ARCH_HAS_STRNLEN_USER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index e5936417d3cd3..7183eea282212 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -3,6 +3,7 @@ config NIOS2
 	def_bool y
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_DMA_SET_UNCACHED
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda1..b1acad3076180 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -148,6 +148,7 @@ config PPC
 	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
 	select ARCH_HAS_STRICT_KERNEL_RWX	if PPC_85xx && !HIBERNATION && !RANDOMIZE_BASE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c3..b5a48f8424af9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -29,6 +29,7 @@ config RISCV
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 04b9550cf0070..001f5149952b4 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -10,6 +10,7 @@ config SUPERH
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8535e19062f65..e4bfb80b48cfe 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -13,6 +13,7 @@ config 64BIT
 config SPARC
 	bool
 	default y
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select DMA_OPS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 53bab123a8ee4..d7c2bf4ee403d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -91,6 +91,7 @@ config X86
 	select ARCH_HAS_NONLEAF_PMD_YOUNG	if PGTABLE_LEVELS > 2
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
 	select ARCH_HAS_COPY_MC			if X86_64
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 3c6e5471f025b..c6cbd7459939c 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -8,6 +8,7 @@ config XTENSA
 	select ARCH_HAS_DMA_PREP_COHERENT if MMU
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_SCREEN_INFO
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if MMU
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 8b2b9ac37c3df..d4a72bea56be0 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -21,6 +21,9 @@ config STI_CORE
 config VIDEO_CMDLINE
 	bool
 
+config ARCH_HAS_SCREEN_INFO
+	bool
+
 config VIDEO_NOMODESET
 	bool
 	default n
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 941be574bbe00..5e5d4158a4b4b 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -47,6 +47,7 @@ mandatory-y += percpu.h
 mandatory-y += pgalloc.h
 mandatory-y += preempt.h
 mandatory-y += rwonce.h
+mandatory-y += screen_info.h
 mandatory-y += sections.h
 mandatory-y += serial.h
 mandatory-y += shmparam.h
diff --git a/include/asm-generic/screen_info.h b/include/asm-generic/screen_info.h
new file mode 100644
index 0000000000000..6fd0e50fabfcd
--- /dev/null
+++ b/include/asm-generic/screen_info.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_GENERIC_SCREEN_INFO_H
+#define _ASM_GENERIC_SCREEN_INFO_H
+
+#include <uapi/linux/screen_info.h>
+
+#if defined(CONFIG_ARCH_HAS_SCREEN_INFO)
+extern struct screen_info screen_info;
+#endif
+
+#endif /* _ASM_GENERIC_SCREEN_INFO_H */
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index eab7081392d50..c764b9a51c24b 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -4,6 +4,6 @@
 
 #include <uapi/linux/screen_info.h>
 
-extern struct screen_info screen_info;
+#include <asm/screen_info.h>
 
 #endif /* _SCREEN_INFO_H */
-- 
2.41.0

