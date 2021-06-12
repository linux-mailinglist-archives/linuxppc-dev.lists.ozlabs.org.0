Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F673A4BBA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 02:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1zDz2Vxhz3c6q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 10:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1zDc6CCzz309P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 10:32:00 +1000 (AEST)
Received: by mail-ot1-f54.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso4821211otl.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 17:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qga+c0C77T21FQKulI0d4f+Rhv/BssoNhwHf+62zha8=;
 b=Quu9yzGYFuJFIGppI/GgLIsIHQWDIDcF+piTUjw4bCOPOWfjRx5AUKlFE0FJi4dBt6
 Qi6jFgYAKcPWmjtGHmFYqaGsqP1WI2RsULcb7NyR9s01ywLZv7XOoqlGWc0eVJHRKhe9
 33vVEYyJDVnAH4QhYyW9mdbcAn/901JC2zXiO1UheJVdO8oCdOIQc94etVZByz2ozHbm
 10LmPLvY3vKwJQnPWm0kEVs5ho57qI3mygxoqRUhbokI2+xNa8dDrJ0MYtVxjLua++rs
 7/tUm4/76njqv3P7pdoo7VX2eefq5Z1TOrx2XXQGj18zU73IMnaYOeCwo7TAJ73PBZLk
 dG+g==
X-Gm-Message-State: AOAM532l2ZVQyV+K5qQbefpUzU094qseTSE+zJ+7oAFc70pkD5WToViU
 tM/UnpGpiVTZZPO7rjRjazw=
X-Google-Smtp-Source: ABdhPJw/Pdj10SN92PG4Bdy28rQf1qV8jsWTF5ft7sQMfDfaPTuxwn/WHn0hzVjI1cjYn56YgHt0fw==
X-Received: by 2002:a05:6830:3147:: with SMTP id
 c7mr5204852ots.332.1623457915004; 
 Fri, 11 Jun 2021 17:31:55 -0700 (PDT)
Received: from Powerful.. ([2605:a601:aac6:6c00:4376:94a1:82c5:6517])
 by smtp.gmail.com with ESMTPSA id z6sm1553331oiz.39.2021.06.11.17.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 17:31:53 -0700 (PDT)
From: Li Yang <leoyang.li@nxp.com>
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH] usb: gadget: fsl: properly remove remnant of MXC support
Date: Fri, 11 Jun 2021 19:31:28 -0500
Message-Id: <20210612003128.372238-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.30.2
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
Cc: arnd@arndb.de, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, ran.wang_1@nxp.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
didn't remove all the MXC related stuff which can cause build problem
for LS1021 when enabled again in Kconfig.  This patch remove all the
remnants.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 36 +++++----------------------
 drivers/usb/gadget/udc/fsl_usb2_udc.h | 19 --------------
 2 files changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 2b357b3f64c0..29fcb9b461d7 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -36,7 +36,6 @@
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 #include <linux/dmapool.h>
-#include <linux/delay.h>
 #include <linux/of_device.h>
 
 #include <asm/byteorder.h>
@@ -323,13 +322,11 @@ static int dr_controller_setup(struct fsl_udc *udc)
 		fsl_writel(tmp, &dr_regs->endptctrl[ep_num]);
 	}
 	/* Config control enable i/o output, cpu endian register */
-#ifndef CONFIG_ARCH_MXC
 	if (udc->pdata->have_sysif_regs) {
 		ctrl = __raw_readl(&usb_sys_regs->control);
 		ctrl |= USB_CTRL_IOENB;
 		__raw_writel(ctrl, &usb_sys_regs->control);
 	}
-#endif
 
 #if defined(CONFIG_PPC32) && !defined(CONFIG_NOT_COHERENT_CACHE)
 	/* Turn on cache snooping hardware, since some PowerPC platforms
@@ -2153,7 +2150,6 @@ static int fsl_proc_read(struct seq_file *m, void *v)
 	tmp_reg = fsl_readl(&dr_regs->endpointprime);
 	seq_printf(m, "EP Prime Reg = [0x%x]\n\n", tmp_reg);
 
-#ifndef CONFIG_ARCH_MXC
 	if (udc->pdata->have_sysif_regs) {
 		tmp_reg = usb_sys_regs->snoop1;
 		seq_printf(m, "Snoop1 Reg : = [0x%x]\n\n", tmp_reg);
@@ -2161,7 +2157,6 @@ static int fsl_proc_read(struct seq_file *m, void *v)
 		tmp_reg = usb_sys_regs->control;
 		seq_printf(m, "General Control Reg : = [0x%x]\n\n", tmp_reg);
 	}
-#endif
 
 	/* ------fsl_udc, fsl_ep, fsl_request structure information ----- */
 	ep = &udc->eps[0];
@@ -2412,28 +2407,21 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	 */
 	if (pdata->init && pdata->init(pdev)) {
 		ret = -ENODEV;
-		goto err_iounmap_noclk;
+		goto err_iounmap;
 	}
 
 	/* Set accessors only after pdata->init() ! */
 	fsl_set_accessors(pdata);
 
-#ifndef CONFIG_ARCH_MXC
 	if (pdata->have_sysif_regs)
 		usb_sys_regs = (void *)dr_regs + USB_DR_SYS_OFFSET;
-#endif
-
-	/* Initialize USB clocks */
-	ret = fsl_udc_clk_init(pdev);
-	if (ret < 0)
-		goto err_iounmap_noclk;
 
 	/* Read Device Controller Capability Parameters register */
 	dccparams = fsl_readl(&dr_regs->dccparams);
 	if (!(dccparams & DCCPARAMS_DC)) {
 		ERR("This SOC doesn't support device role\n");
 		ret = -ENODEV;
-		goto err_iounmap;
+		goto err_exit;
 	}
 	/* Get max device endpoints */
 	/* DEN is bidirectional ep number, max_ep doubles the number */
@@ -2442,7 +2430,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
 		ret = ret ? : -ENODEV;
-		goto err_iounmap;
+		goto err_exit;
 	}
 	udc_controller->irq = ret;
 
@@ -2451,7 +2439,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	if (ret != 0) {
 		ERR("cannot request irq %d err %d\n",
 				udc_controller->irq, ret);
-		goto err_iounmap;
+		goto err_exit;
 	}
 
 	/* Initialize the udc structure including QH member and other member */
@@ -2467,10 +2455,6 @@ static int fsl_udc_probe(struct platform_device *pdev)
 		dr_controller_setup(udc_controller);
 	}
 
-	ret = fsl_udc_clk_finalize(pdev);
-	if (ret)
-		goto err_free_irq;
-
 	/* Setup gadget structure */
 	udc_controller->gadget.ops = &fsl_gadget_ops;
 	udc_controller->gadget.max_speed = USB_SPEED_HIGH;
@@ -2530,11 +2514,10 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	dma_pool_destroy(udc_controller->td_pool);
 err_free_irq:
 	free_irq(udc_controller->irq, udc_controller);
-err_iounmap:
+err_exit:
 	if (pdata->exit)
 		pdata->exit(pdev);
-	fsl_udc_clk_release();
-err_iounmap_noclk:
+err_iounmap:
 	iounmap(dr_regs);
 err_release_mem_region:
 	if (pdata->operating_mode == FSL_USB2_DR_DEVICE)
@@ -2561,8 +2544,6 @@ static int fsl_udc_remove(struct platform_device *pdev)
 	udc_controller->done = &done;
 	usb_del_gadget_udc(&udc_controller->gadget);
 
-	fsl_udc_clk_release();
-
 	/* DR has been stopped in usb_gadget_unregister_driver() */
 	remove_proc_file();
 
@@ -2677,10 +2658,6 @@ static int fsl_udc_otg_resume(struct device *dev)
 --------------------------------------------------------------------------*/
 static const struct platform_device_id fsl_udc_devtype[] = {
 	{
-		.name = "imx-udc-mx27",
-	}, {
-		.name = "imx-udc-mx51",
-	}, {
 		.name = "fsl-usb2-udc",
 	}, {
 		/* sentinel */
@@ -2689,7 +2666,6 @@ static const struct platform_device_id fsl_udc_devtype[] = {
 MODULE_DEVICE_TABLE(platform, fsl_udc_devtype);
 static struct platform_driver udc_driver = {
 	.remove		= fsl_udc_remove,
-	/* Just for FSL i.mx SoC currently */
 	.id_table	= fsl_udc_devtype,
 	/* these suspend and resume are not usb suspend and resume */
 	.suspend	= fsl_udc_suspend,
diff --git a/drivers/usb/gadget/udc/fsl_usb2_udc.h b/drivers/usb/gadget/udc/fsl_usb2_udc.h
index 4ba651ae9048..2efc5a930b48 100644
--- a/drivers/usb/gadget/udc/fsl_usb2_udc.h
+++ b/drivers/usb/gadget/udc/fsl_usb2_udc.h
@@ -588,23 +588,4 @@ static inline struct ep_queue_head *get_qh_by_ep(struct fsl_ep *ep)
 				USB_DIR_IN) ? 1 : 0];
 }
 
-struct platform_device;
-#ifdef CONFIG_ARCH_MXC
-int fsl_udc_clk_init(struct platform_device *pdev);
-int fsl_udc_clk_finalize(struct platform_device *pdev);
-void fsl_udc_clk_release(void);
-#else
-static inline int fsl_udc_clk_init(struct platform_device *pdev)
-{
-	return 0;
-}
-static inline int fsl_udc_clk_finalize(struct platform_device *pdev)
-{
-	return 0;
-}
-static inline void fsl_udc_clk_release(void)
-{
-}
-#endif
-
 #endif
-- 
2.30.2

