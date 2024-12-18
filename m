Return-Path: <linuxppc-dev+bounces-4295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 686FE9F6402
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:56:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF64gtwz2yjb;
	Wed, 18 Dec 2024 21:55:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519338;
	cv=none; b=WJ/Eu6h6ea+N5eVjStiSmwa0FGX/hyuZkOqg2WHfe833FUrVQEY+xAFqM1fjUIKOnNpNL481L1n3H5SecNq76oFUpsFlpJDS71N7GuOdq3slB1HWsq1FaA1mXjMu0tR8T+1p+Apq6IBIPj94FCHEfitqOzBTT9axsEIL7DnWR+99gSgWJsQ2p167QXok8IDwuvar/WFa+MrcbeYmAa1Urwaxm8dokW0k874bIWCb93CRRK6RAE/B5l9HNQpTwIGJsj4Dl+jqIcGgSc0dgnahp04WjELaR1XunzB7jwXWWgoUMTUJ1xHshENCB0Op9wf2j+1L7J72WoNCdlf+ohVhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519338; c=relaxed/relaxed;
	bh=6dDq9HpuCyJcGsbu36y/LO4+p3k+dkpaL+nfW3jT97Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHKoHxXIDO7UvV1uM1qF9ktvD4C1cLilHaKNESA+0PJU+RKMJeewfGGqx7vm9oKAELoeYu9rQlHwZSwEaRKpHyIJHTVttfySieTrgmbvb1hmz9wNQT3GAtXcBw0njplAoMuJTTOH9Dinsve9Lu9n71hc5RR6qgid7xWcnbdadzjam4G8Yh6Hm8RF5rwhntcUmaB2P8CPLh9s2DfG0MUmIqeis7IuYFASjoJG7ds/DTLbnqQg3mz1tP37mpyQIXB/5oL+ib9r6N+7Xj/tUHApO3AXEPYq5I+PNSQpXjMAZ12HaKSnsiRh7KPfluQicnExu9LGz1biQC0kPuZj7i0cEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aRiS/KRR; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aRiS/KRR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF31jQjz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519328;
	bh=6dDq9HpuCyJcGsbu36y/LO4+p3k+dkpaL+nfW3jT97Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aRiS/KRR4rwta/Yi3tQbj6az8A3VgQUV7w04A963E9rGVHGF9oIKaU778ZC1zwDeq
	 HpYoJdNA60BFnEEcxzFx03W0kWIXITAV390WrI2B4Ie6Un13vvBF/1uFmjeT9tSXYK
	 DC3hPd3PncROr16DHrjGq8T197xqPxuRQbxes1BpWdT0ShpQ2wNCBdNrQhOESCOoqM
	 RAis8rQo85RvJFfIAdCGlYwoML+q6wR58V+mIFB3QiOZNyipZAuL9zZlrlPJDFk74Q
	 or9dfcltC/irjEbe4bjis+puVn2/FRRk8Zps7v4Ax8guwVqYrsgJrOOe0eAIN+9y70
	 /wgn+t65v08vA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDv6t0vz4xf6;
	Wed, 18 Dec 2024 21:55:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 03/25] powerpc: Remove PPC_PMI and driver
Date: Wed, 18 Dec 2024 21:54:51 +1100
Message-ID: <20241218105523.416573-3-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

CONFIG_PPC_PMI is no longer selectable now that PPC_IBM_CELL_BLADE has
been removed, via the dependency on PPC_IBM_CELL_POWERBUTTON.

So remove it and the driver, and the pmi.h header which it was the only
user of.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/include/asm/pmi.h      |  53 ------
 arch/powerpc/platforms/cell/Kconfig |   9 -
 arch/powerpc/sysdev/Makefile        |   1 -
 arch/powerpc/sysdev/pmi.c           | 267 ----------------------------
 4 files changed, 330 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/pmi.h
 delete mode 100644 arch/powerpc/sysdev/pmi.c

diff --git a/arch/powerpc/include/asm/pmi.h b/arch/powerpc/include/asm/pmi.h
deleted file mode 100644
index 478f0a2fe7f4..000000000000
--- a/arch/powerpc/include/asm/pmi.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _POWERPC_PMI_H
-#define _POWERPC_PMI_H
-
-/*
- * Definitions for talking with PMI device on PowerPC
- *
- * PMI (Platform Management Interrupt) is a way to communicate
- * with the BMC (Baseboard Management Controller) via interrupts.
- * Unlike IPMI it is bidirectional and has a low latency.
- *
- * (C) Copyright IBM Deutschland Entwicklung GmbH 2005
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- */
-
-#ifdef __KERNEL__
-
-#define PMI_TYPE_FREQ_CHANGE	0x01
-#define PMI_TYPE_POWER_BUTTON	0x02
-#define PMI_READ_TYPE		0
-#define PMI_READ_DATA0		1
-#define PMI_READ_DATA1		2
-#define PMI_READ_DATA2		3
-#define PMI_WRITE_TYPE		4
-#define PMI_WRITE_DATA0		5
-#define PMI_WRITE_DATA1		6
-#define PMI_WRITE_DATA2		7
-
-#define PMI_ACK			0x80
-
-#define PMI_TIMEOUT		100
-
-typedef struct {
-	u8	type;
-	u8	data0;
-	u8	data1;
-	u8	data2;
-} pmi_message_t;
-
-struct pmi_handler {
-	struct list_head node;
-	u8 type;
-	void (*handle_pmi_message) (pmi_message_t);
-};
-
-int pmi_register_handler(struct pmi_handler *);
-void pmi_unregister_handler(struct pmi_handler *);
-
-int pmi_send_message(pmi_message_t);
-
-#endif /* __KERNEL__ */
-#endif /* _POWERPC_PMI_H */
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index ee43d6092e31..758dc08a6dde 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -21,15 +21,6 @@ config SPU_BASE
 	bool
 	select PPC_COPRO_BASE
 
-config PPC_PMI
-	tristate
-	default y
-	depends on CPU_FREQ_CBE_PMI || PPC_IBM_CELL_POWERBUTTON
-	help
-	  PMI (Platform Management Interrupt) is a way to
-	  communicate with the BMC (Baseboard Management Controller).
-	  It is used in some IBM Cell blades.
-
 config CBE_CPUFREQ_SPU_GOVERNOR
 	tristate "CBE frequency scaling based on SPU usage"
 	depends on SPU_FS && CPU_FREQ
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index 24a177d164f1..0834a9a12600 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_PPC_MSI_BITMAP)	+= msi_bitmap.o
 
 obj-$(CONFIG_PPC_MPC106)	+= grackle.o
 obj-$(CONFIG_PPC_DCR_NATIVE)	+= dcr-low.o
-obj-$(CONFIG_PPC_PMI)		+= pmi.o
 obj-$(CONFIG_U3_DART)		+= dart_iommu.o
 obj-$(CONFIG_MMIO_NVRAM)	+= mmio_nvram.o
 obj-$(CONFIG_FSL_SOC)		+= fsl_soc.o fsl_mpic_err.o
diff --git a/arch/powerpc/sysdev/pmi.c b/arch/powerpc/sysdev/pmi.c
deleted file mode 100644
index 2511e586fe31..000000000000
--- a/arch/powerpc/sysdev/pmi.c
+++ /dev/null
@@ -1,267 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * pmi driver
- *
- * (C) Copyright IBM Deutschland Entwicklung GmbH 2005
- *
- * PMI (Platform Management Interrupt) is a way to communicate
- * with the BMC (Baseboard Management Controller) via interrupts.
- * Unlike IPMI it is bidirectional and has a low latency.
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- */
-
-#include <linux/interrupt.h>
-#include <linux/slab.h>
-#include <linux/completion.h>
-#include <linux/spinlock.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/workqueue.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
-
-#include <asm/io.h>
-#include <asm/pmi.h>
-
-struct pmi_data {
-	struct list_head	handler;
-	spinlock_t		handler_spinlock;
-	spinlock_t		pmi_spinlock;
-	struct mutex		msg_mutex;
-	pmi_message_t		msg;
-	struct completion	*completion;
-	struct platform_device	*dev;
-	int			irq;
-	u8 __iomem		*pmi_reg;
-	struct work_struct	work;
-};
-
-static struct pmi_data *data;
-
-static irqreturn_t pmi_irq_handler(int irq, void *dev_id)
-{
-	u8 type;
-	int rc;
-
-	spin_lock(&data->pmi_spinlock);
-
-	type = ioread8(data->pmi_reg + PMI_READ_TYPE);
-	pr_debug("pmi: got message of type %d\n", type);
-
-	if (type & PMI_ACK && !data->completion) {
-		printk(KERN_WARNING "pmi: got unexpected ACK message.\n");
-		rc = -EIO;
-		goto unlock;
-	}
-
-	if (data->completion && !(type & PMI_ACK)) {
-		printk(KERN_WARNING "pmi: expected ACK, but got %d\n", type);
-		rc = -EIO;
-		goto unlock;
-	}
-
-	data->msg.type = type;
-	data->msg.data0 = ioread8(data->pmi_reg + PMI_READ_DATA0);
-	data->msg.data1 = ioread8(data->pmi_reg + PMI_READ_DATA1);
-	data->msg.data2 = ioread8(data->pmi_reg + PMI_READ_DATA2);
-	rc = 0;
-unlock:
-	spin_unlock(&data->pmi_spinlock);
-
-	if (rc == -EIO) {
-		rc = IRQ_HANDLED;
-		goto out;
-	}
-
-	if (data->msg.type & PMI_ACK) {
-		complete(data->completion);
-		rc = IRQ_HANDLED;
-		goto out;
-	}
-
-	schedule_work(&data->work);
-
-	rc = IRQ_HANDLED;
-out:
-	return rc;
-}
-
-
-static const struct of_device_id pmi_match[] = {
-	{ .type = "ibm,pmi", .name = "ibm,pmi" },
-	{ .type = "ibm,pmi" },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, pmi_match);
-
-static void pmi_notify_handlers(struct work_struct *work)
-{
-	struct pmi_handler *handler;
-
-	spin_lock(&data->handler_spinlock);
-	list_for_each_entry(handler, &data->handler, node) {
-		pr_debug("pmi: notifying handler %p\n", handler);
-		if (handler->type == data->msg.type)
-			handler->handle_pmi_message(data->msg);
-	}
-	spin_unlock(&data->handler_spinlock);
-}
-
-static int pmi_of_probe(struct platform_device *dev)
-{
-	struct device_node *np = dev->dev.of_node;
-	int rc;
-
-	if (data) {
-		printk(KERN_ERR "pmi: driver has already been initialized.\n");
-		rc = -EBUSY;
-		goto out;
-	}
-
-	data = kzalloc(sizeof(struct pmi_data), GFP_KERNEL);
-	if (!data) {
-		printk(KERN_ERR "pmi: could not allocate memory.\n");
-		rc = -ENOMEM;
-		goto out;
-	}
-
-	data->pmi_reg = of_iomap(np, 0);
-	if (!data->pmi_reg) {
-		printk(KERN_ERR "pmi: invalid register address.\n");
-		rc = -EFAULT;
-		goto error_cleanup_data;
-	}
-
-	INIT_LIST_HEAD(&data->handler);
-
-	mutex_init(&data->msg_mutex);
-	spin_lock_init(&data->pmi_spinlock);
-	spin_lock_init(&data->handler_spinlock);
-
-	INIT_WORK(&data->work, pmi_notify_handlers);
-
-	data->dev = dev;
-
-	data->irq = irq_of_parse_and_map(np, 0);
-	if (!data->irq) {
-		printk(KERN_ERR "pmi: invalid interrupt.\n");
-		rc = -EFAULT;
-		goto error_cleanup_iomap;
-	}
-
-	rc = request_irq(data->irq, pmi_irq_handler, 0, "pmi", NULL);
-	if (rc) {
-		printk(KERN_ERR "pmi: can't request IRQ %d: returned %d\n",
-				data->irq, rc);
-		goto error_cleanup_iomap;
-	}
-
-	printk(KERN_INFO "pmi: found pmi device at addr %p.\n", data->pmi_reg);
-
-	goto out;
-
-error_cleanup_iomap:
-	iounmap(data->pmi_reg);
-
-error_cleanup_data:
-	kfree(data);
-
-out:
-	return rc;
-}
-
-static void pmi_of_remove(struct platform_device *dev)
-{
-	struct pmi_handler *handler, *tmp;
-
-	free_irq(data->irq, NULL);
-	iounmap(data->pmi_reg);
-
-	spin_lock(&data->handler_spinlock);
-
-	list_for_each_entry_safe(handler, tmp, &data->handler, node)
-		list_del(&handler->node);
-
-	spin_unlock(&data->handler_spinlock);
-
-	kfree(data);
-	data = NULL;
-}
-
-static struct platform_driver pmi_of_platform_driver = {
-	.probe		= pmi_of_probe,
-	.remove		= pmi_of_remove,
-	.driver = {
-		.name = "pmi",
-		.of_match_table = pmi_match,
-	},
-};
-module_platform_driver(pmi_of_platform_driver);
-
-int pmi_send_message(pmi_message_t msg)
-{
-	unsigned long flags;
-	DECLARE_COMPLETION_ONSTACK(completion);
-
-	if (!data)
-		return -ENODEV;
-
-	mutex_lock(&data->msg_mutex);
-
-	data->msg = msg;
-	pr_debug("pmi_send_message: msg is %08x\n", *(u32*)&msg);
-
-	data->completion = &completion;
-
-	spin_lock_irqsave(&data->pmi_spinlock, flags);
-	iowrite8(msg.data0, data->pmi_reg + PMI_WRITE_DATA0);
-	iowrite8(msg.data1, data->pmi_reg + PMI_WRITE_DATA1);
-	iowrite8(msg.data2, data->pmi_reg + PMI_WRITE_DATA2);
-	iowrite8(msg.type, data->pmi_reg + PMI_WRITE_TYPE);
-	spin_unlock_irqrestore(&data->pmi_spinlock, flags);
-
-	pr_debug("pmi_send_message: wait for completion\n");
-
-	wait_for_completion_interruptible_timeout(data->completion,
-						  PMI_TIMEOUT);
-
-	data->completion = NULL;
-
-	mutex_unlock(&data->msg_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pmi_send_message);
-
-int pmi_register_handler(struct pmi_handler *handler)
-{
-	if (!data)
-		return -ENODEV;
-
-	spin_lock(&data->handler_spinlock);
-	list_add_tail(&handler->node, &data->handler);
-	spin_unlock(&data->handler_spinlock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pmi_register_handler);
-
-void pmi_unregister_handler(struct pmi_handler *handler)
-{
-	if (!data)
-		return;
-
-	pr_debug("pmi: unregistering handler %p\n", handler);
-
-	spin_lock(&data->handler_spinlock);
-	list_del(&handler->node);
-	spin_unlock(&data->handler_spinlock);
-}
-EXPORT_SYMBOL_GPL(pmi_unregister_handler);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
-MODULE_DESCRIPTION("IBM Platform Management Interrupt driver");
-- 
2.47.1


