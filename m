Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BC8700FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 13:12:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpHdG1GJPz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpHcr5FC0z2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 23:12:10 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rh7Al-00085U-W2; Mon, 04 Mar 2024 13:12:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rh7Ak-004LRw-QV; Mon, 04 Mar 2024 13:11:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rh7Ak-00Gg77-2M;
	Mon, 04 Mar 2024 13:11:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: fsl-udc: Replace custom log wrappers by pr_{err,warn,debug}
Date: Mon,  4 Mar 2024 13:11:53 +0100
Message-ID: <20240304121153.750165-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8481; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SqhwOJp6gk4aDa+lNR4UBczOfjcJVDAFw6aFbeB6lQo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5bqJLeDO5TMsRbJivONu/ac5yk3LyT1NidXTN UbJlYxBQWSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeW6iQAKCRCPgPtYfRL+ TibqB/4wotkIPKKzOGpbwso5bVniLhNUxgM2BVEn+RxoSn+7KP4GcfVYNs2/ZUsQWwR5WOV+Hyw 0vu7HvXed0HuBCd9RtgIBQJHfvm3Zp5L402ll1Mzl67e8PyqcM2isp1Rf2/sSjh0jLHZmbSjJw2 o5leVcenABM63qSz1Yhjifo74QeBYo+KCdU6sHuB6lWNJUu5c+BErKJk4fKZgDpLWqahvXwKuN1 ViYcsWWkavGQxFEWWRA65B5nzsD6aJYLXbeD50O0396GMFThXAUR02QK62cv2oG48PA+a1wNze5 6RkFkcWJW75WwFmod4XjW5w3+nink7KaV1qjGPUpq1W/t1OS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The custom log wrappers ERR, WARNING and DBG don't add anything useful
that cannot easily be done with pr_err() and friends. Replace the custom
stuff by the well known functions from printk.h.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I didn't replace VDBG by pr_vdebug because the latter doesn't exist.
Alternatively all these macros could be replaced by
dev_{err,warn,dbg,vdbg}, which however would be a bigger change that
affects the output more.

Thoughts?

Best regards
Uwe

 drivers/usb/gadget/udc/fsl_udc_core.c | 36 ++++++++++++++-------------
 drivers/usb/gadget/udc/fsl_usb2_udc.h | 19 +++-----------
 2 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index e8042c158f6d..ebe611d4a7f9 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -15,6 +15,8 @@
 
 #undef VERBOSE
 
+#define pr_fmt(x) "udc: " x
+
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/ioport.h>
@@ -285,7 +287,7 @@ static int dr_controller_setup(struct fsl_udc *udc)
 	timeout = jiffies + FSL_UDC_RESET_TIMEOUT;
 	while (fsl_readl(&dr_regs->usbcmd) & USB_CMD_CTRL_RESET) {
 		if (time_after(jiffies, timeout)) {
-			ERR("udc reset timeout!\n");
+			pr_err("udc reset timeout!\n");
 			return -ETIMEDOUT;
 		}
 		cpu_relax();
@@ -1105,7 +1107,7 @@ static void fsl_ep_fifo_flush(struct usb_ep *_ep)
 		/* Wait until flush complete */
 		while (fsl_readl(&dr_regs->endptflush)) {
 			if (time_after(jiffies, timeout)) {
-				ERR("ep flush timeout\n");
+				pr_err("ep flush timeout\n");
 				return;
 			}
 			cpu_relax();
@@ -1543,7 +1545,7 @@ static void ep0_req_complete(struct fsl_udc *udc, struct fsl_ep *ep0,
 		udc->ep0_state = WAIT_FOR_SETUP;
 		break;
 	case WAIT_FOR_SETUP:
-		ERR("Unexpected ep0 packets\n");
+		pr_err("Unexpected ep0 packets\n");
 		break;
 	default:
 		ep0stall(udc);
@@ -1612,7 +1614,7 @@ static int process_ep_req(struct fsl_udc *udc, int pipe,
 		errors = hc32_to_cpu(curr_td->size_ioc_sts);
 		if (errors & DTD_ERROR_MASK) {
 			if (errors & DTD_STATUS_HALTED) {
-				ERR("dTD error %08x QH=%d\n", errors, pipe);
+				pr_err("dTD error %08x QH=%d\n", errors, pipe);
 				/* Clear the errors and Halt condition */
 				tmp = hc32_to_cpu(curr_qh->size_ioc_int_sts);
 				tmp &= ~errors;
@@ -1631,7 +1633,7 @@ static int process_ep_req(struct fsl_udc *udc, int pipe,
 				status = -EILSEQ;
 				break;
 			} else
-				ERR("Unknown error has occurred (0x%x)!\n",
+				pr_err("Unknown error has occurred (0x%x)!\n",
 					errors);
 
 		} else if (hc32_to_cpu(curr_td->size_ioc_sts)
@@ -1691,7 +1693,7 @@ static void dtd_complete_irq(struct fsl_udc *udc)
 
 		/* If the ep is configured */
 		if (!curr_ep->ep.name) {
-			WARNING("Invalid EP?");
+			pr_warn("Invalid EP?\n");
 			continue;
 		}
 
@@ -1820,7 +1822,7 @@ static void reset_irq(struct fsl_udc *udc)
 	while (fsl_readl(&dr_regs->endpointprime)) {
 		/* Wait until all endptprime bits cleared */
 		if (time_after(jiffies, timeout)) {
-			ERR("Timeout for reset\n");
+			pr_err("Timeout for reset\n");
 			break;
 		}
 		cpu_relax();
@@ -1958,7 +1960,7 @@ static int fsl_udc_start(struct usb_gadget *g,
 					udc_controller->transceiver->otg,
 						    &udc_controller->gadget);
 			if (retval < 0) {
-				ERR("can't bind to transceiver\n");
+				pr_err("can't bind to transceiver\n");
 				udc_controller->driver = NULL;
 				return retval;
 			}
@@ -2243,7 +2245,7 @@ static int struct_udc_setup(struct fsl_udc *udc,
 
 	udc->eps = kcalloc(udc->max_ep, sizeof(struct fsl_ep), GFP_KERNEL);
 	if (!udc->eps) {
-		ERR("kmalloc udc endpoint status failed\n");
+		pr_err("kmalloc udc endpoint status failed\n");
 		goto eps_alloc_failed;
 	}
 
@@ -2258,7 +2260,7 @@ static int struct_udc_setup(struct fsl_udc *udc,
 	udc->ep_qh = dma_alloc_coherent(&pdev->dev, size,
 					&udc->ep_qh_dma, GFP_KERNEL);
 	if (!udc->ep_qh) {
-		ERR("malloc QHs for udc failed\n");
+		pr_err("malloc QHs for udc failed\n");
 		goto ep_queue_alloc_failed;
 	}
 
@@ -2269,14 +2271,14 @@ static int struct_udc_setup(struct fsl_udc *udc,
 	udc->status_req = container_of(fsl_alloc_request(NULL, GFP_KERNEL),
 			struct fsl_req, req);
 	if (!udc->status_req) {
-		ERR("kzalloc for udc status request failed\n");
+		pr_err("kzalloc for udc status request failed\n");
 		goto udc_status_alloc_failed;
 	}
 
 	/* allocate a small amount of memory to get valid address */
 	udc->status_req->req.buf = kmalloc(8, GFP_KERNEL);
 	if (!udc->status_req->req.buf) {
-		ERR("kzalloc for udc request buffer failed\n");
+		pr_err("kzalloc for udc request buffer failed\n");
 		goto udc_req_buf_alloc_failed;
 	}
 
@@ -2373,7 +2375,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	if (pdata->operating_mode == FSL_USB2_DR_OTG) {
 		udc_controller->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
 		if (IS_ERR_OR_NULL(udc_controller->transceiver)) {
-			ERR("Can't find OTG driver!\n");
+			pr_err("Can't find OTG driver!\n");
 			ret = -ENODEV;
 			goto err_kfree;
 		}
@@ -2389,7 +2391,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	if (pdata->operating_mode == FSL_USB2_DR_DEVICE) {
 		if (!request_mem_region(res->start, resource_size(res),
 					driver_name)) {
-			ERR("request mem region for %s failed\n", pdev->name);
+			pr_err("request mem region for %s failed\n", pdev->name);
 			ret = -EBUSY;
 			goto err_kfree;
 		}
@@ -2420,7 +2422,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	/* Read Device Controller Capability Parameters register */
 	dccparams = fsl_readl(&dr_regs->dccparams);
 	if (!(dccparams & DCCPARAMS_DC)) {
-		ERR("This SOC doesn't support device role\n");
+		pr_err("This SOC doesn't support device role\n");
 		ret = -ENODEV;
 		goto err_exit;
 	}
@@ -2438,14 +2440,14 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	ret = request_irq(udc_controller->irq, fsl_udc_irq, IRQF_SHARED,
 			driver_name, udc_controller);
 	if (ret != 0) {
-		ERR("cannot request irq %d err %d\n",
+		pr_err("cannot request irq %d err %d\n",
 				udc_controller->irq, ret);
 		goto err_exit;
 	}
 
 	/* Initialize the udc structure including QH member and other member */
 	if (struct_udc_setup(udc_controller, pdev)) {
-		ERR("Can't initialize udc data structure\n");
+		pr_err("Can't initialize udc data structure\n");
 		ret = -ENOMEM;
 		goto err_free_irq;
 	}
diff --git a/drivers/usb/gadget/udc/fsl_usb2_udc.h b/drivers/usb/gadget/udc/fsl_usb2_udc.h
index 2efc5a930b48..646bef64756e 100644
--- a/drivers/usb/gadget/udc/fsl_usb2_udc.h
+++ b/drivers/usb/gadget/udc/fsl_usb2_udc.h
@@ -508,13 +508,6 @@ struct fsl_udc {
 
 /*-------------------------------------------------------------------------*/
 
-#ifdef DEBUG
-#define DBG(fmt, args...) 	printk(KERN_DEBUG "[%s]  " fmt "\n", \
-				__func__, ## args)
-#else
-#define DBG(fmt, args...)	do{}while(0)
-#endif
-
 #if 0
 static void dump_msg(const char *label, const u8 * buf, unsigned int length)
 {
@@ -523,7 +516,7 @@ static void dump_msg(const char *label, const u8 * buf, unsigned int length)
 
 	if (length >= 512)
 		return;
-	DBG("%s, length %u:\n", label, length);
+	pr_debug("[%s] %s, length %u:\n", __func__, label, length);
 	start = 0;
 	while (length > 0) {
 		num = min(length, 16u);
@@ -535,7 +528,7 @@ static void dump_msg(const char *label, const u8 * buf, unsigned int length)
 			p += 3;
 		}
 		*p = 0;
-		printk(KERN_DEBUG "%6x: %s\n", start, line);
+		pr_debug("%6x: %s\n", start, line);
 		buf += num;
 		start += num;
 		length -= num;
@@ -544,15 +537,11 @@ static void dump_msg(const char *label, const u8 * buf, unsigned int length)
 #endif
 
 #ifdef VERBOSE
-#define VDBG		DBG
+#define VDBG(fmt, args...)	pr_debug("[%s] " fmt "\n", ## args)
 #else
-#define VDBG(stuff...)	do{}while(0)
+#define VDBG(fmt, args...)	do {} while(0)
 #endif
 
-#define ERR(stuff...)		pr_err("udc: " stuff)
-#define WARNING(stuff...)	pr_warn("udc: " stuff)
-#define INFO(stuff...)		pr_info("udc: " stuff)
-
 /*-------------------------------------------------------------------------*/
 
 /* ### Add board specific defines here

base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
-- 
2.43.0

