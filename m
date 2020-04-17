Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1711AE3BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 19:23:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493jcP49vdzDrhM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 03:23:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.18; helo=m17618.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493jZb4hYqzDrgN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 03:22:15 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.227])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id BAAE54E12BB;
 Sat, 18 Apr 2020 01:21:53 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] drivers: uio: new driver uio_fsl_85xx_cache_sram
Date: Fri, 17 Apr 2020 10:21:30 -0700
Message-Id: <20200417172130.14287-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VNQk9CQkJNQk9DSU9JSVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Okk6KAw5Vjg4NA5JMRYOQksz
 Dx5PCgNVSlVKTkNMSk9PSkpNSEpLVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlMWVdZCAFZQUpPQkpNNwY+
X-HM-Tid: 0a7189293f939376kuwsbaae54e12bb
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
Cc: robh@kernel.org, oss@buserror.net, kernel@vivo.com,
 Wang Wenhu <wenhu.wang@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implements a new uio driver for freescale 85xx platforms to access
the Cache-Sram form user level. It is extremely helpful for the user
space applications that require high performance memory accesses.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
---
 drivers/uio/Kconfig                   |   8 +
 drivers/uio/Makefile                  |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c | 407 ++++++++++++++++++++++++++
 3 files changed, 416 insertions(+)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index 202ee81cfc2b..f6e6ec0089c0 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -105,6 +105,14 @@ config UIO_NETX
 	  To compile this driver as a module, choose M here; the module
 	  will be called uio_netx.
 
+config UIO_FSL_85XX_CACHE_SRAM
+	tristate "Freescale MPC85xx Cache-Sram driver"
+	depends on FSL_SOC_BOOKE && PPC32 && !FSL_85XX_CACHE_SRAM
+	help
+	  Generic driver for accessing the Cache-Sram form user level. This
+	  is extremely helpful for some user-space applications that require
+	  high performance memory accesses.
+
 config UIO_FSL_ELBC_GPCM
 	tristate "eLBC/GPCM driver"
 	depends on FSL_LBC
diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
index c285dd2a4539..be2056cffc21 100644
--- a/drivers/uio/Makefile
+++ b/drivers/uio/Makefile
@@ -10,4 +10,5 @@ obj-$(CONFIG_UIO_NETX)	+= uio_netx.o
 obj-$(CONFIG_UIO_PRUSS)         += uio_pruss.o
 obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
 obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
+obj-$(CONFIG_UIO_FSL_85XX_CACHE_SRAM)	+= uio_fsl_85xx_cache_sram.o
 obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
diff --git a/drivers/uio/uio_fsl_85xx_cache_sram.c b/drivers/uio/uio_fsl_85xx_cache_sram.c
new file mode 100644
index 000000000000..312ca38e93e1
--- /dev/null
+++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
@@ -0,0 +1,407 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/uio_driver.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/of_address.h>
+
+#define DRIVER_NAME	"uio_fsl_85xx_cache_sram"
+#define UIO_INFO_VER	"devicetree,pseudo"
+
+#define MAX_SRAM_UIO_INFOS	5
+
+#define L2CR_L2FI		0x40000000	/* L2 flash invalidate */
+#define L2CR_SRAM_FULL		0x00010000	/* L2SRAM full size */
+#define L2CR_SRAM_HALF		0x00020000	/* L2SRAM half size */
+#define L2CR_SRAM_QUART		0x00040000	/* L2SRAM one quarter size */
+#define L2CR_SRAM_EIGHTH	0x00060000	/* L2SRAM one eighth size */
+
+#define L2SRAM_BAR_MSK_LO18	0xFFFFC000	/* Lower 18 bits */
+#define L2SRAM_BARE_MSK_HI4	0x0000000F	/* Upper 4 bits */
+
+enum cache_sram_lock_ways {
+	LOCK_WAYS_ZERO,
+	LOCK_WAYS_EIGHTH,
+	LOCK_WAYS_TWO_EIGHTH,
+	LOCK_WAYS_HALF = 4,
+	LOCK_WAYS_FULL = 8,
+};
+
+struct mpc85xx_l2ctlr {
+	u32	ctl;		/* 0x000 - L2 control */
+	u8	res1[0xC];
+	u32	ewar0;		/* 0x010 - External write address 0 */
+	u32	ewarea0;	/* 0x014 - External write address extended 0 */
+	u32	ewcr0;		/* 0x018 - External write ctrl */
+	u8	res2[4];
+	u32	ewar1;		/* 0x020 - External write address 1 */
+	u32	ewarea1;	/* 0x024 - External write address extended 1 */
+	u32	ewcr1;		/* 0x028 - External write ctrl 1 */
+	u8	res3[4];
+	u32	ewar2;		/* 0x030 - External write address 2 */
+	u32	ewarea2;	/* 0x034 - External write address extended 2 */
+	u32	ewcr2;		/* 0x038 - External write ctrl 2 */
+	u8	res4[4];
+	u32	ewar3;		/* 0x040 - External write address 3 */
+	u32	ewarea3;	/* 0x044 - External write address extended 3 */
+	u32	ewcr3;		/* 0x048 - External write ctrl 3 */
+	u8	res5[0xB4];
+	u32	srbar0;		/* 0x100 - SRAM base address 0 */
+	u32	srbarea0;	/* 0x104 - SRAM base addr reg ext address 0 */
+	u32	srbar1;		/* 0x108 - SRAM base address 1 */
+	u32	srbarea1;	/* 0x10C - SRAM base addr reg ext address 1 */
+	u8	res6[0xCF0];
+	u32	errinjhi;	/* 0xE00 - Error injection mask high */
+	u32	errinjlo;	/* 0xE04 - Error injection mask low */
+	u32	errinjctl;	/* 0xE08 - Error injection tag/ecc control */
+	u8	res7[0x14];
+	u32	captdatahi;	/* 0xE20 - Error data high capture */
+	u32	captdatalo;	/* 0xE24 - Error data low capture */
+	u32	captecc;	/* 0xE28 - Error syndrome */
+	u8	res8[0x14];
+	u32	errdet;		/* 0xE40 - Error detect */
+	u32	errdis;		/* 0xE44 - Error disable */
+	u32	errinten;	/* 0xE48 - Error interrupt enable */
+	u32	errattr;	/* 0xE4c - Error attribute capture */
+	u32	erradrrl;	/* 0xE50 - Error address capture low */
+	u32	erradrrh;	/* 0xE54 - Error address capture high */
+	u32	errctl;		/* 0xE58 - Error control */
+	u8	res9[0x1A4];
+};
+
+/**
+ * struct uio_cache_sram - controller for cache-sram and uio devices
+ *
+ * @base_phys:	physical address of cache-sram
+ * @base_virt:	mapped virtual address of cache-sram
+ * @size:	size of the sram could be used by user
+ * @alloced:	size of the sram allocated while initiating uio_infos
+ * @l2cache_size: total size of the cache-sram
+ * @l2ctlr:	address of the l2-controller
+ * @info_count:	count of the uio devices(info) for the cache-sram
+ * @uio_infos:	address array of the uio devices(info)
+ */
+struct uio_cache_sram {
+	phys_addr_t base_phys;
+	void *base_virt;
+	unsigned int size;
+	unsigned int alloced;
+
+	unsigned int l2cache_size;
+
+	struct mpc85xx_l2ctlr __iomem *l2ctlr;
+
+	unsigned int info_count;
+	struct uio_info *uio_infos[MAX_SRAM_UIO_INFOS];
+};
+
+static int of_init_cache_sram(struct device_node *node,
+			      struct uio_cache_sram *cache_sram)
+{
+	const __be32 *cell;
+
+	if (of_property_read_u32(node, "cache-size",
+				&cache_sram->l2cache_size)) {
+		pr_err("%pOF: missing cache-size property\n", node);
+		return -EINVAL;
+	}
+
+	cell = of_get_property(node, "sram-range", NULL);
+	if (!cell) {
+		pr_err("%pOF: missing sram-range property\n", node);
+		return -EINVAL;
+	}
+
+	cache_sram->base_phys = of_read_number(cell, of_n_addr_cells(node));
+	cache_sram->size = of_read_number(cell + of_n_addr_cells(node),
+					  of_n_size_cells(node));
+
+	return 0;
+}
+
+static void l2ctrl_init(struct uio_cache_sram *cache_sram)
+{
+	struct mpc85xx_l2ctlr *l2ctlr = cache_sram->l2ctlr;
+
+	/* Write bits[0-17] to srbar0 */
+	out_be32(&l2ctlr->srbar0,
+		 lower_32_bits(cache_sram->base_phys) & L2SRAM_BAR_MSK_LO18);
+
+	/* Write bits[18-21] to srbare0 */
+#ifdef CONFIG_PHYS_64BIT
+	out_be32(&l2ctlr->srbarea0,
+		 upper_32_bits(cache_sram->base_phys) & L2SRAM_BARE_MSK_HI4);
+#endif
+
+	clrsetbits_be32(&l2ctlr->ctl, L2CR_L2E, L2CR_L2FI);
+
+	switch (LOCK_WAYS_FULL * cache_sram->size / cache_sram->l2cache_size) {
+	case LOCK_WAYS_EIGHTH:
+		setbits32(&l2ctlr->ctl,
+			  L2CR_L2E | L2CR_L2FI | L2CR_SRAM_EIGHTH);
+		break;
+
+	case LOCK_WAYS_TWO_EIGHTH:
+		setbits32(&l2ctlr->ctl,
+			  L2CR_L2E | L2CR_L2FI | L2CR_SRAM_QUART);
+		break;
+
+	case LOCK_WAYS_HALF:
+		setbits32(&l2ctlr->ctl,
+			  L2CR_L2E | L2CR_L2FI | L2CR_SRAM_HALF);
+		break;
+
+	case LOCK_WAYS_FULL:
+	default:
+		setbits32(&l2ctlr->ctl,
+			  L2CR_L2E | L2CR_L2FI | L2CR_SRAM_FULL);
+		break;
+	}
+	eieio();
+}
+
+static int uio_cache_sram_init(struct platform_device *pdev,
+			       struct uio_cache_sram *cache_sram)
+{
+	struct device_node *node = pdev->dev.of_node;
+	unsigned int rem;
+	unsigned char ways;
+	int ret;
+
+	ret = of_init_cache_sram(node, cache_sram);
+	if (ret)
+		return ret;
+
+	rem = cache_sram->l2cache_size % cache_sram->size;
+	ways = LOCK_WAYS_FULL * cache_sram->size / cache_sram->l2cache_size;
+	if (rem || (ways & (ways - 1))) {
+		dev_err(&pdev->dev, "Illegal cache-size in command line\n");
+		return -EINVAL;
+	}
+
+	cache_sram->l2ctlr = of_iomap(pdev->dev.of_node, 0);
+	if (!cache_sram->l2ctlr) {
+		dev_err(&pdev->dev, "error can't map l2-controller\n");
+		return -EINVAL;
+	}
+
+	l2ctrl_init(cache_sram);
+
+	if (!request_mem_region(cache_sram->base_phys, cache_sram->size,
+				"fsl_85xx_cache_sram")) {
+		dev_err(&pdev->dev, "%pOF: request memory failed\n",
+				pdev->dev.of_node);
+		ret = -ENXIO;
+		goto out_unmap;
+	}
+
+	cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
+						 cache_sram->size);
+	if (!cache_sram->base_virt) {
+		dev_err(&pdev->dev, "%pOF: ioremap_coherent failed\n",
+			pdev->dev.of_node);
+		ret = -ENOMEM;
+		goto out_release;
+	}
+
+	return 0;
+out_release:
+	release_mem_region(cache_sram->base_phys, cache_sram->size);
+out_unmap:
+	iounmap(cache_sram->l2ctlr);
+	return ret;
+}
+
+static int uio_cache_sram_destroy(struct uio_cache_sram *cache_sram)
+{
+	iounmap(cache_sram->l2ctlr);
+	iounmap(cache_sram->base_virt);
+	release_mem_region(cache_sram->base_phys, cache_sram->size);
+
+	return 0;
+}
+
+static void uio_info_free_internal(struct uio_info *info)
+{
+	int i;
+
+	for (i = 0; i < MAX_UIO_MAPS; i++) {
+		struct uio_mem *uiomem = &info->mem[i];
+
+		if (uiomem->internal_addr)
+			memset(uiomem, 0, sizeof(*uiomem));
+	}
+}
+
+void uio_infos_unregister(struct uio_cache_sram *cache_sram)
+{
+	int i;
+
+	for (i = 0; i < cache_sram->info_count; i++) {
+		uio_unregister_device(cache_sram->uio_infos[i]);
+		uio_info_free_internal(cache_sram->uio_infos[i]);
+		cache_sram->uio_infos[i] = NULL;
+	}
+
+	cache_sram->info_count = 0;
+}
+
+static int uio_fsl_85xx_cache_sram_probe(struct platform_device *pdev)
+{
+	struct device_node *parent = pdev->dev.of_node;
+	struct device_node *node = NULL;
+	struct uio_cache_sram *cache_sram;
+	struct uio_info *info;
+	struct uio_mem *uiomem;
+	const unsigned int *p;
+	struct property *prop;
+	const char *dt_name;
+	u32 size;
+	int ret;
+
+	cache_sram = devm_kzalloc(&pdev->dev, sizeof(*cache_sram), GFP_KERNEL);
+	if (!cache_sram)
+		return -ENOMEM;
+
+	ret = uio_cache_sram_init(pdev, cache_sram);
+	if (ret)
+		return ret;
+
+	for_each_child_of_node(parent, node) {
+		char buf[24];
+		int map_idx = 0;
+
+		/* alloc uio_info for one uio device */
+		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
+
+		/* get optional uio name */
+		if (of_property_read_string(parent, "uio_name", &dt_name)) {
+			sprintf(buf, "uio-sram%d", cache_sram->info_count);
+			dt_name = buf;
+		}
+
+		info->name = devm_kstrdup(&pdev->dev, dt_name, GFP_KERNEL);
+		if (!info->name)
+			return -ENOMEM;
+
+		of_property_for_each_u32(node, "uiomaps", prop, p, size) {
+			char name[10];
+
+			/* size should not be less than 2 */
+			if (size < 2) {
+				pr_err("size %x less than 2\n", size);
+				return -EINVAL;
+			}
+
+			/* size should be 2^n aligned */
+			if (size != roundup_pow_of_two(size)) {
+				pr_err("size %x is not 2^n algiend\n", size);
+				return -EINVAL;
+			}
+
+			if (cache_sram->alloced + size > cache_sram->size) {
+				pr_err("size %x too big\n", size);
+				return -EINVAL;
+			}
+
+			uiomem = &info->mem[map_idx];
+			uiomem->addr = cache_sram->base_phys +
+				       cache_sram->alloced;
+			uiomem->internal_addr = cache_sram->base_virt +
+						cache_sram->alloced;
+			uiomem->size = size;
+			uiomem->memtype = UIO_MEM_PHYS;
+
+			cache_sram->alloced += size;
+
+			sprintf(name, "mem%d", map_idx);
+			uiomem->name = devm_kstrdup(&pdev->dev, name,
+						    GFP_KERNEL);
+
+			map_idx++;
+			if (map_idx >= MAX_UIO_MAPS) {
+				dev_warn(&pdev->dev, "more than %d uio-maps for device.\n",
+					 MAX_UIO_MAPS);
+				break;
+			}
+		}
+
+		if (map_idx == 0) {
+			dev_err(&pdev->dev, "error no valid uio-map configuration found\n");
+			ret = -EINVAL;
+			goto err_out;
+		}
+
+		info->version = UIO_INFO_VER;
+
+		/* register uio device */
+		if (uio_register_device(&pdev->dev, info)) {
+			dev_err(&pdev->dev, "error uio,cache-sram registration failed\n");
+			ret = -ENODEV;
+			goto err_out;
+		}
+
+		cache_sram->uio_infos[cache_sram->info_count] = info;
+		cache_sram->info_count++;
+
+		if (cache_sram->info_count >= MAX_SRAM_UIO_INFOS) {
+			dev_warn(&pdev->dev, "more than %d uio_info devices.\n",
+				 MAX_SRAM_UIO_INFOS);
+			break;
+		}
+	}
+
+	platform_set_drvdata(pdev, cache_sram);
+
+	return 0;
+err_out:
+	uio_infos_unregister(cache_sram);
+	return ret;
+}
+
+static int uio_fsl_85xx_cache_sram_remove(struct platform_device *pdev)
+{
+	struct uio_cache_sram *cache_sram = platform_get_drvdata(pdev);
+
+	uio_infos_unregister(cache_sram);
+
+	uio_cache_sram_destroy(cache_sram);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static struct of_device_id uio_fsl_85xx_cache_sram_of_match[] = {
+	{ /* This is filled with module_parm */ },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, uio_fsl_85xx_cache_sram_of_match);
+
+module_param_string(of_id, uio_fsl_85xx_cache_sram_of_match[0].compatible,
+		    sizeof(uio_fsl_85xx_cache_sram_of_match[0].compatible), 0);
+MODULE_PARM_DESC(of_id, "platform device id to be handled by cache-sram-uio");
+#endif
+
+static struct platform_driver uio_fsl_85xx_cache_sram = {
+	.probe = uio_fsl_85xx_cache_sram_probe,
+	.remove = uio_fsl_85xx_cache_sram_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table	= of_match_ptr(uio_fsl_85xx_cache_sram_of_match),
+	},
+};
+
+module_platform_driver(uio_fsl_85xx_cache_sram);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
+MODULE_DESCRIPTION("Freescale MPC85xx Cache-Sram UIO Platform Driver");
+MODULE_ALIAS("platform:" DRIVER_NAME);
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

