Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5947E16E5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 22:45:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNp2C1y7lz3dSm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 08:45:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNp0j0YT1z2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 08:44:35 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzkun-0005cD-Oi; Sun, 05 Nov 2023 22:44:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzkul-006sXO-W2; Sun, 05 Nov 2023 22:44:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzkul-00DHxY-MX; Sun, 05 Nov 2023 22:44:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 1/2] tty: hvc: Make hvc_remove() return no value
Date: Sun,  5 Nov 2023 22:44:08 +0100
Message-ID: <20231105214406.3765906-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
References: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2573; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ewSPLP5ifSElHkqTy30VZ8vnKC3i1UJHz+Fq0EnpmRs=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBlSAyobeiDhh9Iomsc1Tu+zjHMHnl9hPYBzGbix isoisLpv2qJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUgMqAAKCRCPgPtYfRL+ Tp+KB/i38wuL7ojwuWv8ndvkcmuUx4zY7ZMJtB5Q7dpiqKMDqtbpR/qds8gaGJk/bGSbkMt76eZ rhd33nplSmb0o/wm0rCCTxDmyvdO8ieej6JH8ORAX9Weh+2D3Ka4jG5qfODKsln4ODoY0dIw+6k fmSKqTKIEEKhMG+050qqO8EJXziGEVVLgJHRBnIwOF1AHBrKrtfFz1zPGa9QyFC4+vU7apL+R2+ g+iPs1i5fEzcB8gnb+WtRYtrBe2v27qL9yglDLkvEELN7b/P68VI9MNZ6Ig1pEf0JCEmMwNB2kl HWx4OGLyXn2DTN9+nZkbZMxVOroz0AEOfWOR7sW2vDv6k2I=
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
Cc: kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function hvc_remove() returns zero unconditionally. Make it return
void instead to make it obvious that the caller doesn't need to do any
error handling. Accordingly drop the error handling from
hvc_opal_remove().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/hvc/hvc_console.c |  3 +--
 drivers/tty/hvc/hvc_console.h |  2 +-
 drivers/tty/hvc/hvc_opal.c    | 15 +++++++--------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 959fae54ca39..57f5c37125e6 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -976,7 +976,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 }
 EXPORT_SYMBOL_GPL(hvc_alloc);
 
-int hvc_remove(struct hvc_struct *hp)
+void hvc_remove(struct hvc_struct *hp)
 {
 	unsigned long flags;
 	struct tty_struct *tty;
@@ -1010,7 +1010,6 @@ int hvc_remove(struct hvc_struct *hp)
 		tty_vhangup(tty);
 		tty_kref_put(tty);
 	}
-	return 0;
 }
 EXPORT_SYMBOL_GPL(hvc_remove);
 
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 9668f821db01..78f7543511f1 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -77,7 +77,7 @@ extern int hvc_instantiate(uint32_t vtermno, int index,
 extern struct hvc_struct * hvc_alloc(uint32_t vtermno, int data,
 				     const struct hv_ops *ops, int outbuf_size);
 /* remove a vterm from hvc tty operation (module_exit or hotplug remove) */
-extern int hvc_remove(struct hvc_struct *hp);
+extern void hvc_remove(struct hvc_struct *hp);
 
 /* data available */
 int hvc_poll(struct hvc_struct *hp);
diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 992e199e0ea8..8995b253cf90 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -235,16 +235,15 @@ static int hvc_opal_probe(struct platform_device *dev)
 static int hvc_opal_remove(struct platform_device *dev)
 {
 	struct hvc_struct *hp = dev_get_drvdata(&dev->dev);
-	int rc, termno;
+	int termno;
 
 	termno = hp->vtermno;
-	rc = hvc_remove(hp);
-	if (rc == 0) {
-		if (hvc_opal_privs[termno] != &hvc_opal_boot_priv)
-			kfree(hvc_opal_privs[termno]);
-		hvc_opal_privs[termno] = NULL;
-	}
-	return rc;
+	hvc_remove(hp);
+	if (hvc_opal_privs[termno] != &hvc_opal_boot_priv)
+		kfree(hvc_opal_privs[termno]);
+	hvc_opal_privs[termno] = NULL;
+
+	return 0;
 }
 
 static struct platform_driver hvc_opal_driver = {
-- 
2.42.0

