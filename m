Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B655E7E7D6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 16:31:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRjV658f1z3dHt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 02:31:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRjTK146qz3cSY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 02:30:59 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT8-0006Yc-Ry; Fri, 10 Nov 2023 16:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT8-0083Lu-5i; Fri, 10 Nov 2023 16:30:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT7-00GnyA-Sn; Fri, 10 Nov 2023 16:30:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 51/52] serial: ucc: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:30:19 +0100
Message-ID: <20231110152927.70601-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1i8KT+sh7QtkRDn6szKY9xL97sdpwMK7Je2MNdk5bn0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQ/n+keJw9FvldhWW778kewBkupye3qT/5WqkxLxK9Zb MxYf2VHJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATuR3P/lfgSfgf1VPeWVbN scFyGyYeKHWMXT99z8xfkdW3XkZU/X28fMLnAof23gJH0825/UlGknvaKwS+hGapxKzm2fDqmJL 6/TYVxrbK+sadn/wduFy5b857FqmgEa1fuiX7/CXjeVqVEnkbbU6dDeYw8BFnC/jU4F1sO4s9ue k/z5FlkXvdm3erPRW0+7/uUMYuuYrLpzQ9m0uvfFUOv/z27tZ2Y5nzH/PkxH97qN++wXuBu7i/L 1+qYkLz4dh/C1o37pnw78JT5+eBcrNefdnxni+r8ATP0yTVfP9ZjdIcERlP196MY3jt8szfRSWy skfU5ljdXoVlk/SXNs4XvVn5pz3kxMVzPm41HIvbrDilAQ==
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Timur Tabi <timur@kernel.org>, linux-serial@vger.kernel.org
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
 drivers/tty/serial/ucc_uart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index ed7a6bb5596a..f9ad942c9aaf 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1459,7 +1459,7 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 	return ret;
 }
 
-static int ucc_uart_remove(struct platform_device *ofdev)
+static void ucc_uart_remove(struct platform_device *ofdev)
 {
 	struct uart_qe_port *qe_port = platform_get_drvdata(ofdev);
 
@@ -1470,8 +1470,6 @@ static int ucc_uart_remove(struct platform_device *ofdev)
 	of_node_put(qe_port->np);
 
 	kfree(qe_port);
-
-	return 0;
 }
 
 static const struct of_device_id ucc_uart_match[] = {
@@ -1492,7 +1490,7 @@ static struct platform_driver ucc_uart_of_driver = {
 		.of_match_table    = ucc_uart_match,
 	},
 	.probe  	= ucc_uart_probe,
-	.remove 	= ucc_uart_remove,
+	.remove_new 	= ucc_uart_remove,
 };
 
 static int __init ucc_uart_init(void)
-- 
2.42.0

