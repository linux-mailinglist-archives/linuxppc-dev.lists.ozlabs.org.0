Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C125E7E76C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 02:45:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=hTEq3oiq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRM8N4v1Lz3cb1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 12:45:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=hTEq3oiq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.78; helo=rcdn-iport-7.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRM1w6Nnjz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 12:39:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=37012; q=dns/txt;
  s=iport; t=1699580373; x=1700789973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vJBa01mKyZaFU95wqbINxHeiLhIt/IfgiGWPZq5C14s=;
  b=hTEq3oiqyDTf0CRYO/tj/+OFUe6kMeT6YZ2AlqOrH8c4nALsjpVzN/DW
   FfpJCgIt7+HtGqUJE8aDTuksbJUlsg1t0Ucise8ccAeL10Jnb4G/qVunb
   50WxJooNeXPm6FtV49eOJBUeUtjvZkXNHwP3NXBQSPhI0fRv6SWodU/AP
   w=;
X-CSE-ConnectionGUID: rcrZ8nhaTFCvv7RVNa6Ynw==
X-CSE-MsgGUID: wLhxpbV3R5C6+zcUb+RAUQ==
X-IronPort-AV: E=Sophos;i="6.03,291,1694736000"; 
   d="scan'208";a="134585027"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:38:28 +0000
Received: from goliath.lan ([10.25.128.169])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 3AA1cHVK011466;
	Fri, 10 Nov 2023 01:38:27 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Tomas Mudrunka <tomas.mudrunka@gmail.com>,
        Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 4/8] CMDLINE: mips: convert to generic builtin command line
Date: Thu,  9 Nov 2023 17:38:08 -0800
Message-Id: <20231110013817.2378507-5-danielwa@cisco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110013817.2378507-1-danielwa@cisco.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.25.128.169, [10.25.128.169]
X-Outbound-Node: rcdn-core-4.cisco.com
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
Cc: Ruslan Ruslichenko <rruslich@cisco.com>, Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This updates the mips code to use the CONFIG_GENERIC_CMDLINE
option.

This deletes the option for MIPS_CMDLINE_BUILTIN_EXTEND
and replaces the functionality with generic code.

Of note, the pic32 has some strange handling of the current built
in command line. It was converted to use the static variant which
can't be updated after compilation. It should eventually be updated
to use to append and prepend symbols.

This includes a scripted mass convert of the config files to use
the new generic cmdline. There is a bit of a trim effect here.
It would seems that some of the config haven't been trimmed in
a while.

The script used is as follows,

if [[ -z "$1" || -z "$2" ]]; then
        echo "Two arguments are needed."
        exit 1
fi
mkdir $1
cp $2 $1/.config
sed -i 's/CONFIG_CMDLINE=/CONFIG_CMDLINE_BOOL=y\nCONFIG_CMDLINE_PREPEND=/g' $1/.config
make ARCH=$1 O=$1 olddefconfig
make ARCH=$1 O=$1 savedefconfig
cp $1/defconfig $2
rm -Rf $1

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/mips/Kconfig                         |   4 +-
 arch/mips/Kconfig.debug                   |  44 -------
 arch/mips/configs/ar7_defconfig           |  12 +-
 arch/mips/configs/bcm47xx_defconfig       |  10 +-
 arch/mips/configs/bcm63xx_defconfig       |  21 ++--
 arch/mips/configs/bmips_be_defconfig      |  17 ++-
 arch/mips/configs/bmips_stb_defconfig     | 139 ++++++++--------------
 arch/mips/configs/ci20_defconfig          |   8 +-
 arch/mips/configs/cu1000-neo_defconfig    |  19 ++-
 arch/mips/configs/cu1830-neo_defconfig    |  19 ++-
 arch/mips/configs/generic_defconfig       |  15 +--
 arch/mips/configs/gpr_defconfig           |  33 ++---
 arch/mips/configs/loongson3_defconfig     |  29 ++---
 arch/mips/include/asm/setup.h             |   2 +
 arch/mips/kernel/relocate.c               |  17 ++-
 arch/mips/kernel/setup.c                  |  36 +-----
 arch/mips/pic32/pic32mzda/early_console.c |   2 +-
 arch/mips/pic32/pic32mzda/init.c          |   3 +-
 18 files changed, 144 insertions(+), 286 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index bc8421859006..65fd3decc6b1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -31,6 +31,7 @@ config MIPS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
@@ -2989,9 +2990,6 @@ choice
 	config MIPS_CMDLINE_FROM_BOOTLOADER
 		bool "Bootloader kernel arguments if available"
 
-	config MIPS_CMDLINE_BUILTIN_EXTEND
-		depends on CMDLINE_BOOL
-		bool "Extend builtin kernel arguments with bootloader arguments"
 endchoice
 
 endmenu
diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index f4ae7900fcd3..f9da53d4ebd2 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -26,50 +26,6 @@ config EARLY_PRINTK_8250
 config USE_GENERIC_EARLY_PRINTK_8250
 	bool
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
-	help
-	  For most systems, it is firmware or second stage bootloader that
-	  by default specifies the kernel command line options.  However,
-	  it might be necessary or advantageous to either override the
-	  default kernel command line or add a few extra options to it.
-	  For such cases, this option allows you to hardcode your own
-	  command line options directly into the kernel.  For that, you
-	  should choose 'Y' here, and fill in the extra boot arguments
-	  in CONFIG_CMDLINE.
-
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
-
-	  Most MIPS systems will normally expect 'N' here and rely upon
-	  the command line from the firmware or the second-stage bootloader.
-
-config CMDLINE
-	string "Default kernel command string"
-	depends on CMDLINE_BOOL
-	help
-	  On some platforms, there is currently no way for the boot loader to
-	  pass arguments to the kernel.  For these platforms, and for the cases
-	  when you want to add some extra options to the command line or ignore
-	  the default command line, you can supply some command-line options at
-	  build time by entering them here.  In other cases you can specify
-	  kernel args so that you don't have to set them up in board prom
-	  initialization routines.
-
-	  For more information, see the CMDLINE_BOOL and CMDLINE_OVERRIDE
-	  options.
-
-config CMDLINE_OVERRIDE
-	bool "Built-in command line overrides firmware arguments"
-	depends on CMDLINE_BOOL
-	help
-	  By setting this option to 'Y' you will have your kernel ignore
-	  command line arguments from firmware or second stage bootloader.
-	  Instead, the built-in command line will be used exclusively.
-
-	  Normally, you will choose 'N' here.
-
 config SB1XXX_CORELIS
 	bool "Corelis Debugger"
 	depends on SIBYTE_SB1xxx_SOC
diff --git a/arch/mips/configs/ar7_defconfig b/arch/mips/configs/ar7_defconfig
index 329c60aa570a..0dff0795705e 100644
--- a/arch/mips/configs/ar7_defconfig
+++ b/arch/mips/configs/ar7_defconfig
@@ -9,17 +9,18 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 # CONFIG_KALLSYMS is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
+CONFIG_KEXEC=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="rootfstype=squashfs,jffs2"
 CONFIG_AR7=y
 CONFIG_HZ_100=y
-CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BSD_DISKLABEL=y
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -39,7 +40,6 @@ CONFIG_TCP_CONG_WESTWOOD=y
 # CONFIG_TCP_CONG_HTCP is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
-# CONFIG_BRIDGE_NETFILTER is not set
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_MARK=y
 CONFIG_NF_CONNTRACK_FTP=m
@@ -115,5 +115,3 @@ CONFIG_SQUASHFS=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="rootfstype=squashfs,jffs2"
diff --git a/arch/mips/configs/bcm47xx_defconfig b/arch/mips/configs/bcm47xx_defconfig
index 6a68a96d13f8..26e2134f83af 100644
--- a/arch/mips/configs/bcm47xx_defconfig
+++ b/arch/mips/configs/bcm47xx_defconfig
@@ -3,8 +3,9 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyS0,115200"
 CONFIG_BCM47XX=y
-CONFIG_PCI=y
 # CONFIG_SUSPEND is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -31,6 +32,7 @@ CONFIG_NET_SCH_FQ_CODEL=y
 CONFIG_HAMRADIO=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
+CONFIG_PCI=y
 CONFIG_MTD=y
 CONFIG_MTD_BCM47XX_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -67,14 +69,10 @@ CONFIG_BCMA_DRIVER_GMAC_CMN=y
 CONFIG_USB=y
 CONFIG_USB_HCD_BCMA=y
 CONFIG_USB_HCD_SSB=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_CRC32_SARWATE=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200"
+CONFIG_DEBUG_FS=y
diff --git a/arch/mips/configs/bcm63xx_defconfig b/arch/mips/configs/bcm63xx_defconfig
index 34d0ca638ef0..0a73fd34063f 100644
--- a/arch/mips/configs/bcm63xx_defconfig
+++ b/arch/mips/configs/bcm63xx_defconfig
@@ -1,5 +1,4 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-# CONFIG_SWAP is not set
 CONFIG_NO_HZ=y
 CONFIG_EXPERT=y
 # CONFIG_FUTEX is not set
@@ -9,18 +8,16 @@ CONFIG_EXPERT=y
 # CONFIG_EVENTFD is not set
 # CONFIG_SHMEM is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyS0,115200"
 CONFIG_BCM63XX=y
 CONFIG_BCM63XX_CPU_6338=y
 CONFIG_BCM63XX_CPU_6345=y
 CONFIG_BCM63XX_CPU_6348=y
 CONFIG_BCM63XX_CPU_6358=y
 # CONFIG_SECCOMP is not set
-CONFIG_PCI=y
-CONFIG_PCCARD=y
-CONFIG_PCMCIA_BCM63XX=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_SWAP is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
@@ -29,6 +26,10 @@ CONFIG_INET=y
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
 CONFIG_MAC80211=y
+CONFIG_PCI=y
+# CONFIG_VGA_ARB is not set
+CONFIG_PCCARD=y
+CONFIG_PCMCIA_BCM63XX=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_MTD=y
@@ -47,11 +48,8 @@ CONFIG_B43=y
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 # CONFIG_UNIX98_PTYS is not set
-CONFIG_SERIAL_BCM63XX=y
-CONFIG_SERIAL_BCM63XX_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_VGA_ARB is not set
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 # CONFIG_USB_EHCI_TT_NEWSCHED is not set
@@ -62,5 +60,4 @@ CONFIG_PROC_KCORE=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 # CONFIG_CRYPTO_HW is not set
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200"
+# CONFIG_SLUB_DEBUG is not set
diff --git a/arch/mips/configs/bmips_be_defconfig b/arch/mips/configs/bmips_be_defconfig
index daef132d000b..0b2b7685330f 100644
--- a/arch/mips/configs/bmips_be_defconfig
+++ b/arch/mips/configs/bmips_be_defconfig
@@ -1,17 +1,17 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-# CONFIG_SWAP is not set
 CONFIG_NO_HZ=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon"
 CONFIG_BMIPS_GENERIC=y
 CONFIG_HIGHMEM=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=4
-# CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_SWAP is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
@@ -34,6 +34,7 @@ CONFIG_MTD_PHYSMAP=y
 # CONFIG_BLK_DEV is not set
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
 CONFIG_BCMGENET=y
@@ -41,7 +42,6 @@ CONFIG_USB_USBNET=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
-CONFIG_SERIAL_BCM63XX=y
 CONFIG_SERIAL_BCM63XX_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_POWER_RESET=y
@@ -70,7 +70,6 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon"
+CONFIG_DEBUG_FS=y
+# CONFIG_SLUB_DEBUG is not set
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index cd0dc37c3d84..4f96a1da7610 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -1,59 +1,44 @@
 # CONFIG_LOCALVERSION_AUTO is not set
-# CONFIG_SWAP is not set
+CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
-CONFIG_HZ=1000
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
 CONFIG_EXPERT=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon"
 CONFIG_BMIPS_GENERIC=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_HIGHMEM=y
-CONFIG_HIGH_RES_TIMERS=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=4
-# CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
-# CONFIG_RD_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
-# CONFIG_RD_LZMA is not set
-CONFIG_RD_XZ=y
-# CONFIG_RD_LZO is not set
-# CONFIG_RD_LZ4 is not set
-CONFIG_PCI=y
-CONFIG_PCI_MSI=y
-CONFIG_PCIEASPM_POWERSAVE=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCIE_BRCMSTB=y
+CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
+CONFIG_PM_DEBUG=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_BMIPS_CPUFREQ=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_SECCOMP is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_SWAP is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-# CONFIG_INET_DIAG is not set
-CONFIG_CFG80211=y
-CONFIG_NL80211_TESTMODE=y
-CONFIG_WIRELESS=y
-CONFIG_MAC80211=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-# CONFIG_PREVENT_FIRMWARE_BUILD is not set
-CONFIG_BRCMSTB_GISB_ARB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
@@ -62,25 +47,32 @@ CONFIG_IP_PNP_RARP=y
 CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
-CONFIG_INET_UDP_DIAG=y
+# CONFIG_INET_DIAG is not set
 CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_BIC=y
 # CONFIG_TCP_CONG_WESTWOOD is not set
 # CONFIG_TCP_CONG_HTCP is not set
 # CONFIG_IPV6 is not set
-CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
 CONFIG_NETFILTER=y
-CONFIG_NETFILTER_XTABLES=y
-CONFIG_BRIDGE=y
 CONFIG_BRIDGE_NETFILTER=m
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
 CONFIG_BRIDGE_NF_EBTABLES=m
 CONFIG_BRIDGE_EBT_BROUTE=m
+CONFIG_BRIDGE=y
 CONFIG_NET_DSA=y
-CONFIG_NET_SWITCHDEV=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_ALIGNMENT=12
-CONFIG_SPI=y
+CONFIG_VLAN_8021Q=y
+CONFIG_CFG80211=y
+CONFIG_NL80211_TESTMODE=y
+CONFIG_MAC80211=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEASPM_POWERSAVE=y
+CONFIG_PCI_MSI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -91,22 +83,21 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_ROM=y
 CONFIG_MTD_ABSENT=y
-CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_BRCMNAND=y
 CONFIG_MTD_SPI_NOR=y
 # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_GLUEBI=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
 # CONFIG_BLK_DEV is not set
-CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_AHCI_BRCM=y
 CONFIG_NETDEVICES=y
-CONFIG_VLAN_8021Q=y
 CONFIG_MACVLAN=y
 CONFIG_BCMGENET=y
 CONFIG_USB_USBNET=y
@@ -116,15 +107,16 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=y
 # CONFIG_SERIO is not set
-CONFIG_VT=y
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_SPI=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_BRCMSTB=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_SUPPLY=y
 # CONFIG_HWMON is not set
@@ -135,21 +127,18 @@ CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
-CONFIG_SOC_BRCMSTB=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_SOC_BRCMSTB=y
+CONFIG_PHY_BRCM_SATA=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-# CONFIG_DNOTIFY is not set
-CONFIG_PROC_KCORE=y
-CONFIG_CIFS=y
 CONFIG_JBD2_DEBUG=y
+# CONFIG_DNOTIFY is not set
 CONFIG_FUSE_FS=y
-CONFIG_FHANDLE=y
-CONFIG_CGROUPS=y
 CONFIG_CUSE=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
@@ -157,6 +146,7 @@ CONFIG_ZISOFS=y
 CONFIG_UDF_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_UBIFS_FS=y
@@ -169,42 +159,17 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
+CONFIG_CIFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+# CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
-# CONFIG_DEBUG_INFO is not set
-# CONFIG_DEBUG_INFO_REDUCED is not set
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_LOCKUP_DETECTOR=y
-CONFIG_DEBUG_USER=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon"
-# CONFIG_MIPS_CMDLINE_FROM_DTB is not set
-CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
-# CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER is not set
-# CONFIG_CRYPTO_HW is not set
-CONFIG_FW_CFE=y
-CONFIG_ATA=y
-CONFIG_SATA_AHCI_PLATFORM=y
-CONFIG_GENERIC_PHY=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_PHY_BRCM_USB=y
-CONFIG_PHY_BRCM_SATA=y
-CONFIG_PM_DEBUG=y
-CONFIG_SYSVIPC=y
-CONFIG_FUNCTION_GRAPH_TRACER=y
-CONFIG_DYNAMIC_FTRACE=y
-CONFIG_FUNCTION_TRACER=y
+# CONFIG_SLUB_DEBUG is not set
 CONFIG_FUNCTION_PROFILER=y
+CONFIG_STACK_TRACER=y
 CONFIG_IRQSOFF_TRACER=y
 CONFIG_SCHED_TRACER=y
-CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_FTRACE_SYSCALLS=y
-CONFIG_TRACER_SNAPSHOT=y
-CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
-CONFIG_STACK_TRACER=y
-CONFIG_AHCI_BRCM=y
-CONFIG_MTD_RAW_NAND=y
+CONFIG_BLK_DEV_IO_TRACE=y
diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index cdf2a782dee1..87d34b903f04 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -17,8 +17,10 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon console=ttyS4,115200 clk_ignore_unused"
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
@@ -126,7 +128,6 @@ CONFIG_DRM_INGENIC=m
 CONFIG_DRM_INGENIC_DW_HDMI=m
 CONFIG_FB=y
 # CONFIG_VGA_CONSOLE is not set
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
@@ -225,7 +226,4 @@ CONFIG_DEBUG_FS=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
-CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon console=ttyS4,115200 clk_ignore_unused"
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 19517beaf540..f5be8b992a0c 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -14,20 +14,22 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon clk_ignore_unused"
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1000_CU1000_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
-# CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+# CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPAT_BRK is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -66,7 +68,6 @@ CONFIG_SENSORS_ADS7828=m
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
@@ -86,7 +87,6 @@ CONFIG_DMA_JZ4780=y
 # CONFIG_INGENIC_TIMER is not set
 CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -97,15 +97,14 @@ CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_NFS_FS=y
-CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_CODEPAGE_950=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
-CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
 CONFIG_PRINTK_TIME=y
@@ -119,8 +118,4 @@ CONFIG_DEBUG_FS=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
-CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon clk_ignore_unused"
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index b403e67ab105..b02d32f19604 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -14,20 +14,22 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
+CONFIG_KALLSYMS_ALL=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon clk_ignore_unused"
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1830_CU1830_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
-# CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+# CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPAT_BRK is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -69,7 +71,6 @@ CONFIG_SENSORS_ADS7828=m
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
@@ -89,7 +90,6 @@ CONFIG_DMA_JZ4780=y
 # CONFIG_INGENIC_TIMER is not set
 CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -100,15 +100,14 @@ CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_NFS_FS=y
-CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_CODEPAGE_950=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
-CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
 CONFIG_PRINTK_TIME=y
@@ -122,8 +121,4 @@ CONFIG_DEBUG_FS=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
-CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon clk_ignore_unused"
diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index 071e2205c7ed..53eddba32478 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -1,5 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
@@ -15,11 +16,9 @@ CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_BPF_SYSCALL=y
-CONFIG_USERFAULTFD=y
 CONFIG_EXPERT=y
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_COMPAT_BRK is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon"
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_MIPS_CPS=y
 CONFIG_HIGHMEM=y
@@ -29,6 +28,8 @@ CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_USERFAULTFD=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -44,14 +45,11 @@ CONFIG_HW_RANDOM=y
 # CONFIG_HWMON is not set
 CONFIG_MFD_SYSCON=y
 CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
 CONFIG_HID_CYPRESS=y
 CONFIG_HID_EZKEY=y
 CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 # CONFIG_MIPS_PLATFORM_DEVICES is not set
@@ -85,7 +83,6 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_FS=y
+# CONFIG_SLUB_DEBUG is not set
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon"
diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index 92fc0edbac47..5c070a81a26d 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -9,9 +9,10 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyS0,115200 root=/dev/nfs rw ip=auto"
 CONFIG_MIPS_ALCHEMY=y
 CONFIG_MIPS_GPR=y
-CONFIG_PCI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
@@ -45,7 +46,6 @@ CONFIG_NETFILTER_XT_MATCH_LIMIT=m
 CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_MARK=m
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
-CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
 CONFIG_NETFILTER_XT_MATCH_QUOTA=m
 CONFIG_NETFILTER_XT_MATCH_REALM=m
@@ -102,27 +102,21 @@ CONFIG_IPDDP_ENCAP=y
 CONFIG_X25=m
 CONFIG_LAPB=m
 CONFIG_NET_SCHED=y
-CONFIG_NET_SCH_CBQ=m
 CONFIG_NET_SCH_HTB=m
 CONFIG_NET_SCH_HFSC=m
-CONFIG_NET_SCH_ATM=m
 CONFIG_NET_SCH_PRIO=m
 CONFIG_NET_SCH_RED=m
 CONFIG_NET_SCH_SFQ=m
 CONFIG_NET_SCH_TEQL=m
 CONFIG_NET_SCH_TBF=m
 CONFIG_NET_SCH_GRED=m
-CONFIG_NET_SCH_DSMARK=m
 CONFIG_NET_SCH_NETEM=m
 CONFIG_NET_SCH_INGRESS=m
 CONFIG_NET_CLS_BASIC=m
-CONFIG_NET_CLS_TCINDEX=m
 CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_FW=m
 CONFIG_NET_CLS_U32=m
 CONFIG_CLS_U32_MARK=y
-CONFIG_NET_CLS_RSVP=m
-CONFIG_NET_CLS_RSVP6=m
 CONFIG_NET_EMATCH=y
 CONFIG_NET_EMATCH_CMP=m
 CONFIG_NET_EMATCH_NBYTE=m
@@ -145,6 +139,8 @@ CONFIG_BAYCOM_SER_HDX=m
 CONFIG_YAM=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
+CONFIG_PCI=y
+# CONFIG_VGA_ARB is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
@@ -232,8 +228,6 @@ CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_NOWAYOUT=y
 CONFIG_SSB=m
 CONFIG_SSB_DRIVER_PCICORE=y
-# CONFIG_VGA_ARB is not set
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_USB_HID=m
@@ -250,10 +244,6 @@ CONFIG_USB_STORAGE=m
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_GENERIC=y
 CONFIG_USB_SERIAL_SIERRAWIRELESS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 CONFIG_ISO9660_FS=m
@@ -275,20 +265,15 @@ CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_AUTHENC=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_MD4=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200 root=/dev/nfs rw ip=auto"
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 07839a4b397e..aca4797b5bb6 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -5,6 +5,8 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -22,18 +24,18 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
-CONFIG_SYSFS_DEPRECATED=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_BPF_SYSCALL=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="ieee754=relaxed"
 CONFIG_MACH_LOONGSON64=y
 CONFIG_CPU_HAS_MSA=y
 CONFIG_NUMA=y
 CONFIG_NR_CPUS=16
 CONFIG_HZ_256=y
-CONFIG_KEXEC=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_VIRTUALIZATION=y
@@ -47,15 +49,12 @@ CONFIG_MODVERSIONS=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_MQ_IOSCHED_DEADLINE=m
 CONFIG_IOSCHED_BFQ=y
-CONFIG_BFQ_GROUP_IOSCHED=y
 CONFIG_BINFMT_MISC=m
 CONFIG_KSM=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=y
 CONFIG_NET_KEY=y
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTIPLE_TABLES=y
@@ -128,7 +127,6 @@ CONFIG_L2TP=m
 CONFIG_BRIDGE=m
 CONFIG_VSOCKETS=m
 CONFIG_VIRTIO_VSOCKETS=m
-CONFIG_BPF_JIT=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
@@ -196,7 +194,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_BROCADE is not set
 # CONFIG_NET_VENDOR_CHELSIO is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_CISCO is not set
@@ -216,6 +213,7 @@ CONFIG_IXGBE=y
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
 # CONFIG_NET_VENDOR_RDC is not set
 CONFIG_8139CP=m
 CONFIG_8139TOO=m
@@ -276,15 +274,14 @@ CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
+CONFIG_DRM_RADEON=m
 CONFIG_DRM_AMDGPU=m
 CONFIG_DRM_AMDGPU_SI=y
 CONFIG_DRM_AMDGPU_CIK=y
 CONFIG_DRM_AMDGPU_USERPTR=y
 CONFIG_DRM_AMD_ACP=y
-CONFIG_DRM_AMD_DC=y
 CONFIG_DRM_AMD_DC_SI=y
 CONFIG_DRM_AST=m
-CONFIG_DRM_RADEON=m
 CONFIG_DRM_QXL=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_FB=y
@@ -292,7 +289,6 @@ CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
 # CONFIG_VGA_CONSOLE is not set
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
@@ -350,7 +346,6 @@ CONFIG_EXT3_FS_SECURITY=y
 CONFIG_XFS_FS=y
 CONFIG_XFS_POSIX_ACL=y
 CONFIG_QUOTA=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_QFMT_V1=m
 CONFIG_QFMT_V2=m
 CONFIG_AUTOFS_FS=y
@@ -390,24 +385,20 @@ CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_PATH=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 CONFIG_FUNCTION_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="ieee754=relaxed"
diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index 8c56b862fd9c..798bc3c68080 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 #include <uapi/asm/setup.h>
 
+#ifndef __ASSEMBLY__
 extern void prom_putchar(char);
 extern void setup_early_printk(void);
 
@@ -27,5 +28,6 @@ extern unsigned long ebase;
 extern unsigned int hwrena;
 extern void per_cpu_trap_init(bool);
 extern void cpu_cache_init(void);
+#endif
 
 #endif /* __SETUP_H */
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 58fc8d089402..089d67c476ae 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -23,6 +23,7 @@
 #include <linux/start_kernel.h>
 #include <linux/string.h>
 #include <linux/printk.h>
+#include <linux/cmdline.h>
 
 #define RELOCATED(x) ((void *)((long)x + offset))
 
@@ -247,16 +248,26 @@ static inline __init bool kaslr_disabled(void)
 	char *str;
 
 #if defined(CONFIG_CMDLINE_BOOL)
-	const char *builtin_cmdline = CONFIG_CMDLINE;
+	char *builtin_cmdline = CMDLINE_PREPEND;
 
 	str = strstr(builtin_cmdline, "nokaslr");
 	if (str == builtin_cmdline ||
 	    (str > builtin_cmdline && *(str - 1) == ' '))
 		return true;
 #endif
-	str = strstr(arcs_cmdline, "nokaslr");
-	if (str == arcs_cmdline || (str > arcs_cmdline && *(str - 1) == ' '))
+	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
+		str = strstr(arcs_cmdline, "nokaslr");
+		if (str == arcs_cmdline || (str > arcs_cmdline && *(str - 1) == ' '))
+			return true;
+	}
+
+#if defined(CONFIG_CMDLINE_BOOL)
+	builtin_cmdline = CMDLINE_APPEND;
+	str = strstr(builtin_cmdline, "nokaslr");
+	if (str == builtin_cmdline ||
+	    (str > builtin_cmdline && *(str - 1) == ' '))
 		return true;
+#endif
 
 	return false;
 }
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index cb871eb784a7..38e0e19b9c0d 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <linux/debugfs.h>
 #include <linux/kexec.h>
 #include <linux/sizes.h>
+#include <linux/cmdline.h>
 #include <linux/device.h>
 #include <linux/dma-map-ops.h>
 #include <linux/decompress/generic.h>
@@ -70,12 +71,6 @@ EXPORT_SYMBOL(mips_machtype);
 static char __initdata command_line[COMMAND_LINE_SIZE];
 char __initdata arcs_cmdline[COMMAND_LINE_SIZE];
 
-#ifdef CONFIG_CMDLINE_BOOL
-static const char builtin_cmdline[] __initconst = CONFIG_CMDLINE;
-#else
-static const char builtin_cmdline[] __initconst = "";
-#endif
-
 /*
  * mips_io_port_base is the begin of the address space to which x86 style
  * I/O ports are mapped.
@@ -561,27 +556,7 @@ static void __init bootcmdline_init(void)
 {
 	bool dt_bootargs = false;
 
-	/*
-	 * If CMDLINE_OVERRIDE is enabled then initializing the command line is
-	 * trivial - we simply use the built-in command line unconditionally &
-	 * unmodified.
-	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
-		strscpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-		return;
-	}
-
-	/*
-	 * If the user specified a built-in command line &
-	 * MIPS_CMDLINE_BUILTIN_EXTEND, then the built-in command line is
-	 * prepended to arguments from the bootloader or DT so we'll copy them
-	 * to the start of boot_command_line here. Otherwise, empty
-	 * boot_command_line to undo anything early_init_dt_scan_chosen() did.
-	 */
-	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
-		strscpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	else
-		boot_command_line[0] = 0;
+	boot_command_line[0] = 0;
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
 	/*
@@ -604,12 +579,9 @@ static void __init bootcmdline_init(void)
 		bootcmdline_append(arcs_cmdline, COMMAND_LINE_SIZE);
 
 	/*
-	 * If the user specified a built-in command line & we didn't already
-	 * prepend it, we append it to boot_command_line here.
+	 * Use the generic system for builtin prepend and append.
 	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) &&
-	    !IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
-		bootcmdline_append(builtin_cmdline, COMMAND_LINE_SIZE);
+	cmdline_add_builtin(boot_command_line);
 }
 
 /*
diff --git a/arch/mips/pic32/pic32mzda/early_console.c b/arch/mips/pic32/pic32mzda/early_console.c
index 3cd1b408fa1c..f14bc1846706 100644
--- a/arch/mips/pic32/pic32mzda/early_console.c
+++ b/arch/mips/pic32/pic32mzda/early_console.c
@@ -76,7 +76,7 @@ static char * __init pic32_getcmdline(void)
 	 * command line setup if using CONFIG_CMDLINE_BOOL.
 	 */
 #ifdef CONFIG_CMDLINE_OVERRIDE
-	return CONFIG_CMDLINE;
+	return CMDLINE_STATIC_PREPEND " " CMDLINE_STATIC_APPEND;
 #else
 	return fw_getcmdline();
 #endif
diff --git a/arch/mips/pic32/pic32mzda/init.c b/arch/mips/pic32/pic32mzda/init.c
index 53b227a9074c..ba2524255857 100644
--- a/arch/mips/pic32/pic32mzda/init.c
+++ b/arch/mips/pic32/pic32mzda/init.c
@@ -9,6 +9,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/platform_data/sdhci-pic32.h>
+#include <linux/cmdline.h>
 
 #include <asm/fw/fw.h>
 #include <asm/mips-boards/generic.h>
@@ -41,7 +42,7 @@ void __init plat_mem_setup(void)
 	pr_info(" boot_command_line: %s\n", boot_command_line);
 	pr_info(" arcs_cmdline     : %s\n", arcs_cmdline);
 #ifdef CONFIG_CMDLINE_BOOL
-	pr_info(" builtin_cmdline  : %s\n", CONFIG_CMDLINE);
+	pr_info(" builtin_cmdline  : %s\n", CMDLINE_STATIC_PREPEND " " CMDLINE_STATIC_APPEND);
 #endif
 	if (dtb != __dtb_start)
 		strscpy(arcs_cmdline, boot_command_line, COMMAND_LINE_SIZE);
-- 
2.39.2

