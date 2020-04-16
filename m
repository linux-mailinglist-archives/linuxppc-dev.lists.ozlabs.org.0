Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BC1ACCD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:11:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49343c6V0GzDrjG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 02:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=115.236.127.101;
 helo=mail-m127101.qiye.163.com; envelope-from=wenhu.wang@vivo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from mail-m127101.qiye.163.com (mail-m127101.qiye.163.com
 [115.236.127.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4933Gf1mxnzDrgD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 01:36:09 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by mail-m127101.qiye.163.com (Hmail) with ESMTPA id 02B6C47AEE;
 Thu, 16 Apr 2020 23:35:58 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, oss@buserror.net,
 christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4,4/4] drivers: uio: new driver for fsl_85xx_cache_sram
Date: Thu, 16 Apr 2020 08:35:37 -0700
Message-Id: <20200416153537.23736-5-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416153537.23736-1-wenhu.wang@vivo.com>
References: <20200416153537.23736-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSFVKTkNLS0tJSEtMQ0JKQ1lXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxg6Sio6IzgwQw8dLDkzKSk8
 FBcaC0lVSlVKTkNMS05KSE5CT09IVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUxDTUo3Bg++
X-HM-Tid: 0a7183a1ec369865kuuu02b6c47aee
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
Changes since v1:
 * Addressed comments from Greg K-H
 * Moved kfree(info->name) into uio_info_free_internal()
Changes since v2:
 * Addressed comments from Greg, Scott and Christophe
 * Use "uiomem->internal_addr" as if condition for sram memory free,
   and memset the uiomem entry
 * of_match_table modified to be apart from HW info which belong to
   the HW level driver fsl_85xx_cache_sram to match
 * Use roundup_pow_of_two for align calc(really learned a lot from Christophe)
 * Remove useless clear block of uiomem entries.
 * Use UIO_INFO_VER micro for info->version, and define it as
   "devicetree,pseudo", meaning this is pseudo device and probed from
   device tree configuration
Changes since v3:
 * Addressed comments from Christophe(use devm_xxx memory alloc interfaces)
---
 drivers/uio/Kconfig                   |   9 ++
 drivers/uio/Makefile                  |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c | 148 ++++++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index 202ee81cfc2b..9c3b47461b71 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -105,6 +105,15 @@ config UIO_NETX
 	  To compile this driver as a module, choose M here; the module
 	  will be called uio_netx.
 
+config UIO_FSL_85XX_CACHE_SRAM
+	tristate "Freescale 85xx Cache-Sram driver"
+	depends on FSL_SOC_BOOKE && PPC32
+	select FSL_85XX_CACHE_SRAM
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
index 000000000000..cb339d1f9019
--- /dev/null
+++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/uio_driver.h>
+#include <linux/stringify.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <asm/fsl_85xx_cache_sram.h>
+
+#define DRIVER_NAME	"uio_fsl_85xx_cache_sram"
+#define UIO_INFO_VER	"devicetree,pseudo"
+#define UIO_NAME	"uio_cache_sram"
+
+static void uio_info_free_internal(struct uio_info *info)
+{
+	int i;
+
+	for (i = 0; i < MAX_UIO_MAPS; i++) {
+		struct uio_mem *uiomem = &info->mem[i];
+
+		if (uiomem->internal_addr) {
+			mpc85xx_cache_sram_free(uiomem->internal_addr);
+			memset(uiomem, 0, sizeof(*uiomem));
+		}
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
+	int ret;
+
+	/* alloc uio_info for one device */
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* get optional uio name */
+	if (of_property_read_string(parent, "uio_name", &dt_name))
+		dt_name = UIO_NAME;
+
+	info->name = devm_kstrdup(&pdev->dev, dt_name, GFP_KERNEL);
+	if (!info->name)
+		return -ENOMEM;
+
+	uiomem = info->mem;
+	for_each_child_of_node(parent, node) {
+		void *virt;
+		phys_addr_t phys;
+
+		ret = of_property_read_u32(node, "cache-mem-size", &mem_size);
+		if (ret) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+
+		if (mem_size == 0) {
+			dev_err(&pdev->dev, "error cache-mem-size should not be 0\n");
+			ret = -EINVAL;
+			goto err_out;
+		}
+
+		virt = mpc85xx_cache_sram_alloc(mem_size, &phys,
+						roundup_pow_of_two(mem_size));
+		if (!virt) {
+			/* mpc85xx_cache_sram_alloc to define the real cause */
+			ret = -ENOMEM;
+			goto err_out;
+		}
+
+		uiomem->memtype = UIO_MEM_PHYS;
+		uiomem->addr = phys;
+		uiomem->size = mem_size;
+		uiomem->name = kstrdup(node->name, GFP_KERNEL);;
+		uiomem->internal_addr = virt;
+		uiomem++;
+
+		if (uiomem >= &info->mem[MAX_UIO_MAPS]) {
+			dev_warn(&pdev->dev, "more than %d uio-maps for device.\n",
+				 MAX_UIO_MAPS);
+			break;
+		}
+	}
+
+	if (uiomem == info->mem) {
+		dev_err(&pdev->dev, "error no valid uio-map configuration found\n");
+		return -EINVAL;
+	}
+
+	info->version = UIO_INFO_VER;
+
+	/* register uio device */
+	if (uio_register_device(&pdev->dev, info)) {
+		dev_err(&pdev->dev, "error uio,cache-sram registration failed\n");
+		ret = -ENODEV;
+		goto err_out;
+	}
+
+	platform_set_drvdata(pdev, info);
+
+	return 0;
+err_out:
+	uio_info_free_internal(info);
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
+	return 0;
+}
+
+static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
+	{	.compatible = "uio,mpc85xx-cache-sram",	},
+	{},
+};
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

