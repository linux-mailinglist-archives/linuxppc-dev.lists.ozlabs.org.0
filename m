Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A62691B704B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 11:10:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497pKl6yDczDr97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 19:10:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497p5Q2NQzzDqwm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 18:59:38 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.227])
 by m17616.mail.qiye.163.com (Hmail) with ESMTPA id 397E21082A0;
 Fri, 24 Apr 2020 16:59:31 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: kernel@vivo.com
Subject: [PATCH v4,
 5/5] powerpc: sysdev: support userspace access of fsl_85xx_sram
Date: Fri, 24 Apr 2020 01:58:39 -0700
Message-Id: <20200424085839.60284-6-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424085839.60284-1-wenhu.wang@vivo.com>
References: <20200424085839.60284-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VJTUtCQkJNTEJOTU5PSFlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nio6DDo6Cjg5PFYYNh04TAoy
 Di4aCjlVSlVKTkNMTEpDTExKTUxNVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlMWVdZCAFZQUJKS0o3Bg++
X-HM-Tid: 0a71ab69d3289374kuws397e21082a0
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Scott Wood <oss@buserror.net>,
 Wang Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org
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
Changes since v3: Addressed comments from Christophe
 * Move the module to drivers/soc/fsl/ directory
 * Minor changes of coding-style
---
 .../powerpc/include/asm/fsl_85xx_cache_sram.h | 17 ++++++++
 arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h     |  2 +
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c     |  2 +
 arch/powerpc/sysdev/fsl_85xx_sram_uapi.c      | 39 +++++++++++++++++++
 drivers/soc/fsl/Kconfig                       | 12 ++++++
 drivers/soc/fsl/Makefile                      |  1 +
 drivers/soc/fsl/fsl_85xx_sram.h               | 13 +++++++
 drivers/soc/fsl/fsl_85xx_sram_uapi.c          | 39 +++++++++++++++++++
 8 files changed, 125 insertions(+)
 create mode 100644 arch/powerpc/sysdev/fsl_85xx_sram_uapi.c
 create mode 100644 drivers/soc/fsl/fsl_85xx_sram.h
 create mode 100644 drivers/soc/fsl/fsl_85xx_sram_uapi.c

diff --git a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
index 0235a0447baa..50fd6733c506 100644
--- a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
+++ b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
@@ -26,8 +26,25 @@ struct mpc85xx_cache_sram {
 	unsigned int size;
 	rh_info_t *rh;
 	spinlock_t lock;
+
+#ifdef CONFIG_FSL_85XX_SRAM_UAPI
+	struct device *dev;
+#endif
 };
 
+#ifdef CONFIG_FSL_85XX_SRAM_UAPI
+static inline void set_cache_sram_dev(struct mpc85xx_cache_sram *sram,
+				      struct device *dev)
+{
+	sram->dev = dev;
+}
+#else
+static inline void set_cache_sram_dev(struct mpc85xx_cache_sram *sram,
+				      struct device *dev)
+{
+}
+#endif
+
 extern void mpc85xx_cache_sram_free(void *ptr);
 extern void *mpc85xx_cache_sram_alloc(unsigned int size,
 				  phys_addr_t *phys, unsigned int align);
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h b/arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h
index ce370749add9..beb855adcfec 100644
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
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
index 3de5ac8382c0..96d4a02b06fe 100644
--- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
+++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
@@ -115,6 +115,8 @@ int instantiate_cache_sram(struct platform_device *dev,
 	rh_attach_region(cache_sram->rh, 0, cache_sram->size);
 	spin_lock_init(&cache_sram->lock);
 
+	set_cache_sram_dev(cache_sram, &dev->dev);
+
 	dev_info(&dev->dev, "[base:0x%llx, size:0x%x] configured and loaded\n",
 		(unsigned long long)cache_sram->base_phys, cache_sram->size);
 
diff --git a/arch/powerpc/sysdev/fsl_85xx_sram_uapi.c b/arch/powerpc/sysdev/fsl_85xx_sram_uapi.c
new file mode 100644
index 000000000000..64fdf082d069
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
+#include "fsl_85xx_sram.h"
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
diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index 4df32bc4c7a6..ceeebb22f6d3 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -50,4 +50,16 @@ config FSL_RCPM
 	  tasks associated with power management, such as wakeup source control.
 	  Note that currently this driver will not support PowerPC based
 	  QorIQ processor.
+
+config FSL_85XX_SRAM_UAPI
+	tristate "Freescale MPC85xx SRAM UAPI Support"
+	depends on FSL_SOC_BOOKE && PPC32
+	select FSL_85XX_CACHE_SRAM
+	select SRAM_DYNAMIC
+	help
+	  This registers a device of struct sram_device type which would act as
+	  an interface for user level applications to access the Freescale 85xx
+	  Cache-SRAM memory dynamically, meaning allocate on demand dynamically
+	  while they are running.
+
 endmenu
diff --git a/drivers/soc/fsl/Makefile b/drivers/soc/fsl/Makefile
index 906f1cd8af01..716e38f75735 100644
--- a/drivers/soc/fsl/Makefile
+++ b/drivers/soc/fsl/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_FSL_RCPM)			+= rcpm.o
 obj-$(CONFIG_FSL_GUTS)			+= guts.o
 obj-$(CONFIG_FSL_MC_DPIO) 		+= dpio/
 obj-$(CONFIG_DPAA2_CONSOLE)		+= dpaa2-console.o
+obj-$(CONFIG_FSL_85XX_SRAM_UAPI)	+= fsl_85xx_sram_uapi.o
diff --git a/drivers/soc/fsl/fsl_85xx_sram.h b/drivers/soc/fsl/fsl_85xx_sram.h
new file mode 100644
index 000000000000..b3b88bf10538
--- /dev/null
+++ b/drivers/soc/fsl/fsl_85xx_sram.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __FSL_85XX_SRAM_H__
+#define __FSL_85XX_SRAM_H__
+
+extern struct mpc85xx_cache_sram *cache_sram;
+
+static inline struct mpc85xx_cache_sram *mpc85xx_get_cache_sram(void)
+{
+	return cache_sram;
+}
+
+#endif /* __FSL_85XX_SRAM_H__ */
diff --git a/drivers/soc/fsl/fsl_85xx_sram_uapi.c b/drivers/soc/fsl/fsl_85xx_sram_uapi.c
new file mode 100644
index 000000000000..64fdf082d069
--- /dev/null
+++ b/drivers/soc/fsl/fsl_85xx_sram_uapi.c
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
+#include "fsl_85xx_sram.h"
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

