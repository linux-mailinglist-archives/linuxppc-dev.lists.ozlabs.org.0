Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A067E16E4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 22:45:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNp1j16y0z3dFr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 08:45:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNp0j0PSsz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 08:44:35 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzkun-0005cE-Oi; Sun, 05 Nov 2023 22:44:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzkum-006sXR-8l; Sun, 05 Nov 2023 22:44:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzkul-00DHxh-Vg; Sun, 05 Nov 2023 22:44:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 2/2] tty: hvc: hvc_opal: Convert to platform remove callback returning void
Date: Sun,  5 Nov 2023 22:44:09 +0100
Message-ID: <20231105214406.3765906-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
References: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aRh+VlrD93eVwb3Ts9Sdsvnv4r85WYOj6jpzvcDjK9w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSAypRG5HDLrTaATjjj2FscK4Eor8te3H9iIjE lJfnUmMmMqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUgMqQAKCRCPgPtYfRL+ To21B/4sLgK1LpZERifG0P5EwL/zjUngw9OA63nUq3ZV2/pGLdvcQyAVWt5+X9pwnJs7/hPbI24 2T45zpauXqTT2KTEt/QyC+DdaalLvPCdvrSJYollV6B6qNxY6NdkwAY2DhNGYX8Sd36OJMAZMy7 Dyk4ewPY3xxL+d8iLSMuiBI414HbnLdfEUQDKC97xsPuu43tto1X9hl/rNhBqtqdk4U1NpXjt5j DI9oni1FBIlT0a/MnbZsz8k9/QAI+sRcEYu+3FAFnZkoZtzxgStbJJX2TRuMi9/Y6qTWf91PkiG ZurJ2t2hfaZTNWXsKhtHWP/srqY072ZgXgMcu9uP78bqW65K
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/hvc/hvc_opal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 8995b253cf90..2cdf66e395cc 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -232,7 +232,7 @@ static int hvc_opal_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int hvc_opal_remove(struct platform_device *dev)
+static void hvc_opal_remove(struct platform_device *dev)
 {
 	struct hvc_struct *hp = dev_get_drvdata(&dev->dev);
 	int termno;
@@ -242,13 +242,11 @@ static int hvc_opal_remove(struct platform_device *dev)
 	if (hvc_opal_privs[termno] != &hvc_opal_boot_priv)
 		kfree(hvc_opal_privs[termno]);
 	hvc_opal_privs[termno] = NULL;
-
-	return 0;
 }
 
 static struct platform_driver hvc_opal_driver = {
 	.probe		= hvc_opal_probe,
-	.remove		= hvc_opal_remove,
+	.remove_new	= hvc_opal_remove,
 	.driver		= {
 		.name	= hvc_opal_name,
 		.of_match_table	= hvc_opal_match,
-- 
2.42.0

