Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3169E887
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 20:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqZr3kTYz3cMf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 06:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=icpXWHGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=1416e03d26=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=icpXWHGQ;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLqYv61Jpz3c41
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 06:47:13 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LIqeGR007370;
	Tue, 21 Feb 2023 19:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=WadIPGdxkyZujLWzbW9EFKH6CiWu8A3CrNphG7+7trE=;
 b=icpXWHGQzVrbO7rNsLQSCgxsuLdQtfW3nTwamKKqs6vT3p6bhMuAWIrNqsHzoTmIZIfl
 DBeQ+g1lKXTzCgufUhk3qw+preY8cqvXlDM/P96L+Uu7a3Sxbr8HMpMAv3VHRKqSEgJU
 mIp8dLw15QKG/dSMmZsrl8fK9unxQE4HPk+SID5LUU4CcTqD9SMWwbw2+X9V7iIw6KQH
 f5m2HkHiTq6uj7++gj+rbq9W998e/V+0J0pBlf9RkH8ofMFCBhO60rMAEHjFYzqh5JZU
 KSXIjs6jac0HQLKR3/kWvGfpc0oMdCtsUYX+a0MFyN+zG2Gnn++6lPz9dcv9RovS3yfF FA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem319s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Feb 2023 19:46:59 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 21 Feb 2023 11:46:58 -0800
Received: from sc2600cp.wrs.com (128.224.56.77) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Feb 2023 11:46:57 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config fragments.
Date: Tue, 21 Feb 2023 14:46:37 -0500
Message-ID: <20230221194637.28436-5-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230221194637.28436-1-paul.gortmaker@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tSbQvZ54WaGt4LYc-0yAy4HkHfuj81XR
X-Proofpoint-GUID: tSbQvZ54WaGt4LYc-0yAy4HkHfuj81XR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210170
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

None of these have a reference anymore anywhere, such as like this:

  arch/powerpc/Makefile:  $(call merge_into_defconfig,mpc85xx_base.config,\

As such, we probably should just clean up and remove them.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/configs/85xx-32bit.config |   5 -
 arch/powerpc/configs/85xx-hw.config    | 139 -------------------------
 arch/powerpc/configs/85xx-smp.config   |   2 -
 3 files changed, 146 deletions(-)
 delete mode 100644 arch/powerpc/configs/85xx-32bit.config
 delete mode 100644 arch/powerpc/configs/85xx-hw.config
 delete mode 100644 arch/powerpc/configs/85xx-smp.config

diff --git a/arch/powerpc/configs/85xx-32bit.config b/arch/powerpc/configs/85xx-32bit.config
deleted file mode 100644
index 6b8894d727a2..000000000000
--- a/arch/powerpc/configs/85xx-32bit.config
+++ /dev/null
@@ -1,5 +0,0 @@
-CONFIG_HIGHMEM=y
-CONFIG_KEXEC=y
-CONFIG_PPC_85xx=y
-CONFIG_PROC_KCORE=y
-CONFIG_PHYS_64BIT=y
diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
deleted file mode 100644
index 524db76f47b7..000000000000
--- a/arch/powerpc/configs/85xx-hw.config
+++ /dev/null
@@ -1,139 +0,0 @@
-CONFIG_AQUANTIA_PHY=y
-CONFIG_AT803X_PHY=y
-CONFIG_ATA=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_BROADCOM_PHY=y
-CONFIG_C293_PCIE=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_CHR_DEV_ST=y
-CONFIG_CICADA_PHY=y
-CONFIG_CLK_QORIQ=y
-CONFIG_CRYPTO_DEV_FSL_CAAM=y
-CONFIG_CRYPTO_DEV_TALITOS=y
-CONFIG_DAVICOM_PHY=y
-CONFIG_DMADEVICES=y
-CONFIG_E1000E=y
-CONFIG_E1000=y
-CONFIG_EDAC=y
-CONFIG_EDAC_MPC85XX=y
-CONFIG_EEPROM_AT24=y
-CONFIG_EEPROM_LEGACY=y
-CONFIG_FB_FSL_DIU=y
-CONFIG_FS_ENET=y
-CONFIG_FSL_CORENET_CF=y
-CONFIG_FSL_DMA=y
-CONFIG_FSL_HV_MANAGER=y
-CONFIG_FSL_PQ_MDIO=y
-CONFIG_FSL_RIO=y
-CONFIG_FSL_XGMAC_MDIO=y
-CONFIG_GIANFAR=y
-CONFIG_GPIO_MPC8XXX=y
-CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
-CONFIG_HID_BELKIN=y
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-CONFIG_HID_CYPRESS=y
-CONFIG_HID_EZKEY=y
-CONFIG_HID_GYRATION=y
-CONFIG_HID_LOGITECH=y
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-CONFIG_HID_PANTHERLORD=y
-CONFIG_HID_PETALYNX=y
-CONFIG_HID_SAMSUNG=y
-CONFIG_HID_SUNPLUS=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_CPM=m
-CONFIG_I2C_MPC=y
-CONFIG_I2C_MUX_PCA954x=y
-CONFIG_I2C_MUX=y
-CONFIG_I2C=y
-CONFIG_IGB=y
-CONFIG_INPUT_FF_MEMLESS=m
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSEDEV is not set
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_MARVELL_PHY=y
-CONFIG_MDIO_BUS_MUX_GPIO=y
-CONFIG_MDIO_BUS_MUX_MMIOREG=y
-CONFIG_MMC_SDHCI_OF_ESDHC=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_NAND_FSL_ELBC=y
-CONFIG_MTD_NAND_FSL_IFC=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_PLATRAM=y
-CONFIG_MTD_SPI_NOR=y
-CONFIG_NETDEVICES=y
-CONFIG_NVRAM=y
-CONFIG_PATA_ALI=y
-CONFIG_PATA_SIL680=y
-CONFIG_PATA_VIA=y
-# CONFIG_PCIEASPM is not set
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_MSI=y
-CONFIG_PCI=y
-CONFIG_PPC_EPAPR_HV_BYTECHAN=y
-# CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
-CONFIG_QE_GPIO=y
-CONFIG_QUICC_ENGINE=y
-CONFIG_RAPIDIO=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_CMOS=y
-CONFIG_RTC_DRV_DS1307=y
-CONFIG_RTC_DRV_DS1374=y
-CONFIG_RTC_DRV_DS3232=y
-CONFIG_SATA_AHCI=y
-CONFIG_SATA_FSL=y
-CONFIG_SATA_SIL24=y
-CONFIG_SATA_SIL=y
-CONFIG_SCSI_LOGGING=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_SENSORS_INA2XX=y
-CONFIG_SENSORS_LM90=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_DETECT_IRQ=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_NR_UARTS=6
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_8250_RUNTIME_UARTS=6
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_QE=m
-CONFIG_SERIO_LIBPS2=y
-# CONFIG_SND_DRIVERS is not set
-CONFIG_SND_INTEL8X0=y
-CONFIG_SND_POWERPC_SOC=y
-# CONFIG_SND_PPC is not set
-CONFIG_SND_SOC=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
-# CONFIG_SND_USB is not set
-CONFIG_SND=y
-CONFIG_SOUND=y
-CONFIG_SPI_FSL_ESPI=y
-CONFIG_SPI_FSL_SPI=y
-CONFIG_SPI_GPIO=y
-CONFIG_SPI=y
-CONFIG_TERANETICS_PHY=y
-CONFIG_UCC_GETH=y
-CONFIG_USB_EHCI_FSL=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_HID=m
-CONFIG_USB_MON=y
-CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
-CONFIG_USB_OHCI_HCD_PPC_OF_LE=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_USB=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_VIRT_DRIVERS=y
-CONFIG_VITESSE_PHY=y
diff --git a/arch/powerpc/configs/85xx-smp.config b/arch/powerpc/configs/85xx-smp.config
deleted file mode 100644
index 3b4d1e54636d..000000000000
--- a/arch/powerpc/configs/85xx-smp.config
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_NR_CPUS=24
-CONFIG_SMP=y
-- 
2.17.1

