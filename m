Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E05198D88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 09:54:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s1n71sKFzDqxQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Fyi5wr8d; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s1h06McLzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 18:49:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s1gw4qyYz9v2XX;
 Tue, 31 Mar 2020 09:49:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Fyi5wr8d; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CNCdDnIdnnCq; Tue, 31 Mar 2020 09:49:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s1gw3Qdhz9v2CZ;
 Tue, 31 Mar 2020 09:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585640988; bh=AIZU6R0YplUM8yyu3ijKZuMdHMxdCB0YXbIQbZVffRg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Fyi5wr8du1GsWab7v54Xt0TNnhqjSxe9VzJtxaoWkrEYtJCUnEu+G9KT1TpFk532+
 stl5IpQAxqmls72KDskN1s4OD4qI0F9xoNqawY0iHM+ydDNvd8aWbaSCC41eg4NYr/
 4fvce8/O4QjX4cxG8cvq2+YJTjjDuSBWEGwUDqJA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 70F7F8B752;
 Tue, 31 Mar 2020 09:49:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 43yBhwcq8V6A; Tue, 31 Mar 2020 09:49:49 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E21518B787;
 Tue, 31 Mar 2020 09:49:48 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ADC6465678; Tue, 31 Mar 2020 07:49:48 +0000 (UTC)
Message-Id: <b9100ab09e482fb7a082cc7811384e0b5dea14b4.1585640941.git.christophe.leroy@c-s.fr>
In-Reply-To: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 03/11] powerpc/40x: Remove 40x platforms.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 31 Mar 2020 07:49:48 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

40x platforms have been orphaned for many years.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 MAINTAINERS                                 |   1 -
 arch/powerpc/configs/40x/acadia_defconfig   |  62 ----------
 arch/powerpc/configs/40x/ep405_defconfig    |  62 ----------
 arch/powerpc/configs/40x/kilauea_defconfig  |  70 -----------
 arch/powerpc/configs/40x/klondike_defconfig |  45 -------
 arch/powerpc/configs/40x/makalu_defconfig   |  60 ----------
 arch/powerpc/configs/40x/obs600_defconfig   |  70 -----------
 arch/powerpc/configs/40x/walnut_defconfig   |  55 ---------
 arch/powerpc/configs/ppc40x_defconfig       |  78 -------------
 arch/powerpc/platforms/40x/Kconfig          | 123 --------------------
 arch/powerpc/platforms/40x/Makefile         |   4 -
 arch/powerpc/platforms/40x/ep405.c          | 123 --------------------
 arch/powerpc/platforms/40x/ppc40x_simple.c  |  79 -------------
 arch/powerpc/platforms/40x/walnut.c         |  65 -----------
 arch/powerpc/platforms/Kconfig              |   1 -
 arch/powerpc/platforms/Makefile             |   1 -
 16 files changed, 899 deletions(-)
 delete mode 100644 arch/powerpc/configs/40x/acadia_defconfig
 delete mode 100644 arch/powerpc/configs/40x/ep405_defconfig
 delete mode 100644 arch/powerpc/configs/40x/kilauea_defconfig
 delete mode 100644 arch/powerpc/configs/40x/klondike_defconfig
 delete mode 100644 arch/powerpc/configs/40x/makalu_defconfig
 delete mode 100644 arch/powerpc/configs/40x/obs600_defconfig
 delete mode 100644 arch/powerpc/configs/40x/walnut_defconfig
 delete mode 100644 arch/powerpc/configs/ppc40x_defconfig
 delete mode 100644 arch/powerpc/platforms/40x/Kconfig
 delete mode 100644 arch/powerpc/platforms/40x/Makefile
 delete mode 100644 arch/powerpc/platforms/40x/ep405.c
 delete mode 100644 arch/powerpc/platforms/40x/ppc40x_simple.c
 delete mode 100644 arch/powerpc/platforms/40x/walnut.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 75e8aded73ce..cc133d70cf7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9649,7 +9649,6 @@ F:	arch/powerpc/platforms/52xx/
 LINUX FOR POWERPC EMBEDDED PPC4XX
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Orphan
-F:	arch/powerpc/platforms/40x/
 F:	arch/powerpc/platforms/44x/
 
 LINUX FOR POWERPC EMBEDDED PPC83XX AND PPC85XX
diff --git a/arch/powerpc/configs/40x/acadia_defconfig b/arch/powerpc/configs/40x/acadia_defconfig
deleted file mode 100644
index db93c117be36..000000000000
--- a/arch/powerpc/configs/40x/acadia_defconfig
+++ /dev/null
@@ -1,62 +0,0 @@
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
-# CONFIG_WALNUT is not set
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
diff --git a/arch/powerpc/configs/40x/ep405_defconfig b/arch/powerpc/configs/40x/ep405_defconfig
deleted file mode 100644
index a3854cf65f8d..000000000000
--- a/arch/powerpc/configs/40x/ep405_defconfig
+++ /dev/null
@@ -1,62 +0,0 @@
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
-CONFIG_EP405=y
-# CONFIG_WALNUT is not set
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
-CONFIG_USB=y
-CONFIG_USB_MON=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
-CONFIG_USB_OHCI_HCD_PPC_OF_LE=y
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
index edc22464dfb5..000000000000
--- a/arch/powerpc/configs/40x/kilauea_defconfig
+++ /dev/null
@@ -1,70 +0,0 @@
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
-# CONFIG_WALNUT is not set
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
index 579fa846839c..000000000000
--- a/arch/powerpc/configs/40x/klondike_defconfig
+++ /dev/null
@@ -1,45 +0,0 @@
-CONFIG_40x=y
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_WALNUT is not set
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
index 188789b9aa4c..000000000000
--- a/arch/powerpc/configs/40x/makalu_defconfig
+++ /dev/null
@@ -1,60 +0,0 @@
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
-# CONFIG_WALNUT is not set
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
index 5bf6af7ef093..000000000000
--- a/arch/powerpc/configs/40x/obs600_defconfig
+++ /dev/null
@@ -1,70 +0,0 @@
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
-# CONFIG_WALNUT is not set
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
index 88960a72b525..000000000000
--- a/arch/powerpc/configs/ppc40x_defconfig
+++ /dev/null
@@ -1,78 +0,0 @@
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
-CONFIG_EP405=y
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
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
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
index d06ca51e8443..000000000000
--- a/arch/powerpc/platforms/40x/Kconfig
+++ /dev/null
@@ -1,123 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config ACADIA
-	bool "Acadia"
-	depends on 40x
-	select PPC40x_SIMPLE
-	select 405EZ
-	help
-	  This option enables support for the AMCC 405EZ Acadia evaluation board.
-
-config EP405
-	bool "EP405/EP405PC"
-	depends on 40x
-	select 405GP
-	select FORCE_PCI
-	help
-	  This option enables support for the EP405/EP405PC boards.
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
-	select PPC4xx_MSI
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
-config WALNUT
-	bool "Walnut"
-	depends on 40x
-	default y
-	select 405GP
-	select FORCE_PCI
-	select OF_RTC
-	help
-	  This option enables support for the IBM PPC405GP evaluation board.
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
-# OAK doesn't exist but wanted to keep this around for any future 403GCX boards
-config 403GCX
-	bool
-	#depends on OAK
-	select IBM405_ERR51
-
-config 405GP
-	bool
-	select IBM405_ERR77
-	select IBM405_ERR51
-	select IBM_EMAC_ZMII if IBM_EMAC
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
-config STB03xxx
-	bool
-	select IBM405_ERR77
-	select IBM405_ERR51
-
-config PPC4xx_GPIO
-	bool "PPC4xx GPIO support"
-	depends on 40x
-	select GPIOLIB
-	help
-	  Enable gpiolib support for ppc40x based boards
-
-# 40x errata/workaround config symbols, selected by the CPU models above
-
-# All 405-based cores up until the 405GPR and 405EP have this errata.
-config IBM405_ERR77
-	bool
-
-# All 40x-based cores, up until the 405GPR and 405EP have this errata.
-config IBM405_ERR51
-	bool
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
index e9386deed505..000000000000
--- a/arch/powerpc/platforms/40x/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_WALNUT)				+= walnut.o
-obj-$(CONFIG_EP405)				+= ep405.o
-obj-$(CONFIG_PPC40x_SIMPLE)		+= ppc40x_simple.o
diff --git a/arch/powerpc/platforms/40x/ep405.c b/arch/powerpc/platforms/40x/ep405.c
deleted file mode 100644
index 1c8aec6e9bb7..000000000000
--- a/arch/powerpc/platforms/40x/ep405.c
+++ /dev/null
@@ -1,123 +0,0 @@
-/*
- * Architecture- / platform-specific boot-time initialization code for
- * IBM PowerPC 4xx based boards. Adapted from original
- * code by Gary Thomas, Cort Dougan <cort@fsmlabs.com>, and Dan Malek
- * <dan@net4x.com>.
- *
- * Copyright(c) 1999-2000 Grant Erickson <grant@lcse.umn.edu>
- *
- * Rewritten and ported to the merged powerpc tree:
- * Copyright 2007 IBM Corporation
- * Josh Boyer <jwboyer@linux.vnet.ibm.com>
- *
- * Adapted to EP405 by Ben. Herrenschmidt <benh@kernel.crashing.org>
- *
- * TODO: Wire up the PCI IRQ mux and the southbridge interrupts
- *
- * 2002 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- */
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-
-#include <asm/machdep.h>
-#include <asm/prom.h>
-#include <asm/udbg.h>
-#include <asm/time.h>
-#include <asm/uic.h>
-#include <asm/pci-bridge.h>
-#include <asm/ppc4xx.h>
-
-static struct device_node *bcsr_node;
-static void __iomem *bcsr_regs;
-
-/* BCSR registers  */
-#define BCSR_ID			0
-#define BCSR_PCI_CTRL	       	1
-#define BCSR_FLASH_NV_POR_CTRL	2
-#define BCSR_FENET_UART_CTRL	3
-#define BCSR_PCI_IRQ		4
-#define BCSR_XIRQ_SELECT	5
-#define BCSR_XIRQ_ROUTING	6
-#define BCSR_XIRQ_STATUS	7
-#define BCSR_XIRQ_STATUS2	8
-#define BCSR_SW_STAT_LED_CTRL	9
-#define BCSR_GPIO_IRQ_PAR_CTRL	10
-/* there's more, can't be bothered typing them tho */
-
-
-static const struct of_device_id ep405_of_bus[] __initconst = {
-	{ .compatible = "ibm,plb3", },
-	{ .compatible = "ibm,opb", },
-	{ .compatible = "ibm,ebc", },
-	{},
-};
-
-static int __init ep405_device_probe(void)
-{
-	of_platform_bus_probe(NULL, ep405_of_bus, NULL);
-
-	return 0;
-}
-machine_device_initcall(ep405, ep405_device_probe);
-
-static void __init ep405_init_bcsr(void)
-{
-	const u8 *irq_routing;
-	int i;
-
-	/* Find the bloody thing & map it */
-	bcsr_node = of_find_compatible_node(NULL, NULL, "ep405-bcsr");
-	if (bcsr_node == NULL) {
-		printk(KERN_ERR "EP405 BCSR not found !\n");
-		return;
-	}
-	bcsr_regs = of_iomap(bcsr_node, 0);
-	if (bcsr_regs == NULL) {
-		printk(KERN_ERR "EP405 BCSR failed to map !\n");
-		return;
-	}
-
-	/* Get the irq-routing property and apply the routing to the CPLD */
-	irq_routing = of_get_property(bcsr_node, "irq-routing", NULL);
-	if (irq_routing == NULL)
-		return;
-	for (i = 0; i < 16; i++) {
-		u8 irq = irq_routing[i];
-		out_8(bcsr_regs + BCSR_XIRQ_SELECT, i);
-		out_8(bcsr_regs + BCSR_XIRQ_ROUTING, irq);
-	}
-	in_8(bcsr_regs + BCSR_XIRQ_SELECT);
-	mb();
-	out_8(bcsr_regs + BCSR_GPIO_IRQ_PAR_CTRL, 0xfe);
-}
-
-static void __init ep405_setup_arch(void)
-{
-	/* Find & init the BCSR CPLD */
-	ep405_init_bcsr();
-
-	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-}
-
-static int __init ep405_probe(void)
-{
-	if (!of_machine_is_compatible("ep405"))
-		return 0;
-
-	return 1;
-}
-
-define_machine(ep405) {
-	.name			= "EP405",
-	.probe			= ep405_probe,
-	.setup_arch		= ep405_setup_arch,
-	.progress		= udbg_progress,
-	.init_IRQ		= uic_init_tree,
-	.get_irq		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
-};
diff --git a/arch/powerpc/platforms/40x/ppc40x_simple.c b/arch/powerpc/platforms/40x/ppc40x_simple.c
deleted file mode 100644
index e70b42729322..000000000000
--- a/arch/powerpc/platforms/40x/ppc40x_simple.c
+++ /dev/null
@@ -1,79 +0,0 @@
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
-#include <asm/prom.h>
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
-	if (of_device_compatible_match(of_root, board)) {
-		pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-		return 1;
-	}
-
-	return 0;
-}
-
-define_machine(ppc40x_simple) {
-	.name = "PowerPC 40x Platform",
-	.probe = ppc40x_probe,
-	.progress = udbg_progress,
-	.init_IRQ = uic_init_tree,
-	.get_irq = uic_get_irq,
-	.restart = ppc4xx_reset_system,
-	.calibrate_decr = generic_calibrate_decr,
-};
diff --git a/arch/powerpc/platforms/40x/walnut.c b/arch/powerpc/platforms/40x/walnut.c
deleted file mode 100644
index e5797815e2f1..000000000000
--- a/arch/powerpc/platforms/40x/walnut.c
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * Architecture- / platform-specific boot-time initialization code for
- * IBM PowerPC 4xx based boards. Adapted from original
- * code by Gary Thomas, Cort Dougan <cort@fsmlabs.com>, and Dan Malek
- * <dan@net4x.com>.
- *
- * Copyright(c) 1999-2000 Grant Erickson <grant@lcse.umn.edu>
- *
- * Rewritten and ported to the merged powerpc tree:
- * Copyright 2007 IBM Corporation
- * Josh Boyer <jwboyer@linux.vnet.ibm.com>
- *
- * 2002 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- */
-
-#include <linux/init.h>
-#include <linux/of_platform.h>
-#include <linux/rtc.h>
-
-#include <asm/machdep.h>
-#include <asm/prom.h>
-#include <asm/udbg.h>
-#include <asm/time.h>
-#include <asm/uic.h>
-#include <asm/pci-bridge.h>
-#include <asm/ppc4xx.h>
-
-static const struct of_device_id walnut_of_bus[] __initconst = {
-	{ .compatible = "ibm,plb3", },
-	{ .compatible = "ibm,opb", },
-	{ .compatible = "ibm,ebc", },
-	{},
-};
-
-static int __init walnut_device_probe(void)
-{
-	of_platform_bus_probe(NULL, walnut_of_bus, NULL);
-	of_instantiate_rtc();
-
-	return 0;
-}
-machine_device_initcall(walnut, walnut_device_probe);
-
-static int __init walnut_probe(void)
-{
-	if (!of_machine_is_compatible("ibm,walnut"))
-		return 0;
-
-	pci_set_flags(PCI_REASSIGN_ALL_RSRC);
-
-	return 1;
-}
-
-define_machine(walnut) {
-	.name			= "Walnut",
-	.probe			= walnut_probe,
-	.progress		= udbg_progress,
-	.init_IRQ		= uic_init_tree,
-	.get_irq		= uic_get_irq,
-	.restart		= ppc4xx_reset_system,
-	.calibrate_decr		= generic_calibrate_decr,
-};
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 5e6479d409a0..ec65c7ed5396 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -18,7 +18,6 @@ source "arch/powerpc/platforms/85xx/Kconfig"
 source "arch/powerpc/platforms/86xx/Kconfig"
 source "arch/powerpc/platforms/embedded6xx/Kconfig"
 source "arch/powerpc/platforms/44x/Kconfig"
-source "arch/powerpc/platforms/40x/Kconfig"
 source "arch/powerpc/platforms/amigaone/Kconfig"
 
 config KVM_GUEST
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 143d4417f6cc..cae14326bc49 100644
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
2.25.0

