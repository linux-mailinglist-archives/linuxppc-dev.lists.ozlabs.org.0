Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80709427793
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:37:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRDNY3PRlz3cX1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 16:37:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HQmnz0Kvwz2yw6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 22:54:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B21B11FB;
 Fri,  8 Oct 2021 04:54:45 -0700 (PDT)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com
 [10.1.196.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 848163F766;
 Fri,  8 Oct 2021 04:54:37 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: [PATCH 2/2] sched: Centralize SCHED_{SMT, MC, CLUSTER} definitions
Date: Fri,  8 Oct 2021 12:53:47 +0100
Message-Id: <20211008115347.425234-3-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008115347.425234-1-valentin.schneider@arm.com>
References: <20211008115347.425234-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 09 Oct 2021 16:36:15 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Hugh Dickins <hughd@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 YiFei Zhu <yifeifz2@illinois.edu>, Helge Deller <deller@gmx.de>,
 aubrey.li@linux.intel.com, Barry Song <21cnbao@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vipin Sharma <vipinsh@google.com>, Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sergei Trofimovich <slyfox@gentoo.org>,
 jonathan.cameron@huawei.com, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 song.bao.hua@hisilicon.com, Ben Segall <bsegall@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Borkmann <daniel@iogearbox.net>, Chris Down <chris@chrisdown.name>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, tim.c.chen@linux.intel.com,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Barry recently introduced a new CONFIG_SCHED_CLUSTER, and discussions
around that highlighted that every architecture redefines its own help text
and dependencies for CONFIG_SCHED_SMT and CONFIG_SCHED_MC.

Move the definition of those to scheduler's Kconfig to centralize help text
and generic dependencies (i.e. SMP). Make them depend on a matching
ARCH_SUPPORTS_SCHED_* which the architectures can select with the relevant
architecture-specific dependency.

s390 uses its own topology table (set_sched_topology()) and doesn't seem to
cope without SCHED_MC or SCHED_SMT, so those remain untogglable.

Suggested-by: Barry Song <21cnbao@gmail.com>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 arch/arm/Kconfig     | 18 ++----------------
 arch/arm64/Kconfig   | 26 +++-----------------------
 arch/ia64/Kconfig    |  9 +--------
 arch/mips/Kconfig    | 10 +---------
 arch/parisc/Kconfig  |  9 +--------
 arch/powerpc/Kconfig |  9 +--------
 arch/s390/Kconfig    |  8 ++------
 arch/sh/Kconfig      |  1 +
 arch/sh/mm/Kconfig   |  9 ---------
 arch/sparc/Kconfig   | 20 ++------------------
 arch/x86/Kconfig     | 26 +++-----------------------
 kernel/sched/Kconfig | 43 +++++++++++++++++++++++++++++++++++++++++++
 12 files changed, 60 insertions(+), 128 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fc196421b2ce..13aac98edf06 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -32,6 +32,8 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
+	select ARCH_SUPPORTS_SCHED_SMT if ARM_CPU_TOPOLOGY
+	select ARCH_SUPPORTS_SCHED_MC if ARM_CPU_TOPOLOGY
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
@@ -1166,22 +1168,6 @@ config ARM_CPU_TOPOLOGY
 	  affinity between processors which is then used to describe the cpu
 	  topology of an ARM System.
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on ARM_CPU_TOPOLOGY
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
-config SCHED_SMT
-	bool "SMT scheduler support"
-	depends on ARM_CPU_TOPOLOGY
-	help
-	  Improves the CPU scheduler's decision making when dealing with
-	  MultiThreading at a cost of slightly increased overhead in some
-	  places. If unsure say N here.
-
 config HAVE_ARM_SCU
 	bool
 	help
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index d13677f4731d..8a49dd33f5e3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -88,6 +88,9 @@ config ARM64
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select ARCH_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
@@ -982,29 +985,6 @@ config CPU_LITTLE_ENDIAN
 
 endchoice
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
-config SCHED_CLUSTER
-	bool "Cluster scheduler support"
-	help
-	  Cluster scheduler support improves the CPU scheduler's decision
-	  making when dealing with machines that have clusters of CPUs.
-	  Cluster usually means a couple of CPUs which are placed closely
-	  by sharing mid-level caches, last-level cache tags or internal
-	  busses.
-
-config SCHED_SMT
-	bool "SMT scheduler support"
-	help
-	  Improves the CPU scheduler's decision making when dealing with
-	  MultiThreading at a cost of slightly increased overhead in some
-	  places. If unsure say N here.
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
 	range 2 4096
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 045792cde481..67f3d84242ae 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -18,6 +18,7 @@ config IA64
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_SUPPORTS_ACPI
+	select ARCH_SUPPORTS_SCHED_SMT
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
 	select ARCH_MIGHT_HAVE_ACPI_PDC if ACPI
 	select FORCE_PCI
@@ -247,14 +248,6 @@ config HOTPLUG_CPU
 	  can be controlled through /sys/devices/system/cpu/cpu#.
 	  Say N if you want to disable CPU hotplug.
 
-config SCHED_SMT
-	bool "SMT scheduler support"
-	depends on SMP
-	help
-	  Improves the CPU scheduler's decision making when dealing with
-	  Intel IA64 chips with MultiThreading at a cost of slightly increased
-	  overhead in some places. If unsure say N here.
-
 config PERMIT_BSP_REMOVE
 	bool "Support removal of Bootstrap Processor"
 	depends on HOTPLUG_CPU
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 771ca53af06d..cc60d440b097 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2373,17 +2373,9 @@ config MIPS_MT_SMP
 config MIPS_MT
 	bool
 
-config SCHED_SMT
-	bool "SMT (multithreading) scheduler support"
-	depends on SYS_SUPPORTS_SCHED_SMT
-	default n
-	help
-	  SMT scheduler support improves the CPU scheduler's decision making
-	  when dealing with MIPS MT enabled cores at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config SYS_SUPPORTS_SCHED_SMT
 	bool
+	select ARCH_SUPPORTS_SCHED_SMT
 
 config SYS_SUPPORTS_MULTITHREADING
 	bool
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4742b6f169b7..6aaa962ec2f4 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -13,6 +13,7 @@ config PARISC
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
+	select ARCH_SUPPORTS_SCHED_MC if PARISC_CPU_TOPOLOGY && PA8X00
 	select DMA_OPS
 	select RTC_CLASS
 	select RTC_DRV_GENERIC
@@ -295,14 +296,6 @@ config PARISC_CPU_TOPOLOGY
 	help
 	  Support PARISC cpu topology definition.
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on PARISC_CPU_TOPOLOGY && PA8X00
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config IRQSTACKS
 	bool "Use separate kernel stacks when processing interrupts"
 	default y
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ba5b66189358..9f45b92ccac1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -151,6 +151,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC32 || PPC_BOOK3S_64
+	select ARCH_SUPPORTS_SCHED_SMT          if PPC64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
@@ -861,14 +862,6 @@ config PPC_PROT_SAO_LPAR
 config PPC_COPRO_BASE
 	bool
 
-config SCHED_SMT
-	bool "SMT (Hyperthreading) scheduler support"
-	depends on PPC64 && SMP
-	help
-	  SMT scheduler support improves the CPU scheduler's decision making
-	  when dealing with POWER5 cpus at a cost of slightly increased
-	  overhead in some places. If unsure say N here.
-
 config PPC_DENORMALISATION
 	bool "PowerPC denormalisation exception handling"
 	depends on PPC_BOOK3S_64
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index b86de61b8caa..a0b4117cb1fa 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -483,12 +483,6 @@ config NODES_SHIFT
 	depends on NUMA
 	default "1"
 
-config SCHED_SMT
-	def_bool n
-
-config SCHED_MC
-	def_bool n
-
 config SCHED_BOOK
 	def_bool n
 
@@ -498,6 +492,8 @@ config SCHED_DRAWER
 config SCHED_TOPOLOGY
 	def_bool y
 	prompt "Topology scheduler support"
+	select ARCH_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_MC
 	select SCHED_SMT
 	select SCHED_MC
 	select SCHED_BOOK
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 6904f4bdbf00..7380ee27d252 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -13,6 +13,7 @@ config SUPERH
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
+	select ARCH_SUPPORTS_SCHED_MC
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select CPU_NO_EFFICIENT_FFS
 	select DMA_DECLARE_COHERENT
diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index ba569cfb4368..1d9f7006a72a 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -208,15 +208,6 @@ config HUGETLB_PAGE_SIZE_64MB
 
 endchoice
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on SMP
-	default y
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 endmenu
 
 menu "Cache configuration"
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index b120ed947f50..a6cf30d37725 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -86,6 +86,8 @@ config SPARC64
 	select HAVE_ARCH_AUDITSYSCALL
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
+	select ARCH_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_MC
 	select HAVE_NMI
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select ARCH_USE_QUEUED_RWLOCKS
@@ -290,24 +292,6 @@ if SPARC64
 source "kernel/power/Kconfig"
 endif
 
-config SCHED_SMT
-	bool "SMT (Hyperthreading) scheduler support"
-	depends on SPARC64 && SMP
-	default y
-	help
-	  SMT scheduler support improves the CPU scheduler's decision making
-	  when dealing with SPARC cpus at a cost of slightly increased overhead
-	  in some places. If unsure say N here.
-
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on SPARC64 && SMP
-	default y
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config CMDLINE_BOOL
 	bool "Default bootloader kernel arguments"
 	depends on SPARC64
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 349e59b2f0e3..87a91fd33d85 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -107,6 +107,9 @@ config X86
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
@@ -1001,29 +1004,6 @@ config NR_CPUS
 	  This is purely to save memory: each supported CPU adds about 8KB
 	  to the kernel image.
 
-config SCHED_CLUSTER
-	bool "Cluster scheduler support"
-	depends on SMP
-	default y
-	help
-	  Cluster scheduler support improves the CPU scheduler's decision
-	  making when dealing with machines that have clusters of CPUs.
-	  Cluster usually means a couple of CPUs which are placed closely
-	  by sharing mid-level caches, last-level cache tags or internal
-	  busses.
-
-config SCHED_SMT
-	def_bool y if SMP
-
-config SCHED_MC
-	def_bool y
-	prompt "Multi-core scheduler support"
-	depends on SMP
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config SCHED_MC_PRIO
 	bool "CPU core priorities scheduler support"
 	depends on SCHED_MC && CPU_SUP_INTEL
diff --git a/kernel/sched/Kconfig b/kernel/sched/Kconfig
index c8b8e12c9c9c..9ceb08f42aeb 100644
--- a/kernel/sched/Kconfig
+++ b/kernel/sched/Kconfig
@@ -131,3 +131,46 @@ config SCHED_CORE
 	  SCHED_CORE is default disabled. When it is enabled and unused,
 	  which is the likely usage by Linux distributions, there should
 	  be no measurable impact on performance.
+
+
+#
+# For architectuers that want to enable generic scheduler handling of
+# different topology levels:
+#
+config ARCH_SUPPORTS_SCHED_SMT
+       bool
+
+config ARCH_SUPPORTS_SCHED_MC
+       bool
+
+config ARCH_SUPPORTS_SCHED_CLUSTER
+       bool
+
+config SCHED_SMT
+	bool "SMT scheduler support"
+	depends on ARCH_SUPPORTS_SCHED_SMT && SMP
+	default y
+	help
+	  Improves the CPU scheduler's decision making when dealing with
+	  MultiThreading at a cost of slightly increased overhead in some
+	  places. If unsure say N here.
+
+config SCHED_MC
+	bool "Multi-core scheduler support"
+	depends on ARCH_SUPPORTS_SCHED_MC && SMP
+	default y
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places. If unsure say N here.
+
+config SCHED_CLUSTER
+	bool "Cluster scheduler support"
+	depends on ARCH_SUPPORTS_SCHED_CLUSTER && SMP
+	default y
+	help
+	  Cluster scheduler support improves the CPU scheduler's decision
+	  making when dealing with machines that have clusters of CPUs.
+	  Cluster usually means a couple of CPUs which are placed closely
+	  by sharing mid-level caches, last-level cache tags or internal
+	  busses.
-- 
2.25.1

