Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8877ECC377
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 21:16:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lKNk6bTZzDqY0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 05:16:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NSdJbkC2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lCdL3pnXzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2019 00:56:54 +1000 (AEST)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03B4B2133F;
 Fri,  4 Oct 2019 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570201012;
 bh=2mKxiYbUqFAYC8HwEexsiuZjLowiVHlnF0alJUeeDSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NSdJbkC2OajX50YunsguaZ4UEQoLL4XAD+PX1ArEq/DoMQUKcZYiy60p1Fq6ieksE
 IxK3WtotdZCIsU6jiYRFEOHqso/trZoLwrcwZ35ycfsPtctRCOKlFUkn9HVV3J0cfZ
 +i0L1mTqUUa8PIsQQGswE/gHmEu5xbH7ZCuUHInU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, keyrings@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-input@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org,
 esc.storagedev@microsemi.com, linux-rockchip@lists.infradead.org,
 linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
 ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig indentation
Date: Fri,  4 Oct 2019 16:55:44 +0200
Message-Id: <20191004145544.5066-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004145544.5066-1-krzk@kernel.org>
References: <20191004145544.5066-1-krzk@kernel.org>
X-Mailman-Approved-At: Sat, 05 Oct 2019 05:01:29 +1000
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
    $ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/Kconfig                           |  4 ++--
 arch/alpha/Kconfig                     |  2 +-
 arch/arm/Kconfig.debug                 |  4 ++--
 arch/arm/mach-ep93xx/Kconfig           |  8 ++++----
 arch/arm/mach-hisi/Kconfig             |  2 +-
 arch/arm/mach-ixp4xx/Kconfig           | 16 ++++++++--------
 arch/arm/mach-mmp/Kconfig              |  2 +-
 arch/arm/mach-omap1/Kconfig            | 14 +++++++-------
 arch/arm/mach-prima2/Kconfig           |  6 +++---
 arch/arm/mach-s3c24xx/Kconfig          |  4 ++--
 arch/arm/mach-s3c64xx/Kconfig          |  6 +++---
 arch/arm/plat-samsung/Kconfig          |  2 +-
 arch/arm64/Kconfig                     |  6 +++---
 arch/arm64/Kconfig.debug               |  2 +-
 arch/h8300/Kconfig                     |  4 ++--
 arch/h8300/Kconfig.cpu                 |  4 ++--
 arch/m68k/Kconfig.bus                  |  2 +-
 arch/m68k/Kconfig.debug                | 16 ++++++++--------
 arch/m68k/Kconfig.machine              |  8 ++++----
 arch/nds32/Kconfig.cpu                 | 18 +++++++++---------
 arch/openrisc/Kconfig                  | 26 +++++++++++++-------------
 arch/powerpc/Kconfig.debug             | 18 +++++++++---------
 arch/powerpc/platforms/Kconfig.cputype |  2 +-
 arch/riscv/Kconfig.socs                |  2 +-
 arch/sh/boards/Kconfig                 |  2 +-
 arch/sh/mm/Kconfig                     |  2 +-
 arch/um/Kconfig                        |  2 +-
 arch/x86/Kconfig                       | 18 +++++++++---------
 28 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 5f8a5d84dbbe..8d4f77bbed29 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -76,7 +76,7 @@ config JUMP_LABEL
        depends on HAVE_ARCH_JUMP_LABEL
        depends on CC_HAS_ASM_GOTO
        help
-         This option enables a transparent branch optimization that
+	 This option enables a transparent branch optimization that
 	 makes certain almost-always-true or almost-always-false branch
 	 conditions even cheaper to execute within the kernel.
 
@@ -84,7 +84,7 @@ config JUMP_LABEL
 	 scheduler functionality, networking code and KVM have such
 	 branches and include support for this optimization technique.
 
-         If it is detected that the compiler has support for "asm goto",
+	 If it is detected that the compiler has support for "asm goto",
 	 the kernel will compile such branches with just a nop
 	 instruction. When the condition flag is toggled to true, the
 	 nop will be converted to a jump instruction to execute the
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index ef179033a7c2..30a6291355cb 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -545,7 +545,7 @@ config NR_CPUS
 	default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
 	help
 	  MARVEL support can handle a maximum of 32 CPUs, all the others
-          with working support have a maximum of 4 CPUs.
+	  with working support have a maximum of 4 CPUs.
 
 config ARCH_DISCONTIGMEM_ENABLE
 	bool "Discontiguous Memory Support"
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 8bcbd0cd739b..0e5d52fbddbd 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -274,7 +274,7 @@ choice
 		select DEBUG_UART_8250
 		help
 		  Say Y here if you want the debug print routines to direct
-                  their output to the CNS3xxx UART0.
+	          their output to the CNS3xxx UART0.
 
 	config DEBUG_DAVINCI_DA8XX_UART1
 		bool "Kernel low-level debugging on DaVinci DA8XX using UART1"
@@ -828,7 +828,7 @@ choice
 		select DEBUG_UART_8250
 		help
 		  Say Y here if you want kernel low-level debugging support
-                  on Rockchip RV1108 based platforms.
+	          on Rockchip RV1108 based platforms.
 
 	config DEBUG_RV1108_UART1
 		bool "Kernel low-level debugging messages via Rockchip RV1108 UART1"
diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
index f2db5fd38145..bf81dfab7f1b 100644
--- a/arch/arm/mach-ep93xx/Kconfig
+++ b/arch/arm/mach-ep93xx/Kconfig
@@ -126,10 +126,10 @@ config MACH_MICRO9S
 	  Contec Micro9-Slim board.
 
 config MACH_SIM_ONE
-        bool "Support Simplemachines Sim.One board"
-        help
-          Say 'Y' here if you want your kernel to support the
-          Simplemachines Sim.One board.
+	bool "Support Simplemachines Sim.One board"
+	help
+	  Say 'Y' here if you want your kernel to support the
+	  Simplemachines Sim.One board.
 
 config MACH_SNAPPER_CL15
 	bool "Support Bluewater Systems Snapper CL15 Module"
diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 98338a489921..4697a756f676 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -31,7 +31,7 @@ config ARCH_HIP01
        select HAVE_ARM_TWD if SMP
        select ARM_GLOBAL_TIMER
        help
-         Support for Hisilicon HIP01 SoC family
+	 Support for Hisilicon HIP01 SoC family
 
 config ARCH_HIP04
 	bool "Hisilicon HiP04 Cortex A15 family"
diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index f7211b57b1e7..484e8eb16baa 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -214,14 +214,14 @@ config IXP4XX_INDIRECT_PCI
 	bool "Use indirect PCI memory access"
 	depends on PCI
 	help
-          IXP4xx provides two methods of accessing PCI memory space:
-
-          1) A direct mapped window from 0x48000000 to 0x4BFFFFFF (64MB).
-             To access PCI via this space, we simply ioremap() the BAR
-             into the kernel and we can use the standard read[bwl]/write[bwl]
-             macros. This is the preferred method due to speed but it
-             limits the system to just 64MB of PCI memory. This can be
-             problematic if using video cards and other memory-heavy devices.
+	  IXP4xx provides two methods of accessing PCI memory space:
+
+	  1) A direct mapped window from 0x48000000 to 0x4BFFFFFF (64MB).
+	     To access PCI via this space, we simply ioremap() the BAR
+	     into the kernel and we can use the standard read[bwl]/write[bwl]
+	     macros. This is the preferred method due to speed but it
+	     limits the system to just 64MB of PCI memory. This can be
+	     problematic if using video cards and other memory-heavy devices.
 
 	  2) If > 64MB of memory space is required, the IXP4xx can be
 	     configured to use indirect registers to access the whole PCI
diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index 0440109e973b..c549fc3938b8 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -150,7 +150,7 @@ config CPU_MMP2
 	  Select code specific to MMP2. MMP2 is ARMv7 compatible.
 
 config USB_EHCI_MV_U2O
-        bool "EHCI support for PXA USB OTG controller"
+	bool "EHCI support for PXA USB OTG controller"
 	depends on USB_EHCI_MV
 	help
 	  Enables support for OTG controller which can be switched to host mode.
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 2a17dc1d122c..89138d14d0f2 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -66,8 +66,8 @@ config MACH_OMAP_INNOVATOR
 	bool "TI Innovator"
 	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
 	help
-          TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
-          have such a board.
+	  TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
+	  have such a board.
 
 config MACH_OMAP_H2
 	bool "TI H2 Support"
@@ -94,7 +94,7 @@ config MACH_OMAP_OSK
 	depends on ARCH_OMAP1 && ARCH_OMAP16XX
     	help
 	  TI OMAP 5912 OSK (OMAP Starter Kit) board support. Say Y here
-          if you have such a board.
+	  if you have such a board.
 
 config OMAP_OSK_MISTRAL
 	bool "Mistral QVGA board Support"
@@ -180,10 +180,10 @@ config MACH_OMAP_GENERIC
 	bool "Generic OMAP board"
 	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
 	help
-          Support for generic OMAP-1510, 1610 or 1710 board with
-          no FPGA. Can be used as template for porting Linux to
-          custom OMAP boards. Say Y here if you have a custom
-          board.
+	  Support for generic OMAP-1510, 1610 or 1710 board with
+	  no FPGA. Can be used as template for porting Linux to
+	  custom OMAP boards. Say Y here if you have a custom
+	  board.
 
 endmenu
 
diff --git a/arch/arm/mach-prima2/Kconfig b/arch/arm/mach-prima2/Kconfig
index 6f66785fab01..88a76d265fd9 100644
--- a/arch/arm/mach-prima2/Kconfig
+++ b/arch/arm/mach-prima2/Kconfig
@@ -22,7 +22,7 @@ config ARCH_ATLAS6
 	default y
 	select SIRF_IRQ
 	help
-          Support for CSR SiRFSoC ARM Cortex A9 Platform
+	  Support for CSR SiRFSoC ARM Cortex A9 Platform
 
 config ARCH_ATLAS7
 	bool "CSR SiRFSoC ATLAS7 ARM Cortex A7 Platform"
@@ -32,7 +32,7 @@ config ARCH_ATLAS7
 	select HAVE_ARM_SCU if SMP
 	select HAVE_SMP
 	help
-          Support for CSR SiRFSoC ARM Cortex A7 Platform
+	  Support for CSR SiRFSoC ARM Cortex A7 Platform
 
 config ARCH_PRIMA2
 	bool "CSR SiRFSoC PRIMA2 ARM Cortex A9 Platform"
@@ -41,7 +41,7 @@ config ARCH_PRIMA2
 	select ZONE_DMA
 	select PRIMA2_TIMER
 	help
-          Support for CSR SiRFSoC ARM Cortex A9 Platform
+	  Support for CSR SiRFSoC ARM Cortex A9 Platform
 
 config SIRF_IRQ
 	bool
diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 686f0bbde998..95db290637aa 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -141,8 +141,8 @@ config S3C2410_CPUFREQ_UTILS
        bool
        depends on ARM_S3C24XX_CPUFREQ
        help
-         Internal node to select timing code that is common to the s3c2410
-         and s3c2440/s3c244 cpu frequency support.
+	 Internal node to select timing code that is common to the s3c2410
+	 and s3c2440/s3c244 cpu frequency support.
 
 # cpu frequency support common to s3c2412, s3c2413 and s3c2442
 
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 5700822e3c74..125e50301d2a 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -202,7 +202,7 @@ config SMDK6410_SD_CH0
 	bool "Use channel 0 only"
 	depends on MACH_SMDK6410
 	help
-          Select CON7 (channel 0) as the MMC/SD slot, as
+	  Select CON7 (channel 0) as the MMC/SD slot, as
 	  at least some SMDK6410 boards come with the
 	  resistors fitted so that the card detects for
 	  channels 0 and 1 are the same.
@@ -211,7 +211,7 @@ config SMDK6410_SD_CH1
 	bool "Use channel 1 only"
 	depends on MACH_SMDK6410
 	help
-          Select CON6 (channel 1) as the MMC/SD slot, as
+	  Select CON6 (channel 1) as the MMC/SD slot, as
 	  at least some SMDK6410 boards come with the
 	  resistors fitted so that the card detects for
 	  channels 0 and 1 are the same.
@@ -257,7 +257,7 @@ config MACH_NCP
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_I2C1
 	help
-          Machine support for the Samsung NCP
+	  Machine support for the Samsung NCP
 
 config MACH_HMT
 	bool "Airgoo HMT"
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 301e572651c0..99ae92fa452a 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -250,7 +250,7 @@ config S3C_PM_DEBUG_LED_SMDK
        bool "SMDK LED suspend/resume debugging"
        depends on PM && (MACH_SMDK6410)
        help
-         Say Y here to enable the use of the SMDK LEDs on the baseboard
+	 Say Y here to enable the use of the SMDK LEDs on the baseboard
 	 for debugging of the state of the suspend and resume process.
 
 	 Note, this currently only works for S3C64XX based SMDK boards.
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 41a9b4257b72..60233baf3f0f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -262,7 +262,7 @@ config GENERIC_HWEIGHT
 	def_bool y
 
 config GENERIC_CSUM
-        def_bool y
+	def_bool y
 
 config GENERIC_CALIBRATE_DELAY
 	def_bool y
@@ -832,7 +832,7 @@ config ARM64_PA_BITS
 config CPU_BIG_ENDIAN
        bool "Build big-endian kernel"
        help
-         Say Y if you plan on running a kernel in big-endian mode.
+	 Say Y if you plan on running a kernel in big-endian mode.
 
 config SCHED_MC
 	bool "Multi-core scheduler support"
@@ -1593,7 +1593,7 @@ config EFI
 	help
 	  This option provides support for runtime services provided
 	  by UEFI firmware (such as non-volatile variables, realtime
-          clock, and platform reset). A UEFI stub is also provided to
+	  clock, and platform reset). A UEFI stub is also provided to
 	  allow the kernel to be booted as an EFI application. This
 	  is only useful on systems that have UEFI firmware.
 
diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index cf09010d825f..bb1eb10a7a62 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -8,7 +8,7 @@ config ARM64_PTDUMP_DEBUGFS
 	depends on DEBUG_KERNEL
 	select ARM64_PTDUMP_CORE
 	select DEBUG_FS
-        help
+	help
 	  Say Y here if you want to show the kernel pagetable layout in a
 	  debugfs file. This information is only useful for kernel developers
 	  who are working in architecture specific areas of the kernel.
diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index 14bb45644c0c..7a33141fd0b7 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config H8300
-        def_bool y
+	def_bool y
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_BINFMT_FLAT
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
@@ -38,7 +38,7 @@ config NO_IOPORT_MAP
 	def_bool y
 
 config GENERIC_CSUM
-        def_bool y
+	def_bool y
 
 config HZ
 	int
diff --git a/arch/h8300/Kconfig.cpu b/arch/h8300/Kconfig.cpu
index b5e14d513e62..59be62d0716b 100644
--- a/arch/h8300/Kconfig.cpu
+++ b/arch/h8300/Kconfig.cpu
@@ -90,11 +90,11 @@ config H8S_SIM
 endchoice
 
 config H8300_BUILTIN_DTB
-        string "Builtin DTB"
+	string "Builtin DTB"
 	default ""
 
 config OFFSET
-        hex "Load offset"
+	hex "Load offset"
 	default 0
 
 endmenu
diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index 9d0a3a23d50e..f1be832e2b74 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -66,6 +66,6 @@ endif
 if !MMU
 
 config ISA_DMA_API
-        def_bool !M5272
+	def_bool !M5272
 
 endif
diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index f43643111eaf..11b306bdd788 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -12,16 +12,16 @@ config EARLY_PRINTK
 	bool "Early printk"
 	depends on !(SUN3 || M68000 || COLDFIRE)
 	help
-          Write kernel log output directly to a serial port.
-          Where implemented, output goes to the framebuffer as well.
-          PROM console functionality on Sun 3x is not affected by this option.
+	  Write kernel log output directly to a serial port.
+	  Where implemented, output goes to the framebuffer as well.
+	  PROM console functionality on Sun 3x is not affected by this option.
 
-          Pass "earlyprintk" on the kernel command line to get a
-          boot console.
+	  Pass "earlyprintk" on the kernel command line to get a
+	  boot console.
 
-          This is useful for kernel debugging when your machine crashes very
-          early, i.e. before the normal console driver is loaded.
-          You should normally say N here, unless you want to debug such a crash.
+	  This is useful for kernel debugging when your machine crashes very
+	  early, i.e. before the normal console driver is loaded.
+	  You should normally say N here, unless you want to debug such a crash.
 
 if !MMU
 
diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index c01e103492fd..b23a66bac77f 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -269,10 +269,10 @@ config AMCORE
 	  Support for the Sysam AMCORE open-hardware generic board.
 
 config STMARK2
-        bool "Sysam stmark2 board support"
-        depends on M5441x
-        help
-          Support for the Sysam stmark2 open-hardware generic board.
+	bool "Sysam stmark2 board support"
+	depends on M5441x
+	help
+	  Support for the Sysam stmark2 open-hardware generic board.
 
 config FIREBEE
 	bool "FireBee board support"
diff --git a/arch/nds32/Kconfig.cpu b/arch/nds32/Kconfig.cpu
index f80a4ab63da2..2216cd789b29 100644
--- a/arch/nds32/Kconfig.cpu
+++ b/arch/nds32/Kconfig.cpu
@@ -13,8 +13,8 @@ config FPU
 	default n
 	help
 	  If FPU ISA is used in user space, this configuration shall be Y to
-          enable required support in kerenl such as fpu context switch and
-          fpu exception handler.
+	  enable required support in kerenl such as fpu context switch and
+	  fpu exception handler.
 
 	  If no FPU ISA is used in user space, say N.
 
@@ -24,7 +24,7 @@ config LAZY_FPU
 	default y
 	help
 	  Say Y here to enable the lazy FPU scheme. The lazy FPU scheme can
-          enhance system performance by reducing the context switch
+	  enhance system performance by reducing the context switch
 	  frequency of the FPU register.
 
 	  For nomal case, say Y.
@@ -75,11 +75,11 @@ choice
 	  if its cache way size is larger than page size. You can specify the
 	  CPU type direcly or choose CPU_V3 if unsure.
 
-          A kernel built for N10 is able to run on N15, D15, N13, N10 or D10.
-          A kernel built for N15 is able to run on N15 or D15.
-          A kernel built for D10 is able to run on D10 or D15.
-          A kernel built for D15 is able to run on D15.
-          A kernel built for N13 is able to run on N15, N13 or D15.
+	  A kernel built for N10 is able to run on N15, D15, N13, N10 or D10.
+	  A kernel built for N15 is able to run on N15 or D15.
+	  A kernel built for D10 is able to run on D10 or D15.
+	  A kernel built for D15 is able to run on D15.
+	  A kernel built for N13 is able to run on N15, N13 or D15.
 
 config CPU_N15
 	bool "AndesCore N15"
@@ -173,7 +173,7 @@ config HIGHMEM
 
 config CACHE_L2
 	bool "Support L2 cache"
-        default y
+	default y
 	help
 	  Say Y here to enable L2 cache if your SoC are integrated with L2CC.
 	  If unsure, say N.
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index bf326f0edd2f..1928e061ff96 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -13,7 +13,7 @@ config OPENRISC
 	select IRQ_DOMAIN
 	select HANDLE_DOMAIN_IRQ
 	select GPIOLIB
-        select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_TRACEHOOK
 	select SPARSE_IRQ
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_PROBE
@@ -51,12 +51,12 @@ config NO_IOPORT_MAP
 	def_bool y
 
 config TRACE_IRQFLAGS_SUPPORT
-        def_bool y
+	def_bool y
 
 # For now, use generic checksum functions
 #These can be reimplemented in assembly later if so inclined
 config GENERIC_CSUM
-        def_bool y
+	def_bool y
 
 config STACKTRACE_SUPPORT
 	def_bool y
@@ -89,8 +89,8 @@ config DCACHE_WRITETHROUGH
 	  If unsure say N here
 
 config OPENRISC_BUILTIN_DTB
-        string "Builtin DTB"
-        default ""
+	string "Builtin DTB"
+	default ""
 
 menu "Class II Instructions"
 
@@ -161,13 +161,13 @@ config OPENRISC_HAVE_SHADOW_GPRS
 	  On a unicore system it's safe to say N here if you are unsure.
 
 config CMDLINE
-        string "Default kernel command string"
-        default ""
-        help
-          On some architectures there is currently no way for the boot loader
-          to pass arguments to the kernel. For these architectures, you should
-          supply some command-line options at build time by entering them
-          here.
+	string "Default kernel command string"
+	default ""
+	help
+	  On some architectures there is currently no way for the boot loader
+	  to pass arguments to the kernel. For these architectures, you should
+	  supply some command-line options at build time by entering them
+	  here.
 
 menu "Debugging options"
 
@@ -185,7 +185,7 @@ config OPENRISC_ESR_EXCEPTION_BUG_CHECK
 	default n
 	help
 	  This option enables some checks that might expose some problems
-          in kernel.
+	  in kernel.
 
 	  Say N if you are unsure.
 
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index c59920920ddc..4e1d39847462 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -122,8 +122,8 @@ config XMON_DEFAULT_RO_MODE
 	depends on XMON
 	default y
 	help
-          Operate xmon in read-only mode. The cmdline options 'xmon=rw' and
-          'xmon=ro' override this default.
+	  Operate xmon in read-only mode. The cmdline options 'xmon=rw' and
+	  'xmon=ro' override this default.
 
 config DEBUGGER
 	bool
@@ -222,7 +222,7 @@ config PPC_EARLY_DEBUG_44x
 	help
 	  Select this to enable early debugging for IBM 44x chips via the
 	  inbuilt serial port.  If you enable this, ensure you set
-          PPC_EARLY_DEBUG_44x_PHYSLOW below to suit your target board.
+	  PPC_EARLY_DEBUG_44x_PHYSLOW below to suit your target board.
 
 config PPC_EARLY_DEBUG_40x
 	bool "Early serial debugging for IBM/AMCC 40x CPUs"
@@ -325,7 +325,7 @@ config PPC_EARLY_DEBUG_44x_PHYSLOW
 	default "0x40000200"
 	help
 	  You probably want 0x40000200 for ebony boards and
-          0x40000300 for taishan
+	  0x40000300 for taishan
 
 config PPC_EARLY_DEBUG_44x_PHYSHIGH
 	hex "EPRN of early debug UART physical address"
@@ -359,9 +359,9 @@ config FAIL_IOMMU
 	  If you are unsure, say N.
 
 config PPC_PTDUMP
-        bool "Export kernel pagetable layout to userspace via debugfs"
-        depends on DEBUG_KERNEL && DEBUG_FS
-        help
+	bool "Export kernel pagetable layout to userspace via debugfs"
+	depends on DEBUG_KERNEL && DEBUG_FS
+	help
 	  This option exports the state of the kernel pagetables to a
 	  debugfs file. This is only useful for kernel developers who are
 	  working in architecture specific areas of the kernel - probably
@@ -390,8 +390,8 @@ config PPC_DEBUG_WX
 
 config PPC_FAST_ENDIAN_SWITCH
 	bool "Deprecated fast endian-switch syscall"
-        depends on DEBUG_KERNEL && PPC_BOOK3S_64
-        help
+	depends on DEBUG_KERNEL && PPC_BOOK3S_64
+	help
 	  If you're unsure what this is, say N.
 
 config KASAN_SHADOW_OFFSET
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 12543e53fa96..073b6cb6d1ac 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -421,7 +421,7 @@ config PPC_PERF_CTRS
        def_bool y
        depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
        help
-         This enables the powerpc-specific perf_event back-end.
+	 This enables the powerpc-specific perf_event back-end.
 
 config FORCE_SMP
 	# Allow platforms to force SMP=y by selecting this
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 536c0ef4aee8..85199004c6ef 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,6 +8,6 @@ config SOC_SIFIVE
        select CLK_SIFIVE_FU540_PRCI
        select SIFIVE_PLIC
        help
-         This enables support for SiFive SoC platform hardware.
+	 This enables support for SiFive SoC platform hardware.
 
 endmenu
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index cee24c308337..60a113114a76 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -231,7 +231,7 @@ config SH_MIGOR
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Select Migo-R if configuring for the SH7722 Migo-R platform
-          by Renesas System Solutions Asia Pte. Ltd.
+	  by Renesas System Solutions Asia Pte. Ltd.
 
 config SH_AP325RXA
 	bool "AP-325RXA"
diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index 5c8a2ebfc720..d84316abaa81 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -2,7 +2,7 @@
 menu "Memory management options"
 
 config MMU
-        bool "Support for memory management hardware"
+	bool "Support for memory management hardware"
 	depends on !CPU_SH2
 	default y
 	help
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index fec6b4ca2b6e..2a6d04fcb3e9 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -153,7 +153,7 @@ config KERNEL_STACK_ORDER
 	  It is possible to reduce the stack to 1 for 64BIT and 0 for 32BIT on
 	  older (pre-2017) CPUs. It is not recommended on newer CPUs due to the
 	  increase in the size of the state which needs to be saved when handling
-          signals.
+	  signals.
 
 config MMAPPER
 	tristate "iomem emulation driver"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 96ea2c7449ef..989eaa96e3e6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -806,9 +806,9 @@ config KVM_GUEST
 	  timing infrastructure such as time of day, and system time
 
 config ARCH_CPUIDLE_HALTPOLL
-        def_bool n
-        prompt "Disable host haltpoll when loading haltpoll driver"
-        help
+	def_bool n
+	prompt "Disable host haltpoll when loading haltpoll driver"
+	help
 	  If virtualized under KVM, disable host haltpoll.
 
 config PVH
@@ -892,11 +892,11 @@ config APB_TIMER
        select DW_APB_TIMER
        depends on X86_INTEL_MID && SFI
        help
-         APB timer is the replacement for 8254, HPET on X86 MID platforms.
-         The APBT provides a stable time base on SMP
-         systems, unlike the TSC, but it is more expensive to access,
-         as it is off-chip. APB timers are always running regardless of CPU
-         C states, they are used as per CPU clockevent device when possible.
+	 APB timer is the replacement for 8254, HPET on X86 MID platforms.
+	 The APBT provides a stable time base on SMP
+	 systems, unlike the TSC, but it is more expensive to access,
+	 as it is off-chip. APB timers are always running regardless of CPU
+	 C states, they are used as per CPU clockevent device when possible.
 
 # Mark as expert because too many people got it wrong.
 # The code disables itself when not needed.
@@ -1962,7 +1962,7 @@ config EFI_STUB
        depends on EFI && !X86_USE_3DNOW
        select RELOCATABLE
        ---help---
-          This kernel feature allows a bzImage to be loaded directly
+	  This kernel feature allows a bzImage to be loaded directly
 	  by EFI firmware without the use of a bootloader.
 
 	  See Documentation/admin-guide/efi-stub.rst for more information.
-- 
2.17.1

