Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E96989DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 02:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHHbP2wMPz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 12:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=42.101.60.237; helo=mail.nfschina.com; envelope-from=zhounan@nfschina.com; receiver=<UNKNOWN>)
Received: from mail.nfschina.com (unknown [42.101.60.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHHZn3yMpz3cGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 12:35:44 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 940CE1A00990;
	Thu, 16 Feb 2023 09:36:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQiqXFqyimAa; Thu, 16 Feb 2023 09:36:14 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zhounan@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 69E6D1A00910;
	Thu, 16 Feb 2023 09:36:14 +0800 (CST)
From: Zhou nan <zhounan@nfschina.com>
To: leoyang.li@nxp.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2] usb: fix some spelling mistakes in comment of gadget
Date: Wed, 15 Feb 2023 17:35:35 -0800
Message-Id: <20230216013535.6399-1-zhounan@nfschina.com>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zhou nan <zhounan@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

usb: Fix spelling mistake in comments of gadget.

Signed-off-by: Zhou nan <zhounan@nfschina.com>
---
v2:
- Modify the title and description text.
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index a67873a074b7..da876d09fc01 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -471,7 +471,7 @@ static int dr_ep_get_stall(unsigned char ep_num, unsigned char dir)
 ********************************************************************/
 
 /*------------------------------------------------------------------
-* struct_ep_qh_setup(): set the Endpoint Capabilites field of QH
+* struct_ep_qh_setup(): set the Endpoint Capabilities field of QH
  * @zlt: Zero Length Termination Select (1: disable; 0: enable)
  * @mult: Mult field
  ------------------------------------------------------------------*/
@@ -483,7 +483,7 @@ static void struct_ep_qh_setup(struct fsl_udc *udc, unsigned char ep_num,
 	struct ep_queue_head *p_QH = &udc->ep_qh[2 * ep_num + dir];
 	unsigned int tmp = 0;
 
-	/* set the Endpoint Capabilites in QH */
+	/* set the Endpoint Capabilities in QH */
 	switch (ep_type) {
 	case USB_ENDPOINT_XFER_CONTROL:
 		/* Interrupt On Setup (IOS). for control ep  */
@@ -593,7 +593,7 @@ static int fsl_ep_enable(struct usb_ep *_ep,
 	ep->stopped = 0;
 
 	/* Controller related setup */
-	/* Init EPx Queue Head (Ep Capabilites field in QH
+	/* Init EPx Queue Head (Ep Capabilities field in QH
 	 * according to max, zlt, mult) */
 	struct_ep_qh_setup(udc, (unsigned char) ep_index(ep),
 			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
@@ -1361,7 +1361,7 @@ static void ch9getstatus(struct fsl_udc *udc, u8 request_type, u16 value,
 	udc->ep0_dir = USB_DIR_IN;
 	/* Borrow the per device status_req */
 	req = udc->status_req;
-	/* Fill in the reqest structure */
+	/* Fill in the request structure */
 	*((u16 *) req->req.buf) = cpu_to_le16(tmp);
 
 	req->ep = ep;
-- 
2.27.0

