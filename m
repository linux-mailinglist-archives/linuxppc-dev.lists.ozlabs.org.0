Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C79991B6BAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 05:02:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497f8s5w8VzDr7q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 13:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.16; helo=m17616.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17616.mail.qiye.163.com (m17616.mail.qiye.163.com
 [59.111.176.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497drK275kzDr6B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:47:45 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17616.mail.qiye.163.com (Hmail) with ESMTPA id 5F729106A2C;
 Fri, 24 Apr 2020 10:47:38 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3,
 5/5] powerpc: sysdev: support userspace access of fsl_85xx_sram
Date: Thu, 23 Apr 2020 19:45:54 -0700
Message-Id: <20200424024554.30709-6-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424024554.30709-1-wenhu.wang@vivo.com>
References: <20200424024554.30709-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSVVOSUtCQkJCS0NPT0xJTFlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6GDo6NTg3NFYVOCoULww8
 S08wCRpVSlVKTkNMTUJNT05CS09PVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUxPS043Bg++
X-HM-Tid: 0a71aa155c469374kuws5f729106a2c
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
Cc: robh@kernel.org, oss@buserror.net, kernel@vivo.com, paulus@samba.org,
 Wang Wenhu <wenhu.wang@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

New module which registers its memory allocation and free APIs to the
sram_dynamic module, which would create a device of struct sram_device
type to act as an interface for user level applications to access the
backend hardware device, fsl_85xx_cache_sram, which is drived by the
FSL_85XX_CACHE_SRAM module.

Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
---
 .../powerpc/include/asm/fsl_85xx_cache_sram.h |  4 ++
 arch/powerpc/platforms/85xx/Kconfig           | 10 +++++
 arch/powerpc/sysdev/Makefile                  |  1 +
 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h     |  6 +++
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c     | 12 ++++++
 arch/powerpc/sysdev/fsl_85xx_sram_uapi.c      | 39 +++++++++++++++++++
 6 files changed, 72 insertions(+)
 create mode 100644 arch/powerpc/sysdev/fsl_85xx_sram_uapi.c

diff --git a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
index 0235a0447baa..99cb7e202c38 100644
--- a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
+++ b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
@@ -26,6 +26,10 @@ struct mpc85xx_cache_sram {
 	unsigned int size;
 	rh_info_t *rh;
 	spinlock_t lock;
+
+#ifdef CONFIG_FSL_85XX_SRAM_UAPI
+	struct device *dev;
+#endif
 };
 
 extern void mpc85xx_cache_sram_free(void *ptr);
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index fa3d29dcb57e..3a6f6af973eb 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -16,6 +16,16 @@ if FSL_SOC_BOOKE
 
 if PPC32
 
+config FSL_85XX_SRAM_UAPI
+	tristate "Freescale MPC85xx SRAM UAPI Support"
+	depends on FSL_SOC_BOOKE && SRAM_DYNAMIC
+	select FSL_85XX_CACHE_SRAM
+	help
+	  This registers a device of struct sram_device type which would act as
+	  an interface for user level applications to access the Freescale 85xx
+	  Cache-SRAM memory dynamically, meaning allocate on demand dynamically
+	  while they are running.
+
 config FSL_85XX_CACHE_SRAM
 	bool
 	select PPC_LIB_RHEAP
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index cb5a5bd2cef5..e71f82f0d2c3 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_FSL_CORENET_RCPM)	+= fsl_rcpm.o
 obj-$(CONFIG_FSL_LBC)		+= fsl_lbc.o
 obj-$(CONFIG_FSL_GTM)		+= fsl_gtm.o
 obj-$(CONFIG_FSL_85XX_CACHE_SRAM)	+= fsl_85xx_l2ctlr.o fsl_85xx_cache_sram.o
+obj-$(CONFIG_FSL_85XX_SRAM_UAPI)	+= fsl_85xx_sram_uapi.o
 obj-$(CONFIG_FSL_RIO)		+= fsl_rio.o fsl_rmu.o
 obj-$(CONFIG_TSI108_BRIDGE)	+= tsi108_pci.o tsi108_dev.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc_cmos_setup.o
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h b/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
index ce370749add9..4930784d9852 100644
--- a/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
+++ b/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
@@ -10,6 +10,8 @@
 #ifndef __FSL_85XX_CACHE_CTLR_H__
 #define __FSL_85XX_CACHE_CTLR_H__
 
+#include <linux/platform_device.h>
+
 #define L2CR_L2FI		0x40000000	/* L2 flash invalidate */
 #define L2CR_L2IO		0x00200000	/* L2 instruction only */
 #define L2CR_SRAM_ZERO		0x00000000	/* L2SRAM zero size */
@@ -81,6 +83,10 @@ struct sram_parameters {
 	phys_addr_t sram_offset;
 };
 
+#ifdef CONFIG_FSL_85XX_SRAM_UAPI
+extern struct mpc85xx_cache_sram *mpc85xx_get_cache_sram(void);
+#endif
+
 extern int instantiate_cache_sram(struct platform_device *dev,
 		struct sram_parameters sram_params);
 extern void remove_cache_sram(struct platform_device *dev);
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
index 3de5ac8382c0..0156ea63a3a2 100644
--- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
+++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
@@ -23,6 +23,14 @@
 
 struct mpc85xx_cache_sram *cache_sram;
 
+
+#ifdef CONFIG_FSL_85XX_SRAM_UAPI
+struct mpc85xx_cache_sram *mpc85xx_get_cache_sram(void)
+{
+	return cache_sram;
+}
+#endif
+
 void *mpc85xx_cache_sram_alloc(unsigned int size,
 				phys_addr_t *phys, unsigned int align)
 {
@@ -115,6 +123,10 @@ int instantiate_cache_sram(struct platform_device *dev,
 	rh_attach_region(cache_sram->rh, 0, cache_sram->size);
 	spin_lock_init(&cache_sram->lock);
 
+#ifdef CONFIG_FSL_85XX_SRAM_UAPI
+	cache_sram->dev = &dev->dev;
+#endif
+
 	dev_info(&dev->dev, "[base:0x%llx, size:0x%x] configured and loaded\n",
 		(unsigned long long)cache_sram->base_phys, cache_sram->size);
 
diff --git a/arch/powerpc/sysdev/fsl_85xx_sram_uapi.c b/arch/powerpc/sysdev/fsl_85xx_sram_uapi.c
new file mode 100644
index 000000000000..60190bf3c8e9
--- /dev/null
+++ b/arch/powerpc/sysdev/fsl_85xx_sram_uapi.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
+ * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
+ * All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/sram_dynamic.h>
+#include <asm/fsl_85xx_cache_sram.h>
+#include "fsl_85xx_cache_ctlr.h"
+
+static struct sram_api mpc85xx_sram_api = {
+	.name = "mpc85xx_sram",
+	.alloc = mpc85xx_cache_sram_alloc,
+	.free = mpc85xx_cache_sram_free,
+};
+
+static int __init mpc85xx_sram_uapi_init(void)
+{
+	struct mpc85xx_cache_sram *sram = mpc85xx_get_cache_sram();
+
+	if (!sram)
+		return -ENODEV;
+
+	return sram_register_device(sram->dev, &mpc85xx_sram_api);
+}
+subsys_initcall(mpc85xx_sram_uapi_init);
+
+static void __exit mpc85xx_sram_uapi_exit(void)
+{
+	sram_unregister_device(&mpc85xx_sram_api);
+}
+module_exit(mpc85xx_sram_uapi_exit);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
+MODULE_DESCRIPTION("MPC85xx SRAM User-Space API Support");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

