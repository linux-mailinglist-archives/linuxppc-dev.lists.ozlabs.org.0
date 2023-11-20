Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11A7F1FE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 23:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ1fS1kGgz3dTW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 09:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ1dW2ZKcz3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 08:59:59 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ6-0003rU-C0; Mon, 20 Nov 2023 22:59:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ3-00ARF5-6m; Mon, 20 Nov 2023 22:59:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5CJ2-004fCu-TE; Mon, 20 Nov 2023 22:59:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/5] usb: gadget: udc: Convert to platform remove callback returning void
Date: Mon, 20 Nov 2023 22:58:31 +0100
Message-ID: <20231120215830.71071-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NGgnAsKRDJtchth2h1V+09ayIfLrr5Gjju5DvvEEWTI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlW9aGVsV1Zt4tqEhTjh663ROQpcHCNjJXv/7H8 QoQQZjNnr+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVvWhgAKCRCPgPtYfRL+ TliRCACFeRhxOA9KHcUabcEOYqtrCN+0aV6zr50I74bzXPfYE4EwFwgP2lVQjCWXDprj5F2hTCv Ioi2mzz5KHge3cjF1zetPS3NmH3NHVdmT7z1VUujla/DkbvaaNXWhV27pnqpcNdQh4e8dXbH9Zw /K3r+g/GG7db8QwgUs1P6ZTMwkbbDWAyLny2XQpjwEWCm9UznEn1YGoVoaBSsHrWym5+Atf6R7v NRxx+N1JJLMX5rzyfwnbovF57T6m55pBkhqNeevKsJomDu1BEt13UoULLTBZ4/umOKGMVAem3fw k4yEm3N8bjsXBS4A4Ft1yQhEZjsJ/+9hDhGr/QENlqbI/jP2
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vladimir Zapolskiy <vz@mleia.com>, Alan Stern <stern@rowland.harvard.edu>, Daniel Mack <daniel@zonque.org>, kernel@pengutronix.de, Zhu Wang <wangzhu9@huawei.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this patch set converts the platform drivers below drivers/usb/gadget to
use .remove_new. These drivers all have an error path if the driver is
still in use. Returning there early leaks resources, but fixing this
isn't trivial, so I just added an error message. The patches don't make
a difference to the drivers apart from the improved error message.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal of
.remove_new().

Best regards
Uwe

Uwe Kleine-König (5):
  usb: gadget: at91_udc: Convert to platform remove callback returning void
  usb: gadget: fsl_udc: Convert to platform remove callback returning void
  usb: gadget: gr_udc: Convert to platform remove callback returning void
  usb: gadget: lpc32xx_udc: Convert to platform remove callback returning void
  usb: gadget: pxa25x_udc: Convert to platform remove callback returning void

 drivers/usb/gadget/udc/at91_udc.c     | 13 +++++++------
 drivers/usb/gadget/udc/fsl_udc_core.c | 13 +++++++------
 drivers/usb/gadget/udc/gr_udc.c       | 13 +++++++------
 drivers/usb/gadget/udc/lpc32xx_udc.c  | 13 +++++++------
 drivers/usb/gadget/udc/pxa25x_udc.c   | 12 +++++++-----
 5 files changed, 35 insertions(+), 29 deletions(-)

base-commit: 5a82d69d48c82e89aef44483d2a129f869f3506a
-- 
2.42.0

