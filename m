Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA6991BE4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 14:16:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e1BuBMpB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9ZDW5YKsz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 22:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e1BuBMpB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9Z7F5Xjkz3cbX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 22:12:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719576724;
	bh=WYT0khtgzRzNinKxDCwOcJb1fcM3qP/glbbACC98xr4=;
	h=From:To:Subject:Date:From;
	b=e1BuBMpBCc+yONnbRb5QwVj9acwFKKpD75Ahknv33nvFkl7QhRe9VLpww2gJKjjTc
	 Vo5SI2H4YqCO7QcixlOL/t6S7Ua0CKpb2ykgepk76zMIaiO3RqjZOVsuhE9OlZcsXv
	 yLraN093C7X8z/xbVeIszX6qEW1dvjrkg0G8mTw2ROSIEMMDiCktiwtfdjb3gANjFi
	 OelnnT8Pg9MVbx2y8bOt6H4UCBhS9wXcQZ8wISX79rxaecq8Ttee0rBh7lCgrvdl5S
	 QBVmTXwdWK4c6cXGa+8q0MgiYlZE55/nIS5sayrmVpb5rLiEKaXG+PoENqEgFH2pFg
	 DEpIWQMbVUCJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9Z776chGz4wbh;
	Fri, 28 Jun 2024 22:12:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 1/7] powerpc/40x: Remove 40x platforms.
Date: Fri, 28 Jun 2024 22:11:55 +1000
Message-ID: <20240628121201.130802-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

40x platforms have been orphaned for many years.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS                                 |  1 -
 arch/powerpc/configs/40x/acadia_defconfig   | 61 ----------------
 arch/powerpc/configs/40x/kilauea_defconfig  | 69 ------------------
 arch/powerpc/configs/40x/klondike_defconfig | 43 ------------
 arch/powerpc/configs/40x/makalu_defconfig   | 59 ----------------
 arch/powerpc/configs/40x/obs600_defconfig   | 69 ------------------
 arch/powerpc/configs/40x/walnut_defconfig   | 55 ---------------
 arch/powerpc/configs/ppc40x_defconfig       | 74 -------------------
 arch/powerpc/platforms/40x/Kconfig          | 78 ---------------------
 arch/powerpc/platforms/40x/Makefile         |  2 -
 arch/powerpc/platforms/40x/ppc40x_simple.c  | 74 -------------------
 arch/powerpc/platforms/Kconfig              |  1 -
 arch/powerpc/platforms/Makefile             |  1 -
 13 files changed, 587 deletions(-)
 delete mode 100644 arch/powerpc/configs/40x/acadia_defconfig
 delete mode 100644 arch/powerpc/configs/40x/kilauea_defconfig
 delete mode 100644 arch/powerpc/configs/40x/klondike_defconfig
 delete mode 100644 arch/powerpc/configs/40x/makalu_defconfig
 delete mode 100644 arch/powerpc/configs/40x/obs600_defconfig
 delete mode 100644 arch/powerpc/configs/40x/walnut_defconfig
 delete mode 100644 arch/powerpc/configs/ppc40x_defconfig
 delete mode 100644 arch/powerpc/platforms/40x/Kconfig
 delete mode 100644 arch/powerpc/platforms/40x/Makefile
 delete mode 100644 arch/powerpc/platforms/40x/ppc40x_simple.c

v3: Unchanged.

diff --git a/MAINTAINERS b/MAINTAINERS
index 8754ac2c259d..0f1731947cd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12755,7 +12755,6 @@ F:	arch/powerpc/platforms/52xx/
 LINUX FOR POWERPC EMBEDDED PPC4XX
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Orphan
-F:	arch/powerpc/platforms/40x/
 F:	arch/powerpc/platforms/44x/
 
 LINUX FOR POWERPC EMBEDDED PPC85XX
diff --git a/arch/powerpc/configs/40x/acadia_defconfig b/arch/powerpc/configs/40x/acadia_defconfig
deleted file mode 100644
index 25eed86ec528..000000000000
--- a/arch/powerpc/configs/40x/acadia_defconfig
+++ /dev/null
@@ -1,61 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_ACADIA=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=m
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-CONFIG_IBM_EMAC_RXB=256
-CONFIG_IBM_EMAC_TXB=256
-CONFIG_IBM_EMAC_DEBUG=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_THERMAL=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/configs/40x/kilauea_defconfig b/arch/powerpc/configs/40x/kilauea_defconfig
deleted file mode 100644
index 3549c9e950e8..000000000000
--- a/arch/powerpc/configs/40x/kilauea_defconfig
+++ /dev/null
@@ -1,69 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_KILAUEA=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_NDFC=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-CONFIG_IBM_EMAC_RXB=256
-CONFIG_IBM_EMAC_TXB=256
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_IBM_IIC=y
-CONFIG_SENSORS_LM75=y
-CONFIG_THERMAL=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_DS1307=y
-CONFIG_EXT2_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/configs/40x/klondike_defconfig b/arch/powerpc/configs/40x/klondike_defconfig
deleted file mode 100644
index a974d1e945cc..000000000000
--- a/arch/powerpc/configs/40x/klondike_defconfig
+++ /dev/null
@@ -1,43 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_APM8018X=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_MATH_EMULATION=y
-# CONFIG_SUSPEND is not set
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_SAS_ATTRS=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-# CONFIG_UNIX98_PTYS is not set
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
-# CONFIG_IOMMU_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_BUGVERBOSE is not set
-# CONFIG_FTRACE is not set
diff --git a/arch/powerpc/configs/40x/makalu_defconfig b/arch/powerpc/configs/40x/makalu_defconfig
deleted file mode 100644
index 4563f88acf0c..000000000000
--- a/arch/powerpc/configs/40x/makalu_defconfig
+++ /dev/null
@@ -1,59 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_MAKALU=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=m
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-CONFIG_IBM_EMAC_RXB=256
-CONFIG_IBM_EMAC_TXB=256
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_THERMAL=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/configs/40x/obs600_defconfig b/arch/powerpc/configs/40x/obs600_defconfig
deleted file mode 100644
index 2a2bb3f46847..000000000000
--- a/arch/powerpc/configs/40x/obs600_defconfig
+++ /dev/null
@@ -1,69 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_OBS600=y
-CONFIG_MATH_EMULATION=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_NDFC=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-CONFIG_IBM_EMAC_RXB=256
-CONFIG_IBM_EMAC_TXB=256
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_IBM_IIC=y
-CONFIG_SENSORS_LM75=y
-CONFIG_THERMAL=y
-# CONFIG_USB_SUPPORT is not set
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_DS1307=y
-CONFIG_EXT2_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/configs/40x/walnut_defconfig b/arch/powerpc/configs/40x/walnut_defconfig
deleted file mode 100644
index 9eaaf1a1d2c6..000000000000
--- a/arch/powerpc/configs/40x/walnut_defconfig
+++ /dev/null
@@ -1,55 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=m
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_THERMAL=y
-CONFIG_EXT2_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/configs/ppc40x_defconfig b/arch/powerpc/configs/ppc40x_defconfig
deleted file mode 100644
index 7e48693775f4..000000000000
--- a/arch/powerpc/configs/ppc40x_defconfig
+++ /dev/null
@@ -1,74 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PPC4xx_GPIO=y
-CONFIG_ACADIA=y
-CONFIG_HOTFOOT=y
-CONFIG_KILAUEA=y
-CONFIG_MAKALU=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_CONNECTOR=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=m
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_UBI=m
-CONFIG_MTD_UBI_GLUEBI=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=35000
-CONFIG_NETDEVICES=y
-CONFIG_IBM_EMAC=y
-# CONFIG_INPUT is not set
-CONFIG_SERIO=m
-# CONFIG_SERIO_I8042 is not set
-# CONFIG_SERIO_SERPORT is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=m
-CONFIG_I2C_CHARDEV=m
-CONFIG_I2C_GPIO=m
-CONFIG_I2C_IBM_IIC=m
-# CONFIG_HWMON is not set
-CONFIG_THERMAL=y
-CONFIG_FB=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=m
-CONFIG_UBIFS_FS=m
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_ECB=y
-CONFIG_CRYPTO_PCBC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
deleted file mode 100644
index b3c466c50535..000000000000
--- a/arch/powerpc/platforms/40x/Kconfig
+++ /dev/null
@@ -1,78 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config ACADIA
-	bool "Acadia"
-	depends on 40x
-	select PPC40x_SIMPLE
-	select 405EZ
-	help
-	  This option enables support for the AMCC 405EZ Acadia evaluation board.
-
-config HOTFOOT
-	bool "Hotfoot"
-	depends on 40x
-	select PPC40x_SIMPLE
-	select FORCE_PCI
-	help
-	  This option enables support for the ESTEEM 195E Hotfoot board.
-
-config KILAUEA
-	bool "Kilauea"
-	depends on 40x
-	select 405EX
-	select PPC40x_SIMPLE
-	select PPC4xx_PCI_EXPRESS
-	select FORCE_PCI
-	select PCI_MSI
-	help
-	  This option enables support for the AMCC PPC405EX evaluation board.
-
-config MAKALU
-	bool "Makalu"
-	depends on 40x
-	select 405EX
-	select FORCE_PCI
-	select PPC4xx_PCI_EXPRESS
-	select PPC40x_SIMPLE
-	help
-	  This option enables support for the AMCC PPC405EX board.
-
-config OBS600
-	bool "OpenBlockS 600"
-	depends on 40x
-	select 405EX
-	select PPC40x_SIMPLE
-	help
-	  This option enables support for PlatHome OpenBlockS 600 server
-
-config PPC40x_SIMPLE
-	bool "Simple PowerPC 40x board support"
-	depends on 40x
-	help
-	  This option enables the simple PowerPC 40x platform support.
-
-config 405EX
-	bool
-	select IBM_EMAC_EMAC4 if IBM_EMAC
-	select IBM_EMAC_RGMII if IBM_EMAC
-
-config 405EZ
-	bool
-	select IBM_EMAC_NO_FLOW_CTRL if IBM_EMAC
-	select IBM_EMAC_MAL_CLR_ICINTSTAT if IBM_EMAC
-	select IBM_EMAC_MAL_COMMON_ERR if IBM_EMAC
-
-config PPC4xx_GPIO
-	bool "PPC4xx GPIO support"
-	depends on 40x
-	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
-	help
-	  Enable gpiolib support for ppc40x based boards
-
-config APM8018X
-	bool "APM8018X"
-	depends on 40x
-	select PPC40x_SIMPLE
-	help
-	  This option enables support for the AppliedMicro APM8018X evaluation
-	  board.
diff --git a/arch/powerpc/platforms/40x/Makefile b/arch/powerpc/platforms/40x/Makefile
deleted file mode 100644
index 122de98527c4..000000000000
--- a/arch/powerpc/platforms/40x/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_PPC40x_SIMPLE)		+= ppc40x_simple.o
diff --git a/arch/powerpc/platforms/40x/ppc40x_simple.c b/arch/powerpc/platforms/40x/ppc40x_simple.c
deleted file mode 100644
index 294ab2728588..000000000000
--- a/arch/powerpc/platforms/40x/ppc40x_simple.c
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Generic PowerPC 40x platform support
- *
- * Copyright 2008 IBM Corporation
- *
- * This implements simple platform support for PowerPC 44x chips.  This is
- * mostly used for eval boards or other simple and "generic" 44x boards.  If
- * your board has custom functions or hardware, then you will likely want to
- * implement your own board.c file to accommodate it.
- */
-
-#include <asm/machdep.h>
-#include <asm/pci-bridge.h>
-#include <asm/ppc4xx.h>
-#include <asm/time.h>
-#include <asm/udbg.h>
-#include <asm/uic.h>
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-
-static const struct of_device_id ppc40x_of_bus[] __initconst = {
-	{ .compatible = "ibm,plb3", },
-	{ .compatible = "ibm,plb4", },
-	{ .compatible = "ibm,opb", },
-	{ .compatible = "ibm,ebc", },
-	{ .compatible = "simple-bus", },
-	{},
-};
-
-static int __init ppc40x_device_probe(void)
-{
-	of_platform_bus_probe(NULL, ppc40x_of_bus, NULL);
-
-	return 0;
-}
-machine_device_initcall(ppc40x_simple, ppc40x_device_probe);
-
-/* This is the list of boards that can be supported by this simple
- * platform code.  This does _not_ mean the boards are compatible,
- * as they most certainly are not from a device tree perspective.
- * However, their differences are handled by the device tree and the
- * drivers and therefore they don't need custom board support files.
- *
- * Again, if your board needs to do things differently then create a
- * board.c file for it rather than adding it to this list.
- */
-static const char * const board[] __initconst = {
-	"amcc,acadia",
-	"amcc,haleakala",
-	"amcc,kilauea",
-	"amcc,makalu",
-	"apm,klondike",
-	"est,hotfoot",
-	"plathome,obs600",
-	NULL
-};
-
-static int __init ppc40x_probe(void)
-{
-	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-	return 1;
-}
-
-define_machine(ppc40x_simple) {
-	.name = "PowerPC 40x Platform",
-	.compatibles = board,
-	.probe = ppc40x_probe,
-	.progress = udbg_progress,
-	.init_IRQ = uic_init_tree,
-	.get_irq = uic_get_irq,
-	.restart = ppc4xx_reset_system,
-};
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 1fd253f92a77..1112a5831619 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -18,7 +18,6 @@ source "arch/powerpc/platforms/85xx/Kconfig"
 source "arch/powerpc/platforms/86xx/Kconfig"
 source "arch/powerpc/platforms/embedded6xx/Kconfig"
 source "arch/powerpc/platforms/44x/Kconfig"
-source "arch/powerpc/platforms/40x/Kconfig"
 source "arch/powerpc/platforms/amigaone/Kconfig"
 source "arch/powerpc/platforms/book3s/Kconfig"
 source "arch/powerpc/platforms/microwatt/Kconfig"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 94470fb27c99..d1a417b301b6 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -5,7 +5,6 @@ obj-$(CONFIG_FSL_ULI1575)	+= fsl_uli1575.o
 obj-$(CONFIG_PPC_PMAC)		+= powermac/
 obj-$(CONFIG_PPC_CHRP)		+= chrp/
 obj-$(CONFIG_4xx)		+= 4xx/
-obj-$(CONFIG_40x)		+= 40x/
 obj-$(CONFIG_44x)		+= 44x/
 obj-$(CONFIG_PPC_MPC512x)	+= 512x/
 obj-$(CONFIG_PPC_MPC52xx)	+= 52xx/
-- 
2.45.2

