Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C63612044D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 01:57:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rRDH04L7zDqY1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:57:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ubuntu.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=christian.brauner@ubuntu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rR0l6GcHzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 09:47:35 +1000 (AEST)
Received: from ip5f5af08c.dynamic.kabel-deutschland.de ([95.90.240.140]
 helo=wittgenstein.fritz.box) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jnW8j-0005DO-ID; Mon, 22 Jun 2020 23:46:13 +0000
From: Christian Brauner <christian.brauner@ubuntu.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
Date: Tue, 23 Jun 2020 01:43:25 +0200
Message-Id: <20200622234326.906346-17-christian.brauner@ubuntu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622234326.906346-1-christian.brauner@ubuntu.com>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Jun 2020 09:56:22 +1000
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
Cc: linux-riscv@lists.infradead.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All architectures support copy_thread_tls() now, so remove the legacy
copy_thread() function and the HAVE_COPY_THREAD_TLS config option. Everyone
uses the same process creation calling convention based on
copy_thread_tls() and struct kernel_clone_args. This will make it easier to
maintain the core process creation code under kernel/, simplifies the
callpaths and makes the identical for all architectures.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nick Hu <nickhu@andestech.com>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Vincent Chen <deanbo422@gmail.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Rich Felker <dalias@libc.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: "Matthew Wilcox
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-c6x-dev@linux-c6x.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 arch/Kconfig               |  7 -------
 arch/alpha/Kconfig         |  1 -
 arch/arc/Kconfig           |  1 -
 arch/arm/Kconfig           |  1 -
 arch/arm64/Kconfig         |  1 -
 arch/c6x/Kconfig           |  1 -
 arch/csky/Kconfig          |  1 -
 arch/h8300/Kconfig         |  1 -
 arch/hexagon/Kconfig       |  1 -
 arch/ia64/Kconfig          |  1 -
 arch/m68k/Kconfig          |  1 -
 arch/microblaze/Kconfig    |  1 -
 arch/mips/Kconfig          |  1 -
 arch/nds32/Kconfig         |  1 -
 arch/nios2/Kconfig         |  1 -
 arch/openrisc/Kconfig      |  1 -
 arch/parisc/Kconfig        |  1 -
 arch/powerpc/Kconfig       |  1 -
 arch/riscv/Kconfig         |  1 -
 arch/s390/Kconfig          |  1 -
 arch/sh/Kconfig            |  1 -
 arch/sparc/Kconfig         |  1 -
 arch/um/Kconfig            |  1 -
 arch/unicore32/Kconfig     |  1 -
 arch/x86/Kconfig           |  1 -
 arch/xtensa/Kconfig        |  1 -
 include/linux/sched/task.h | 15 +--------------
 kernel/fork.c              |  9 ---------
 28 files changed, 1 insertion(+), 55 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8cc35dc556c7..943aac2f3ebe 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -754,13 +754,6 @@ config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	depends on MMU
 	select ARCH_HAS_ELF_RANDOMIZE
 
-config HAVE_COPY_THREAD_TLS
-	bool
-	help
-	  Architecture provides copy_thread_tls to accept tls argument via
-	  normal C parameter passing, rather than extracting the syscall
-	  argument from pt_regs.
-
 config HAVE_STACK_VALIDATION
 	bool
 	help
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b01515c6b2ed..10862c5a8c76 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -38,7 +38,6 @@ config ALPHA
 	select OLD_SIGSUSPEND
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
-	select HAVE_COPY_THREAD_TLS
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index fddc70029727..1fa0b98ed9ce 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -29,7 +29,6 @@ config ARC
 	select GENERIC_SMP_IDLE_THREAD
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_FUTEX_CMPXCHG if FUTEX
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2ac74904a3ce..445b5ed693f0 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -72,7 +72,6 @@ config ARM
 	select HAVE_ARM_SMCCC if CPU_V7
 	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
 	select HAVE_CONTEXT_TRACKING
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
 	select HAVE_DMA_CONTIGUOUS if MMU
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a4a094bedcb2..de93e965727d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -148,7 +148,6 @@ config ARM64
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
index 9cde76a5928e..6444ebfd06a6 100644
--- a/arch/c6x/Kconfig
+++ b/arch/c6x/Kconfig
@@ -22,7 +22,6 @@ config C6X
 	select GENERIC_CLOCKEVENTS
 	select MODULES_USE_ELF_RELA
 	select MMU_GATHER_NO_RANGE if MMU
-	select HAVE_COPY_THREAD_TLS
 
 config MMU
 	def_bool n
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index bd31ab12f77d..902f1142d550 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -38,7 +38,6 @@ config CSKY
 	select GX6605S_TIMER if CPU_CK610
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_AUDITSYSCALL
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index de0eb417a0b9..d11666d538fe 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -26,7 +26,6 @@ config H8300
 	select HAVE_ARCH_HASH
 	select CPU_NO_EFFICIENT_FFS
 	select UACCESS_MEMCPY
-	select HAVE_COPY_THREAD_TLS
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 19bc2f2ee331..667cfc511cf9 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -31,7 +31,6 @@ config HEXAGON
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select MODULES_USE_ELF_RELA
 	select GENERIC_CPU_DEVICES
-	select HAVE_COPY_THREAD_TLS
 	help
 	  Qualcomm Hexagon is a processor architecture designed for high
 	  performance and low power across a wide variety of applications.
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 1b6034b89a04..1fa2fe2ef053 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -55,7 +55,6 @@ config IA64
 	select HAVE_ARCH_AUDITSYSCALL
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
-	select HAVE_COPY_THREAD_TLS
 	select NUMA if !FLATMEM
 	default y
 	help
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6ad6cdac74b3..6663f1741798 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -14,7 +14,6 @@ config M68K
 	select HAVE_AOUT if MMU
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
-	select HAVE_COPY_THREAD_TLS
 	select GENERIC_IRQ_SHOW
 	select GENERIC_ATOMIC64
 	select HAVE_UID16
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index e3a211a41880..d262ac0c8714 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -46,7 +46,6 @@ config MICROBLAZE
 	select CPU_NO_EFFICIENT_FFS
 	select MMU_GATHER_NO_RANGE if MMU
 	select SPARSE_IRQ
-	select HAVE_COPY_THREAD_TLS
 
 # Endianness selection
 choice
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..ca92c3ed2dc5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -51,7 +51,6 @@ config MIPS
 	select HAVE_CBPF_JIT if !64BIT && !CPU_MICROMIPS
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_TIF_NOHZ
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index 7b6eaca81cce..e30298e99e1b 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -48,7 +48,6 @@ config NDS32
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE
-	select HAVE_COPY_THREAD_TLS
 	help
 	  Andes(nds32) Linux support.
 
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index f9a05957a883..c6645141bb2a 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -27,7 +27,6 @@ config NIOS2
 	select USB_ARCH_HAS_HCD if USB_SUPPORT
 	select CPU_NO_EFFICIENT_FFS
 	select MMU_GATHER_NO_RANGE if MMU
-	select HAVE_COPY_THREAD_TLS
 
 config GENERIC_CSUM
 	def_bool y
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 8588996165ae..7e94fe37cb2f 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -16,7 +16,6 @@ config OPENRISC
 	select HANDLE_DOMAIN_IRQ
 	select GPIOLIB
 	select HAVE_ARCH_TRACEHOOK
-	select HAVE_COPY_THREAD_TLS
 	select SPARSE_IRQ
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_PROBE
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 8e4c3708773d..2667eeb6c6f1 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -62,7 +62,6 @@ config PARISC
 	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
-	select HAVE_COPY_THREAD_TLS
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..3b262d87e9c4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -186,7 +186,6 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_CONTEXT_TRACKING		if PPC64
 	select HAVE_TIF_NOHZ			if PPC64
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 128192e14ff2..f6a3a2bea3d8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,7 +52,6 @@ config RISCV
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_FUTEX_CMPXCHG if FUTEX
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c7d7ede6300c..959969759453 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -136,7 +136,6 @@ config S390
 	select HAVE_EBPF_JIT if PACK_STACK && HAVE_MARCH_Z196_FEATURES
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index e10118d61ce7..9fc2b010e938 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -70,7 +70,6 @@ config SUPERH
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 	select SPARSE_IRQ
 	select HAVE_STACKPROTECTOR
-	select HAVE_COPY_THREAD_TLS
 	help
 	  The SuperH is a RISC processor targeted for use in embedded systems
 	  and consumer electronics; it was also used in the Sega Dreamcast
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 66213c0cb557..5bf2dc163540 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -48,7 +48,6 @@ config SPARC
 	select LOCKDEP_SMALL if LOCKDEP
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
-	select HAVE_COPY_THREAD_TLS
 
 config SPARC32
 	def_bool !64BIT
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 9318dc6d1a0c..ef69be17ff70 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -14,7 +14,6 @@ config UML
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_BUGVERBOSE
-	select HAVE_COPY_THREAD_TLS
 	select GENERIC_IRQ_SHOW
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CLOCKEVENTS
diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
index 01451cf500d2..11ba1839d198 100644
--- a/arch/unicore32/Kconfig
+++ b/arch/unicore32/Kconfig
@@ -22,7 +22,6 @@ config UNICORE32
 	select MODULES_USE_ELF_REL
 	select NEED_DMA_MAP_STATE
 	select MMU_GATHER_NO_RANGE if MMU
-	select HAVE_COPY_THREAD_TLS
 	help
 	  UniCore-32 is 32-bit Instruction Set Architecture,
 	  including a series of low-power-consumption RISC chip
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 6a0cc524882d..214b8bf39bbe 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -161,7 +161,6 @@ config X86
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING		if X86_64
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 3a9f1e80394a..b71ba910d92f 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -24,7 +24,6 @@ config XTENSA
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
 	select HAVE_ARCH_TRACEHOOK
-	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_EXIT_THREAD
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 9f03c44941fb..77cbe14c3034 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -65,22 +65,9 @@ extern void fork_init(void);
 
 extern void release_task(struct task_struct * p);
 
-#ifdef CONFIG_HAVE_COPY_THREAD_TLS
 extern int copy_thread_tls(unsigned long, unsigned long, unsigned long,
 			struct task_struct *, unsigned long);
-#else
-extern int copy_thread(unsigned long, unsigned long, unsigned long,
-			struct task_struct *);
-
-/* Architectures that haven't opted into copy_thread_tls get the tls argument
- * via pt_regs, so ignore the tls argument passed via C. */
-static inline int copy_thread_tls(
-		unsigned long clone_flags, unsigned long sp, unsigned long arg,
-		struct task_struct *p, unsigned long tls)
-{
-	return copy_thread(clone_flags, sp, arg, p);
-}
-#endif
+
 extern void flush_thread(void);
 
 #ifdef CONFIG_HAVE_EXIT_THREAD
diff --git a/kernel/fork.c b/kernel/fork.c
index 0fd7eb1b38f9..8e52e16a1b5e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2577,15 +2577,6 @@ SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
 
 #ifdef __ARCH_WANT_SYS_CLONE3
 
-/*
- * copy_thread implementations handle CLONE_SETTLS by reading the TLS value from
- * the registers containing the syscall arguments for clone. This doesn't work
- * with clone3 since the TLS value is passed in clone_args instead.
- */
-#ifndef CONFIG_HAVE_COPY_THREAD_TLS
-#error clone3 requires copy_thread_tls support in arch
-#endif
-
 noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
 					      struct clone_args __user *uargs,
 					      size_t usize)
-- 
2.27.0

