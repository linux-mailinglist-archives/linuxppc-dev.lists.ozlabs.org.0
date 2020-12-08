Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD12D2D9F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 15:56:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr3CY2CQrzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 01:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 392 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Dec 2020 01:53:26 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr38Q1DgzzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 01:53:25 +1100 (AEDT)
Received: from orion.localdomain ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MkYkC-1kIJPC0qBq-00lz4e; Tue, 08 Dec 2020 15:44:08 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: usb: gadget: prefer pr_*() functions over raw
 printk()
Date: Tue,  8 Dec 2020 15:44:03 +0100
Message-Id: <20201208144403.22097-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:Hd0jRTZbyRdEtlPBUB2MGqA/988pOvZCOqb2ORa+FOFfi38Jkpt
 1l1ZPOwy1dHvIRiqjtpPZar3zuDoVixaOykeDlTX66plCa/RkBwunYPI50lZl5ZJne1SWaR
 F22p+Vm7sVO/VSHBR08hvopYMkLyxUfoNMkrb+M1m0C7BQ4p944up8bEFMEknoj+RVB29Ji
 pC+u5I5ZdwEn9KxmdK/jA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WFn1TeMzSz4=:zN1vyc5s1nodtBY/sEewat
 7LEqralka5DDBkJUNMH36fxvZ9tIvqAYQ8PU3f9aIusVpSZDf+c/ZdS1A/NLpH+k6p9UG/WMK
 KfqKnIaX6WQf1+tCLelscvrObVtqd7gb4uobXdLAYSoB+zPMqkbB6g61sX7tZCDrL4kVCPER5
 sTOVCbx9F7WShUGc/vEvBmkneXGXUlXSWDO6dYox978qwJifrfdhtT6DVFR2/OucjNwTsopuH
 eVEKbMxc5Yl1sUZumdRvwicU2wQlCitY0WSh9VU2anhG2bfLbBvzMIVZksT2iwc3EEJaQr2qz
 PdLTk4hHijZpBZPSlFDEmw0Vp/uwjWR3ai16yUqOLZRtTwZ9BBvaeWRIpZv/QOcXBJocdmdpk
 0qLB+EUNLsMsK8xNQ86Vn/XqbTRLOxHzQh0vhlNyTFIgy9qMst1s25hqdHo2e
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 laurent.pinchart@ideasonboard.com, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reduce a bit logging boilerplate by using the preferred pr_*()
macros instead of raw printk().

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/usb/gadget/function/uvc.h       |  2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c |  2 +-
 drivers/usb/gadget/udc/fsl_udc_core.c   |  4 +--
 drivers/usb/gadget/udc/fsl_usb2_udc.h   |  4 +--
 drivers/usb/gadget/udc/fusb300_udc.c    | 64 ++++++++++++++++-----------------
 drivers/usb/gadget/udc/goku_udc.c       |  2 +-
 drivers/usb/gadget/udc/r8a66597-udc.h   |  2 +-
 7 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 23ee25383c1f..d546eb7c348c 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -49,7 +49,7 @@ extern unsigned int uvc_gadget_trace_param;
 #define uvc_trace(flag, msg...) \
 	do { \
 		if (uvc_gadget_trace_param & flag) \
-			printk(KERN_DEBUG "uvcvideo: " msg); \
+			pr_debug("uvcvideo: " msg); \
 	} while (0)
 
 #define uvcg_dbg(f, fmt, args...) \
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 2b893bceea45..4834fafb3f70 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -1573,7 +1573,7 @@ static void usba_control_irq(struct usba_udc *udc, struct usba_ep *ep)
 		 * generate or receive a reply right away. */
 		usba_ep_writel(ep, CLR_STA, USBA_RX_SETUP);
 
-		/* printk(KERN_DEBUG "setup: %d: %02x.%02x\n",
+		/* pr_debug("setup: %d: %02x.%02x\n",
 			ep->state, crq.crq.bRequestType,
 			crq.crq.bRequest); */
 
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index ad6ff9c4188e..cab4def04f9f 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -1474,7 +1474,7 @@ __acquires(udc->lock)
 			mdelay(10);
 			tmp = fsl_readl(&dr_regs->portsc1) | (ptc << 16);
 			fsl_writel(tmp, &dr_regs->portsc1);
-			printk(KERN_INFO "udc: switch to test mode %d.\n", ptc);
+			pr_info("udc: switch to test mode %d.\n", ptc);
 		}
 
 		return;
@@ -1952,7 +1952,7 @@ static int fsl_udc_start(struct usb_gadget *g,
 	if (!IS_ERR_OR_NULL(udc_controller->transceiver)) {
 		/* Suspend the controller until OTG enable it */
 		udc_controller->stopped = 1;
-		printk(KERN_INFO "Suspend udc for OTG auto detect\n");
+		pr_info("Suspend udc for OTG auto detect\n");
 
 		/* connect to bus through transceiver */
 		if (!IS_ERR_OR_NULL(udc_controller->transceiver)) {
diff --git a/drivers/usb/gadget/udc/fsl_usb2_udc.h b/drivers/usb/gadget/udc/fsl_usb2_udc.h
index 4ba651ae9048..b180bf14dd0c 100644
--- a/drivers/usb/gadget/udc/fsl_usb2_udc.h
+++ b/drivers/usb/gadget/udc/fsl_usb2_udc.h
@@ -509,7 +509,7 @@ struct fsl_udc {
 /*-------------------------------------------------------------------------*/
 
 #ifdef DEBUG
-#define DBG(fmt, args...) 	printk(KERN_DEBUG "[%s]  " fmt "\n", \
+#define DBG(fmt, args...) 	pr_debug("[%s]  " fmt "\n", \
 				__func__, ## args)
 #else
 #define DBG(fmt, args...)	do{}while(0)
@@ -535,7 +535,7 @@ static void dump_msg(const char *label, const u8 * buf, unsigned int length)
 			p += 3;
 		}
 		*p = 0;
-		printk(KERN_DEBUG "%6x: %s\n", start, line);
+		pr_debug("%6x: %s\n", start, line);
 		buf += num;
 		start += num;
 		length -= num;
diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index 9af8b415f303..c4e7e4b8e46f 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -352,24 +352,24 @@ static void fusb300_wrcxf(struct fusb300_ep *ep,
 		for (i = length >> 2; i > 0; i--) {
 			data = *tmp | *(tmp + 1) << 8 | *(tmp + 2) << 16 |
 				*(tmp + 3) << 24;
-			printk(KERN_DEBUG "    0x%x\n", data);
+			pr_debug("    0x%x\n", data);
 			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
 			tmp = tmp + 4;
 		}
 		switch (length % 4) {
 		case 1:
 			data = *tmp;
-			printk(KERN_DEBUG "    0x%x\n", data);
+			pr_debug("    0x%x\n", data);
 			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
 			break;
 		case 2:
 			data = *tmp | *(tmp + 1) << 8;
-			printk(KERN_DEBUG "    0x%x\n", data);
+			pr_debug("    0x%x\n", data);
 			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
 			break;
 		case 3:
 			data = *tmp | *(tmp + 1) << 8 | *(tmp + 2) << 16;
-			printk(KERN_DEBUG "    0x%x\n", data);
+			pr_debug("    0x%x\n", data);
 			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
 			break;
 		default:
@@ -390,7 +390,7 @@ static void fusb300_clear_epnstall(struct fusb300 *fusb300, u8 ep)
 	u32 reg = ioread32(fusb300->reg + FUSB300_OFFSET_EPSET0(ep));
 
 	if (reg & FUSB300_EPSET0_STL) {
-		printk(KERN_DEBUG "EP%d stall... Clear!!\n", ep);
+		pr_debug("EP%d stall... Clear!!\n", ep);
 		reg |= FUSB300_EPSET0_STL_CLR;
 		iowrite32(reg, fusb300->reg + FUSB300_OFFSET_EPSET0(ep));
 	}
@@ -402,7 +402,7 @@ static void ep0_queue(struct fusb300_ep *ep, struct fusb300_request *req)
 		if (req->req.length) {
 			fusb300_wrcxf(ep, req);
 		} else
-			printk(KERN_DEBUG "%s : req->req.length = 0x%x\n",
+			pr_debug("%s : req->req.length = 0x%x\n",
 				__func__, req->req.length);
 		if ((req->req.length == req->req.actual) ||
 		    (req->req.actual < ep->ep.maxpacket))
@@ -565,7 +565,7 @@ static void fusb300_rdcxf(struct fusb300 *fusb300,
 
 	for (i = (length >> 2); i > 0; i--) {
 		data = ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
-		printk(KERN_DEBUG "    0x%x\n", data);
+		pr_debug("    0x%x\n", data);
 		*tmp = data & 0xFF;
 		*(tmp + 1) = (data >> 8) & 0xFF;
 		*(tmp + 2) = (data >> 16) & 0xFF;
@@ -576,18 +576,18 @@ static void fusb300_rdcxf(struct fusb300 *fusb300,
 	switch (length % 4) {
 	case 1:
 		data = ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
-		printk(KERN_DEBUG "    0x%x\n", data);
+		pr_debug("    0x%x\n", data);
 		*tmp = data & 0xFF;
 		break;
 	case 2:
 		data = ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
-		printk(KERN_DEBUG "    0x%x\n", data);
+		pr_debug("    0x%x\n", data);
 		*tmp = data & 0xFF;
 		*(tmp + 1) = (data >> 8) & 0xFF;
 		break;
 	case 3:
 		data = ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
-		printk(KERN_DEBUG "    0x%x\n", data);
+		pr_debug("    0x%x\n", data);
 		*tmp = data & 0xFF;
 		*(tmp + 1) = (data >> 8) & 0xFF;
 		*(tmp + 2) = (data >> 16) & 0xFF;
@@ -610,7 +610,7 @@ static void fusb300_rdfifo(struct fusb300_ep *ep,
 	req->req.actual += length;
 
 	if (req->req.actual > req->req.length)
-		printk(KERN_DEBUG "req->req.actual > req->req.length\n");
+		pr_debug("req->req.actual > req->req.length\n");
 
 	for (i = (length >> 2); i > 0; i--) {
 		data = ioread32(fusb300->reg +
@@ -649,7 +649,7 @@ static void fusb300_rdfifo(struct fusb300_ep *ep,
 		reg = ioread32(fusb300->reg + FUSB300_OFFSET_IGR1);
 		reg &= FUSB300_IGR1_SYNF0_EMPTY_INT;
 		if (i)
-			printk(KERN_INFO "sync fifo is not empty!\n");
+			pr_info("sync fifo is not empty!\n");
 		i++;
 	} while (!reg);
 }
@@ -677,7 +677,7 @@ static u8 fusb300_get_cxstall(struct fusb300 *fusb300)
 static void request_error(struct fusb300 *fusb300)
 {
 	fusb300_set_cxstall(fusb300);
-	printk(KERN_DEBUG "request error!!\n");
+	pr_debug("request error!!\n");
 }
 
 static void get_status(struct fusb300 *fusb300, struct usb_ctrlrequest *ctrl)
@@ -999,7 +999,7 @@ static void check_device_mode(struct fusb300 *fusb300)
 		fusb300->gadget.speed = USB_SPEED_UNKNOWN;
 		break;
 	}
-	printk(KERN_INFO "dev_mode = %d\n", (reg & FUSB300_GCR_DEVEN_MSK));
+	pr_info("dev_mode = %d\n", (reg & FUSB300_GCR_DEVEN_MSK));
 }
 
 
@@ -1076,14 +1076,14 @@ static irqreturn_t fusb300_irq(int irq, void *_fusb300)
 	if (int_grp1 & FUSB300_IGR1_WARM_RST_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_WARM_RST_INT);
-		printk(KERN_INFO"fusb300_warmreset\n");
+		pr_info("fusb300_warmreset\n");
 		fusb300_reset();
 	}
 
 	if (int_grp1 & FUSB300_IGR1_HOT_RST_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_HOT_RST_INT);
-		printk(KERN_INFO"fusb300_hotreset\n");
+		pr_info("fusb300_hotreset\n");
 		fusb300_reset();
 	}
 
@@ -1097,13 +1097,13 @@ static irqreturn_t fusb300_irq(int irq, void *_fusb300)
 	if (int_grp1 & FUSB300_IGR1_CX_COMABT_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_CX_COMABT_INT);
-		printk(KERN_INFO"fusb300_ep0abt\n");
+		pr_info("fusb300_ep0abt\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_VBUS_CHG_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_VBUS_CHG_INT);
-		printk(KERN_INFO"fusb300_vbus_change\n");
+		pr_info("fusb300_vbus_change\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_U3_EXIT_FAIL_INT) {
@@ -1134,25 +1134,25 @@ static irqreturn_t fusb300_irq(int irq, void *_fusb300)
 	if (int_grp1 & FUSB300_IGR1_U3_EXIT_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_U3_EXIT_INT);
-		printk(KERN_INFO "FUSB300_IGR1_U3_EXIT_INT\n");
+		pr_info("FUSB300_IGR1_U3_EXIT_INT\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_U2_EXIT_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_U2_EXIT_INT);
-		printk(KERN_INFO "FUSB300_IGR1_U2_EXIT_INT\n");
+		pr_info("FUSB300_IGR1_U2_EXIT_INT\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_U1_EXIT_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_U1_EXIT_INT);
-		printk(KERN_INFO "FUSB300_IGR1_U1_EXIT_INT\n");
+		pr_info("FUSB300_IGR1_U1_EXIT_INT\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_U3_ENTRY_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_U3_ENTRY_INT);
-		printk(KERN_INFO "FUSB300_IGR1_U3_ENTRY_INT\n");
+		pr_info("FUSB300_IGR1_U3_ENTRY_INT\n");
 		fusb300_enable_bit(fusb300, FUSB300_OFFSET_SSCR1,
 				   FUSB300_SSCR1_GO_U3_DONE);
 	}
@@ -1160,31 +1160,31 @@ static irqreturn_t fusb300_irq(int irq, void *_fusb300)
 	if (int_grp1 & FUSB300_IGR1_U2_ENTRY_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_U2_ENTRY_INT);
-		printk(KERN_INFO "FUSB300_IGR1_U2_ENTRY_INT\n");
+		pr_info("FUSB300_IGR1_U2_ENTRY_INT\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_U1_ENTRY_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_U1_ENTRY_INT);
-		printk(KERN_INFO "FUSB300_IGR1_U1_ENTRY_INT\n");
+		pr_info("FUSB300_IGR1_U1_ENTRY_INT\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_RESM_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_RESM_INT);
-		printk(KERN_INFO "fusb300_resume\n");
+		pr_info("fusb300_resume\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_SUSP_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_SUSP_INT);
-		printk(KERN_INFO "fusb300_suspend\n");
+		pr_info("fusb300_suspend\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_HS_LPM_INT) {
 		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
 				  FUSB300_IGR1_HS_LPM_INT);
-		printk(KERN_INFO "fusb300_HS_LPM_INT\n");
+		pr_info("fusb300_HS_LPM_INT\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_DEV_MODE_CHG_INT) {
@@ -1195,11 +1195,11 @@ static irqreturn_t fusb300_irq(int irq, void *_fusb300)
 
 	if (int_grp1 & FUSB300_IGR1_CX_COMFAIL_INT) {
 		fusb300_set_cxstall(fusb300);
-		printk(KERN_INFO "fusb300_ep0fail\n");
+		pr_info("fusb300_ep0fail\n");
 	}
 
 	if (int_grp1 & FUSB300_IGR1_CX_SETUP_INT) {
-		printk(KERN_INFO "fusb300_ep0setup\n");
+		pr_info("fusb300_ep0setup\n");
 		if (setup_packet(fusb300, &ctrl)) {
 			spin_unlock(&fusb300->lock);
 			if (fusb300->driver->setup(&fusb300->gadget, &ctrl) < 0)
@@ -1209,16 +1209,16 @@ static irqreturn_t fusb300_irq(int irq, void *_fusb300)
 	}
 
 	if (int_grp1 & FUSB300_IGR1_CX_CMDEND_INT)
-		printk(KERN_INFO "fusb300_cmdend\n");
+		pr_info("fusb300_cmdend\n");
 
 
 	if (int_grp1 & FUSB300_IGR1_CX_OUT_INT) {
-		printk(KERN_INFO "fusb300_cxout\n");
+		pr_info("fusb300_cxout\n");
 		fusb300_ep0out(fusb300);
 	}
 
 	if (int_grp1 & FUSB300_IGR1_CX_IN_INT) {
-		printk(KERN_INFO "fusb300_cxin\n");
+		pr_info("fusb300_cxin\n");
 		fusb300_ep0in(fusb300);
 	}
 
diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index 3e1267d38774..4f225552861a 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -1748,7 +1748,7 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	int			retval;
 
 	if (!pdev->irq) {
-		printk(KERN_ERR "Check PCI %s IRQ setup!\n", pci_name(pdev));
+		pr_err("Check PCI %s IRQ setup!\n", pci_name(pdev));
 		retval = -ENODEV;
 		goto err;
 	}
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.h b/drivers/usb/gadget/udc/r8a66597-udc.h
index 9a115caba661..fa4d62c32ea1 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.h
+++ b/drivers/usb/gadget/udc/r8a66597-udc.h
@@ -247,7 +247,7 @@ static inline u16 get_xtal_from_pdata(struct r8a66597_platdata *pdata)
 		clock = XTAL48;
 		break;
 	default:
-		printk(KERN_ERR "r8a66597: platdata clock is wrong.\n");
+		pr_err("r8a66597: platdata clock is wrong.\n");
 		break;
 	}
 
-- 
2.11.0

