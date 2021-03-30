Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3334F05C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 19:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xzP4H9wz3c8f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 04:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=igPWng3g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.72; helo=rcdn-iport-1.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=igPWng3g; dkim-atps=neutral
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xwt5SbSz3bqm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 04:57:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=31637; q=dns/txt;
 s=iport; t=1617127038; x=1618336638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xjwCQ5P9bZZohvZETFcBmvRuV24kIqsHd6Gw1Nlfczk=;
 b=igPWng3g7cWQNiADa5Mv3z5CTY/zu6FqNfBonY5kmZDYQ0emverMnYf8
 Aus5H6s0s7OBamsefhgNh/ZWaftdNRgtAnWjkcYrG8q9R6rN0P7NiTZaT
 4e0jwMoIWFbk3O0fn2GeE2VHzO81bYkbqJ/mMK4QHwOIAE5wYzv9Hod8h 4=;
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="869756239"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 17:57:17 +0000
Received: from zorba.cisco.com ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CI024502;
 Tue, 30 Mar 2021 17:57:16 GMT
From: Daniel Walker <danielwa@cisco.com>
To: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 5/8] CMDLINE: mips: convert to generic builtin command line
Date: Tue, 30 Mar 2021 10:57:00 -0700
Message-Id: <ee6b727a83a936c521d7d746669726e22ab8b642.1617126961.git.danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
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
Cc: Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This updates the mips code to use the CONFIG_GENERIC_CMDLINE
option.

This deletes the option for MIPS_CMDLINE_BUILTIN_EXTEND
and replaces the functionality with generic code.

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
 arch/mips/Kconfig                      |  4 +--
 arch/mips/Kconfig.debug                | 44 --------------------------
 arch/mips/configs/ar7_defconfig        |  9 ++----
 arch/mips/configs/bcm47xx_defconfig    |  8 ++---
 arch/mips/configs/bcm63xx_defconfig    | 15 +++------
 arch/mips/configs/bmips_be_defconfig   | 11 +++----
 arch/mips/configs/bmips_stb_defconfig  | 11 +++----
 arch/mips/configs/capcella_defconfig   | 11 ++-----
 arch/mips/configs/ci20_defconfig       | 10 +++---
 arch/mips/configs/cu1000-neo_defconfig | 10 +++---
 arch/mips/configs/cu1830-neo_defconfig | 10 +++---
 arch/mips/configs/e55_defconfig        |  4 +--
 arch/mips/configs/generic_defconfig    |  6 ++--
 arch/mips/configs/gpr_defconfig        | 18 ++---------
 arch/mips/configs/loongson3_defconfig  | 13 ++------
 arch/mips/configs/mpc30x_defconfig     |  7 ++--
 arch/mips/configs/tb0219_defconfig     |  7 ++--
 arch/mips/configs/tb0226_defconfig     |  7 ++--
 arch/mips/configs/tb0287_defconfig     |  7 ++--
 arch/mips/configs/workpad_defconfig    | 11 +++----
 arch/mips/kernel/setup.c               | 36 +++------------------
 21 files changed, 59 insertions(+), 200 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..0e753894d28d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -24,6 +24,7 @@ config MIPS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
@@ -3212,9 +3213,6 @@ choice
 	config MIPS_CMDLINE_FROM_BOOTLOADER
 		bool "Bootloader kernel arguments if available"
 
-	config MIPS_CMDLINE_BUILTIN_EXTEND
-		depends on CMDLINE_BOOL
-		bool "Extend builtin kernel arguments with bootloader arguments"
 endchoice
 
 endmenu
diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 7a8d94cdd493..b5a099c74eb6 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -30,50 +30,6 @@ config EARLY_PRINTK_8250
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
index cf9c6329b807..c09470aa672f 100644
--- a/arch/mips/configs/ar7_defconfig
+++ b/arch/mips/configs/ar7_defconfig
@@ -12,6 +12,8 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="rootfstype=squashfs,jffs2"
 CONFIG_AR7=y
 CONFIG_HZ_100=y
 CONFIG_KEXEC=y
@@ -32,9 +34,6 @@ CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_MROUTE=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_TCP_CONG_ADVANCED=y
 # CONFIG_TCP_CONG_BIC is not set
@@ -43,7 +42,6 @@ CONFIG_TCP_CONG_WESTWOOD=y
 # CONFIG_TCP_CONG_HTCP is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
-# CONFIG_BRIDGE_NETFILTER is not set
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_MARK=y
 CONFIG_NF_CONNTRACK_FTP=m
@@ -117,8 +115,5 @@ CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
 CONFIG_SQUASHFS=y
 # CONFIG_CRYPTO_HW is not set
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="rootfstype=squashfs,jffs2"
diff --git a/arch/mips/configs/bcm47xx_defconfig b/arch/mips/configs/bcm47xx_defconfig
index 91ce75edbfb4..69a965bb2dd9 100644
--- a/arch/mips/configs/bcm47xx_defconfig
+++ b/arch/mips/configs/bcm47xx_defconfig
@@ -4,8 +4,9 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyS0,115200"
 CONFIG_BCM47XX=y
-CONFIG_PCI=y
 # CONFIG_SUSPEND is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -32,6 +33,7 @@ CONFIG_NET_SCH_FQ_CODEL=y
 CONFIG_HAMRADIO=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
+CONFIG_PCI=y
 CONFIG_MTD=y
 CONFIG_MTD_BCM47XX_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -75,7 +77,5 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200"
+CONFIG_DEBUG_FS=y
diff --git a/arch/mips/configs/bcm63xx_defconfig b/arch/mips/configs/bcm63xx_defconfig
index 861f680184b9..6791e48b2d7d 100644
--- a/arch/mips/configs/bcm63xx_defconfig
+++ b/arch/mips/configs/bcm63xx_defconfig
@@ -11,27 +11,26 @@ CONFIG_EXPERT=y
 # CONFIG_AIO is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_SLUB_DEBUG is not set
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
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_NET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
 CONFIG_MAC80211=y
+CONFIG_PCI=y
+CONFIG_PCCARD=y
+CONFIG_PCMCIA_BCM63XX=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_MTD=y
@@ -50,8 +49,6 @@ CONFIG_B43=y
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 # CONFIG_UNIX98_PTYS is not set
-CONFIG_SERIAL_BCM63XX=y
-CONFIG_SERIAL_BCM63XX_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 # CONFIG_VGA_ARB is not set
@@ -65,5 +62,3 @@ CONFIG_PROC_KCORE=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 # CONFIG_CRYPTO_HW is not set
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200"
diff --git a/arch/mips/configs/bmips_be_defconfig b/arch/mips/configs/bmips_be_defconfig
index 032bb51defe8..ae1c4adf8d98 100644
--- a/arch/mips/configs/bmips_be_defconfig
+++ b/arch/mips/configs/bmips_be_defconfig
@@ -5,21 +5,20 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_SLUB_DEBUG is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon"
 CONFIG_BMIPS_GENERIC=y
 CONFIG_HIGHMEM=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=4
-# CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
+# CONFIG_SECCOMP is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
@@ -73,7 +72,5 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon"
+CONFIG_DEBUG_FS=y
diff --git a/arch/mips/configs/bmips_stb_defconfig b/arch/mips/configs/bmips_stb_defconfig
index 625bd2d7e685..cb3b114b10d0 100644
--- a/arch/mips/configs/bmips_stb_defconfig
+++ b/arch/mips/configs/bmips_stb_defconfig
@@ -5,12 +5,13 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_SLUB_DEBUG is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon"
 CONFIG_BMIPS_GENERIC=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_HIGHMEM=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=4
-# CONFIG_SECCOMP is not set
 CONFIG_MIPS_O32_FP64_SUPPORT=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
@@ -20,15 +21,13 @@ CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_BMIPS_CPUFREQ=y
+# CONFIG_SECCOMP is not set
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_CFG80211=y
 CONFIG_NL80211_TESTMODE=y
@@ -84,7 +83,5 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 # CONFIG_CRYPTO_HW is not set
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon"
+CONFIG_DEBUG_FS=y
diff --git a/arch/mips/configs/capcella_defconfig b/arch/mips/configs/capcella_defconfig
index 7bf8971af53b..a8b87cccfade 100644
--- a/arch/mips/configs/capcella_defconfig
+++ b/arch/mips/configs/capcella_defconfig
@@ -2,6 +2,8 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="mem=32M console=ttyVR0,38400"
 CONFIG_MACH_VR41XX=y
 CONFIG_ZAO_CAPCELLA=y
 CONFIG_MODULES=y
@@ -20,9 +22,6 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
 CONFIG_TCP_MD5SIG=y
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
@@ -73,19 +72,13 @@ CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_ARC4=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
 CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="mem=32M console=ttyVR0,38400"
diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index ab7ebb066834..28e72ae87ca9 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,12 +22,14 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon console=ttyS4,115200 clk_ignore_unused"
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
-# CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+# CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
@@ -99,12 +101,12 @@ CONFIG_IR_GPIO_CIR=m
 CONFIG_IR_GPIO_TX=m
 CONFIG_MEDIA_SUPPORT=m
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_CH341=y
+CONFIG_JZ4770_PHY=y
 CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
@@ -138,7 +140,6 @@ CONFIG_JZ4780_NEMC=y
 CONFIG_PWM=y
 CONFIG_PWM_JZ4740=m
 CONFIG_JZ4780_EFUSE=y
-CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -151,7 +152,6 @@ CONFIG_CONFIGFS_FS=y
 CONFIG_UBIFS_FS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
-CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_737=y
 CONFIG_NLS_CODEPAGE_775=y
@@ -203,5 +203,3 @@ CONFIG_PANIC_TIMEOUT=10
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon console=ttyS4,115200 clk_ignore_unused"
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 9d75f5b77d5d..e54e708783d9 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -19,12 +19,14 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
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
 # CONFIG_COMPACTION is not set
@@ -67,12 +69,12 @@ CONFIG_SENSORS_ADS7828=m
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_CH341=y
+CONFIG_JZ4770_PHY=y
 CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
@@ -87,7 +89,6 @@ CONFIG_DMA_JZ4780=y
 # CONFIG_INGENIC_TIMER is not set
 CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -98,7 +99,6 @@ CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_NFS_FS=y
-CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_CODEPAGE_950=y
@@ -123,5 +123,3 @@ CONFIG_PANIC_TIMEOUT=10
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon clk_ignore_unused"
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index 29decd0003c6..06267749acc9 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -19,12 +19,14 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
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
 # CONFIG_COMPACTION is not set
@@ -70,12 +72,12 @@ CONFIG_SENSORS_ADS7828=m
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_CH341=y
+CONFIG_JZ4770_PHY=y
 CONFIG_USB_GADGET=y
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
@@ -90,7 +92,6 @@ CONFIG_DMA_JZ4780=y
 # CONFIG_INGENIC_TIMER is not set
 CONFIG_INGENIC_SYSOST=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_JZ4770_PHY=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -101,7 +102,6 @@ CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_NFS_FS=y
-CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_936=y
 CONFIG_NLS_CODEPAGE_950=y
@@ -126,5 +126,3 @@ CONFIG_PANIC_TIMEOUT=10
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon clk_ignore_unused"
diff --git a/arch/mips/configs/e55_defconfig b/arch/mips/configs/e55_defconfig
index fd82b858a8f0..19769d645fcb 100644
--- a/arch/mips/configs/e55_defconfig
+++ b/arch/mips/configs/e55_defconfig
@@ -2,6 +2,8 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyVR0,19200 ide0=0x1f0,0x3f6,40 mem=8M"
 CONFIG_MACH_VR41XX=y
 CONFIG_CASIO_E55=y
 CONFIG_MODULES=y
@@ -33,5 +35,3 @@ CONFIG_AUTOFS4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyVR0,19200 ide0=0x1f0,0x3f6,40 mem=8M"
diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index 714169e411cf..665ae8d63ef3 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -3,7 +3,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
 CONFIG_RT_GROUP_SCHED=y
@@ -21,6 +20,8 @@ CONFIG_USERFAULTFD=y
 CONFIG_EMBEDDED=y
 # CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="earlycon"
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_MIPS_CPS=y
 CONFIG_HIGHMEM=y
@@ -52,7 +53,6 @@ CONFIG_HID_CHICONY=y
 CONFIG_HID_CYPRESS=y
 CONFIG_HID_EZKEY=y
 CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 # CONFIG_MIPS_PLATFORM_DEVICES is not set
@@ -88,5 +88,3 @@ CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon"
diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index 5cb91509bb7c..cb642d14dd93 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -10,9 +10,10 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyS0,115200 root=/dev/nfs rw ip=auto"
 CONFIG_MIPS_ALCHEMY=y
 CONFIG_MIPS_GPR=y
-CONFIG_PCI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
@@ -29,9 +30,6 @@ CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
 CONFIG_NETFILTER=y
@@ -49,7 +47,6 @@ CONFIG_NETFILTER_XT_MATCH_LIMIT=m
 CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_MARK=m
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
-CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
 CONFIG_NETFILTER_XT_MATCH_QUOTA=m
 CONFIG_NETFILTER_XT_MATCH_REALM=m
@@ -151,6 +148,7 @@ CONFIG_BAYCOM_SER_HDX=m
 CONFIG_YAM=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
+CONFIG_PCI=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
@@ -225,9 +223,6 @@ CONFIG_HDLC_X25=m
 CONFIG_PCI200SYN=m
 CONFIG_WANXL=m
 CONFIG_FARSYNC=m
-CONFIG_DSCC4=m
-CONFIG_DSCC4_PCISYNC=y
-CONFIG_DSCC4_PCI_RST=y
 CONFIG_LAPBETHER=m
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -247,7 +242,6 @@ CONFIG_WATCHDOG_NOWAYOUT=y
 CONFIG_SSB=m
 CONFIG_SSB_DRIVER_PCICORE=y
 # CONFIG_VGA_ARB is not set
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_USB_HID=m
@@ -295,16 +289,10 @@ CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200 root=/dev/nfs rw ip=auto"
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 0e79f81217bc..f3b8c64ea379 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -13,7 +13,6 @@ CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
@@ -28,6 +27,8 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="ieee754=relaxed"
 CONFIG_MACH_LOONGSON64=y
 CONFIG_CPU_HAS_MSA=y
 CONFIG_NR_CPUS=16
@@ -39,7 +40,6 @@ CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
-CONFIG_KVM_MIPS_VZ=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
@@ -204,7 +204,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_DEC is not set
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
-# CONFIG_NET_VENDOR_HP is not set
 # CONFIG_NET_VENDOR_I825XX is not set
 CONFIG_E1000=y
 CONFIG_E1000E=y
@@ -246,7 +245,6 @@ CONFIG_PPP_ASYNC=m
 CONFIG_PPP_SYNC_TTY=m
 CONFIG_ATH9K=m
 CONFIG_HOSTAP=m
-CONFIG_INPUT_POLLDEV=m
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_MOUSEDEV_PSAUX=y
@@ -278,7 +276,6 @@ CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM93=m
 CONFIG_SENSORS_W83627HF=m
 CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
@@ -388,18 +385,14 @@ CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
 CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_CRYPTO_AUTHENC=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5=y
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
@@ -408,5 +401,3 @@ CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="ieee754=relaxed"
diff --git a/arch/mips/configs/mpc30x_defconfig b/arch/mips/configs/mpc30x_defconfig
index d4e038802510..925e71b9a9a7 100644
--- a/arch/mips/configs/mpc30x_defconfig
+++ b/arch/mips/configs/mpc30x_defconfig
@@ -3,6 +3,8 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="mem=32M console=ttyVR0,19200 ide0=0x170,0x376,73"
 CONFIG_MACH_VR41XX=y
 CONFIG_VICTOR_MPC30X=y
 CONFIG_MODULES=y
@@ -18,9 +20,6 @@ CONFIG_NET_KEY=y
 CONFIG_NET_KEY_MIGRATE=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
 CONFIG_CONNECTOR=m
@@ -49,5 +48,3 @@ CONFIG_AUTOFS4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_CONFIGFS_FS=m
 CONFIG_NFS_FS=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="mem=32M console=ttyVR0,19200 ide0=0x170,0x376,73"
diff --git a/arch/mips/configs/tb0219_defconfig b/arch/mips/configs/tb0219_defconfig
index 6547f84750b5..1d1bacd3eb2b 100644
--- a/arch/mips/configs/tb0219_defconfig
+++ b/arch/mips/configs/tb0219_defconfig
@@ -2,6 +2,8 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="cca=3 mem=64M console=ttyVR0,115200 ip=any root=/dev/nfs"
 CONFIG_MACH_VR41XX=y
 CONFIG_TANBAC_TB0219=y
 CONFIG_MODULES=y
@@ -23,9 +25,6 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_NET_IPIP=m
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
 CONFIG_BLK_DEV_LOOP=m
@@ -73,5 +72,3 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NFSD=y
 CONFIG_NFSD_V3=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="cca=3 mem=64M console=ttyVR0,115200 ip=any root=/dev/nfs"
diff --git a/arch/mips/configs/tb0226_defconfig b/arch/mips/configs/tb0226_defconfig
index 7e099f7c2286..072ac9fa92a7 100644
--- a/arch/mips/configs/tb0226_defconfig
+++ b/arch/mips/configs/tb0226_defconfig
@@ -2,6 +2,8 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="cca=3 mem=32M console=ttyVR0,115200"
 CONFIG_MACH_VR41XX=y
 CONFIG_TANBAC_TB0226=y
 CONFIG_MODULES=y
@@ -21,9 +23,6 @@ CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
 CONFIG_BLK_DEV_LOOP=m
@@ -68,5 +67,3 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NFSD=m
 CONFIG_NFSD_V3=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="cca=3 mem=32M console=ttyVR0,115200"
diff --git a/arch/mips/configs/tb0287_defconfig b/arch/mips/configs/tb0287_defconfig
index 0d881dd862c0..30b1b84fe46b 100644
--- a/arch/mips/configs/tb0287_defconfig
+++ b/arch/mips/configs/tb0287_defconfig
@@ -2,6 +2,8 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="cca=3 mem=64M console=ttyVR0,115200 ip=any root=/dev/nfs"
 CONFIG_MACH_VR41XX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -22,9 +24,6 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_NET_IPIP=m
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_BIC=y
 CONFIG_TCP_CONG_CUBIC=m
@@ -81,5 +80,3 @@ CONFIG_NFSD_V3=y
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="cca=3 mem=64M console=ttyVR0,115200 ip=any root=/dev/nfs"
diff --git a/arch/mips/configs/workpad_defconfig b/arch/mips/configs/workpad_defconfig
index 891a5f77305d..81bf360060a2 100644
--- a/arch/mips/configs/workpad_defconfig
+++ b/arch/mips/configs/workpad_defconfig
@@ -2,10 +2,10 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_SLAB=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_PREPEND="console=ttyVR0,19200 ide0=0x170,0x376,49 mem=16M"
 CONFIG_MACH_VR41XX=y
 CONFIG_IBM_WORKPAD=y
-CONFIG_PCCARD=y
-CONFIG_PCMCIA_VRC4171=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
@@ -20,11 +20,10 @@ CONFIG_NET_KEY=y
 CONFIG_NET_KEY_MIGRATE=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
+CONFIG_PCCARD=y
+CONFIG_PCMCIA_VRC4171=y
 CONFIG_BLK_DEV_RAM=m
 CONFIG_IDE=y
 CONFIG_BLK_DEV_IDECS=m
@@ -61,5 +60,3 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_NFS_FS=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V3=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyVR0,19200 ide0=0x170,0x376,49 mem=16M"
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 279be0153f8b..e4fcd9e5f65c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -23,6 +23,7 @@
 #include <linux/debugfs.h>
 #include <linux/kexec.h>
 #include <linux/sizes.h>
+#include <linux/cmdline.h>
 #include <linux/device.h>
 #include <linux/dma-map-ops.h>
 #include <linux/decompress/generic.h>
@@ -66,12 +67,6 @@ EXPORT_SYMBOL(mips_machtype);
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
@@ -546,27 +541,7 @@ static void __init bootcmdline_init(void)
 {
 	bool dt_bootargs = false;
 
-	/*
-	 * If CMDLINE_OVERRIDE is enabled then initializing the command line is
-	 * trivial - we simply use the built-in command line unconditionally &
-	 * unmodified.
-	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
-		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
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
-		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	else
-		boot_command_line[0] = 0;
+	boot_command_line[0] = 0;
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
 	/*
@@ -589,12 +564,9 @@ static void __init bootcmdline_init(void)
 		bootcmdline_append(arcs_cmdline, COMMAND_LINE_SIZE);
 
 	/*
-	 * If the user specified a built-in command line & we didn't already
-	 * prepend it, we append it to boot_command_line here.
+	 * Use the generic system for builtin prepend and append.
 	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) &&
-	    !IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
-		bootcmdline_append(builtin_cmdline, COMMAND_LINE_SIZE);
+	cmdline_add_builtin(boot_command_line, NULL, COMMAND_LINE_SIZE);
 }
 
 /*
-- 
2.25.1

