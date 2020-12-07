Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CD2D09A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 05:04:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq8p714PMzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 15:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq8mb2mcfzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 15:03:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KullJ/g9; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cq8mb1Z2Nz9sW0; Mon,  7 Dec 2020 15:03:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cq8mb0Tylz9sW1; Mon,  7 Dec 2020 15:03:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607313791;
 bh=UrgAJv9lrueewNznbxSf1DdMYlarZH/Y8UYuA+ksMh0=;
 h=From:To:Cc:Subject:Date:From;
 b=KullJ/g92NFc+tyQ640u8FUxbP+TIyutYfTPIZa4K+WXfdfHE2JfG4l3kltokoDRx
 DvsUNg3f3rpbHJ20nOx4OipV/TCxLPh4B8asS60ckQvor3BXxqXAUERwODtEkS5ZBL
 6xJKJuu1qD1ryzZ1GwCgjzfDloCX/tgok8zv3jAJULoAEkh6HmtK2Qy9ciZ7T2OcAM
 KUzx6uEIHirnOG4kF6o3xTgQmMgWZCqFsjST9g4hjRO65WyqV38j2Dyv0JFqjyMWjK
 x87a1wOyXScgMv5nw4oK2ogbsHpGzNAEjx1uahgZAWprLc3O36mpUg6zrCemKkcXdM
 DJEcJq2eZ5fbQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bp@alien8.de
Subject: [PATCH] EDAC/mv64x60: Remove orphan mv64x60 driver
Date: Mon,  7 Dec 2020 15:02:53 +1100
Message-Id: <20201207040253.628528-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: tony.luck@intel.com, rric@kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, james.morse@arm.com, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mv64x60 EDAC driver depends on CONFIG_MV64X60. But that symbol is
not user-selectable, and the last code that selected it was removed
with the C2K board support in 2018, see:

  92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")

That means the driver is now dead code, so remove it.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/edac/Kconfig        |   7 -
 drivers/edac/Makefile       |   1 -
 drivers/edac/mv64x60_edac.c | 883 ------------------------------------
 drivers/edac/mv64x60_edac.h | 114 -----
 4 files changed, 1005 deletions(-)
 delete mode 100644 drivers/edac/mv64x60_edac.c
 delete mode 100644 drivers/edac/mv64x60_edac.h

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index fa0c3b5797e4..f3816f1131ed 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -292,13 +292,6 @@ config EDAC_LAYERSCAPE
 	  Support for error detection and correction on Freescale memory
 	  controllers on Layerscape SoCs.
 
-config EDAC_MV64X60
-	tristate "Marvell MV64x60"
-	depends on MV64X60
-	help
-	  Support for error detection and correction on the Marvell
-	  MV64360 and MV64460 chipsets.
-
 config EDAC_PASEMI
 	tristate "PA Semi PWRficient"
 	depends on PPC_PASEMI && PCI
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 3cd1aeb0a916..464d3d8d850a 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -65,7 +65,6 @@ obj-$(CONFIG_EDAC_SKX)			+= skx_edac.o
 i10nm_edac-y				:= skx_common.o i10nm_base.o
 obj-$(CONFIG_EDAC_I10NM)		+= i10nm_edac.o
 
-obj-$(CONFIG_EDAC_MV64X60)		+= mv64x60_edac.o
 obj-$(CONFIG_EDAC_CELL)			+= cell_edac.o
 obj-$(CONFIG_EDAC_PPC4XX)		+= ppc4xx_edac.o
 obj-$(CONFIG_EDAC_AMD8111)		+= amd8111_edac.o
diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
deleted file mode 100644
index 3c68bb525d5d..000000000000
--- a/drivers/edac/mv64x60_edac.c
+++ /dev/null
@@ -1,883 +0,0 @@
-/*
- * Marvell MV64x60 Memory Controller kernel module for PPC platforms
- *
- * Author: Dave Jiang <djiang@mvista.com>
- *
- * 2006-2007 (c) MontaVista Software, Inc. This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- *
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/edac.h>
-#include <linux/gfp.h>
-
-#include "edac_module.h"
-#include "mv64x60_edac.h"
-
-static const char *mv64x60_ctl_name = "MV64x60";
-static int edac_dev_idx;
-static int edac_pci_idx;
-static int edac_mc_idx;
-
-/*********************** PCI err device **********************************/
-#ifdef CONFIG_PCI
-static void mv64x60_pci_check(struct edac_pci_ctl_info *pci)
-{
-	struct mv64x60_pci_pdata *pdata = pci->pvt_info;
-	u32 cause;
-
-	cause = readl(pdata->pci_vbase + MV64X60_PCI_ERROR_CAUSE);
-	if (!cause)
-		return;
-
-	printk(KERN_ERR "Error in PCI %d Interface\n", pdata->pci_hose);
-	printk(KERN_ERR "Cause register: 0x%08x\n", cause);
-	printk(KERN_ERR "Address Low: 0x%08x\n",
-	       readl(pdata->pci_vbase + MV64X60_PCI_ERROR_ADDR_LO));
-	printk(KERN_ERR "Address High: 0x%08x\n",
-	       readl(pdata->pci_vbase + MV64X60_PCI_ERROR_ADDR_HI));
-	printk(KERN_ERR "Attribute: 0x%08x\n",
-	       readl(pdata->pci_vbase + MV64X60_PCI_ERROR_ATTR));
-	printk(KERN_ERR "Command: 0x%08x\n",
-	       readl(pdata->pci_vbase + MV64X60_PCI_ERROR_CMD));
-	writel(~cause, pdata->pci_vbase + MV64X60_PCI_ERROR_CAUSE);
-
-	if (cause & MV64X60_PCI_PE_MASK)
-		edac_pci_handle_pe(pci, pci->ctl_name);
-
-	if (!(cause & MV64X60_PCI_PE_MASK))
-		edac_pci_handle_npe(pci, pci->ctl_name);
-}
-
-static irqreturn_t mv64x60_pci_isr(int irq, void *dev_id)
-{
-	struct edac_pci_ctl_info *pci = dev_id;
-	struct mv64x60_pci_pdata *pdata = pci->pvt_info;
-	u32 val;
-
-	val = readl(pdata->pci_vbase + MV64X60_PCI_ERROR_CAUSE);
-	if (!val)
-		return IRQ_NONE;
-
-	mv64x60_pci_check(pci);
-
-	return IRQ_HANDLED;
-}
-
-/*
- * Bit 0 of MV64x60_PCIx_ERR_MASK does not exist on the 64360 and because of
- * errata FEr-#11 and FEr-##16 for the 64460, it should be 0 on that chip as
- * well.  IOW, don't set bit 0.
- */
-
-/* Erratum FEr PCI-#16: clear bit 0 of PCI SERRn Mask reg. */
-static int __init mv64x60_pci_fixup(struct platform_device *pdev)
-{
-	struct resource *r;
-	void __iomem *pci_serr;
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!r) {
-		printk(KERN_ERR "%s: Unable to get resource for "
-		       "PCI err regs\n", __func__);
-		return -ENOENT;
-	}
-
-	pci_serr = ioremap(r->start, resource_size(r));
-	if (!pci_serr)
-		return -ENOMEM;
-
-	writel(readl(pci_serr) & ~0x1, pci_serr);
-	iounmap(pci_serr);
-
-	return 0;
-}
-
-static int mv64x60_pci_err_probe(struct platform_device *pdev)
-{
-	struct edac_pci_ctl_info *pci;
-	struct mv64x60_pci_pdata *pdata;
-	struct resource *r;
-	int res = 0;
-
-	if (!devres_open_group(&pdev->dev, mv64x60_pci_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
-	pci = edac_pci_alloc_ctl_info(sizeof(*pdata), "mv64x60_pci_err");
-	if (!pci)
-		return -ENOMEM;
-
-	pdata = pci->pvt_info;
-
-	pdata->pci_hose = pdev->id;
-	pdata->name = "mv64x60_pci_err";
-	platform_set_drvdata(pdev, pci);
-	pci->dev = &pdev->dev;
-	pci->dev_name = dev_name(&pdev->dev);
-	pci->mod_name = EDAC_MOD_STR;
-	pci->ctl_name = pdata->name;
-
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		pci->edac_check = mv64x60_pci_check;
-
-	pdata->edac_idx = edac_pci_idx++;
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		printk(KERN_ERR "%s: Unable to get resource for "
-		       "PCI err regs\n", __func__);
-		res = -ENOENT;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdata->name)) {
-		printk(KERN_ERR "%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->pci_vbase = devm_ioremap(&pdev->dev,
-					r->start,
-					resource_size(r));
-	if (!pdata->pci_vbase) {
-		printk(KERN_ERR "%s: Unable to setup PCI err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
-
-	res = mv64x60_pci_fixup(pdev);
-	if (res < 0) {
-		printk(KERN_ERR "%s: PCI fixup failed\n", __func__);
-		goto err;
-	}
-
-	writel(0, pdata->pci_vbase + MV64X60_PCI_ERROR_CAUSE);
-	writel(0, pdata->pci_vbase + MV64X60_PCI_ERROR_MASK);
-	writel(MV64X60_PCIx_ERR_MASK_VAL,
-		  pdata->pci_vbase + MV64X60_PCI_ERROR_MASK);
-
-	if (edac_pci_add_device(pci, pdata->edac_idx) > 0) {
-		edac_dbg(3, "failed edac_pci_add_device()\n");
-		goto err;
-	}
-
-	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = platform_get_irq(pdev, 0);
-		res = devm_request_irq(&pdev->dev,
-				       pdata->irq,
-				       mv64x60_pci_isr,
-				       0,
-				       "[EDAC] PCI err",
-				       pci);
-		if (res < 0) {
-			printk(KERN_ERR "%s: Unable to request irq %d for "
-			       "MV64x60 PCI ERR\n", __func__, pdata->irq);
-			res = -ENODEV;
-			goto err2;
-		}
-		printk(KERN_INFO EDAC_MOD_STR " acquired irq %d for PCI Err\n",
-		       pdata->irq);
-	}
-
-	devres_remove_group(&pdev->dev, mv64x60_pci_err_probe);
-
-	/* get this far and it's successful */
-	edac_dbg(3, "success\n");
-
-	return 0;
-
-err2:
-	edac_pci_del_device(&pdev->dev);
-err:
-	edac_pci_free_ctl_info(pci);
-	devres_release_group(&pdev->dev, mv64x60_pci_err_probe);
-	return res;
-}
-
-static int mv64x60_pci_err_remove(struct platform_device *pdev)
-{
-	struct edac_pci_ctl_info *pci = platform_get_drvdata(pdev);
-
-	edac_dbg(0, "\n");
-
-	edac_pci_del_device(&pdev->dev);
-
-	edac_pci_free_ctl_info(pci);
-
-	return 0;
-}
-
-static struct platform_driver mv64x60_pci_err_driver = {
-	.probe = mv64x60_pci_err_probe,
-	.remove = mv64x60_pci_err_remove,
-	.driver = {
-		   .name = "mv64x60_pci_err",
-	}
-};
-
-#endif /* CONFIG_PCI */
-
-/*********************** SRAM err device **********************************/
-static void mv64x60_sram_check(struct edac_device_ctl_info *edac_dev)
-{
-	struct mv64x60_sram_pdata *pdata = edac_dev->pvt_info;
-	u32 cause;
-
-	cause = readl(pdata->sram_vbase + MV64X60_SRAM_ERR_CAUSE);
-	if (!cause)
-		return;
-
-	printk(KERN_ERR "Error in internal SRAM\n");
-	printk(KERN_ERR "Cause register: 0x%08x\n", cause);
-	printk(KERN_ERR "Address Low: 0x%08x\n",
-	       readl(pdata->sram_vbase + MV64X60_SRAM_ERR_ADDR_LO));
-	printk(KERN_ERR "Address High: 0x%08x\n",
-	       readl(pdata->sram_vbase + MV64X60_SRAM_ERR_ADDR_HI));
-	printk(KERN_ERR "Data Low: 0x%08x\n",
-	       readl(pdata->sram_vbase + MV64X60_SRAM_ERR_DATA_LO));
-	printk(KERN_ERR "Data High: 0x%08x\n",
-	       readl(pdata->sram_vbase + MV64X60_SRAM_ERR_DATA_HI));
-	printk(KERN_ERR "Parity: 0x%08x\n",
-	       readl(pdata->sram_vbase + MV64X60_SRAM_ERR_PARITY));
-	writel(0, pdata->sram_vbase + MV64X60_SRAM_ERR_CAUSE);
-
-	edac_device_handle_ue(edac_dev, 0, 0, edac_dev->ctl_name);
-}
-
-static irqreturn_t mv64x60_sram_isr(int irq, void *dev_id)
-{
-	struct edac_device_ctl_info *edac_dev = dev_id;
-	struct mv64x60_sram_pdata *pdata = edac_dev->pvt_info;
-	u32 cause;
-
-	cause = readl(pdata->sram_vbase + MV64X60_SRAM_ERR_CAUSE);
-	if (!cause)
-		return IRQ_NONE;
-
-	mv64x60_sram_check(edac_dev);
-
-	return IRQ_HANDLED;
-}
-
-static int mv64x60_sram_err_probe(struct platform_device *pdev)
-{
-	struct edac_device_ctl_info *edac_dev;
-	struct mv64x60_sram_pdata *pdata;
-	struct resource *r;
-	int res = 0;
-
-	if (!devres_open_group(&pdev->dev, mv64x60_sram_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
-	edac_dev = edac_device_alloc_ctl_info(sizeof(*pdata),
-					      "sram", 1, NULL, 0, 0, NULL, 0,
-					      edac_dev_idx);
-	if (!edac_dev) {
-		devres_release_group(&pdev->dev, mv64x60_sram_err_probe);
-		return -ENOMEM;
-	}
-
-	pdata = edac_dev->pvt_info;
-	pdata->name = "mv64x60_sram_err";
-	edac_dev->dev = &pdev->dev;
-	platform_set_drvdata(pdev, edac_dev);
-	edac_dev->dev_name = dev_name(&pdev->dev);
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		printk(KERN_ERR "%s: Unable to get resource for "
-		       "SRAM err regs\n", __func__);
-		res = -ENOENT;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdata->name)) {
-		printk(KERN_ERR "%s: Error while request mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->sram_vbase = devm_ioremap(&pdev->dev,
-					 r->start,
-					 resource_size(r));
-	if (!pdata->sram_vbase) {
-		printk(KERN_ERR "%s: Unable to setup SRAM err regs\n",
-		       __func__);
-		res = -ENOMEM;
-		goto err;
-	}
-
-	/* setup SRAM err registers */
-	writel(0, pdata->sram_vbase + MV64X60_SRAM_ERR_CAUSE);
-
-	edac_dev->mod_name = EDAC_MOD_STR;
-	edac_dev->ctl_name = pdata->name;
-
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		edac_dev->edac_check = mv64x60_sram_check;
-
-	pdata->edac_idx = edac_dev_idx++;
-
-	if (edac_device_add_device(edac_dev) > 0) {
-		edac_dbg(3, "failed edac_device_add_device()\n");
-		goto err;
-	}
-
-	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = platform_get_irq(pdev, 0);
-		res = devm_request_irq(&pdev->dev,
-				       pdata->irq,
-				       mv64x60_sram_isr,
-				       0,
-				       "[EDAC] SRAM err",
-				       edac_dev);
-		if (res < 0) {
-			printk(KERN_ERR
-			       "%s: Unable to request irq %d for "
-			       "MV64x60 SRAM ERR\n", __func__, pdata->irq);
-			res = -ENODEV;
-			goto err2;
-		}
-
-		printk(KERN_INFO EDAC_MOD_STR " acquired irq %d for SRAM Err\n",
-		       pdata->irq);
-	}
-
-	devres_remove_group(&pdev->dev, mv64x60_sram_err_probe);
-
-	/* get this far and it's successful */
-	edac_dbg(3, "success\n");
-
-	return 0;
-
-err2:
-	edac_device_del_device(&pdev->dev);
-err:
-	devres_release_group(&pdev->dev, mv64x60_sram_err_probe);
-	edac_device_free_ctl_info(edac_dev);
-	return res;
-}
-
-static int mv64x60_sram_err_remove(struct platform_device *pdev)
-{
-	struct edac_device_ctl_info *edac_dev = platform_get_drvdata(pdev);
-
-	edac_dbg(0, "\n");
-
-	edac_device_del_device(&pdev->dev);
-	edac_device_free_ctl_info(edac_dev);
-
-	return 0;
-}
-
-static struct platform_driver mv64x60_sram_err_driver = {
-	.probe = mv64x60_sram_err_probe,
-	.remove = mv64x60_sram_err_remove,
-	.driver = {
-		   .name = "mv64x60_sram_err",
-	}
-};
-
-/*********************** CPU err device **********************************/
-static void mv64x60_cpu_check(struct edac_device_ctl_info *edac_dev)
-{
-	struct mv64x60_cpu_pdata *pdata = edac_dev->pvt_info;
-	u32 cause;
-
-	cause = readl(pdata->cpu_vbase[1] + MV64x60_CPU_ERR_CAUSE) &
-	    MV64x60_CPU_CAUSE_MASK;
-	if (!cause)
-		return;
-
-	printk(KERN_ERR "Error on CPU interface\n");
-	printk(KERN_ERR "Cause register: 0x%08x\n", cause);
-	printk(KERN_ERR "Address Low: 0x%08x\n",
-	       readl(pdata->cpu_vbase[0] + MV64x60_CPU_ERR_ADDR_LO));
-	printk(KERN_ERR "Address High: 0x%08x\n",
-	       readl(pdata->cpu_vbase[0] + MV64x60_CPU_ERR_ADDR_HI));
-	printk(KERN_ERR "Data Low: 0x%08x\n",
-	       readl(pdata->cpu_vbase[1] + MV64x60_CPU_ERR_DATA_LO));
-	printk(KERN_ERR "Data High: 0x%08x\n",
-	       readl(pdata->cpu_vbase[1] + MV64x60_CPU_ERR_DATA_HI));
-	printk(KERN_ERR "Parity: 0x%08x\n",
-	       readl(pdata->cpu_vbase[1] + MV64x60_CPU_ERR_PARITY));
-	writel(0, pdata->cpu_vbase[1] + MV64x60_CPU_ERR_CAUSE);
-
-	edac_device_handle_ue(edac_dev, 0, 0, edac_dev->ctl_name);
-}
-
-static irqreturn_t mv64x60_cpu_isr(int irq, void *dev_id)
-{
-	struct edac_device_ctl_info *edac_dev = dev_id;
-	struct mv64x60_cpu_pdata *pdata = edac_dev->pvt_info;
-	u32 cause;
-
-	cause = readl(pdata->cpu_vbase[1] + MV64x60_CPU_ERR_CAUSE) &
-	    MV64x60_CPU_CAUSE_MASK;
-	if (!cause)
-		return IRQ_NONE;
-
-	mv64x60_cpu_check(edac_dev);
-
-	return IRQ_HANDLED;
-}
-
-static int mv64x60_cpu_err_probe(struct platform_device *pdev)
-{
-	struct edac_device_ctl_info *edac_dev;
-	struct resource *r;
-	struct mv64x60_cpu_pdata *pdata;
-	int res = 0;
-
-	if (!devres_open_group(&pdev->dev, mv64x60_cpu_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
-	edac_dev = edac_device_alloc_ctl_info(sizeof(*pdata),
-					      "cpu", 1, NULL, 0, 0, NULL, 0,
-					      edac_dev_idx);
-	if (!edac_dev) {
-		devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
-		return -ENOMEM;
-	}
-
-	pdata = edac_dev->pvt_info;
-	pdata->name = "mv64x60_cpu_err";
-	edac_dev->dev = &pdev->dev;
-	platform_set_drvdata(pdev, edac_dev);
-	edac_dev->dev_name = dev_name(&pdev->dev);
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		printk(KERN_ERR "%s: Unable to get resource for "
-		       "CPU err regs\n", __func__);
-		res = -ENOENT;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdata->name)) {
-		printk(KERN_ERR "%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->cpu_vbase[0] = devm_ioremap(&pdev->dev,
-					   r->start,
-					   resource_size(r));
-	if (!pdata->cpu_vbase[0]) {
-		printk(KERN_ERR "%s: Unable to setup CPU err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!r) {
-		printk(KERN_ERR "%s: Unable to get resource for "
-		       "CPU err regs\n", __func__);
-		res = -ENOENT;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdata->name)) {
-		printk(KERN_ERR "%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->cpu_vbase[1] = devm_ioremap(&pdev->dev,
-					   r->start,
-					   resource_size(r));
-	if (!pdata->cpu_vbase[1]) {
-		printk(KERN_ERR "%s: Unable to setup CPU err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
-
-	/* setup CPU err registers */
-	writel(0, pdata->cpu_vbase[1] + MV64x60_CPU_ERR_CAUSE);
-	writel(0, pdata->cpu_vbase[1] + MV64x60_CPU_ERR_MASK);
-	writel(0x000000ff, pdata->cpu_vbase[1] + MV64x60_CPU_ERR_MASK);
-
-	edac_dev->mod_name = EDAC_MOD_STR;
-	edac_dev->ctl_name = pdata->name;
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		edac_dev->edac_check = mv64x60_cpu_check;
-
-	pdata->edac_idx = edac_dev_idx++;
-
-	if (edac_device_add_device(edac_dev) > 0) {
-		edac_dbg(3, "failed edac_device_add_device()\n");
-		goto err;
-	}
-
-	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = platform_get_irq(pdev, 0);
-		res = devm_request_irq(&pdev->dev,
-				       pdata->irq,
-				       mv64x60_cpu_isr,
-				       0,
-				       "[EDAC] CPU err",
-				       edac_dev);
-		if (res < 0) {
-			printk(KERN_ERR
-			       "%s: Unable to request irq %d for MV64x60 "
-			       "CPU ERR\n", __func__, pdata->irq);
-			res = -ENODEV;
-			goto err2;
-		}
-
-		printk(KERN_INFO EDAC_MOD_STR
-		       " acquired irq %d for CPU Err\n", pdata->irq);
-	}
-
-	devres_remove_group(&pdev->dev, mv64x60_cpu_err_probe);
-
-	/* get this far and it's successful */
-	edac_dbg(3, "success\n");
-
-	return 0;
-
-err2:
-	edac_device_del_device(&pdev->dev);
-err:
-	devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
-	edac_device_free_ctl_info(edac_dev);
-	return res;
-}
-
-static int mv64x60_cpu_err_remove(struct platform_device *pdev)
-{
-	struct edac_device_ctl_info *edac_dev = platform_get_drvdata(pdev);
-
-	edac_dbg(0, "\n");
-
-	edac_device_del_device(&pdev->dev);
-	edac_device_free_ctl_info(edac_dev);
-	return 0;
-}
-
-static struct platform_driver mv64x60_cpu_err_driver = {
-	.probe = mv64x60_cpu_err_probe,
-	.remove = mv64x60_cpu_err_remove,
-	.driver = {
-		   .name = "mv64x60_cpu_err",
-	}
-};
-
-/*********************** DRAM err device **********************************/
-
-static void mv64x60_mc_check(struct mem_ctl_info *mci)
-{
-	struct mv64x60_mc_pdata *pdata = mci->pvt_info;
-	u32 reg;
-	u32 err_addr;
-	u32 sdram_ecc;
-	u32 comp_ecc;
-	u32 syndrome;
-
-	reg = readl(pdata->mc_vbase + MV64X60_SDRAM_ERR_ADDR);
-	if (!reg)
-		return;
-
-	err_addr = reg & ~0x3;
-	sdram_ecc = readl(pdata->mc_vbase + MV64X60_SDRAM_ERR_ECC_RCVD);
-	comp_ecc = readl(pdata->mc_vbase + MV64X60_SDRAM_ERR_ECC_CALC);
-	syndrome = sdram_ecc ^ comp_ecc;
-
-	/* first bit clear in ECC Err Reg, 1 bit error, correctable by HW */
-	if (!(reg & 0x1))
-		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1,
-				     err_addr >> PAGE_SHIFT,
-				     err_addr & PAGE_MASK, syndrome,
-				     0, 0, -1,
-				     mci->ctl_name, "");
-	else	/* 2 bit error, UE */
-		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1,
-				     err_addr >> PAGE_SHIFT,
-				     err_addr & PAGE_MASK, 0,
-				     0, 0, -1,
-				     mci->ctl_name, "");
-
-	/* clear the error */
-	writel(0, pdata->mc_vbase + MV64X60_SDRAM_ERR_ADDR);
-}
-
-static irqreturn_t mv64x60_mc_isr(int irq, void *dev_id)
-{
-	struct mem_ctl_info *mci = dev_id;
-	struct mv64x60_mc_pdata *pdata = mci->pvt_info;
-	u32 reg;
-
-	reg = readl(pdata->mc_vbase + MV64X60_SDRAM_ERR_ADDR);
-	if (!reg)
-		return IRQ_NONE;
-
-	/* writing 0's to the ECC err addr in check function clears irq */
-	mv64x60_mc_check(mci);
-
-	return IRQ_HANDLED;
-}
-
-static void get_total_mem(struct mv64x60_mc_pdata *pdata)
-{
-	struct device_node *np = NULL;
-	const unsigned int *reg;
-
-	np = of_find_node_by_type(NULL, "memory");
-	if (!np)
-		return;
-
-	reg = of_get_property(np, "reg", NULL);
-
-	pdata->total_mem = reg[1];
-}
-
-static void mv64x60_init_csrows(struct mem_ctl_info *mci,
-				struct mv64x60_mc_pdata *pdata)
-{
-	struct csrow_info *csrow;
-	struct dimm_info *dimm;
-
-	u32 devtype;
-	u32 ctl;
-
-	get_total_mem(pdata);
-
-	ctl = readl(pdata->mc_vbase + MV64X60_SDRAM_CONFIG);
-
-	csrow = mci->csrows[0];
-	dimm = csrow->channels[0]->dimm;
-
-	dimm->nr_pages = pdata->total_mem >> PAGE_SHIFT;
-	dimm->grain = 8;
-
-	dimm->mtype = (ctl & MV64X60_SDRAM_REGISTERED) ? MEM_RDDR : MEM_DDR;
-
-	devtype = (ctl >> 20) & 0x3;
-	switch (devtype) {
-	case 0x0:
-		dimm->dtype = DEV_X32;
-		break;
-	case 0x2:		/* could be X8 too, but no way to tell */
-		dimm->dtype = DEV_X16;
-		break;
-	case 0x3:
-		dimm->dtype = DEV_X4;
-		break;
-	default:
-		dimm->dtype = DEV_UNKNOWN;
-		break;
-	}
-
-	dimm->edac_mode = EDAC_SECDED;
-}
-
-static int mv64x60_mc_err_probe(struct platform_device *pdev)
-{
-	struct mem_ctl_info *mci;
-	struct edac_mc_layer layers[2];
-	struct mv64x60_mc_pdata *pdata;
-	struct resource *r;
-	u32 ctl;
-	int res = 0;
-
-	if (!devres_open_group(&pdev->dev, mv64x60_mc_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
-	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
-	layers[0].size = 1;
-	layers[0].is_virt_csrow = true;
-	layers[1].type = EDAC_MC_LAYER_CHANNEL;
-	layers[1].size = 1;
-	layers[1].is_virt_csrow = false;
-	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
-			    sizeof(struct mv64x60_mc_pdata));
-	if (!mci) {
-		printk(KERN_ERR "%s: No memory for CPU err\n", __func__);
-		devres_release_group(&pdev->dev, mv64x60_mc_err_probe);
-		return -ENOMEM;
-	}
-
-	pdata = mci->pvt_info;
-	mci->pdev = &pdev->dev;
-	platform_set_drvdata(pdev, mci);
-	pdata->name = "mv64x60_mc_err";
-	mci->dev_name = dev_name(&pdev->dev);
-	pdata->edac_idx = edac_mc_idx++;
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		printk(KERN_ERR "%s: Unable to get resource for "
-		       "MC err regs\n", __func__);
-		res = -ENOENT;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdata->name)) {
-		printk(KERN_ERR "%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->mc_vbase = devm_ioremap(&pdev->dev,
-				       r->start,
-				       resource_size(r));
-	if (!pdata->mc_vbase) {
-		printk(KERN_ERR "%s: Unable to setup MC err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
-
-	ctl = readl(pdata->mc_vbase + MV64X60_SDRAM_CONFIG);
-	if (!(ctl & MV64X60_SDRAM_ECC)) {
-		/* Non-ECC RAM? */
-		printk(KERN_WARNING "%s: No ECC DIMMs discovered\n", __func__);
-		res = -ENODEV;
-		goto err;
-	}
-
-	edac_dbg(3, "init mci\n");
-	mci->mtype_cap = MEM_FLAG_RDDR | MEM_FLAG_DDR;
-	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
-	mci->edac_cap = EDAC_FLAG_SECDED;
-	mci->mod_name = EDAC_MOD_STR;
-	mci->ctl_name = mv64x60_ctl_name;
-
-	if (edac_op_state == EDAC_OPSTATE_POLL)
-		mci->edac_check = mv64x60_mc_check;
-
-	mci->ctl_page_to_phys = NULL;
-
-	mci->scrub_mode = SCRUB_SW_SRC;
-
-	mv64x60_init_csrows(mci, pdata);
-
-	/* setup MC registers */
-	writel(0, pdata->mc_vbase + MV64X60_SDRAM_ERR_ADDR);
-	ctl = readl(pdata->mc_vbase + MV64X60_SDRAM_ERR_ECC_CNTL);
-	ctl = (ctl & 0xff00ffff) | 0x10000;
-	writel(ctl, pdata->mc_vbase + MV64X60_SDRAM_ERR_ECC_CNTL);
-
-	res = edac_mc_add_mc(mci);
-	if (res) {
-		edac_dbg(3, "failed edac_mc_add_mc()\n");
-		goto err;
-	}
-
-	if (edac_op_state == EDAC_OPSTATE_INT) {
-		/* acquire interrupt that reports errors */
-		pdata->irq = platform_get_irq(pdev, 0);
-		res = devm_request_irq(&pdev->dev,
-				       pdata->irq,
-				       mv64x60_mc_isr,
-				       0,
-				       "[EDAC] MC err",
-				       mci);
-		if (res < 0) {
-			printk(KERN_ERR "%s: Unable to request irq %d for "
-			       "MV64x60 DRAM ERR\n", __func__, pdata->irq);
-			res = -ENODEV;
-			goto err2;
-		}
-
-		printk(KERN_INFO EDAC_MOD_STR " acquired irq %d for MC Err\n",
-		       pdata->irq);
-	}
-
-	/* get this far and it's successful */
-	edac_dbg(3, "success\n");
-
-	return 0;
-
-err2:
-	edac_mc_del_mc(&pdev->dev);
-err:
-	devres_release_group(&pdev->dev, mv64x60_mc_err_probe);
-	edac_mc_free(mci);
-	return res;
-}
-
-static int mv64x60_mc_err_remove(struct platform_device *pdev)
-{
-	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
-
-	edac_dbg(0, "\n");
-
-	edac_mc_del_mc(&pdev->dev);
-	edac_mc_free(mci);
-	return 0;
-}
-
-static struct platform_driver mv64x60_mc_err_driver = {
-	.probe = mv64x60_mc_err_probe,
-	.remove = mv64x60_mc_err_remove,
-	.driver = {
-		   .name = "mv64x60_mc_err",
-	}
-};
-
-static struct platform_driver * const drivers[] = {
-	&mv64x60_mc_err_driver,
-	&mv64x60_cpu_err_driver,
-	&mv64x60_sram_err_driver,
-#ifdef CONFIG_PCI
-	&mv64x60_pci_err_driver,
-#endif
-};
-
-static int __init mv64x60_edac_init(void)
-{
-
-	printk(KERN_INFO "Marvell MV64x60 EDAC driver " MV64x60_REVISION "\n");
-	printk(KERN_INFO "\t(C) 2006-2007 MontaVista Software\n");
-
-	/* make sure error reporting method is sane */
-	switch (edac_op_state) {
-	case EDAC_OPSTATE_POLL:
-	case EDAC_OPSTATE_INT:
-		break;
-	default:
-		edac_op_state = EDAC_OPSTATE_INT;
-		break;
-	}
-
-	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
-}
-module_init(mv64x60_edac_init);
-
-static void __exit mv64x60_edac_exit(void)
-{
-	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
-}
-module_exit(mv64x60_edac_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Montavista Software, Inc.");
-module_param(edac_op_state, int, 0444);
-MODULE_PARM_DESC(edac_op_state,
-		 "EDAC Error Reporting state: 0=Poll, 2=Interrupt");
diff --git a/drivers/edac/mv64x60_edac.h b/drivers/edac/mv64x60_edac.h
deleted file mode 100644
index c7f209c92a1a..000000000000
--- a/drivers/edac/mv64x60_edac.h
+++ /dev/null
@@ -1,114 +0,0 @@
-/*
- * EDAC defs for Marvell MV64x60 bridge chip
- *
- * Author: Dave Jiang <djiang@mvista.com>
- *
- * 2007 (c) MontaVista Software, Inc. This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
- *
- */
-#ifndef _MV64X60_EDAC_H_
-#define _MV64X60_EDAC_H_
-
-#define MV64x60_REVISION " Ver: 2.0.0"
-#define EDAC_MOD_STR	"MV64x60_edac"
-
-#define mv64x60_printk(level, fmt, arg...) \
-	edac_printk(level, "MV64x60", fmt, ##arg)
-
-#define mv64x60_mc_printk(mci, level, fmt, arg...) \
-	edac_mc_chipset_printk(mci, level, "MV64x60", fmt, ##arg)
-
-/* CPU Error Report Registers */
-#define MV64x60_CPU_ERR_ADDR_LO		0x00	/* 0x0070 */
-#define MV64x60_CPU_ERR_ADDR_HI		0x08	/* 0x0078 */
-#define MV64x60_CPU_ERR_DATA_LO		0x00	/* 0x0128 */
-#define MV64x60_CPU_ERR_DATA_HI		0x08	/* 0x0130 */
-#define MV64x60_CPU_ERR_PARITY		0x10	/* 0x0138 */
-#define MV64x60_CPU_ERR_CAUSE		0x18	/* 0x0140 */
-#define MV64x60_CPU_ERR_MASK		0x20	/* 0x0148 */
-
-#define MV64x60_CPU_CAUSE_MASK		0x07ffffff
-
-/* SRAM Error Report Registers */
-#define MV64X60_SRAM_ERR_CAUSE		0x08	/* 0x0388 */
-#define MV64X60_SRAM_ERR_ADDR_LO	0x10	/* 0x0390 */
-#define MV64X60_SRAM_ERR_ADDR_HI	0x78	/* 0x03f8 */
-#define MV64X60_SRAM_ERR_DATA_LO	0x18	/* 0x0398 */
-#define MV64X60_SRAM_ERR_DATA_HI	0x20	/* 0x03a0 */
-#define MV64X60_SRAM_ERR_PARITY		0x28	/* 0x03a8 */
-
-/* SDRAM Controller Registers */
-#define MV64X60_SDRAM_CONFIG		0x00	/* 0x1400 */
-#define MV64X60_SDRAM_ERR_DATA_HI	0x40	/* 0x1440 */
-#define MV64X60_SDRAM_ERR_DATA_LO	0x44	/* 0x1444 */
-#define MV64X60_SDRAM_ERR_ECC_RCVD	0x48	/* 0x1448 */
-#define MV64X60_SDRAM_ERR_ECC_CALC	0x4c	/* 0x144c */
-#define MV64X60_SDRAM_ERR_ADDR		0x50	/* 0x1450 */
-#define MV64X60_SDRAM_ERR_ECC_CNTL	0x54	/* 0x1454 */
-#define MV64X60_SDRAM_ERR_ECC_ERR_CNT	0x58	/* 0x1458 */
-
-#define MV64X60_SDRAM_REGISTERED	0x20000
-#define MV64X60_SDRAM_ECC		0x40000
-
-#ifdef CONFIG_PCI
-/*
- * Bit 0 of MV64x60_PCIx_ERR_MASK does not exist on the 64360 and because of
- * errata FEr-#11 and FEr-##16 for the 64460, it should be 0 on that chip as
- * well.  IOW, don't set bit 0.
- */
-#define MV64X60_PCIx_ERR_MASK_VAL	0x00a50c24
-
-/* Register offsets from PCIx error address low register */
-#define MV64X60_PCI_ERROR_ADDR_LO	0x00
-#define MV64X60_PCI_ERROR_ADDR_HI	0x04
-#define MV64X60_PCI_ERROR_ATTR		0x08
-#define MV64X60_PCI_ERROR_CMD		0x10
-#define MV64X60_PCI_ERROR_CAUSE		0x18
-#define MV64X60_PCI_ERROR_MASK		0x1c
-
-#define MV64X60_PCI_ERR_SWrPerr		0x0002
-#define MV64X60_PCI_ERR_SRdPerr		0x0004
-#define	MV64X60_PCI_ERR_MWrPerr		0x0020
-#define MV64X60_PCI_ERR_MRdPerr		0x0040
-
-#define MV64X60_PCI_PE_MASK	(MV64X60_PCI_ERR_SWrPerr | \
-				MV64X60_PCI_ERR_SRdPerr | \
-				MV64X60_PCI_ERR_MWrPerr | \
-				MV64X60_PCI_ERR_MRdPerr)
-
-struct mv64x60_pci_pdata {
-	int pci_hose;
-	void __iomem *pci_vbase;
-	char *name;
-	int irq;
-	int edac_idx;
-};
-
-#endif				/* CONFIG_PCI */
-
-struct mv64x60_mc_pdata {
-	void __iomem *mc_vbase;
-	int total_mem;
-	char *name;
-	int irq;
-	int edac_idx;
-};
-
-struct mv64x60_cpu_pdata {
-	void __iomem *cpu_vbase[2];
-	char *name;
-	int irq;
-	int edac_idx;
-};
-
-struct mv64x60_sram_pdata {
-	void __iomem *sram_vbase;
-	char *name;
-	int irq;
-	int edac_idx;
-};
-
-#endif
-- 
2.25.1

