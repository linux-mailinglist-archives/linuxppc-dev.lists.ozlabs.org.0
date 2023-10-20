Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD957D13E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:18:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ERnIsojr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBqWS3frfz3vgS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 03:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ERnIsojr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=batv+5f4592396010e9e3c002+7362+infradead.org+dwmw2@casper.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBqSp48Hwz3c5c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Oct 2023 03:15:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tKr5NCYEWPmX5deg+2Ptja2Fo3YNlvlkNEh9wJh6ZDg=; b=ERnIsojrkc5WLnr34IDZQWQKrG
	wFzlSNa4uSGkth0zeh9LHdVk5FXd6R1LgmCBut8RlHh4SGdWnzA22SU/ejGMiigfeW+6R5k7l2fg2
	0uiPSrmfiUIoAU5Q2qVPTTjT2kI+9So4NYm2If5BnDiMQZk7Rt7YUcegC1ffCiPYVpfP+E6Imy9hV
	i2YFd5mM2Jc+985Yim+drAaCsJdkxvZKx7L2lWkn8w4S+76vvn2Jy23msUjaZ2EOVxJJfAY6wkfgh
	GDrxLxeDVf77oL1C2C89fPb2hRzeM7pGCmELvA/wEZqdkqmaffpDBxTbaPsfNHSm8zNZg6XsaeLtV
	M17Mpk1w==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qts9u-00E44E-8P; Fri, 20 Oct 2023 16:15:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qts9s-001UOc-1F;
	Fri, 20 Oct 2023 17:15:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/3] hvc/xen: fix console unplug
Date: Fri, 20 Oct 2023 17:15:29 +0100
Message-Id: <20231020161529.355083-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231020161529.355083-1-dwmw2@infradead.org>
References: <20231020161529.355083-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Dawei Li <set_pte_at@outlook.com>, Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Woodhouse <dwmw@amazon.co.uk>

On unplug of a Xen console, xencons_disconnect_backend() unconditionally
calls free_irq() via unbind_from_irqhandler(), causing a warning of
freeing an already-free IRQ:

(qemu) device_del con1
[   32.050919] ------------[ cut here ]------------
[   32.050942] Trying to free already-free IRQ 33
[   32.050990] WARNING: CPU: 0 PID: 51 at kernel/irq/manage.c:1895 __free_irq+0x1d4/0x330

It should be using evtchn_put() to tear down the event channel binding,
and let the Linux IRQ side of it be handled by notifier_del_irq() through
the HVC code.

On which topic... xencons_disconnect_backend() should call hvc_remove()
*first*, rather than tearing down the event channel and grant mapping
while they are in use. And then the IRQ is guaranteed to be freed by
the time it's torn down by evtchn_put().

Since evtchn_put() also closes the actual event channel, avoid calling
xenbus_free_evtchn() except in the failure path where the IRQ was not
successfully set up.

However, calling hvc_remove() at the start of xencons_disconnect_backend()
still isn't early enough. An unplug request is indicated by the backend
setting its state to XenbusStateClosing, which triggers a notification
to xencons_backend_changed(), which... does nothing except set its own
frontend state directly to XenbusStateClosed without *actually* tearing
down the HVC device or, you know, making sure it isn't actively in use.

So the backend sees the guest frontend set its state to XenbusStateClosed
and stops servicing the interrupt... and the guest spins for ever in the
domU_write_console() function waiting for the ring to drain.

Fix that one by calling hvc_remove() from xencons_backend_changed() before
signalling to the backend that it's OK to proceed with the removal.

Tested with 'dd if=/dev/zero of=/dev/hvc1' while telling Qemu to remove
the console device.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Cc: stable@vger.kernel.org
---
 drivers/tty/hvc/hvc_xen.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 4a768b504263..34c01874f45b 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -377,18 +377,21 @@ void xen_console_resume(void)
 #ifdef CONFIG_HVC_XEN_FRONTEND
 static void xencons_disconnect_backend(struct xencons_info *info)
 {
-	if (info->irq > 0)
-		unbind_from_irqhandler(info->irq, NULL);
-	info->irq = 0;
+	if (info->hvc != NULL)
+		hvc_remove(info->hvc);
+	info->hvc = NULL;
+	if (info->irq > 0) {
+		evtchn_put(info->evtchn);
+		info->irq = 0;
+		info->evtchn = 0;
+	}
+	/* evtchn_put() will also close it so this is only an error path */
 	if (info->evtchn > 0)
 		xenbus_free_evtchn(info->xbdev, info->evtchn);
 	info->evtchn = 0;
 	if (info->gntref > 0)
 		gnttab_free_grant_references(info->gntref);
 	info->gntref = 0;
-	if (info->hvc != NULL)
-		hvc_remove(info->hvc);
-	info->hvc = NULL;
 }
 
 static void xencons_free(struct xencons_info *info)
@@ -553,10 +556,23 @@ static void xencons_backend_changed(struct xenbus_device *dev,
 		if (dev->state == XenbusStateClosed)
 			break;
 		fallthrough;	/* Missed the backend's CLOSING state */
-	case XenbusStateClosing:
+	case XenbusStateClosing: {
+		struct xencons_info *info = dev_get_drvdata(&dev->dev);;
+
+		/*
+		 * Don't tear down the evtchn and grant ref before the other
+		 * end has disconnected, but do stop userspace from trying
+		 * to use the device before we allow the backend to close.
+		 */
+		if (info->hvc) {
+			hvc_remove(info->hvc);
+			info->hvc = NULL;
+		}
+
 		xenbus_frontend_closed(dev);
 		break;
 	}
+	}
 }
 
 static const struct xenbus_device_id xencons_ids[] = {
@@ -616,7 +632,7 @@ static int __init xen_hvc_init(void)
 		list_del(&info->list);
 		spin_unlock_irqrestore(&xencons_lock, flags);
 		if (info->irq)
-			unbind_from_irqhandler(info->irq, NULL);
+			evtchn_put(info->evtchn);
 		kfree(info);
 		return r;
 	}
-- 
2.40.1

