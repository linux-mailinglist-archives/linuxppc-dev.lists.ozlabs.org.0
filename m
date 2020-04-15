Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AB1AA2B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:01:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Mt745YfzDr1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 23:01:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492MHd4c5TzDqKM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 22:34:35 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id E2A734E24CC;
 Wed, 15 Apr 2020 20:34:27 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, oss@buserror.net,
 christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] drivers: uio: new driver for fsl_85xx_cache_sram
Date: Wed, 15 Apr 2020 05:33:46 -0700
Message-Id: <20200415123346.116212-6-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415123346.116212-1-wenhu.wang@vivo.com>
References: <20200415123346.116212-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VLQklLS0tPQ09PTU1OTllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODY6Shw4CTgxSwg2OUMRIzgN
 NgwKFDRVSlVKTkNNQk5PS01DSEJLVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUNMTkk3Bg++
X-HM-Tid: 0a717dd560e39376kuwse2a734e24cc
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
Cc: kernel@vivo.com, Wang Wenhu <wenhu.wang@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A driver for freescale 85xx platforms to access the Cache-Sram form
user level. This is extremely helpful for some user-space applications
that require high performance memory accesses.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
---
 drivers/uio/Kconfig                   |   8 ++
 drivers/uio/Makefile                  |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c | 195 ++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index 202ee81cfc2b..afd38ec13de0 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -105,6 +105,14 @@ config UIO_NETX
 	  To compile this driver as a module, choose M here; the module
 	  will be called uio_netx.
 
+config UIO_FSL_85XX_CACHE_SRAM
+	tristate "Freescale 85xx Cache-Sram driver"
+	depends on FSL_85XX_CACHE_SRAM
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
index 000000000000..e11202dd5b93
--- /dev/null
+++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/uio_driver.h>
+#include <linux/stringify.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <asm/fsl_85xx_cache_sram.h>
+
+#define DRIVER_VERSION	"0.1.0"
+#define DRIVER_NAME	"uio_fsl_85xx_cache_sram"
+#define UIO_NAME	"uio_cache_sram"
+
+static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
+	{	.compatible = "uio,fsl,p2020-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p2010-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1020-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1011-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1013-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1022-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,mpc8548-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,mpc8544-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,mpc8572-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,mpc8536-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1021-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1012-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1025-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1016-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1024-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1015-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,p1010-l2-cache-controller",	},
+	{	.compatible = "uio,fsl,bsc9131-l2-cache-controller",	},
+	{},
+};
+
+static void uio_info_free_internal(struct uio_info *info)
+{
+	struct uio_mem *uiomem = &info->mem[0];
+
+	while (uiomem < &info->mem[MAX_UIO_MAPS]) {
+		if (uiomem->size) {
+			mpc85xx_cache_sram_free(uiomem->internal_addr);
+			kfree(uiomem->name);
+		}
+		uiomem++;
+	}
+}
+
+static int uio_fsl_85xx_cache_sram_probe(struct platform_device *pdev)
+{
+	struct device_node *parent = pdev->dev.of_node;
+	struct device_node *node = NULL;
+	struct uio_info *info;
+	struct uio_mem *uiomem;
+	const char *dt_name;
+	u32 mem_size;
+	u32 align;
+	void *virt;
+	phys_addr_t phys;
+	int ret = -ENODEV;
+
+	/* alloc uio_info for one device */
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		dev_err(&pdev->dev, "kzalloc uio_info failed\n");
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	/* get optional uio name */
+	if (of_property_read_string(parent, "uio_name", &dt_name))
+		dt_name = UIO_NAME;
+
+	info->name = kstrdup(dt_name, GFP_KERNEL);
+	if (!info->name) {
+		dev_err(&pdev->dev, "error kstrdup uio_name\n");
+		ret = -ENOMEM;
+		goto err_info_free;
+	}
+
+	uiomem = &info->mem[0];
+	for_each_child_of_node(parent, node) {
+		if (!node) {
+			dev_err(&pdev->dev, "device's OF-node is NULL\n");
+			continue;
+		}
+
+		ret = of_property_read_u32(node, "cache-mem-size", &mem_size);
+		if (ret) {
+			dev_err(&pdev->dev, "missing cache-mem-size value\n");
+			continue;
+		}
+
+		if (mem_size == 0) {
+			dev_err(&pdev->dev, "cache-mem-size should not be 0\n");
+			continue;
+		}
+
+		align = 2;
+		while (align < mem_size)
+			align *= 2;
+		virt = mpc85xx_cache_sram_alloc(mem_size, &phys, align);
+		if (!virt) {
+			dev_err(&pdev->dev, "allocate 0x%x cache-mem failed\n", mem_size);
+			continue;
+		}
+
+		uiomem->memtype = UIO_MEM_PHYS;
+		uiomem->addr = phys;
+		uiomem->size = mem_size;
+		uiomem->name = kstrdup(node->name, GFP_KERNEL);;
+		uiomem->internal_addr = virt;
+		++uiomem;
+
+		if (uiomem >= &info->mem[MAX_UIO_MAPS]) {
+			dev_warn(&pdev->dev, "device has more than "
+				 __stringify(MAX_UIO_MAPS)
+				 " I/O memory resources.\n");
+			break;
+		}
+	}
+
+	while (uiomem < &info->mem[MAX_UIO_MAPS]) {
+		uiomem->size = 0;
+		++uiomem;
+	}
+
+	if (info->mem[0].size == 0) {
+		dev_err(&pdev->dev, "error no valid uio-map configured\n");
+		ret = -EINVAL;
+		goto err_name_free;
+	}
+
+	info->version = DRIVER_VERSION;
+
+	/* register UIO device */
+	if (uio_register_device(&pdev->dev, info)) {
+		dev_err(&pdev->dev, "UIO registration failed\n");
+		ret = -ENODEV;
+		goto err_unregister;
+	}
+
+	platform_set_drvdata(pdev, info);
+
+	return 0;
+err_unregister:
+	uio_info_free_internal(info);
+err_name_free:
+	kfree(info->name);
+err_info_free:
+	kfree(info);
+err_out:
+	return ret;
+}
+
+static int uio_fsl_85xx_cache_sram_remove(struct platform_device *pdev)
+{
+	struct uio_info *info = platform_get_drvdata(pdev);
+
+	uio_unregister_device(info);
+
+	uio_info_free_internal(info);
+
+	kfree(info->name);
+
+	kfree(info);
+
+	return 0;
+}
+
+static struct platform_driver uio_fsl_85xx_cache_sram = {
+	.probe = uio_fsl_85xx_cache_sram_probe,
+	.remove = uio_fsl_85xx_cache_sram_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table	= uio_mpc85xx_l2ctlr_of_match,
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

