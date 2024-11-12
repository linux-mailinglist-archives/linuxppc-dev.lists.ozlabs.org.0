Return-Path: <linuxppc-dev+bounces-3103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF39C50F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 09:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnfzM2YcVz2yDl;
	Tue, 12 Nov 2024 19:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731400911;
	cv=none; b=VpmaXfhzcfZrDHPKSw2NPINsla+/l14Veks6a2SZM0H5Wzwq62rmuAfO1WOzbJ7stVI7WPBPsMbfp5VAI+UZ8RwPDnxT6V6lR25S5NsP1TNRegBWcEsu+t1so48ZonoVtaFsn0wqlZYPw2vB5nF/XFkKU8S+Stlrc3BLuv+aKI0mO1+tmHOtm0ex71a9IJMyeI1agDpiorjzcmOAdFDu217FkLVmoCyS9964AhGDOseUBY+8qfUarifZ8C+AfTkJZLzWon5Oq5BU9AOUcCTNfeXEvZxyFcqX4H17HAJhDYFlYc7RHT3tyV9bBxW1/OIcXuHPZeqWMg6Z1hVPBjoNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731400911; c=relaxed/relaxed;
	bh=guofuncCx9LHvRciGxxQfxaRlHdEfqABn5ehxOafR68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZBgs+Q7kXEvyeRQNXMgwpG5aSy5MRU8UtL19/irlv4dsDUpoaqHRTLVHHkNum/Vsni2zElL1R+afTqXbWfXlz//8TW+juYJyM8HC72QmJesOC9q5OGnLNswQthAKisHoizkCkZii4TeIQg8vNypxR+wMISlXwKYLb7iSDKnG/+DxEYuwOJSlxC3Xoz3GNGw52UJ9lZFzzGRiZKYMQX7TquT75VM5UbEGz8IzCiThL5kuuBHGvE0zJ4bXp9n5lf83FIicjraIaE3whwdC0ppl1fHTNWRRE02DEVGqcw/UF047u4b+uLq0IogJ9cxZ83uvxSvWIUdnjs1TK5RkUhFSlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RYeybT8H; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RYeybT8H;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnfzK0wXrz2y8q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 19:41:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731400906;
	bh=guofuncCx9LHvRciGxxQfxaRlHdEfqABn5ehxOafR68=;
	h=From:To:Cc:Subject:Date:From;
	b=RYeybT8HXi34ZAZ3cLGxm6aBEQkMgW6jIAlBflqcU/s3x6a9uFYds6WvV1AZOi9r6
	 OwjZh641NGqLA5lN3OGXWV6J9Lu1OXqRme5K6zCwKuSZf/2LbfJo0aECVLE+se9pEH
	 r7AMuzR69+JeQ6LKSfdKhNuG6ni/hpPt0uehnDv9IVOQwh4yqVTQC4mMLAoXIRuJoi
	 j6TrCOPZmdhsJgVuyyxmuuDZP2kZyYHddO2jh7///ysevO+teKMqjAyT8vL3o59fxI
	 GpOywAd0A9iNo9EP0lds8U1exHpIOKA2KYLSl7j4ttI1EKj+MyXiXDJjYg6uZfbKeF
	 y4wH1G5wKA2dQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XnfzF2Ms9z4wyh;
	Tue, 12 Nov 2024 19:41:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linux-edac@vger.kernel.org
Cc: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>,
	bp@alien8.de,
	tony.luck@intel.com
Subject: [PATCH] EDAC/powerpc: Remove PPC_MAPLE drivers
Date: Tue, 12 Nov 2024 19:41:34 +1100
Message-ID: <20241112084134.411964-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

These two drivers are only buildable for the powerpc "maple" platform
(CONFIG_PPC_MAPLE), which has now been removed, see
commit 62f8f307c80e ("powerpc/64: Remove maple platform").

Remove the drivers.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/edac/Kconfig        |  18 --
 drivers/edac/Makefile       |   2 -
 drivers/edac/amd8111_edac.c | 596 ------------------------------------
 drivers/edac/amd8111_edac.h | 118 -------
 drivers/edac/amd8131_edac.c | 358 ----------------------
 drivers/edac/amd8131_edac.h | 107 -------
 6 files changed, 1199 deletions(-)
 delete mode 100644 drivers/edac/amd8111_edac.c
 delete mode 100644 drivers/edac/amd8111_edac.h
 delete mode 100644 drivers/edac/amd8131_edac.c
 delete mode 100644 drivers/edac/amd8131_edac.h

The removal commit is in the powerpc/next branch:
  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next

I can take this via the powerpc tree if that's easiest, let me know.

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 81af6c344d6b..06f7b43a6f78 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -311,24 +311,6 @@ config EDAC_CELL
 	  Cell Broadband Engine internal memory controller
 	  on platform without a hypervisor
 
-config EDAC_AMD8131
-	tristate "AMD8131 HyperTransport PCI-X Tunnel"
-	depends on PCI && PPC_MAPLE
-	help
-	  Support for error detection and correction on the
-	  AMD8131 HyperTransport PCI-X Tunnel chip.
-	  Note, add more Kconfig dependency if it's adopted
-	  on some machine other than Maple.
-
-config EDAC_AMD8111
-	tristate "AMD8111 HyperTransport I/O Hub"
-	depends on PCI && PPC_MAPLE
-	help
-	  Support for error detection and correction on the
-	  AMD8111 HyperTransport I/O Hub chip.
-	  Note, add more Kconfig dependency if it's adopted
-	  on some machine other than Maple.
-
 config EDAC_CPC925
 	tristate "IBM CPC925 Memory Controller (PPC970FX)"
 	depends on PPC64
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index faf310eec4a6..f9cf19d8d13d 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -63,8 +63,6 @@ i10nm_edac-y				:= i10nm_base.o
 obj-$(CONFIG_EDAC_I10NM)		+= i10nm_edac.o skx_edac_common.o
 
 obj-$(CONFIG_EDAC_CELL)			+= cell_edac.o
-obj-$(CONFIG_EDAC_AMD8111)		+= amd8111_edac.o
-obj-$(CONFIG_EDAC_AMD8131)		+= amd8131_edac.o
 
 obj-$(CONFIG_EDAC_HIGHBANK_MC)		+= highbank_mc_edac.o
 obj-$(CONFIG_EDAC_HIGHBANK_L2)		+= highbank_l2_edac.o
diff --git a/drivers/edac/amd8111_edac.c b/drivers/edac/amd8111_edac.c
deleted file mode 100644
index a6d3013d5823..000000000000
--- a/drivers/edac/amd8111_edac.c
+++ /dev/null
@@ -1,596 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * amd8111_edac.c, AMD8111 Hyper Transport chip EDAC kernel module
- *
- * Copyright (c) 2008 Wind River Systems, Inc.
- *
- * Authors:	Cao Qingtao <qingtao.cao@windriver.com>
- * 		Benjamin Walsh <benjamin.walsh@windriver.com>
- * 		Hu Yongqi <yongqi.hu@windriver.com>
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/bitops.h>
-#include <linux/edac.h>
-#include <linux/pci_ids.h>
-#include <asm/io.h>
-
-#include "edac_module.h"
-#include "amd8111_edac.h"
-
-#define AMD8111_EDAC_REVISION	" Ver: 1.0.0"
-#define AMD8111_EDAC_MOD_STR	"amd8111_edac"
-
-#define PCI_DEVICE_ID_AMD_8111_PCI	0x7460
-
-enum amd8111_edac_devs {
-	LPC_BRIDGE = 0,
-};
-
-enum amd8111_edac_pcis {
-	PCI_BRIDGE = 0,
-};
-
-/* Wrapper functions for accessing PCI configuration space */
-static int edac_pci_read_dword(struct pci_dev *dev, int reg, u32 *val32)
-{
-	int ret;
-
-	ret = pci_read_config_dword(dev, reg, val32);
-	if (ret != 0)
-		printk(KERN_ERR AMD8111_EDAC_MOD_STR
-			" PCI Access Read Error at 0x%x\n", reg);
-
-	return ret;
-}
-
-static void edac_pci_read_byte(struct pci_dev *dev, int reg, u8 *val8)
-{
-	int ret;
-
-	ret = pci_read_config_byte(dev, reg, val8);
-	if (ret != 0)
-		printk(KERN_ERR AMD8111_EDAC_MOD_STR
-			" PCI Access Read Error at 0x%x\n", reg);
-}
-
-static void edac_pci_write_dword(struct pci_dev *dev, int reg, u32 val32)
-{
-	int ret;
-
-	ret = pci_write_config_dword(dev, reg, val32);
-	if (ret != 0)
-		printk(KERN_ERR AMD8111_EDAC_MOD_STR
-			" PCI Access Write Error at 0x%x\n", reg);
-}
-
-static void edac_pci_write_byte(struct pci_dev *dev, int reg, u8 val8)
-{
-	int ret;
-
-	ret = pci_write_config_byte(dev, reg, val8);
-	if (ret != 0)
-		printk(KERN_ERR AMD8111_EDAC_MOD_STR
-			" PCI Access Write Error at 0x%x\n", reg);
-}
-
-/*
- * device-specific methods for amd8111 PCI Bridge Controller
- *
- * Error Reporting and Handling for amd8111 chipset could be found
- * in its datasheet 3.1.2 section, P37
- */
-static void amd8111_pci_bridge_init(struct amd8111_pci_info *pci_info)
-{
-	u32 val32;
-	struct pci_dev *dev = pci_info->dev;
-
-	/* First clear error detection flags on the host interface */
-
-	/* Clear SSE/SMA/STA flags in the global status register*/
-	edac_pci_read_dword(dev, REG_PCI_STSCMD, &val32);
-	if (val32 & PCI_STSCMD_CLEAR_MASK)
-		edac_pci_write_dword(dev, REG_PCI_STSCMD, val32);
-
-	/* Clear CRC and Link Fail flags in HT Link Control reg */
-	edac_pci_read_dword(dev, REG_HT_LINK, &val32);
-	if (val32 & HT_LINK_CLEAR_MASK)
-		edac_pci_write_dword(dev, REG_HT_LINK, val32);
-
-	/* Second clear all fault on the secondary interface */
-
-	/* Clear error flags in the memory-base limit reg. */
-	edac_pci_read_dword(dev, REG_MEM_LIM, &val32);
-	if (val32 & MEM_LIMIT_CLEAR_MASK)
-		edac_pci_write_dword(dev, REG_MEM_LIM, val32);
-
-	/* Clear Discard Timer Expired flag in Interrupt/Bridge Control reg */
-	edac_pci_read_dword(dev, REG_PCI_INTBRG_CTRL, &val32);
-	if (val32 & PCI_INTBRG_CTRL_CLEAR_MASK)
-		edac_pci_write_dword(dev, REG_PCI_INTBRG_CTRL, val32);
-
-	/* Last enable error detections */
-	if (edac_op_state == EDAC_OPSTATE_POLL) {
-		/* Enable System Error reporting in global status register */
-		edac_pci_read_dword(dev, REG_PCI_STSCMD, &val32);
-		val32 |= PCI_STSCMD_SERREN;
-		edac_pci_write_dword(dev, REG_PCI_STSCMD, val32);
-
-		/* Enable CRC Sync flood packets to HyperTransport Link */
-		edac_pci_read_dword(dev, REG_HT_LINK, &val32);
-		val32 |= HT_LINK_CRCFEN;
-		edac_pci_write_dword(dev, REG_HT_LINK, val32);
-
-		/* Enable SSE reporting etc in Interrupt control reg */
-		edac_pci_read_dword(dev, REG_PCI_INTBRG_CTRL, &val32);
-		val32 |= PCI_INTBRG_CTRL_POLL_MASK;
-		edac_pci_write_dword(dev, REG_PCI_INTBRG_CTRL, val32);
-	}
-}
-
-static void amd8111_pci_bridge_exit(struct amd8111_pci_info *pci_info)
-{
-	u32 val32;
-	struct pci_dev *dev = pci_info->dev;
-
-	if (edac_op_state == EDAC_OPSTATE_POLL) {
-		/* Disable System Error reporting */
-		edac_pci_read_dword(dev, REG_PCI_STSCMD, &val32);
-		val32 &= ~PCI_STSCMD_SERREN;
-		edac_pci_write_dword(dev, REG_PCI_STSCMD, val32);
-
-		/* Disable CRC flood packets */
-		edac_pci_read_dword(dev, REG_HT_LINK, &val32);
-		val32 &= ~HT_LINK_CRCFEN;
-		edac_pci_write_dword(dev, REG_HT_LINK, val32);
-
-		/* Disable DTSERREN/MARSP/SERREN in Interrupt Control reg */
-		edac_pci_read_dword(dev, REG_PCI_INTBRG_CTRL, &val32);
-		val32 &= ~PCI_INTBRG_CTRL_POLL_MASK;
-		edac_pci_write_dword(dev, REG_PCI_INTBRG_CTRL, val32);
-	}
-}
-
-static void amd8111_pci_bridge_check(struct edac_pci_ctl_info *edac_dev)
-{
-	struct amd8111_pci_info *pci_info = edac_dev->pvt_info;
-	struct pci_dev *dev = pci_info->dev;
-	u32 val32;
-
-	/* Check out PCI Bridge Status and Command Register */
-	edac_pci_read_dword(dev, REG_PCI_STSCMD, &val32);
-	if (val32 & PCI_STSCMD_CLEAR_MASK) {
-		printk(KERN_INFO "Error(s) in PCI bridge status and command"
-			"register on device %s\n", pci_info->ctl_name);
-		printk(KERN_INFO "SSE: %d, RMA: %d, RTA: %d\n",
-			(val32 & PCI_STSCMD_SSE) != 0,
-			(val32 & PCI_STSCMD_RMA) != 0,
-			(val32 & PCI_STSCMD_RTA) != 0);
-
-		val32 |= PCI_STSCMD_CLEAR_MASK;
-		edac_pci_write_dword(dev, REG_PCI_STSCMD, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-
-	/* Check out HyperTransport Link Control Register */
-	edac_pci_read_dword(dev, REG_HT_LINK, &val32);
-	if (val32 & HT_LINK_LKFAIL) {
-		printk(KERN_INFO "Error(s) in hypertransport link control"
-			"register on device %s\n", pci_info->ctl_name);
-		printk(KERN_INFO "LKFAIL: %d\n",
-			(val32 & HT_LINK_LKFAIL) != 0);
-
-		val32 |= HT_LINK_LKFAIL;
-		edac_pci_write_dword(dev, REG_HT_LINK, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-
-	/* Check out PCI Interrupt and Bridge Control Register */
-	edac_pci_read_dword(dev, REG_PCI_INTBRG_CTRL, &val32);
-	if (val32 & PCI_INTBRG_CTRL_DTSTAT) {
-		printk(KERN_INFO "Error(s) in PCI interrupt and bridge control"
-			"register on device %s\n", pci_info->ctl_name);
-		printk(KERN_INFO "DTSTAT: %d\n",
-			(val32 & PCI_INTBRG_CTRL_DTSTAT) != 0);
-
-		val32 |= PCI_INTBRG_CTRL_DTSTAT;
-		edac_pci_write_dword(dev, REG_PCI_INTBRG_CTRL, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-
-	/* Check out PCI Bridge Memory Base-Limit Register */
-	edac_pci_read_dword(dev, REG_MEM_LIM, &val32);
-	if (val32 & MEM_LIMIT_CLEAR_MASK) {
-		printk(KERN_INFO
-			"Error(s) in mem limit register on %s device\n",
-			pci_info->ctl_name);
-		printk(KERN_INFO "DPE: %d, RSE: %d, RMA: %d\n"
-			"RTA: %d, STA: %d, MDPE: %d\n",
-			(val32 & MEM_LIMIT_DPE)  != 0,
-			(val32 & MEM_LIMIT_RSE)  != 0,
-			(val32 & MEM_LIMIT_RMA)  != 0,
-			(val32 & MEM_LIMIT_RTA)  != 0,
-			(val32 & MEM_LIMIT_STA)  != 0,
-			(val32 & MEM_LIMIT_MDPE) != 0);
-
-		val32 |= MEM_LIMIT_CLEAR_MASK;
-		edac_pci_write_dword(dev, REG_MEM_LIM, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-}
-
-static struct resource *legacy_io_res;
-static int at_compat_reg_broken;
-#define LEGACY_NR_PORTS	1
-
-/* device-specific methods for amd8111 LPC Bridge device */
-static void amd8111_lpc_bridge_init(struct amd8111_dev_info *dev_info)
-{
-	u8 val8;
-	struct pci_dev *dev = dev_info->dev;
-
-	/* First clear REG_AT_COMPAT[SERR, IOCHK] if necessary */
-	legacy_io_res = request_region(REG_AT_COMPAT, LEGACY_NR_PORTS,
-					AMD8111_EDAC_MOD_STR);
-	if (!legacy_io_res)
-		printk(KERN_INFO "%s: failed to request legacy I/O region "
-			"start %d, len %d\n", __func__,
-			REG_AT_COMPAT, LEGACY_NR_PORTS);
-	else {
-		val8 = __do_inb(REG_AT_COMPAT);
-		if (val8 == 0xff) { /* buggy port */
-			printk(KERN_INFO "%s: port %d is buggy, not supported"
-				" by hardware?\n", __func__, REG_AT_COMPAT);
-			at_compat_reg_broken = 1;
-			release_region(REG_AT_COMPAT, LEGACY_NR_PORTS);
-			legacy_io_res = NULL;
-		} else {
-			u8 out8 = 0;
-			if (val8 & AT_COMPAT_SERR)
-				out8 = AT_COMPAT_CLRSERR;
-			if (val8 & AT_COMPAT_IOCHK)
-				out8 |= AT_COMPAT_CLRIOCHK;
-			if (out8 > 0)
-				__do_outb(out8, REG_AT_COMPAT);
-		}
-	}
-
-	/* Second clear error flags on LPC bridge */
-	edac_pci_read_byte(dev, REG_IO_CTRL_1, &val8);
-	if (val8 & IO_CTRL_1_CLEAR_MASK)
-		edac_pci_write_byte(dev, REG_IO_CTRL_1, val8);
-}
-
-static void amd8111_lpc_bridge_exit(struct amd8111_dev_info *dev_info)
-{
-	if (legacy_io_res)
-		release_region(REG_AT_COMPAT, LEGACY_NR_PORTS);
-}
-
-static void amd8111_lpc_bridge_check(struct edac_device_ctl_info *edac_dev)
-{
-	struct amd8111_dev_info *dev_info = edac_dev->pvt_info;
-	struct pci_dev *dev = dev_info->dev;
-	u8 val8;
-
-	edac_pci_read_byte(dev, REG_IO_CTRL_1, &val8);
-	if (val8 & IO_CTRL_1_CLEAR_MASK) {
-		printk(KERN_INFO
-			"Error(s) in IO control register on %s device\n",
-			dev_info->ctl_name);
-		printk(KERN_INFO "LPC ERR: %d, PW2LPC: %d\n",
-			(val8 & IO_CTRL_1_LPC_ERR) != 0,
-			(val8 & IO_CTRL_1_PW2LPC) != 0);
-
-		val8 |= IO_CTRL_1_CLEAR_MASK;
-		edac_pci_write_byte(dev, REG_IO_CTRL_1, val8);
-
-		edac_device_handle_ue(edac_dev, 0, 0, edac_dev->ctl_name);
-	}
-
-	if (at_compat_reg_broken == 0) {
-		u8 out8 = 0;
-		val8 = __do_inb(REG_AT_COMPAT);
-		if (val8 & AT_COMPAT_SERR)
-			out8 = AT_COMPAT_CLRSERR;
-		if (val8 & AT_COMPAT_IOCHK)
-			out8 |= AT_COMPAT_CLRIOCHK;
-		if (out8 > 0) {
-			__do_outb(out8, REG_AT_COMPAT);
-			edac_device_handle_ue(edac_dev, 0, 0,
-						edac_dev->ctl_name);
-		}
-	}
-}
-
-/* General devices represented by edac_device_ctl_info */
-static struct amd8111_dev_info amd8111_devices[] = {
-	[LPC_BRIDGE] = {
-		.err_dev = PCI_DEVICE_ID_AMD_8111_LPC,
-		.ctl_name = "lpc",
-		.init = amd8111_lpc_bridge_init,
-		.exit = amd8111_lpc_bridge_exit,
-		.check = amd8111_lpc_bridge_check,
-	},
-	{0},
-};
-
-/* PCI controllers represented by edac_pci_ctl_info */
-static struct amd8111_pci_info amd8111_pcis[] = {
-	[PCI_BRIDGE] = {
-		.err_dev = PCI_DEVICE_ID_AMD_8111_PCI,
-		.ctl_name = "AMD8111_PCI_Controller",
-		.init = amd8111_pci_bridge_init,
-		.exit = amd8111_pci_bridge_exit,
-		.check = amd8111_pci_bridge_check,
-	},
-	{0},
-};
-
-static int amd8111_dev_probe(struct pci_dev *dev,
-				const struct pci_device_id *id)
-{
-	struct amd8111_dev_info *dev_info = &amd8111_devices[id->driver_data];
-	int ret = -ENODEV;
-
-	dev_info->dev = pci_get_device(PCI_VENDOR_ID_AMD,
-					dev_info->err_dev, NULL);
-
-	if (!dev_info->dev) {
-		printk(KERN_ERR "EDAC device not found:"
-			"vendor %x, device %x, name %s\n",
-			PCI_VENDOR_ID_AMD, dev_info->err_dev,
-			dev_info->ctl_name);
-		goto err;
-	}
-
-	if (pci_enable_device(dev_info->dev)) {
-		printk(KERN_ERR "failed to enable:"
-			"vendor %x, device %x, name %s\n",
-			PCI_VENDOR_ID_AMD, dev_info->err_dev,
-			dev_info->ctl_name);
-		goto err_dev_put;
-	}
-
-	/*
-	 * we do not allocate extra private structure for
-	 * edac_device_ctl_info, but make use of existing
-	 * one instead.
-	*/
-	dev_info->edac_idx = edac_device_alloc_index();
-	dev_info->edac_dev =
-		edac_device_alloc_ctl_info(0, dev_info->ctl_name, 1,
-					   NULL, 0, 0, dev_info->edac_idx);
-	if (!dev_info->edac_dev) {
-		ret = -ENOMEM;
-		goto err_dev_put;
-	}
-
-	dev_info->edac_dev->pvt_info = dev_info;
-	dev_info->edac_dev->dev = &dev_info->dev->dev;
-	dev_info->edac_dev->mod_name = AMD8111_EDAC_MOD_STR;
-	dev_info->edac_dev->ctl_name = dev_info->ctl_name;
-	dev_info->edac_dev->dev_name = dev_name(&dev_info->dev->dev);
-
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		dev_info->edac_dev->edac_check = dev_info->check;
-
-	if (dev_info->init)
-		dev_info->init(dev_info);
-
-	if (edac_device_add_device(dev_info->edac_dev) > 0) {
-		printk(KERN_ERR "failed to add edac_dev for %s\n",
-			dev_info->ctl_name);
-		goto err_edac_free_ctl;
-	}
-
-	printk(KERN_INFO "added one edac_dev on AMD8111 "
-		"vendor %x, device %x, name %s\n",
-		PCI_VENDOR_ID_AMD, dev_info->err_dev,
-		dev_info->ctl_name);
-
-	return 0;
-
-err_edac_free_ctl:
-	edac_device_free_ctl_info(dev_info->edac_dev);
-err_dev_put:
-	pci_dev_put(dev_info->dev);
-err:
-	return ret;
-}
-
-static void amd8111_dev_remove(struct pci_dev *dev)
-{
-	struct amd8111_dev_info *dev_info;
-
-	for (dev_info = amd8111_devices; dev_info->err_dev; dev_info++)
-		if (dev_info->dev->device == dev->device)
-			break;
-
-	if (!dev_info->err_dev)	/* should never happen */
-		return;
-
-	if (dev_info->edac_dev) {
-		edac_device_del_device(dev_info->edac_dev->dev);
-		edac_device_free_ctl_info(dev_info->edac_dev);
-	}
-
-	if (dev_info->exit)
-		dev_info->exit(dev_info);
-
-	pci_dev_put(dev_info->dev);
-}
-
-static int amd8111_pci_probe(struct pci_dev *dev,
-				const struct pci_device_id *id)
-{
-	struct amd8111_pci_info *pci_info = &amd8111_pcis[id->driver_data];
-	int ret = -ENODEV;
-
-	pci_info->dev = pci_get_device(PCI_VENDOR_ID_AMD,
-					pci_info->err_dev, NULL);
-
-	if (!pci_info->dev) {
-		printk(KERN_ERR "EDAC device not found:"
-			"vendor %x, device %x, name %s\n",
-			PCI_VENDOR_ID_AMD, pci_info->err_dev,
-			pci_info->ctl_name);
-		goto err;
-	}
-
-	if (pci_enable_device(pci_info->dev)) {
-		printk(KERN_ERR "failed to enable:"
-			"vendor %x, device %x, name %s\n",
-			PCI_VENDOR_ID_AMD, pci_info->err_dev,
-			pci_info->ctl_name);
-		goto err_dev_put;
-	}
-
-	/*
-	 * we do not allocate extra private structure for
-	 * edac_pci_ctl_info, but make use of existing
-	 * one instead.
-	*/
-	pci_info->edac_idx = edac_pci_alloc_index();
-	pci_info->edac_dev = edac_pci_alloc_ctl_info(0, pci_info->ctl_name);
-	if (!pci_info->edac_dev) {
-		ret = -ENOMEM;
-		goto err_dev_put;
-	}
-
-	pci_info->edac_dev->pvt_info = pci_info;
-	pci_info->edac_dev->dev = &pci_info->dev->dev;
-	pci_info->edac_dev->mod_name = AMD8111_EDAC_MOD_STR;
-	pci_info->edac_dev->ctl_name = pci_info->ctl_name;
-	pci_info->edac_dev->dev_name = dev_name(&pci_info->dev->dev);
-
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		pci_info->edac_dev->edac_check = pci_info->check;
-
-	if (pci_info->init)
-		pci_info->init(pci_info);
-
-	if (edac_pci_add_device(pci_info->edac_dev, pci_info->edac_idx) > 0) {
-		printk(KERN_ERR "failed to add edac_pci for %s\n",
-			pci_info->ctl_name);
-		goto err_edac_free_ctl;
-	}
-
-	printk(KERN_INFO "added one edac_pci on AMD8111 "
-		"vendor %x, device %x, name %s\n",
-		PCI_VENDOR_ID_AMD, pci_info->err_dev,
-		pci_info->ctl_name);
-
-	return 0;
-
-err_edac_free_ctl:
-	edac_pci_free_ctl_info(pci_info->edac_dev);
-err_dev_put:
-	pci_dev_put(pci_info->dev);
-err:
-	return ret;
-}
-
-static void amd8111_pci_remove(struct pci_dev *dev)
-{
-	struct amd8111_pci_info *pci_info;
-
-	for (pci_info = amd8111_pcis; pci_info->err_dev; pci_info++)
-		if (pci_info->dev->device == dev->device)
-			break;
-
-	if (!pci_info->err_dev)	/* should never happen */
-		return;
-
-	if (pci_info->edac_dev) {
-		edac_pci_del_device(pci_info->edac_dev->dev);
-		edac_pci_free_ctl_info(pci_info->edac_dev);
-	}
-
-	if (pci_info->exit)
-		pci_info->exit(pci_info);
-
-	pci_dev_put(pci_info->dev);
-}
-
-/* PCI Device ID talbe for general EDAC device */
-static const struct pci_device_id amd8111_edac_dev_tbl[] = {
-	{
-	PCI_VEND_DEV(AMD, 8111_LPC),
-	.subvendor = PCI_ANY_ID,
-	.subdevice = PCI_ANY_ID,
-	.class = 0,
-	.class_mask = 0,
-	.driver_data = LPC_BRIDGE,
-	},
-	{
-	0,
-	}			/* table is NULL-terminated */
-};
-MODULE_DEVICE_TABLE(pci, amd8111_edac_dev_tbl);
-
-static struct pci_driver amd8111_edac_dev_driver = {
-	.name = "AMD8111_EDAC_DEV",
-	.probe = amd8111_dev_probe,
-	.remove = amd8111_dev_remove,
-	.id_table = amd8111_edac_dev_tbl,
-};
-
-/* PCI Device ID table for EDAC PCI controller */
-static const struct pci_device_id amd8111_edac_pci_tbl[] = {
-	{
-	PCI_VEND_DEV(AMD, 8111_PCI),
-	.subvendor = PCI_ANY_ID,
-	.subdevice = PCI_ANY_ID,
-	.class = 0,
-	.class_mask = 0,
-	.driver_data = PCI_BRIDGE,
-	},
-	{
-	0,
-	}			/* table is NULL-terminated */
-};
-MODULE_DEVICE_TABLE(pci, amd8111_edac_pci_tbl);
-
-static struct pci_driver amd8111_edac_pci_driver = {
-	.name = "AMD8111_EDAC_PCI",
-	.probe = amd8111_pci_probe,
-	.remove = amd8111_pci_remove,
-	.id_table = amd8111_edac_pci_tbl,
-};
-
-static int __init amd8111_edac_init(void)
-{
-	int val;
-
-	printk(KERN_INFO "AMD8111 EDAC driver "	AMD8111_EDAC_REVISION "\n");
-	printk(KERN_INFO "\t(c) 2008 Wind River Systems, Inc.\n");
-
-	/* Only POLL mode supported so far */
-	edac_op_state = EDAC_OPSTATE_POLL;
-
-	val = pci_register_driver(&amd8111_edac_dev_driver);
-	val |= pci_register_driver(&amd8111_edac_pci_driver);
-
-	return val;
-}
-
-static void __exit amd8111_edac_exit(void)
-{
-	pci_unregister_driver(&amd8111_edac_pci_driver);
-	pci_unregister_driver(&amd8111_edac_dev_driver);
-}
-
-
-module_init(amd8111_edac_init);
-module_exit(amd8111_edac_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Cao Qingtao <qingtao.cao@windriver.com>");
-MODULE_DESCRIPTION("AMD8111 HyperTransport I/O Hub EDAC kernel module");
diff --git a/drivers/edac/amd8111_edac.h b/drivers/edac/amd8111_edac.h
deleted file mode 100644
index 200cab1b3e42..000000000000
--- a/drivers/edac/amd8111_edac.h
+++ /dev/null
@@ -1,118 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * amd8111_edac.h, EDAC defs for AMD8111 hypertransport chip
- *
- * Copyright (c) 2008 Wind River Systems, Inc.
- *
- * Authors:	Cao Qingtao <qingtao.cao@windriver.com>
- * 		Benjamin Walsh <benjamin.walsh@windriver.com>
- * 		Hu Yongqi <yongqi.hu@windriver.com>
- */
-
-#ifndef _AMD8111_EDAC_H_
-#define _AMD8111_EDAC_H_
-
-/************************************************************
- *	PCI Bridge Status and Command Register, DevA:0x04
- ************************************************************/
-#define REG_PCI_STSCMD	0x04
-enum pci_stscmd_bits {
-	PCI_STSCMD_SSE		= BIT(30),
-	PCI_STSCMD_RMA		= BIT(29),
-	PCI_STSCMD_RTA		= BIT(28),
-	PCI_STSCMD_SERREN	= BIT(8),
-	PCI_STSCMD_CLEAR_MASK	= (PCI_STSCMD_SSE |
-				   PCI_STSCMD_RMA |
-				   PCI_STSCMD_RTA)
-};
-
-/************************************************************
- *	PCI Bridge Memory Base-Limit Register, DevA:0x1c
- ************************************************************/
-#define REG_MEM_LIM     0x1c
-enum mem_limit_bits {
-	MEM_LIMIT_DPE   = BIT(31),
-	MEM_LIMIT_RSE   = BIT(30),
-	MEM_LIMIT_RMA   = BIT(29),
-	MEM_LIMIT_RTA   = BIT(28),
-	MEM_LIMIT_STA   = BIT(27),
-	MEM_LIMIT_MDPE  = BIT(24),
-	MEM_LIMIT_CLEAR_MASK  = (MEM_LIMIT_DPE |
-				 MEM_LIMIT_RSE |
-				 MEM_LIMIT_RMA |
-				 MEM_LIMIT_RTA |
-				 MEM_LIMIT_STA |
-				 MEM_LIMIT_MDPE)
-};
-
-/************************************************************
- *	HyperTransport Link Control Register, DevA:0xc4
- ************************************************************/
-#define REG_HT_LINK	0xc4
-enum ht_link_bits {
-	HT_LINK_LKFAIL	= BIT(4),
-	HT_LINK_CRCFEN	= BIT(1),
-	HT_LINK_CLEAR_MASK = (HT_LINK_LKFAIL)
-};
-
-/************************************************************
- *	PCI Bridge Interrupt and Bridge Control, DevA:0x3c
- ************************************************************/
-#define REG_PCI_INTBRG_CTRL	0x3c
-enum pci_intbrg_ctrl_bits {
-	PCI_INTBRG_CTRL_DTSERREN	= BIT(27),
-	PCI_INTBRG_CTRL_DTSTAT		= BIT(26),
-	PCI_INTBRG_CTRL_MARSP		= BIT(21),
-	PCI_INTBRG_CTRL_SERREN		= BIT(17),
-	PCI_INTBRG_CTRL_PEREN		= BIT(16),
-	PCI_INTBRG_CTRL_CLEAR_MASK	= (PCI_INTBRG_CTRL_DTSTAT),
-	PCI_INTBRG_CTRL_POLL_MASK	= (PCI_INTBRG_CTRL_DTSERREN |
-					   PCI_INTBRG_CTRL_MARSP |
-					   PCI_INTBRG_CTRL_SERREN)
-};
-
-/************************************************************
- *		I/O Control 1 Register, DevB:0x40
- ************************************************************/
-#define REG_IO_CTRL_1 0x40
-enum io_ctrl_1_bits {
-	IO_CTRL_1_NMIONERR	= BIT(7),
-	IO_CTRL_1_LPC_ERR	= BIT(6),
-	IO_CTRL_1_PW2LPC	= BIT(1),
-	IO_CTRL_1_CLEAR_MASK	= (IO_CTRL_1_LPC_ERR | IO_CTRL_1_PW2LPC)
-};
-
-/************************************************************
- *		Legacy I/O Space Registers
- ************************************************************/
-#define REG_AT_COMPAT 0x61
-enum at_compat_bits {
-	AT_COMPAT_SERR		= BIT(7),
-	AT_COMPAT_IOCHK		= BIT(6),
-	AT_COMPAT_CLRIOCHK	= BIT(3),
-	AT_COMPAT_CLRSERR	= BIT(2),
-};
-
-struct amd8111_dev_info {
-	u16 err_dev;	/* PCI Device ID */
-	struct pci_dev *dev;
-	int edac_idx;	/* device index */
-	char *ctl_name;
-	struct edac_device_ctl_info *edac_dev;
-	void (*init)(struct amd8111_dev_info *dev_info);
-	void (*exit)(struct amd8111_dev_info *dev_info);
-	void (*check)(struct edac_device_ctl_info *edac_dev);
-};
-
-struct amd8111_pci_info {
-	u16 err_dev;	/* PCI Device ID */
-	struct pci_dev *dev;
-	int edac_idx;	/* pci index */
-	const char *ctl_name;
-	struct edac_pci_ctl_info *edac_dev;
-	void (*init)(struct amd8111_pci_info *dev_info);
-	void (*exit)(struct amd8111_pci_info *dev_info);
-	void (*check)(struct edac_pci_ctl_info *edac_dev);
-};
-
-#endif /* _AMD8111_EDAC_H_ */
diff --git a/drivers/edac/amd8131_edac.c b/drivers/edac/amd8131_edac.c
deleted file mode 100644
index 28610ba514f4..000000000000
--- a/drivers/edac/amd8131_edac.c
+++ /dev/null
@@ -1,358 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * amd8131_edac.c, AMD8131 hypertransport chip EDAC kernel module
- *
- * Copyright (c) 2008 Wind River Systems, Inc.
- *
- * Authors:	Cao Qingtao <qingtao.cao@windriver.com>
- * 		Benjamin Walsh <benjamin.walsh@windriver.com>
- * 		Hu Yongqi <yongqi.hu@windriver.com>
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/bitops.h>
-#include <linux/edac.h>
-#include <linux/pci_ids.h>
-
-#include "edac_module.h"
-#include "amd8131_edac.h"
-
-#define AMD8131_EDAC_REVISION	" Ver: 1.0.0"
-#define AMD8131_EDAC_MOD_STR	"amd8131_edac"
-
-/* Wrapper functions for accessing PCI configuration space */
-static void edac_pci_read_dword(struct pci_dev *dev, int reg, u32 *val32)
-{
-	int ret;
-
-	ret = pci_read_config_dword(dev, reg, val32);
-	if (ret != 0)
-		printk(KERN_ERR AMD8131_EDAC_MOD_STR
-			" PCI Access Read Error at 0x%x\n", reg);
-}
-
-static void edac_pci_write_dword(struct pci_dev *dev, int reg, u32 val32)
-{
-	int ret;
-
-	ret = pci_write_config_dword(dev, reg, val32);
-	if (ret != 0)
-		printk(KERN_ERR AMD8131_EDAC_MOD_STR
-			" PCI Access Write Error at 0x%x\n", reg);
-}
-
-/* Support up to two AMD8131 chipsets on a platform */
-static struct amd8131_dev_info amd8131_devices[] = {
-	{
-	.inst = NORTH_A,
-	.devfn = DEVFN_PCIX_BRIDGE_NORTH_A,
-	.ctl_name = "AMD8131_PCIX_NORTH_A",
-	},
-	{
-	.inst = NORTH_B,
-	.devfn = DEVFN_PCIX_BRIDGE_NORTH_B,
-	.ctl_name = "AMD8131_PCIX_NORTH_B",
-	},
-	{
-	.inst = SOUTH_A,
-	.devfn = DEVFN_PCIX_BRIDGE_SOUTH_A,
-	.ctl_name = "AMD8131_PCIX_SOUTH_A",
-	},
-	{
-	.inst = SOUTH_B,
-	.devfn = DEVFN_PCIX_BRIDGE_SOUTH_B,
-	.ctl_name = "AMD8131_PCIX_SOUTH_B",
-	},
-	{.inst = NO_BRIDGE,},
-};
-
-static void amd8131_pcix_init(struct amd8131_dev_info *dev_info)
-{
-	u32 val32;
-	struct pci_dev *dev = dev_info->dev;
-
-	/* First clear error detection flags */
-	edac_pci_read_dword(dev, REG_MEM_LIM, &val32);
-	if (val32 & MEM_LIMIT_MASK)
-		edac_pci_write_dword(dev, REG_MEM_LIM, val32);
-
-	/* Clear Discard Timer Timedout flag */
-	edac_pci_read_dword(dev, REG_INT_CTLR, &val32);
-	if (val32 & INT_CTLR_DTS)
-		edac_pci_write_dword(dev, REG_INT_CTLR, val32);
-
-	/* Clear CRC Error flag on link side A */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_A, &val32);
-	if (val32 & LNK_CTRL_CRCERR_A)
-		edac_pci_write_dword(dev, REG_LNK_CTRL_A, val32);
-
-	/* Clear CRC Error flag on link side B */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_B, &val32);
-	if (val32 & LNK_CTRL_CRCERR_B)
-		edac_pci_write_dword(dev, REG_LNK_CTRL_B, val32);
-
-	/*
-	 * Then enable all error detections.
-	 *
-	 * Setup Discard Timer Sync Flood Enable,
-	 * System Error Enable and Parity Error Enable.
-	 */
-	edac_pci_read_dword(dev, REG_INT_CTLR, &val32);
-	val32 |= INT_CTLR_PERR | INT_CTLR_SERR | INT_CTLR_DTSE;
-	edac_pci_write_dword(dev, REG_INT_CTLR, val32);
-
-	/* Enable overall SERR Error detection */
-	edac_pci_read_dword(dev, REG_STS_CMD, &val32);
-	val32 |= STS_CMD_SERREN;
-	edac_pci_write_dword(dev, REG_STS_CMD, val32);
-
-	/* Setup CRC Flood Enable for link side A */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_A, &val32);
-	val32 |= LNK_CTRL_CRCFEN;
-	edac_pci_write_dword(dev, REG_LNK_CTRL_A, val32);
-
-	/* Setup CRC Flood Enable for link side B */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_B, &val32);
-	val32 |= LNK_CTRL_CRCFEN;
-	edac_pci_write_dword(dev, REG_LNK_CTRL_B, val32);
-}
-
-static void amd8131_pcix_exit(struct amd8131_dev_info *dev_info)
-{
-	u32 val32;
-	struct pci_dev *dev = dev_info->dev;
-
-	/* Disable SERR, PERR and DTSE Error detection */
-	edac_pci_read_dword(dev, REG_INT_CTLR, &val32);
-	val32 &= ~(INT_CTLR_PERR | INT_CTLR_SERR | INT_CTLR_DTSE);
-	edac_pci_write_dword(dev, REG_INT_CTLR, val32);
-
-	/* Disable overall System Error detection */
-	edac_pci_read_dword(dev, REG_STS_CMD, &val32);
-	val32 &= ~STS_CMD_SERREN;
-	edac_pci_write_dword(dev, REG_STS_CMD, val32);
-
-	/* Disable CRC Sync Flood on link side A */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_A, &val32);
-	val32 &= ~LNK_CTRL_CRCFEN;
-	edac_pci_write_dword(dev, REG_LNK_CTRL_A, val32);
-
-	/* Disable CRC Sync Flood on link side B */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_B, &val32);
-	val32 &= ~LNK_CTRL_CRCFEN;
-	edac_pci_write_dword(dev, REG_LNK_CTRL_B, val32);
-}
-
-static void amd8131_pcix_check(struct edac_pci_ctl_info *edac_dev)
-{
-	struct amd8131_dev_info *dev_info = edac_dev->pvt_info;
-	struct pci_dev *dev = dev_info->dev;
-	u32 val32;
-
-	/* Check PCI-X Bridge Memory Base-Limit Register for errors */
-	edac_pci_read_dword(dev, REG_MEM_LIM, &val32);
-	if (val32 & MEM_LIMIT_MASK) {
-		printk(KERN_INFO "Error(s) in mem limit register "
-			"on %s bridge\n", dev_info->ctl_name);
-		printk(KERN_INFO "DPE: %d, RSE: %d, RMA: %d\n"
-			"RTA: %d, STA: %d, MDPE: %d\n",
-			val32 & MEM_LIMIT_DPE,
-			val32 & MEM_LIMIT_RSE,
-			val32 & MEM_LIMIT_RMA,
-			val32 & MEM_LIMIT_RTA,
-			val32 & MEM_LIMIT_STA,
-			val32 & MEM_LIMIT_MDPE);
-
-		val32 |= MEM_LIMIT_MASK;
-		edac_pci_write_dword(dev, REG_MEM_LIM, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-
-	/* Check if Discard Timer timed out */
-	edac_pci_read_dword(dev, REG_INT_CTLR, &val32);
-	if (val32 & INT_CTLR_DTS) {
-		printk(KERN_INFO "Error(s) in interrupt and control register "
-			"on %s bridge\n", dev_info->ctl_name);
-		printk(KERN_INFO "DTS: %d\n", val32 & INT_CTLR_DTS);
-
-		val32 |= INT_CTLR_DTS;
-		edac_pci_write_dword(dev, REG_INT_CTLR, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-
-	/* Check if CRC error happens on link side A */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_A, &val32);
-	if (val32 & LNK_CTRL_CRCERR_A) {
-		printk(KERN_INFO "Error(s) in link conf and control register "
-			"on %s bridge\n", dev_info->ctl_name);
-		printk(KERN_INFO "CRCERR: %d\n", val32 & LNK_CTRL_CRCERR_A);
-
-		val32 |= LNK_CTRL_CRCERR_A;
-		edac_pci_write_dword(dev, REG_LNK_CTRL_A, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-
-	/* Check if CRC error happens on link side B */
-	edac_pci_read_dword(dev, REG_LNK_CTRL_B, &val32);
-	if (val32 & LNK_CTRL_CRCERR_B) {
-		printk(KERN_INFO "Error(s) in link conf and control register "
-			"on %s bridge\n", dev_info->ctl_name);
-		printk(KERN_INFO "CRCERR: %d\n", val32 & LNK_CTRL_CRCERR_B);
-
-		val32 |= LNK_CTRL_CRCERR_B;
-		edac_pci_write_dword(dev, REG_LNK_CTRL_B, val32);
-
-		edac_pci_handle_npe(edac_dev, edac_dev->ctl_name);
-	}
-}
-
-static struct amd8131_info amd8131_chipset = {
-	.err_dev = PCI_DEVICE_ID_AMD_8131_APIC,
-	.devices = amd8131_devices,
-	.init = amd8131_pcix_init,
-	.exit = amd8131_pcix_exit,
-	.check = amd8131_pcix_check,
-};
-
-/*
- * There are 4 PCIX Bridges on ATCA-6101 that share the same PCI Device ID,
- * so amd8131_probe() would be called by kernel 4 times, with different
- * address of pci_dev for each of them each time.
- */
-static int amd8131_probe(struct pci_dev *dev, const struct pci_device_id *id)
-{
-	struct amd8131_dev_info *dev_info;
-
-	for (dev_info = amd8131_chipset.devices; dev_info->inst != NO_BRIDGE;
-		dev_info++)
-		if (dev_info->devfn == dev->devfn)
-			break;
-
-	if (dev_info->inst == NO_BRIDGE) /* should never happen */
-		return -ENODEV;
-
-	/*
-	 * We can't call pci_get_device() as we are used to do because
-	 * there are 4 of them but pci_dev_get() instead.
-	 */
-	dev_info->dev = pci_dev_get(dev);
-
-	if (pci_enable_device(dev_info->dev)) {
-		pci_dev_put(dev_info->dev);
-		printk(KERN_ERR "failed to enable:"
-			"vendor %x, device %x, devfn %x, name %s\n",
-			PCI_VENDOR_ID_AMD, amd8131_chipset.err_dev,
-			dev_info->devfn, dev_info->ctl_name);
-		return -ENODEV;
-	}
-
-	/*
-	 * we do not allocate extra private structure for
-	 * edac_pci_ctl_info, but make use of existing
-	 * one instead.
-	 */
-	dev_info->edac_idx = edac_pci_alloc_index();
-	dev_info->edac_dev = edac_pci_alloc_ctl_info(0, dev_info->ctl_name);
-	if (!dev_info->edac_dev)
-		return -ENOMEM;
-
-	dev_info->edac_dev->pvt_info = dev_info;
-	dev_info->edac_dev->dev = &dev_info->dev->dev;
-	dev_info->edac_dev->mod_name = AMD8131_EDAC_MOD_STR;
-	dev_info->edac_dev->ctl_name = dev_info->ctl_name;
-	dev_info->edac_dev->dev_name = dev_name(&dev_info->dev->dev);
-
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		dev_info->edac_dev->edac_check = amd8131_chipset.check;
-
-	if (amd8131_chipset.init)
-		amd8131_chipset.init(dev_info);
-
-	if (edac_pci_add_device(dev_info->edac_dev, dev_info->edac_idx) > 0) {
-		printk(KERN_ERR "failed edac_pci_add_device() for %s\n",
-			dev_info->ctl_name);
-		edac_pci_free_ctl_info(dev_info->edac_dev);
-		return -ENODEV;
-	}
-
-	printk(KERN_INFO "added one device on AMD8131 "
-		"vendor %x, device %x, devfn %x, name %s\n",
-		PCI_VENDOR_ID_AMD, amd8131_chipset.err_dev,
-		dev_info->devfn, dev_info->ctl_name);
-
-	return 0;
-}
-
-static void amd8131_remove(struct pci_dev *dev)
-{
-	struct amd8131_dev_info *dev_info;
-
-	for (dev_info = amd8131_chipset.devices; dev_info->inst != NO_BRIDGE;
-		dev_info++)
-		if (dev_info->devfn == dev->devfn)
-			break;
-
-	if (dev_info->inst == NO_BRIDGE) /* should never happen */
-		return;
-
-	if (dev_info->edac_dev) {
-		edac_pci_del_device(dev_info->edac_dev->dev);
-		edac_pci_free_ctl_info(dev_info->edac_dev);
-	}
-
-	if (amd8131_chipset.exit)
-		amd8131_chipset.exit(dev_info);
-
-	pci_dev_put(dev_info->dev);
-}
-
-static const struct pci_device_id amd8131_edac_pci_tbl[] = {
-	{
-	PCI_VEND_DEV(AMD, 8131_BRIDGE),
-	.subvendor = PCI_ANY_ID,
-	.subdevice = PCI_ANY_ID,
-	.class = 0,
-	.class_mask = 0,
-	.driver_data = 0,
-	},
-	{
-	0,
-	}			/* table is NULL-terminated */
-};
-MODULE_DEVICE_TABLE(pci, amd8131_edac_pci_tbl);
-
-static struct pci_driver amd8131_edac_driver = {
-	.name = AMD8131_EDAC_MOD_STR,
-	.probe = amd8131_probe,
-	.remove = amd8131_remove,
-	.id_table = amd8131_edac_pci_tbl,
-};
-
-static int __init amd8131_edac_init(void)
-{
-	printk(KERN_INFO "AMD8131 EDAC driver " AMD8131_EDAC_REVISION "\n");
-	printk(KERN_INFO "\t(c) 2008 Wind River Systems, Inc.\n");
-
-	/* Only POLL mode supported so far */
-	edac_op_state = EDAC_OPSTATE_POLL;
-
-	return pci_register_driver(&amd8131_edac_driver);
-}
-
-static void __exit amd8131_edac_exit(void)
-{
-	pci_unregister_driver(&amd8131_edac_driver);
-}
-
-module_init(amd8131_edac_init);
-module_exit(amd8131_edac_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Cao Qingtao <qingtao.cao@windriver.com>");
-MODULE_DESCRIPTION("AMD8131 HyperTransport PCI-X Tunnel EDAC kernel module");
diff --git a/drivers/edac/amd8131_edac.h b/drivers/edac/amd8131_edac.h
deleted file mode 100644
index 5f362abdaf12..000000000000
--- a/drivers/edac/amd8131_edac.h
+++ /dev/null
@@ -1,107 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * amd8131_edac.h, EDAC defs for AMD8131 hypertransport chip
- *
- * Copyright (c) 2008 Wind River Systems, Inc.
- *
- * Authors:	Cao Qingtao <qingtao.cao@windriver.com>
- * 		Benjamin Walsh <benjamin.walsh@windriver.com>
- * 		Hu Yongqi <yongqi.hu@windriver.com>
- */
-
-#ifndef _AMD8131_EDAC_H_
-#define _AMD8131_EDAC_H_
-
-#define DEVFN_PCIX_BRIDGE_NORTH_A	8
-#define DEVFN_PCIX_BRIDGE_NORTH_B	16
-#define DEVFN_PCIX_BRIDGE_SOUTH_A	24
-#define DEVFN_PCIX_BRIDGE_SOUTH_B	32
-
-/************************************************************
- *	PCI-X Bridge Status and Command Register, DevA:0x04
- ************************************************************/
-#define REG_STS_CMD	0x04
-enum sts_cmd_bits {
-	STS_CMD_SSE	= BIT(30),
-	STS_CMD_SERREN	= BIT(8)
-};
-
-/************************************************************
- *	PCI-X Bridge Interrupt and Bridge Control Register,
- ************************************************************/
-#define REG_INT_CTLR	0x3c
-enum int_ctlr_bits {
-	INT_CTLR_DTSE	= BIT(27),
-	INT_CTLR_DTS	= BIT(26),
-	INT_CTLR_SERR	= BIT(17),
-	INT_CTLR_PERR	= BIT(16)
-};
-
-/************************************************************
- *	PCI-X Bridge Memory Base-Limit Register, DevA:0x1C
- ************************************************************/
-#define REG_MEM_LIM	0x1c
-enum mem_limit_bits {
-	MEM_LIMIT_DPE 	= BIT(31),
-	MEM_LIMIT_RSE 	= BIT(30),
-	MEM_LIMIT_RMA 	= BIT(29),
-	MEM_LIMIT_RTA 	= BIT(28),
-	MEM_LIMIT_STA	= BIT(27),
-	MEM_LIMIT_MDPE	= BIT(24),
-	MEM_LIMIT_MASK	= MEM_LIMIT_DPE|MEM_LIMIT_RSE|MEM_LIMIT_RMA|
-				MEM_LIMIT_RTA|MEM_LIMIT_STA|MEM_LIMIT_MDPE
-};
-
-/************************************************************
- *	Link Configuration And Control Register, side A
- ************************************************************/
-#define REG_LNK_CTRL_A	0xc4
-
-/************************************************************
- *	Link Configuration And Control Register, side B
- ************************************************************/
-#define REG_LNK_CTRL_B  0xc8
-
-enum lnk_ctrl_bits {
-	LNK_CTRL_CRCERR_A	= BIT(9),
-	LNK_CTRL_CRCERR_B	= BIT(8),
-	LNK_CTRL_CRCFEN		= BIT(1)
-};
-
-enum pcix_bridge_inst {
-	NORTH_A = 0,
-	NORTH_B = 1,
-	SOUTH_A = 2,
-	SOUTH_B = 3,
-	NO_BRIDGE = 4
-};
-
-struct amd8131_dev_info {
-	int devfn;
-	enum pcix_bridge_inst inst;
-	struct pci_dev *dev;
-	int edac_idx;	/* pci device index */
-	char *ctl_name;
-	struct edac_pci_ctl_info *edac_dev;
-};
-
-/*
- * AMD8131 chipset has two pairs of PCIX Bridge and related IOAPIC
- * Controller, and ATCA-6101 has two AMD8131 chipsets, so there are
- * four PCIX Bridges on ATCA-6101 altogether.
- *
- * These PCIX Bridges share the same PCI Device ID and are all of
- * Function Zero, they could be discrimated by their pci_dev->devfn.
- * They share the same set of init/check/exit methods, and their
- * private structures are collected in the devices[] array.
- */
-struct amd8131_info {
-	u16 err_dev;	/* PCI Device ID for AMD8131 APIC*/
-	struct amd8131_dev_info *devices;
-	void (*init)(struct amd8131_dev_info *dev_info);
-	void (*exit)(struct amd8131_dev_info *dev_info);
-	void (*check)(struct edac_pci_ctl_info *edac_dev);
-};
-
-#endif /* _AMD8131_EDAC_H_ */
-
-- 
2.47.0


