Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D940890A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 10:19:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465sMz242MzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 18:19:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ae155d32c5e98ef18dee+5831+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Wd/MLYXc"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465s492wDjzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 18:06:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3t34NdMYaxK3b7q79OweXtc3LDVxX2AkiLPLkSCTGmc=; b=Wd/MLYXcWw0RcxlthtcL1M20zy
 3bKATolABUJyp/PAgkQ4isIzv+9iROyEB1CcZ4Ml1Wi3ZnAy4EOi3+/rg1Xny12A0iq9qRSOMEqZa
 Nbk/hVRbubwVuY2/kv++6zEIq1+31DKl3O+lUg8hlojvJVESHBqyreHowXtg8HUx/MxToZvM3TyIi
 /mGely6wTaaqz/q+rfs1GIvjoeWuxn/W3PSj/6hwcgD19UG1ZFWNPDAo2LSio+dvq8ZhXo2EgfB6v
 gm+4ZM2IgnbwIXhK3NKrv9vstUDV5KKfTSSSxGKaLE5dTMpuLRcbZLstlxanB4X3rU4Ie6P0oSDV1
 xs8Di//Q==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hwir6-0001ut-IN; Sun, 11 Aug 2019 08:05:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH 2/6] usb: add a hcd_uses_dma helper
Date: Sun, 11 Aug 2019 10:05:16 +0200
Message-Id: <20190811080520.21712-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190811080520.21712-1-hch@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, Olav Kongas <ok@artecdesign.ee>,
 Gavin Li <git@thegavinli.com>, linuxppc-dev@lists.ozlabs.org,
 Mathias Nyman <mathias.nyman@intel.com>, Geoff Levand <geoff@infradead.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-usb@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Minas Harutyunyan <hminas@synopsys.com>, Shawn Guo <shawnguo@kernel.org>,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The USB buffer allocation code is the only place in the usb core (and in
fact the whole kernel) that uses is_device_dma_capable, while the URB
mapping code uses the uses_dma flag in struct usb_bus.  Switch the buffer
allocation to use the uses_dma flag used by the rest of the USB code,
and create a helper in hcd.h that checks this flag as well as the
CONFIG_HAS_DMA to simplify the caller a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/core/buffer.c | 10 +++-------
 drivers/usb/core/hcd.c    |  4 ++--
 drivers/usb/dwc2/hcd.c    |  2 +-
 include/linux/usb.h       |  2 +-
 include/linux/usb/hcd.h   |  3 +++
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index 1a5b3dcae930..6cf22c27f2d2 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -66,9 +66,7 @@ int hcd_buffer_create(struct usb_hcd *hcd)
 	char		name[16];
 	int		i, size;
 
-	if (hcd->localmem_pool ||
-	    !IS_ENABLED(CONFIG_HAS_DMA) ||
-	    !is_device_dma_capable(hcd->self.sysdev))
+	if (hcd->localmem_pool || !hcd_uses_dma(hcd))
 		return 0;
 
 	for (i = 0; i < HCD_BUFFER_POOLS; i++) {
@@ -129,8 +127,7 @@ void *hcd_buffer_alloc(
 		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
 
 	/* some USB hosts just use PIO */
-	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
-	    !is_device_dma_capable(bus->sysdev)) {
+	if (!hcd_uses_dma(hcd)) {
 		*dma = ~(dma_addr_t) 0;
 		return kmalloc(size, mem_flags);
 	}
@@ -160,8 +157,7 @@ void hcd_buffer_free(
 		return;
 	}
 
-	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
-	    !is_device_dma_capable(bus->sysdev)) {
+	if (!hcd_uses_dma(hcd)) {
 		kfree(addr);
 		return;
 	}
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 2ccbc2f83570..8592c0344fe8 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1412,7 +1412,7 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 	if (usb_endpoint_xfer_control(&urb->ep->desc)) {
 		if (hcd->self.uses_pio_for_control)
 			return ret;
-		if (IS_ENABLED(CONFIG_HAS_DMA) && hcd->self.uses_dma) {
+		if (hcd_uses_dma(hcd)) {
 			if (is_vmalloc_addr(urb->setup_packet)) {
 				WARN_ONCE(1, "setup packet is not dma capable\n");
 				return -EAGAIN;
@@ -1446,7 +1446,7 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 	if (urb->transfer_buffer_length != 0
 	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
-		if (IS_ENABLED(CONFIG_HAS_DMA) && hcd->self.uses_dma) {
+		if (hcd_uses_dma(hcd)) {
 			if (urb->num_sgs) {
 				int n;
 
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index ee144ff8af5b..111787a137ee 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4608,7 +4608,7 @@ static int _dwc2_hcd_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 
 	buf = urb->transfer_buffer;
 
-	if (hcd->self.uses_dma) {
+	if (hcd_uses_dma(hcd)) {
 		if (!buf && (urb->transfer_dma & 3)) {
 			dev_err(hsotg->dev,
 				"%s: unaligned transfer with no transfer_buffer",
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 83d35d993e8c..e87826e23d59 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1457,7 +1457,7 @@ typedef void (*usb_complete_t)(struct urb *);
  * field rather than determining a dma address themselves.
  *
  * Note that transfer_buffer must still be set if the controller
- * does not support DMA (as indicated by bus.uses_dma) and when talking
+ * does not support DMA (as indicated by hcd_uses_dma()) and when talking
  * to root hub. If you have to trasfer between highmem zone and the device
  * on such controller, create a bounce buffer or bail out with an error.
  * If transfer_buffer cannot be set (is in highmem) and the controller is DMA
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index bab27ccc8ff5..a20e7815d814 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -422,6 +422,9 @@ static inline bool hcd_periodic_completion_in_progress(struct usb_hcd *hcd,
 	return hcd->high_prio_bh.completing_ep == ep;
 }
 
+#define hcd_uses_dma(hcd) \
+	(IS_ENABLED(CONFIG_HAS_DMA) && (hcd)->self.uses_dma)
+
 extern int usb_hcd_link_urb_to_ep(struct usb_hcd *hcd, struct urb *urb);
 extern int usb_hcd_check_unlink_urb(struct usb_hcd *hcd, struct urb *urb,
 		int status);
-- 
2.20.1

