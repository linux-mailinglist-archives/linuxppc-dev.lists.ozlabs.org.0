Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432124C6C46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:24:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6fhK2sLvz3bpP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 23:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VH7eVEC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VH7eVEC8; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6d161p0sz2yMD;
 Mon, 28 Feb 2022 22:08:57 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id p15so23996018ejc.7;
 Mon, 28 Feb 2022 03:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/EGi4mr40p3raaac66vU0+hvD5YB9qCu1pOgtbPKlNE=;
 b=VH7eVEC8n4nRrOoErZmqRCmKK7V5zc3O3oKOvZo//InJ7XISRo4OXBvRXMfd2rUS1i
 Z3McStXnEH5YC1rDBQByspf6SMehlrdIcvguNTspxofen/r+Ku9/5Zc6VDa43ZuI+L2p
 ODGsjalHPfmdltJq4PehGBFpGUI5lnN4Jq/QY5horoOOjoTVfSDxXFEdAwVql0IqIAtS
 7kgSGPGWQVceCqMCNEvvla+av+fJUYIE93j17d1iaJrIlF6Edh2jwNed9PrIimvbPII3
 vwkIbcMNChpBfeEAd9IaH2Ydb6zZyuRdWphPE+E4m5NB1jeJOzq80m/tuCsGSREkl1bm
 sUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/EGi4mr40p3raaac66vU0+hvD5YB9qCu1pOgtbPKlNE=;
 b=xLNIpIF5dBv8RFqZzmWLZwL9hrvVXGuPZFcLWdNeUesQr3gG3s7sEkp7N46GaAgN9d
 9olzLls7bOxPTk3V1a25WbWTHQt2uB1pLFGv7xXZiU7RnQO6XglVZ7TG1YaME2lP9ZQ0
 ipP+qbE8RW9/6jjoXbuPaKi1pDMWzrNeFUZFkAvxVgbhjWga2Q+alN/yd6RqiIw9tE0l
 56Pw9cwFsGY4FmHdsof1gFmTczk9MSjzJ1DCCGT5LyphnnnlEmrX4luEQnriQLaNIPd3
 6V6noX5yUHIeV7FEubrTeHG8PTQfgdkU3LZiEFyHhNZsz30YPfxEqfDztIbMuRpvPMq2
 qK6Q==
X-Gm-Message-State: AOAM5309+6KEh8jTdHTkNZXKa8dweOXzEDr0TiJya1MbzUHh+ehzNvCV
 WxG6j9DTEpPlsqrVpYvuIgo=
X-Google-Smtp-Source: ABdhPJxdOZxTrBRs3m8EHdN9xiZB1+7/ZwU5F9dTBO3q/FP0GLy97OxjFGh37oi6BNvQ+yLVOlfqsg==
X-Received: by 2002:a17:907:3dab:b0:6d6:a9a8:be4b with SMTP id
 he43-20020a1709073dab00b006d6a9a8be4bmr4593604ejc.34.1646046534587; 
 Mon, 28 Feb 2022 03:08:54 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:08:54 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/6] drivers: usb: remove usage of list iterator past the loop
 body
Date: Mon, 28 Feb 2022 12:08:17 +0100
Message-Id: <20220228110822.491923-2-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Feb 2022 23:23:25 +1100
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the list representing the request queue does not contain the expected
request, the value of list_for_each_entry() iterator will not point to a
valid structure. To avoid type confusion in such case, the list iterator
scope will be limited to list_for_each_entry() loop.

In preparation to limiting scope of a list iterator to the list traversal
loop, use a dedicated pointer to point to the found request object.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c | 11 ++++++----
 drivers/usb/gadget/udc/at91_udc.c        | 26 ++++++++++++++----------
 drivers/usb/gadget/udc/atmel_usba_udc.c  | 11 ++++++----
 drivers/usb/gadget/udc/bdc/bdc_ep.c      | 11 +++++++---
 drivers/usb/gadget/udc/fsl_qe_udc.c      | 11 ++++++----
 drivers/usb/gadget/udc/fsl_udc_core.c    | 11 ++++++----
 drivers/usb/gadget/udc/goku_udc.c        | 11 ++++++----
 drivers/usb/gadget/udc/gr_udc.c          | 11 ++++++----
 drivers/usb/gadget/udc/lpc32xx_udc.c     | 11 ++++++----
 drivers/usb/gadget/udc/mv_u3d_core.c     | 11 ++++++----
 drivers/usb/gadget/udc/mv_udc_core.c     | 11 ++++++----
 drivers/usb/gadget/udc/net2272.c         | 12 ++++++-----
 drivers/usb/gadget/udc/net2280.c         | 11 ++++++----
 drivers/usb/gadget/udc/omap_udc.c        | 11 ++++++----
 drivers/usb/gadget/udc/pxa25x_udc.c      | 11 ++++++----
 drivers/usb/gadget/udc/s3c-hsudc.c       | 11 ++++++----
 drivers/usb/gadget/udc/udc-xilinx.c      | 11 ++++++----
 17 files changed, 128 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 917892ca8753..cad874ee4472 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -466,19 +466,22 @@ static int ast_vhub_epn_dequeue(struct usb_ep* u_ep, struct usb_request *u_req)
 {
 	struct ast_vhub_ep *ep = to_ast_ep(u_ep);
 	struct ast_vhub *vhub = ep->vhub;
-	struct ast_vhub_req *req;
+	struct ast_vhub_req *req = NULL;
+	struct ast_vhub_req *tmp;
 	unsigned long flags;
 	int rc = -EINVAL;

 	spin_lock_irqsave(&vhub->lock, flags);

 	/* Make sure it's actually queued on this endpoint */
-	list_for_each_entry (req, &ep->queue, queue) {
-		if (&req->req == u_req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == u_req) {
+			req = tmp;
 			break;
+		}
 	}

-	if (&req->req == u_req) {
+	if (req) {
 		EPVDBG(ep, "dequeue req @%p active=%d\n",
 		       req, req->active);
 		if (req->active)
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 9040a0561466..0fd0307bc07b 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -150,13 +150,14 @@ static void proc_ep_show(struct seq_file *s, struct at91_ep *ep)
 	if (list_empty (&ep->queue))
 		seq_printf(s, "\t(queue empty)\n");

-	else list_for_each_entry (req, &ep->queue, queue) {
-		unsigned	length = req->req.actual;
+	else
+		list_for_each_entry(req, &ep->queue, queue) {
+			unsigned int	length = req->req.actual;

-		seq_printf(s, "\treq %p len %d/%d buf %p\n",
-				&req->req, length,
-				req->req.length, req->req.buf);
-	}
+			seq_printf(s, "\treq %p len %d/%d buf %p\n",
+					&req->req, length,
+					req->req.length, req->req.buf);
+		}
 	spin_unlock_irqrestore(&udc->lock, flags);
 }

@@ -226,7 +227,7 @@ static int proc_udc_show(struct seq_file *s, void *unused)

 	if (udc->enabled && udc->vbus) {
 		proc_ep_show(s, &udc->ep[0]);
-		list_for_each_entry (ep, &udc->gadget.ep_list, ep.ep_list) {
+		list_for_each_entry(ep, &udc->gadget.ep_list, ep.ep_list) {
 			if (ep->ep.desc)
 				proc_ep_show(s, ep);
 		}
@@ -704,7 +705,8 @@ static int at91_ep_queue(struct usb_ep *_ep,
 static int at91_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct at91_ep		*ep;
-	struct at91_request	*req;
+	struct at91_request	*req = NULL;
+	struct at91_request	*tmp;
 	unsigned long		flags;
 	struct at91_udc		*udc;

@@ -717,11 +719,13 @@ static int at91_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&udc->lock, flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry (req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&udc->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 2b893bceea45..8e393e14f137 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -860,7 +860,8 @@ static int usba_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct usba_ep *ep = to_usba_ep(_ep);
 	struct usba_udc *udc = ep->udc;
-	struct usba_request *req;
+	struct usba_request *req = NULL;
+	struct usba_request *tmp;
 	unsigned long flags;
 	u32 status;

@@ -869,12 +870,14 @@ static int usba_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)

 	spin_lock_irqsave(&udc->lock, flags);

-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}

-	if (&req->req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&udc->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index 8e2f20b12519..829e96791d0a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -1757,6 +1757,7 @@ static int bdc_gadget_ep_dequeue(struct usb_ep *_ep,
 				  struct usb_request *_req)
 {
 	struct bdc_req *req;
+	struct bdc_req *tmp;
 	unsigned long flags;
 	struct bdc_ep *ep;
 	struct bdc *bdc;
@@ -1771,12 +1772,16 @@ static int bdc_gadget_ep_dequeue(struct usb_ep *_ep,
 	dev_dbg(bdc->dev, "%s ep:%s req:%p\n", __func__, ep->name, req);
 	bdc_dbg_bd_list(bdc, ep);
 	spin_lock_irqsave(&bdc->lock, flags);
+
+	req = NULL;
 	/* make sure it's still queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->usb_req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->usb_req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->usb_req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&bdc->lock, flags);
 		dev_err(bdc->dev, "usb_req !=req n");
 		return -EINVAL;
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 15db7a3868fe..3979a2825e3c 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -1776,7 +1776,8 @@ static int qe_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
 static int qe_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct qe_ep *ep = container_of(_ep, struct qe_ep, ep);
-	struct qe_req *req;
+	struct qe_req *req = NULL;
+	struct qe_req *tmp;
 	unsigned long flags;

 	if (!_ep || !_req)
@@ -1785,12 +1786,14 @@ static int qe_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&ep->udc->lock, flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}

-	if (&req->req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&ep->udc->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 29fcb9b461d7..23d670fae12c 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -918,7 +918,8 @@ fsl_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 static int fsl_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct fsl_ep *ep = container_of(_ep, struct fsl_ep, ep);
-	struct fsl_req *req;
+	struct fsl_req *req = NULL;
+	struct fsl_req *tmp;
 	unsigned long flags;
 	int ep_num, stopped, ret = 0;
 	u32 epctrl;
@@ -940,11 +941,13 @@ static int fsl_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	fsl_writel(epctrl, &dr_regs->endptctrl[ep_num]);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index 3757a772a55e..62f0b7d794ec 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -809,7 +809,8 @@ static void nuke(struct goku_ep *ep, int status)
 /* dequeue JUST ONE request */
 static int goku_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
-	struct goku_request	*req;
+	struct goku_request	*req = NULL;
+	struct goku_request	*tmp;
 	struct goku_ep		*ep;
 	struct goku_udc		*dev;
 	unsigned long		flags;
@@ -833,11 +834,13 @@ static int goku_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&dev->lock, flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry (req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (req) {
 		spin_unlock_irqrestore (&dev->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 4b35739d3695..5d65d8ad5281 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -1690,7 +1690,8 @@ static int gr_queue_ext(struct usb_ep *_ep, struct usb_request *_req,
 /* Dequeue JUST ONE request */
 static int gr_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
-	struct gr_request *req;
+	struct gr_request *req = NULL;
+	struct gr_request *tmp;
 	struct gr_ep *ep;
 	struct gr_udc *dev;
 	int ret = 0;
@@ -1710,11 +1711,13 @@ static int gr_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&dev->lock, flags);

 	/* Make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index a25d01c89564..024b646638fb 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -1830,7 +1830,8 @@ static int lpc32xx_ep_queue(struct usb_ep *_ep,
 static int lpc32xx_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct lpc32xx_ep *ep;
-	struct lpc32xx_request *req;
+	struct lpc32xx_request *req = NULL;
+	struct lpc32xx_request *tmp;
 	unsigned long flags;

 	ep = container_of(_ep, struct lpc32xx_ep, ep);
@@ -1840,11 +1841,13 @@ static int lpc32xx_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&ep->udc->lock, flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&ep->udc->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index a1057ddfbda3..39bd0aeb58d1 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -844,7 +844,8 @@ mv_u3d_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 static int mv_u3d_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct mv_u3d_ep *ep;
-	struct mv_u3d_req *req;
+	struct mv_u3d_req *req = NULL;
+	struct mv_u3d_req *tmp;
 	struct mv_u3d *u3d;
 	struct mv_u3d_ep_context *ep_context;
 	struct mv_u3d_req *next_req;
@@ -861,11 +862,13 @@ static int mv_u3d_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&ep->u3d->lock, flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index b6d34dda028b..9d708ce49c50 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -771,7 +771,8 @@ static void mv_prime_ep(struct mv_ep *ep, struct mv_req *req)
 static int mv_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct mv_ep *ep = container_of(_ep, struct mv_ep, ep);
-	struct mv_req *req;
+	struct mv_req *req = NULL;
+	struct mv_req *tmp;
 	struct mv_udc *udc = ep->udc;
 	unsigned long flags;
 	int stopped, ret = 0;
@@ -793,11 +794,13 @@ static int mv_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	writel(epctrlx, &udc->op_regs->epctrlx[ep->ep_num]);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 7c38057dcb4a..bb59200f1596 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -926,7 +926,8 @@ static int
 net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct net2272_ep *ep;
-	struct net2272_request *req;
+	struct net2272_request *req = NULL;
+	struct net2272_request *tmp;
 	unsigned long flags;
 	int stopped;

@@ -939,11 +940,13 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	ep->stopped = 1;

 	/* make sure it's still queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		ep->stopped = stopped;
 		spin_unlock_irqrestore(&ep->dev->lock, flags);
 		return -EINVAL;
@@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
 		net2272_done(ep, req, -ECONNRESET);
 	}
-	req = NULL;
 	ep->stopped = stopped;

 	spin_unlock_irqrestore(&ep->dev->lock, flags);
diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
index 16e7d2db6411..dbf5592dbcf0 100644
--- a/drivers/usb/gadget/udc/net2280.c
+++ b/drivers/usb/gadget/udc/net2280.c
@@ -1240,7 +1240,8 @@ static void nuke(struct net2280_ep *ep)
 static int net2280_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct net2280_ep	*ep;
-	struct net2280_request	*req;
+	struct net2280_request	*req = NULL;
+	struct net2280_request	*tmp;
 	unsigned long		flags;
 	u32			dmactl;
 	int			stopped;
@@ -1266,11 +1267,13 @@ static int net2280_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	}

 	/* make sure it's still queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		ep->stopped = stopped;
 		spin_unlock_irqrestore(&ep->dev->lock, flags);
 		ep_dbg(ep->dev, "%s: Request mismatch\n", __func__);
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 494da00398d7..c0f6e066ccc2 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -1003,7 +1003,8 @@ omap_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 static int omap_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct omap_ep	*ep = container_of(_ep, struct omap_ep, ep);
-	struct omap_req	*req;
+	struct omap_req	*req = NULL;
+	struct omap_req	*tmp;
 	unsigned long	flags;

 	if (!_ep || !_req)
@@ -1012,11 +1013,13 @@ static int omap_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	spin_lock_irqsave(&ep->udc->lock, flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&ep->udc->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index b38747fd3bb0..889ea52bbe0a 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -966,7 +966,8 @@ static void nuke(struct pxa25x_ep *ep, int status)
 static int pxa25x_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct pxa25x_ep	*ep;
-	struct pxa25x_request	*req;
+	struct pxa25x_request	*req = NULL;
+	struct pxa25x_request	*tmp;
 	unsigned long		flags;

 	ep = container_of(_ep, struct pxa25x_ep, ep);
@@ -976,11 +977,13 @@ static int pxa25x_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	local_irq_save(flags);

 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry (req, &ep->queue, queue) {
-		if (&req->req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->req != _req) {
+	if (!req) {
 		local_irq_restore(flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
index 89f1f8c9f02e..5006c9ebbac6 100644
--- a/drivers/usb/gadget/udc/s3c-hsudc.c
+++ b/drivers/usb/gadget/udc/s3c-hsudc.c
@@ -877,7 +877,8 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct s3c_hsudc_ep *hsep = our_ep(_ep);
 	struct s3c_hsudc *hsudc = hsep->dev;
-	struct s3c_hsudc_req *hsreq;
+	struct s3c_hsudc_req *hsreq = NULL;
+	struct s3c_hsudc_req *tmp;
 	unsigned long flags;

 	hsep = our_ep(_ep);
@@ -886,11 +887,13 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)

 	spin_lock_irqsave(&hsudc->lock, flags);

-	list_for_each_entry(hsreq, &hsep->queue, queue) {
-		if (&hsreq->req == _req)
+	list_for_each_entry(tmp, &hsep->queue, queue) {
+		if (&tmp->req == _req) {
+			hsreq = tmp;
 			break;
+		}
 	}
-	if (&hsreq->req != _req) {
+	if (!hsreq) {
 		spin_unlock_irqrestore(&hsudc->lock, flags);
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 6ce886fb7bfe..6812824cc823 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1136,17 +1136,20 @@ static int xudc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
 static int xudc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct xusb_ep *ep	= to_xusb_ep(_ep);
-	struct xusb_req *req	= to_xusb_req(_req);
+	struct xusb_req *req	= NULL;
+	struct xusb_req *tmp;
 	struct xusb_udc *udc	= ep->udc;
 	unsigned long flags;

 	spin_lock_irqsave(&udc->lock, flags);
 	/* Make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->usb_req == _req)
+	list_for_each_entry(tmp, &ep->queue, queue) {
+		if (&tmp->usb_req == _req) {
+			req = tmp;
 			break;
+		}
 	}
-	if (&req->usb_req != _req) {
+	if (!req) {
 		spin_unlock_irqrestore(&udc->lock, flags);
 		return -EINVAL;
 	}
--
2.25.1

