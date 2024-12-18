Return-Path: <linuxppc-dev+bounces-4314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188639F6432
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFK1jqCz30fh;
	Wed, 18 Dec 2024 21:55:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519349;
	cv=none; b=md/IzppiCiRyV0hGWK9thrLia1HsIws3bBFe+Rz3p9Qi9THi2sAwqJbYLm6qRXE/l8g/b4v/KWEc3xqs/WURrJUXQ+o7vxsx7JzjfUx1Hc6H1qy3j0q8jRVsof/nGu6xrzMVQOjfYTTctECEp45cKhltwXY//P0o2yJzTtCuYqxg2bHL3weDThTQToyug9E3hDnYUfF3KEXctpyi1K42H9MGJENhE0B37gvMJlzxif2UvlqUx3IBDp6cf+x8l+XjwNIQFUR5XaqpN/luUZJDI8+GhvUT/5eTKCOi6p9jVyQYKefE2DB8xj4GOzswUmPtMjQXt0QTJ91n7WJtVlc2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519349; c=relaxed/relaxed;
	bh=Eq6gua8Dj6zc9FayHosBZJTleTGFwuxWgRUbrXp9WMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nI++AuA8GdQfLHlydewQ1ZXuHbfNvI4guOeIcxcectDDUuAffO2Kg8GW/mOfg2/7rIqEJD8huqKxP8n4lyuxEWimdrUCkv3b4VaojLCsiZjVxD/p8KfJM4QPcnd+kueRXveOjcgQGHT6UcpguF0+ivsVsbatLa5MQ7f/dGCZT9IeAL80lyXaquEdb/figkO5XJ29CkBeov6+xUy6ynmNiUtEmQKqfO1DLNaS3YL/TPTf6Oy0nlZwQtfncDUSHN2JBhm/OtYCWlCU3v6C6EPtAEDIwywmephTf6L5DwFHmp5b2MEX3wJRJ9AjAbIxIW8TvPs+M9Nji4ENZGJy+64enQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G89mkHv1; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=G89mkHv1;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrFD3bqpz30YT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519337;
	bh=Eq6gua8Dj6zc9FayHosBZJTleTGFwuxWgRUbrXp9WMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G89mkHv1LuhfnrREZy6z4Udr4dxCM4FpDNjSTxvyR6NgNMnf+SmSLKOm6PqHI5b4I
	 B2Df52gM4kaQkN6l7ehM62AX2zQXydoT2KGnMWHmS/FiHi1qUROpe9GADI8CFANgV/
	 MVlR44NiuceVUyh81b+YbNrxr7/FM78JCyKoK4qL+uwIW5mm6ZttIluF+f3ylM1BQl
	 wEipSAP22mPuIxegoCeixUxaEe/BYsTpXohJ0iKm1Hum7qFkhyueEE1VGFvG2AW9Hj
	 hgGG92/FWLKY6DeDCRNayvogL1ylWuyjEoZfhGwUfykNVK43E73XZClEZS75p/nvih
	 3YbBNcKQMp8lA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF52D5fz4xfg;
	Wed, 18 Dec 2024 21:55:37 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>,
	linux-edac@vger.kernel.org
Subject: [PATCH v2 23/25] EDAC/cell: Remove powerpc Cell driver
Date: Wed, 18 Dec 2024 21:55:11 +1100
Message-ID: <20241218105523.416573-23-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This driver can no longer be built since support for IBM Cell Blades was
removed, in particular PPC_CELL_COMMON.

Remove the driver.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Rebase.

Cc: linux-edac@vger.kernel.org

 drivers/edac/Kconfig     |   8 --
 drivers/edac/Makefile    |   2 -
 drivers/edac/cell_edac.c | 281 ---------------------------------------
 3 files changed, 291 deletions(-)
 delete mode 100644 drivers/edac/cell_edac.c

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 06f7b43a6f78..766378ceecc6 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -303,14 +303,6 @@ config EDAC_PASEMI
 	  Support for error detection and correction on PA Semi
 	  PWRficient.
 
-config EDAC_CELL
-	tristate "Cell Broadband Engine memory controller"
-	depends on PPC_CELL_COMMON
-	help
-	  Support for error detection and correction on the
-	  Cell Broadband Engine internal memory controller
-	  on platform without a hypervisor
-
 config EDAC_CPC925
 	tristate "IBM CPC925 Memory Controller (PPC970FX)"
 	depends on PPC64
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index f9cf19d8d13d..a45a913b0270 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -62,8 +62,6 @@ obj-$(CONFIG_EDAC_SKX)			+= skx_edac.o skx_edac_common.o
 i10nm_edac-y				:= i10nm_base.o
 obj-$(CONFIG_EDAC_I10NM)		+= i10nm_edac.o skx_edac_common.o
 
-obj-$(CONFIG_EDAC_CELL)			+= cell_edac.o
-
 obj-$(CONFIG_EDAC_HIGHBANK_MC)		+= highbank_mc_edac.o
 obj-$(CONFIG_EDAC_HIGHBANK_L2)		+= highbank_l2_edac.o
 
diff --git a/drivers/edac/cell_edac.c b/drivers/edac/cell_edac.c
deleted file mode 100644
index c2420e2287ff..000000000000
--- a/drivers/edac/cell_edac.c
+++ /dev/null
@@ -1,281 +0,0 @@
-/*
- * Cell MIC driver for ECC counting
- *
- * Copyright 2007 Benjamin Herrenschmidt, IBM Corp.
- *                <benh@kernel.crashing.org>
- *
- * This file may be distributed under the terms of the
- * GNU General Public License.
- */
-#undef DEBUG
-
-#include <linux/edac.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/stop_machine.h>
-#include <linux/io.h>
-#include <linux/of_address.h>
-#include <asm/machdep.h>
-#include <asm/cell-regs.h>
-
-#include "edac_module.h"
-
-struct cell_edac_priv
-{
-	struct cbe_mic_tm_regs __iomem	*regs;
-	int				node;
-	int				chanmask;
-#ifdef DEBUG
-	u64				prev_fir;
-#endif
-};
-
-static void cell_edac_count_ce(struct mem_ctl_info *mci, int chan, u64 ar)
-{
-	struct cell_edac_priv		*priv = mci->pvt_info;
-	struct csrow_info		*csrow = mci->csrows[0];
-	unsigned long			address, pfn, offset, syndrome;
-
-	dev_dbg(mci->pdev, "ECC CE err on node %d, channel %d, ar = 0x%016llx\n",
-		priv->node, chan, ar);
-
-	/* Address decoding is likely a bit bogus, to dbl check */
-	address = (ar & 0xffffffffe0000000ul) >> 29;
-	if (priv->chanmask == 0x3)
-		address = (address << 1) | chan;
-	pfn = address >> PAGE_SHIFT;
-	offset = address & ~PAGE_MASK;
-	syndrome = (ar & 0x000000001fe00000ul) >> 21;
-
-	/* TODO: Decoding of the error address */
-	edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1,
-			     csrow->first_page + pfn, offset, syndrome,
-			     0, chan, -1, "", "");
-}
-
-static void cell_edac_count_ue(struct mem_ctl_info *mci, int chan, u64 ar)
-{
-	struct cell_edac_priv		*priv = mci->pvt_info;
-	struct csrow_info		*csrow = mci->csrows[0];
-	unsigned long			address, pfn, offset;
-
-	dev_dbg(mci->pdev, "ECC UE err on node %d, channel %d, ar = 0x%016llx\n",
-		priv->node, chan, ar);
-
-	/* Address decoding is likely a bit bogus, to dbl check */
-	address = (ar & 0xffffffffe0000000ul) >> 29;
-	if (priv->chanmask == 0x3)
-		address = (address << 1) | chan;
-	pfn = address >> PAGE_SHIFT;
-	offset = address & ~PAGE_MASK;
-
-	/* TODO: Decoding of the error address */
-	edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1,
-			     csrow->first_page + pfn, offset, 0,
-			     0, chan, -1, "", "");
-}
-
-static void cell_edac_check(struct mem_ctl_info *mci)
-{
-	struct cell_edac_priv		*priv = mci->pvt_info;
-	u64				fir, addreg, clear = 0;
-
-	fir = in_be64(&priv->regs->mic_fir);
-#ifdef DEBUG
-	if (fir != priv->prev_fir) {
-		dev_dbg(mci->pdev, "fir change : 0x%016lx\n", fir);
-		priv->prev_fir = fir;
-	}
-#endif
-	if ((priv->chanmask & 0x1) && (fir & CBE_MIC_FIR_ECC_SINGLE_0_ERR)) {
-		addreg = in_be64(&priv->regs->mic_df_ecc_address_0);
-		clear |= CBE_MIC_FIR_ECC_SINGLE_0_RESET;
-		cell_edac_count_ce(mci, 0, addreg);
-	}
-	if ((priv->chanmask & 0x2) && (fir & CBE_MIC_FIR_ECC_SINGLE_1_ERR)) {
-		addreg = in_be64(&priv->regs->mic_df_ecc_address_1);
-		clear |= CBE_MIC_FIR_ECC_SINGLE_1_RESET;
-		cell_edac_count_ce(mci, 1, addreg);
-	}
-	if ((priv->chanmask & 0x1) && (fir & CBE_MIC_FIR_ECC_MULTI_0_ERR)) {
-		addreg = in_be64(&priv->regs->mic_df_ecc_address_0);
-		clear |= CBE_MIC_FIR_ECC_MULTI_0_RESET;
-		cell_edac_count_ue(mci, 0, addreg);
-	}
-	if ((priv->chanmask & 0x2) && (fir & CBE_MIC_FIR_ECC_MULTI_1_ERR)) {
-		addreg = in_be64(&priv->regs->mic_df_ecc_address_1);
-		clear |= CBE_MIC_FIR_ECC_MULTI_1_RESET;
-		cell_edac_count_ue(mci, 1, addreg);
-	}
-
-	/* The procedure for clearing FIR bits is a bit ... weird */
-	if (clear) {
-		fir &= ~(CBE_MIC_FIR_ECC_ERR_MASK | CBE_MIC_FIR_ECC_SET_MASK);
-		fir |= CBE_MIC_FIR_ECC_RESET_MASK;
-		fir &= ~clear;
-		out_be64(&priv->regs->mic_fir, fir);
-		(void)in_be64(&priv->regs->mic_fir);
-
-		mb();	/* sync up */
-#ifdef DEBUG
-		fir = in_be64(&priv->regs->mic_fir);
-		dev_dbg(mci->pdev, "fir clear  : 0x%016lx\n", fir);
-#endif
-	}
-}
-
-static void cell_edac_init_csrows(struct mem_ctl_info *mci)
-{
-	struct csrow_info		*csrow = mci->csrows[0];
-	struct dimm_info		*dimm;
-	struct cell_edac_priv		*priv = mci->pvt_info;
-	struct device_node		*np;
-	int				j;
-	u32				nr_pages;
-
-	for_each_node_by_name(np, "memory") {
-		struct resource r;
-
-		/* We "know" that the Cell firmware only creates one entry
-		 * in the "memory" nodes. If that changes, this code will
-		 * need to be adapted.
-		 */
-		if (of_address_to_resource(np, 0, &r))
-			continue;
-		if (of_node_to_nid(np) != priv->node)
-			continue;
-		csrow->first_page = r.start >> PAGE_SHIFT;
-		nr_pages = resource_size(&r) >> PAGE_SHIFT;
-		csrow->last_page = csrow->first_page + nr_pages - 1;
-
-		for (j = 0; j < csrow->nr_channels; j++) {
-			dimm = csrow->channels[j]->dimm;
-			dimm->mtype = MEM_XDR;
-			dimm->edac_mode = EDAC_SECDED;
-			dimm->nr_pages = nr_pages / csrow->nr_channels;
-		}
-		dev_dbg(mci->pdev,
-			"Initialized on node %d, chanmask=0x%x,"
-			" first_page=0x%lx, nr_pages=0x%x\n",
-			priv->node, priv->chanmask,
-			csrow->first_page, nr_pages);
-		break;
-	}
-	of_node_put(np);
-}
-
-static int cell_edac_probe(struct platform_device *pdev)
-{
-	struct cbe_mic_tm_regs __iomem	*regs;
-	struct mem_ctl_info		*mci;
-	struct edac_mc_layer		layers[2];
-	struct cell_edac_priv		*priv;
-	u64				reg;
-	int				rc, chanmask, num_chans;
-
-	regs = cbe_get_cpu_mic_tm_regs(cbe_node_to_cpu(pdev->id));
-	if (regs == NULL)
-		return -ENODEV;
-
-	edac_op_state = EDAC_OPSTATE_POLL;
-
-	/* Get channel population */
-	reg = in_be64(&regs->mic_mnt_cfg);
-	dev_dbg(&pdev->dev, "MIC_MNT_CFG = 0x%016llx\n", reg);
-	chanmask = 0;
-	if (reg & CBE_MIC_MNT_CFG_CHAN_0_POP)
-		chanmask |= 0x1;
-	if (reg & CBE_MIC_MNT_CFG_CHAN_1_POP)
-		chanmask |= 0x2;
-	if (chanmask == 0) {
-		dev_warn(&pdev->dev,
-			 "Yuck ! No channel populated ? Aborting !\n");
-		return -ENODEV;
-	}
-	dev_dbg(&pdev->dev, "Initial FIR = 0x%016llx\n",
-		in_be64(&regs->mic_fir));
-
-	/* Allocate & init EDAC MC data structure */
-	num_chans = chanmask == 3 ? 2 : 1;
-
-	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
-	layers[0].size = 1;
-	layers[0].is_virt_csrow = true;
-	layers[1].type = EDAC_MC_LAYER_CHANNEL;
-	layers[1].size = num_chans;
-	layers[1].is_virt_csrow = false;
-	mci = edac_mc_alloc(pdev->id, ARRAY_SIZE(layers), layers,
-			    sizeof(struct cell_edac_priv));
-	if (mci == NULL)
-		return -ENOMEM;
-	priv = mci->pvt_info;
-	priv->regs = regs;
-	priv->node = pdev->id;
-	priv->chanmask = chanmask;
-	mci->pdev = &pdev->dev;
-	mci->mtype_cap = MEM_FLAG_XDR;
-	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_EC | EDAC_FLAG_SECDED;
-	mci->edac_cap = EDAC_FLAG_EC | EDAC_FLAG_SECDED;
-	mci->mod_name = "cell_edac";
-	mci->ctl_name = "MIC";
-	mci->dev_name = dev_name(&pdev->dev);
-	mci->edac_check = cell_edac_check;
-	cell_edac_init_csrows(mci);
-
-	/* Register with EDAC core */
-	rc = edac_mc_add_mc(mci);
-	if (rc) {
-		dev_err(&pdev->dev, "failed to register with EDAC core\n");
-		edac_mc_free(mci);
-		return rc;
-	}
-
-	return 0;
-}
-
-static void cell_edac_remove(struct platform_device *pdev)
-{
-	struct mem_ctl_info *mci = edac_mc_del_mc(&pdev->dev);
-	if (mci)
-		edac_mc_free(mci);
-}
-
-static struct platform_driver cell_edac_driver = {
-	.driver		= {
-		.name	= "cbe-mic",
-	},
-	.probe		= cell_edac_probe,
-	.remove		= cell_edac_remove,
-};
-
-static int __init cell_edac_init(void)
-{
-	/* Sanity check registers data structure */
-	BUILD_BUG_ON(offsetof(struct cbe_mic_tm_regs,
-			      mic_df_ecc_address_0) != 0xf8);
-	BUILD_BUG_ON(offsetof(struct cbe_mic_tm_regs,
-			      mic_df_ecc_address_1) != 0x1b8);
-	BUILD_BUG_ON(offsetof(struct cbe_mic_tm_regs,
-			      mic_df_config) != 0x218);
-	BUILD_BUG_ON(offsetof(struct cbe_mic_tm_regs,
-			      mic_fir) != 0x230);
-	BUILD_BUG_ON(offsetof(struct cbe_mic_tm_regs,
-			      mic_mnt_cfg) != 0x210);
-	BUILD_BUG_ON(offsetof(struct cbe_mic_tm_regs,
-			      mic_exc) != 0x208);
-
-	return platform_driver_register(&cell_edac_driver);
-}
-
-static void __exit cell_edac_exit(void)
-{
-	platform_driver_unregister(&cell_edac_driver);
-}
-
-module_init(cell_edac_init);
-module_exit(cell_edac_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Benjamin Herrenschmidt <benh@kernel.crashing.org>");
-MODULE_DESCRIPTION("ECC counting for Cell MIC");
-- 
2.47.1


