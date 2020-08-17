Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6E245E35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 09:42:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVQxZ3pWSzDqNR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:42:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1cabf852a0fb828109f5+6203+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=DYXpd96X; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVQjm0WcMzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:32:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=n/+77b8fiTvqgkxpOm9gs/sfoZ+N5uVr+UE/KwtWS1o=; b=DYXpd96XigUpc0UwJhWioVPNfp
 DoImQ431jl5QX+60Q7P+I4d175kDwNfFkSiPVs8johMqSbHyKrCt+fHJwhNR8gTWlIgaVTQuAIhs5
 K6kWMxbvi+oZ7Vn3la8VbBBjOb1Za/w+JDOypxRXOvgOAQE7+QqDM9sPaQ5jHXGV3SeHgoDYj45k+
 GCyU4huixtv14dtzQWUWwoIOICUKOL4m4wJw87B5xhk+RCP5ISwBI4EQlCLmzCceIOAdWDOfZ5TFc
 4xls6FWu9aXB5Xd3qFVMqa6gQNhzPHQM7ZS/OOXsHRUbSFfw6fXsP+dv7MbgVhCY/ZX0fTgkQuoPg
 VBQTiXMA==;
Received: from [2001:4bb8:188:3918:4550:cdf7:3d45:afb9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zcy-0000ve-NC; Mon, 17 Aug 2020 07:32:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 04/11] uaccess: add infrastructure for kernel builds with
 set_fs()
Date: Mon, 17 Aug 2020 09:32:05 +0200
Message-Id: <20200817073212.830069-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817073212.830069-1-hch@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a CONFIG_SET_FS option that is selected by architecturess that
implement set_fs, which is all of them initially.  If the option is not
set stubs for routines related to overriding the address space are
provided so that architectures can start to opt out of providing set_fs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig            |  3 +++
 arch/alpha/Kconfig      |  1 +
 arch/arc/Kconfig        |  1 +
 arch/arm/Kconfig        |  1 +
 arch/arm64/Kconfig      |  1 +
 arch/c6x/Kconfig        |  1 +
 arch/csky/Kconfig       |  1 +
 arch/h8300/Kconfig      |  1 +
 arch/hexagon/Kconfig    |  1 +
 arch/ia64/Kconfig       |  1 +
 arch/m68k/Kconfig       |  1 +
 arch/microblaze/Kconfig |  1 +
 arch/mips/Kconfig       |  1 +
 arch/nds32/Kconfig      |  1 +
 arch/nios2/Kconfig      |  1 +
 arch/openrisc/Kconfig   |  1 +
 arch/parisc/Kconfig     |  1 +
 arch/powerpc/Kconfig    |  1 +
 arch/riscv/Kconfig      |  1 +
 arch/s390/Kconfig       |  1 +
 arch/sh/Kconfig         |  1 +
 arch/sparc/Kconfig      |  1 +
 arch/um/Kconfig         |  1 +
 arch/x86/Kconfig        |  1 +
 arch/xtensa/Kconfig     |  1 +
 include/linux/uaccess.h | 18 ++++++++++++++++++
 26 files changed, 45 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index af14a567b493fc..3fab619a6aa51a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -24,6 +24,9 @@ config KEXEC_ELF
 config HAVE_IMA_KEXEC
 	bool
 
+config SET_FS
+	bool
+
 config HOTPLUG_SMT
 	bool
 
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 9c5f06e8eb9bc0..d6e9fc7a7b19e2 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -39,6 +39,7 @@ config ALPHA
 	select OLD_SIGSUSPEND
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
+	select SET_FS
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index ba00c4e1e1c271..c49f5754a11e40 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -48,6 +48,7 @@ config ARC
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
+	select SET_FS
 
 config ARCH_HAS_CACHE_LINE_SIZE
 	def_bool y
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e00d94b1665876..87e1478a42dc4f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -118,6 +118,7 @@ config ARM
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC
 	select RTC_LIB
+	select SET_FS
 	select SYS_SUPPORTS_APM_EMULATION
 	# Above selects are sorted alphabetically; please add new ones
 	# according to that.  Thanks.
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6d232837cbeee8..fbd9e35bef096f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -192,6 +192,7 @@ config ARM64
 	select PCI_SYSCALL if PCI
 	select POWER_RESET
 	select POWER_SUPPLY
+	select SET_FS
 	select SPARSE_IRQ
 	select SWIOTLB
 	select SYSCTL_EXCEPTION_TRACE
diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
index 6444ebfd06a665..48d66bf0465d68 100644
--- a/arch/c6x/Kconfig
+++ b/arch/c6x/Kconfig
@@ -22,6 +22,7 @@ config C6X
 	select GENERIC_CLOCKEVENTS
 	select MODULES_USE_ELF_RELA
 	select MMU_GATHER_NO_RANGE if MMU
+	select SET_FS
 
 config MMU
 	def_bool n
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 3d5afb5f568543..2836f6e76fdb2d 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -78,6 +78,7 @@ config CSKY
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_SYSCALL if PCI
 	select PCI_MSI if PCI
+	select SET_FS
 
 config LOCKDEP_SUPPORT
 	def_bool y
diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index d11666d538fea8..7945de067e9fcc 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -25,6 +25,7 @@ config H8300
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_HASH
 	select CPU_NO_EFFICIENT_FFS
+	select SET_FS
 	select UACCESS_MEMCPY
 
 config CPU_BIG_ENDIAN
diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 667cfc511cf999..f2afabbadd430e 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -31,6 +31,7 @@ config HEXAGON
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select MODULES_USE_ELF_RELA
 	select GENERIC_CPU_DEVICES
+	select SET_FS
 	help
 	  Qualcomm Hexagon is a processor architecture designed for high
 	  performance and low power across a wide variety of applications.
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 5b4ec80bf5863a..22a6853840e235 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -56,6 +56,7 @@ config IA64
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select NUMA if !FLATMEM
+	select SET_FS
 	default y
 	help
 	  The Itanium Processor Family is Intel's 64-bit successor to
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6f2f38d05772ab..dcf4ae8c9b215f 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -32,6 +32,7 @@ config M68K
 	select OLD_SIGSUSPEND3
 	select OLD_SIGACTION
 	select MMU_GATHER_NO_RANGE if MMU
+	select SET_FS
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index d262ac0c8714bd..7e3d4583abf3e6 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -46,6 +46,7 @@ config MICROBLAZE
 	select CPU_NO_EFFICIENT_FFS
 	select MMU_GATHER_NO_RANGE if MMU
 	select SPARSE_IRQ
+	select SET_FS
 
 # Endianness selection
 choice
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484cf0..fbc26391b588f8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -87,6 +87,7 @@ config MIPS
 	select MODULES_USE_ELF_RELA if MODULES && 64BIT
 	select PERF_USE_VMALLOC
 	select RTC_LIB
+	select SET_FS
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
 
diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index e30298e99e1bdf..e8e541fd2267d0 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -48,6 +48,7 @@ config NDS32
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE
+	select SET_FS
 	help
 	  Andes(nds32) Linux support.
 
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index c6645141bb2a88..c7c6ba6bec9dfc 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -27,6 +27,7 @@ config NIOS2
 	select USB_ARCH_HAS_HCD if USB_SUPPORT
 	select CPU_NO_EFFICIENT_FFS
 	select MMU_GATHER_NO_RANGE if MMU
+	select SET_FS
 
 config GENERIC_CSUM
 	def_bool y
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 7e94fe37cb2fdf..6233c62931803f 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -39,6 +39,7 @@ config OPENRISC
 	select ARCH_WANT_FRAME_POINTERS
 	select GENERIC_IRQ_MULTI_HANDLER
 	select MMU_GATHER_NO_RANGE if MMU
+	select SET_FS
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 3b0f53dd70bc9b..be70af482b5a9a 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -63,6 +63,7 @@ config PARISC
 	select HAVE_FTRACE_MCOUNT_RECORD if HAVE_DYNAMIC_FTRACE
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
+	select SET_FS
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f48bbfb3ce99d..3f09d6fdf89405 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -249,6 +249,7 @@ config PPC
 	select PCI_SYSCALL			if PCI
 	select PPC_DAWR				if PPC64
 	select RTC_LIB
+	select SET_FS
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7b590552914664..6e05a94f808a5a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -82,6 +82,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_INTC
 	select RISCV_TIMER
+	select SET_FS
 	select SPARSEMEM_STATIC if 32BIT
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 3d86e12e8e3c21..fd81385a7787cb 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -185,6 +185,7 @@ config S390
 	select OLD_SIGSUSPEND3
 	select PCI_DOMAINS		if PCI
 	select PCI_MSI			if PCI
+	select SET_FS
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d20927128fce05..2bd1653f3b3fea 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -71,6 +71,7 @@ config SUPERH
 	select PERF_EVENTS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
+	select SET_FS
 	select SPARSE_IRQ
 	help
 	  The SuperH is a RISC processor targeted for use in embedded systems
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index efeff2c896a544..3e0cf0319a278a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -49,6 +49,7 @@ config SPARC
 	select LOCKDEP_SMALL if LOCKDEP
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
+	select SET_FS
 
 config SPARC32
 	def_bool !64BIT
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index eb51fec759484a..3aefcd81566809 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -19,6 +19,7 @@ config UML
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CLOCKEVENTS
 	select HAVE_GCC_PLUGINS
+	select SET_FS
 	select TTY # Needed for line.c
 
 config MMU
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7101ac64bb209d..f85c13355732fe 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -237,6 +237,7 @@ config X86
 	select HAVE_ARCH_KCSAN			if X86_64
 	select X86_FEATURE_NAMES		if PROC_FS
 	select PROC_PID_ARCH_STATUS		if PROC_FS
+	select SET_FS
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 
 config INSTRUCTION_DECODER
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index e997e0119c0251..94bad4d66b4bde 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -41,6 +41,7 @@ config XTENSA
 	select IRQ_DOMAIN
 	select MODULES_USE_ELF_RELA
 	select PERF_USE_VMALLOC
+	select SET_FS
 	select VIRT_TO_BUS
 	help
 	  Xtensa processors are 32-bit RISC machines designed by Tensilica
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 94b28541165929..70073c802b48ed 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -8,6 +8,7 @@
 
 #include <asm/uaccess.h>
 
+#ifdef CONFIG_SET_FS
 /*
  * Force the uaccess routines to be wired up for actual userspace access,
  * overriding any possible set_fs(KERNEL_DS) still lingering around.  Undone
@@ -25,6 +26,23 @@ static inline void force_uaccess_end(mm_segment_t oldfs)
 {
 	set_fs(oldfs);
 }
+#else /* CONFIG_SET_FS */
+typedef struct {
+	/* empty dummy */
+} mm_segment_t;
+
+#define uaccess_kernel()		(false)
+#define user_addr_max()			(TASK_SIZE_MAX)
+
+static inline mm_segment_t force_uaccess_begin(void)
+{
+	return (mm_segment_t) { };
+}
+
+static inline void force_uaccess_end(mm_segment_t oldfs)
+{
+}
+#endif /* CONFIG_SET_FS */
 
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
-- 
2.28.0

