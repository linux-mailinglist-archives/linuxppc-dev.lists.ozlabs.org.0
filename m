Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF95E877
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:12:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f5jl09fTzDqND
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 02:12:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 330 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Jul 2019 02:10:09 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f5fn552bzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 02:10:08 +1000 (AEST)
Received: from orion.localdomain ([95.114.150.241]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MG9Xu-1hjpoj1ykm-00GYUj; Wed, 03 Jul 2019 18:04:17 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] arch: powerpc: Kconfig: pedantic formatting
Date: Wed,  3 Jul 2019 18:04:13 +0200
Message-Id: <1562169853-12593-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:w69rWeiKAKy1jBAviuFd5OhmXKf5T03HVFaKWltB0PnQaYk5DcC
 LPwZdp0b+Vq0j7Ti0SX/1+X02qQVd2RwLejULKmAHZCGqdSjjhw5gKNDtTs2y5UN+X4Zo7B
 cTWU7KsXEQU8nZLJRSP+LWQ26ed1zLBXRmt8CpENxcNCDsbAsAGybF0Oqu2Wr2GokS9eM2q
 faMPgWTQL+O3ufg2qw6DA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aO8ZPpDSk6Q=:26Bii7MrKXLevsJ9O6Zux4
 4aP3X9DSlMsNWTrvQgIKnE2tJAgFvowrril5JrHNxvCOJqvvKl3ubKlnGIYD99EvSK9reG840
 8KN+9aMFYqIjcckb71+t22JQNpUJyHp+bZ0zpzPLC5EzCVpjRm/b45WHRE+vyDSQQB7emkz50
 Ab5BZ1YKyw8W2ELf3GYEMFuKX/soX8lfQgEV8aV+vgdEOO9kKrmUKp9s+pYLNINBMUx9FFqT5
 uyPBdb9fOAPjBZGnGJeyolmidc9JY/7YjXs0WJKw3gyUemPjyk6w8Kpnnhx+qcCJ3yXZZ82h+
 9iYk8z8fwgkC9Gi4UM2S0RlZggZZ8p1x31Fr5/DmFetE733Yj3viYogKq1ro4xNC0HpA3yegA
 p+ErpaKPyRWwqRG3SMPkP4r3xRnX4XJL3uNfGE8YDKeIovvi7mmKwSz2ySKCoQQPnPs5ckbH5
 9dLKmdqLE0VNUtnuoGvjVjshzzS5I7vGCuh/IeO+DaRI0cH0zA8VM4gm4N80C+vtyYn+WmrYY
 hWoABNkoAEF1cO/gWrtLyNtmLa2KX8Agntvr1jpvdtL+DmNxK7UEGSAmq51tsvWp+f/4rNj1I
 57KY/3Ax9GPTCUNYR7fKZDo7qTJ5b5jhjOaPsfwXpFUYSvgOgtdKs8d7AcccIniKkmdAkdu+L
 aFreGAPqFSc+q/KDyQEL+21CMXT0vsdk3eF4N+FVfbugQmnuEJmdyCp98ouIdR9Q84ME+k9In
 f6KGSnc6CnRSL0fyD9dehwiLyDF6WF9dQQgGdQ==
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
Cc: alistair@popple.id.au, kvm-ppc@vger.kernel.org, oss@buserror.net,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Formatting of Kconfig files doesn't look so pretty, so let the
Great White Handkerchief come around and clean it up.

Also convert "---help---" as requested on lkml.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/powerpc/Kconfig                   | 40 +++++++++++++++++-----------------
 arch/powerpc/kvm/Kconfig               |  6 ++---
 arch/powerpc/platforms/40x/Kconfig     |  7 +++---
 arch/powerpc/platforms/44x/Kconfig     | 10 ++++-----
 arch/powerpc/platforms/85xx/Kconfig    |  8 +++----
 arch/powerpc/platforms/86xx/Kconfig    |  6 ++---
 arch/powerpc/platforms/maple/Kconfig   |  2 +-
 arch/powerpc/platforms/pseries/Kconfig | 18 +++++++--------
 arch/powerpc/sysdev/xics/Kconfig       | 13 +++++------
 9 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636..2c9f911 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -48,7 +48,7 @@ config ARCH_MMAP_RND_COMPAT_BITS_MAX
 	# Allow randomisation to consume up to 512MB of address space (2^29).
 	default 11 if PPC_256K_PAGES	# 11 = 29 (512MB) - 18 (256K)
 	default 13 if PPC_64K_PAGES	# 13 = 29 (512MB) - 16 (64K)
-	default 15 if PPC_16K_PAGES 	# 15 = 29 (512MB) - 14 (16K)
+	default 15 if PPC_16K_PAGES	# 15 = 29 (512MB) - 14 (16K)
 	default 17			# 17 = 29 (512MB) - 12 (4K)
 
 config ARCH_MMAP_RND_COMPAT_BITS_MIN
@@ -244,9 +244,9 @@ config PPC
 	#
 
 config PPC_BARRIER_NOSPEC
-    bool
-    default y
-    depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
+	bool
+	default y
+	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
 
 config EARLY_PRINTK
 	bool
@@ -398,7 +398,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 config MATH_EMULATION
 	bool "Math emulation"
 	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
-	---help---
+	help
 	  Some PowerPC chips designed for embedded applications do not have
 	  a floating-point unit and therefore do not implement the
 	  floating-point instructions in the PowerPC instruction set.  If you
@@ -417,27 +417,27 @@ choice
 
 config	MATH_EMULATION_FULL
 	bool "Emulate all the floating point instructions"
-	---help---
+	help
 	  Select this option will enable the kernel to support to emulate
 	  all the floating point instructions. If your SoC doesn't have
 	  a FPU, you should select this.
 
 config MATH_EMULATION_HW_UNIMPLEMENTED
 	bool "Just emulate the FPU unimplemented instructions"
-	---help---
+	help
 	  Select this if you know there does have a hardware FPU on your
 	  SoC, but some floating point instructions are not implemented by that.
 
 endchoice
 
 config PPC_TRANSACTIONAL_MEM
-       bool "Transactional Memory support for POWERPC"
-       depends on PPC_BOOK3S_64
-       depends on SMP
-       select ALTIVEC
-       select VSX
-       ---help---
-         Support user-mode Transactional Memory on POWERPC.
+	bool "Transactional Memory support for POWERPC"
+	depends on PPC_BOOK3S_64
+	depends on SMP
+	select ALTIVEC
+	select VSX
+	help
+	  Support user-mode Transactional Memory on POWERPC.
 
 config LD_HEAD_STUB_CATCH
 	bool "Reserve 256 bytes to cope with linker stubs in HEAD text" if EXPERT
@@ -457,7 +457,7 @@ config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
 	depends on SMP && (PPC_PSERIES || \
 	PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
-	---help---
+	help
 	  Say Y here to be able to disable and re-enable individual
 	  CPUs at runtime on SMP machines.
 
@@ -825,7 +825,7 @@ config PPC_DENORMALISATION
 	bool "PowerPC denormalisation exception handling"
 	depends on PPC_BOOK3S_64
 	default "y" if PPC_POWERNV
-	---help---
+	help
 	  Add support for handling denormalisation of single precision
 	  values.  Useful for bare metal only.  If unsure say Y here.
 
@@ -938,7 +938,7 @@ config FSL_SOC
 	bool
 
 config FSL_PCI
- 	bool
+	bool
 	select ARCH_HAS_DMA_SET_MASK
 	select PPC_INDIRECT_PCI
 	select PCI_QUIRKS
@@ -986,7 +986,7 @@ config FSL_RIO
 	bool "Freescale Embedded SRIO Controller support"
 	depends on RAPIDIO = y && HAVE_RAPIDIO
 	default "n"
-	---help---
+	help
 	  Include support for RapidIO controller on Freescale embedded
 	  processors (MPC8548, MPC8641, etc).
 
@@ -1050,14 +1050,14 @@ config DYNAMIC_MEMSTART
 	select NONSTATIC_KERNEL
 	help
 	  This option enables the kernel to be loaded at any page aligned
-	  physical address. The kernel creates a mapping from KERNELBASE to 
+	  physical address. The kernel creates a mapping from KERNELBASE to
 	  the address where the kernel is loaded. The page size here implies
 	  the TLB page size of the mapping for kernel on the particular platform.
 	  Please refer to the init code for finding the TLB page size.
 
 	  DYNAMIC_MEMSTART is an easy way of implementing pseudo-RELOCATABLE
 	  kernel image, where the only restriction is the page aligned kernel
-	  load address. When this option is enabled, the compile time physical 
+	  load address. When this option is enabled, the compile time physical
 	  address CONFIG_PHYSICAL_START is ignored.
 
 	  This option is overridden by CONFIG_RELOCATABLE
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index f53997a..8f714a1 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -183,9 +183,9 @@ config KVM_MPIC
 	select HAVE_KVM_MSI
 	help
 	  Enable support for emulating MPIC devices inside the
-          host kernel, rather than relying on userspace to emulate.
-          Currently, support is limited to certain versions of
-          Freescale's MPIC implementation.
+	  host kernel, rather than relying on userspace to emulate.
+	  Currently, support is limited to certain versions of
+	  Freescale's MPIC implementation.
 
 config KVM_XICS
 	bool "KVM in-kernel XICS emulation"
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index ad2bb14..6da813b 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -16,12 +16,12 @@ config EP405
 	  This option enables support for the EP405/EP405PC boards.
 
 config HOTFOOT
-        bool "Hotfoot"
+	bool "Hotfoot"
 	depends on 40x
 	select PPC40x_SIMPLE
 	select FORCE_PCI
-        help
-	 This option enables support for the ESTEEM 195E Hotfoot board.
+	help
+	  This option enables support for the ESTEEM 195E Hotfoot board.
 
 config KILAUEA
 	bool "Kilauea"
@@ -80,7 +80,6 @@ config OBS600
 	help
 	  This option enables support for PlatHome OpenBlockS 600 server
 
-
 config PPC40x_SIMPLE
 	bool "Simple PowerPC 40x board support"
 	depends on 40x
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 35be81f..b369ed4 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -40,12 +40,12 @@ config EBONY
 	  This option enables support for the IBM PPC440GP evaluation board.
 
 config SAM440EP
-        bool "Sam440ep"
+	bool "Sam440ep"
 	depends on 44x
-        select 440EP
-        select FORCE_PCI
-        help
-          This option enables support for the ACube Sam440ep board.
+	select 440EP
+	select FORCE_PCI
+	help
+	  This option enables support for the ACube Sam440ep board.
 
 config SEQUOIA
 	bool "Sequoia"
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index d1af0ee2..fa3d29d 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -147,10 +147,10 @@ config SOCRATES
 	  This option enables support for the Socrates board.
 
 config KSI8560
-        bool "Emerson KSI8560"
-        select DEFAULT_UIMAGE
-        help
-          This option enables support for the Emerson KSI8560 board
+	bool "Emerson KSI8560"
+	select DEFAULT_UIMAGE
+	help
+	  This option enables support for the Emerson KSI8560 board
 
 config XES_MPC85xx
 	bool "X-ES single-board computer"
diff --git a/arch/powerpc/platforms/86xx/Kconfig b/arch/powerpc/platforms/86xx/Kconfig
index 0a61011..07a9d60 100644
--- a/arch/powerpc/platforms/86xx/Kconfig
+++ b/arch/powerpc/platforms/86xx/Kconfig
@@ -62,9 +62,9 @@ config GEF_SBC610
 	  This option enables support for the GE SBC610.
 
 config MVME7100
-        bool "Artesyn MVME7100"
-        help
-          This option enables support for the Emerson/Artesyn MVME7100 board.
+	bool "Artesyn MVME7100"
+	help
+	  This option enables support for the Emerson/Artesyn MVME7100 board.
 
 endif
 
diff --git a/arch/powerpc/platforms/maple/Kconfig b/arch/powerpc/platforms/maple/Kconfig
index 08d530a..86ae210 100644
--- a/arch/powerpc/platforms/maple/Kconfig
+++ b/arch/powerpc/platforms/maple/Kconfig
@@ -14,5 +14,5 @@ config PPC_MAPLE
 	select MMIO_NVRAM
 	select ATA_NONSTANDARD if ATA
 	help
-          This option enables support for the Maple 970FX Evaluation Board.
+	  This option enables support for the Maple 970FX Evaluation Board.
 	  For more information, refer to <http://www.970eval.com>
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 9c6b3d8..c7ad9818 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -80,19 +80,19 @@ config LPARCFG
 	bool "LPAR Configuration Data"
 	depends on PPC_PSERIES
 	help
-	Provide system capacity information via human readable
-	<key word>=<value> pairs through a /proc/ppc64/lparcfg interface.
+	  Provide system capacity information via human readable
+	  <key word>=<value> pairs through a /proc/ppc64/lparcfg interface.
 
 config PPC_PSERIES_DEBUG
 	depends on PPC_PSERIES && PPC_EARLY_DEBUG
 	bool "Enable extra debug logging in platforms/pseries"
-        help
+	default y
+	help
 	  Say Y here if you want the pseries core to produce a bunch of
 	  debug messages to the system log. Select this if you are having a
 	  problem with the pseries core and want to see more of what is
 	  going on. This does not enable debugging in lpar.c, which must
 	  be manually done due to its verbosity.
-	default y
 
 config PPC_SMLPAR
 	bool "Support for shared-memory logical partitions"
@@ -117,16 +117,16 @@ config CMM
 	  balance memory across many LPARs.
 
 config HV_PERF_CTRS
-       bool "Hypervisor supplied PMU events (24x7 & GPCI)"
-       default y
-       depends on PERF_EVENTS && PPC_PSERIES
-       help
+	bool "Hypervisor supplied PMU events (24x7 & GPCI)"
+	default y
+	depends on PERF_EVENTS && PPC_PSERIES
+	help
 	  Enable access to hypervisor supplied counters in perf. Currently,
 	  this enables code that uses the hcall GetPerfCounterInfo and 24x7
 	  interfaces to retrieve counters. GPCI exists on Power 6 and later
 	  systems. 24x7 is available on Power 8 and later systems.
 
-          If unsure, select Y.
+	  If unsure, select Y.
 
 config IBMVIO
 	depends on PPC_PSERIES
diff --git a/arch/powerpc/sysdev/xics/Kconfig b/arch/powerpc/sysdev/xics/Kconfig
index 86fee42..304614c 100644
--- a/arch/powerpc/sysdev/xics/Kconfig
+++ b/arch/powerpc/sysdev/xics/Kconfig
@@ -1,15 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 config PPC_XICS
-       def_bool n
-       select PPC_SMP_MUXED_IPI
-       select HARDIRQS_SW_RESEND
+	def_bool n
+	select PPC_SMP_MUXED_IPI
+	select HARDIRQS_SW_RESEND
 
 config PPC_ICP_NATIVE
-       def_bool n
+	def_bool n
 
 config PPC_ICP_HV
-       def_bool n
+	def_bool n
 
 config PPC_ICS_RTAS
-       def_bool n
-
+	def_bool n
-- 
1.9.1

