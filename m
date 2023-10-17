Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A441E7CCE8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 22:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S95dy3lrDz3vXq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 07:47:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S95dL511Kz3c5K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 07:47:16 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqy2-0001nf-7N; Tue, 17 Oct 2023 22:47:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxy-002Oky-V0; Tue, 17 Oct 2023 22:47:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsqxy-000U0Q-LC; Tue, 17 Oct 2023 22:47:02 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/6] usb: gadget: Convert to use module_platform_driver()
Date: Tue, 17 Oct 2023 22:44:43 +0200
Message-ID: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Z/Vn1N315f7fZHcxDG81QUWg0Chp5jm5OkmHHEOJRVE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlLvI7mPi3t5lSt18AODt6voX5wl6HZGEZUuiLE DhImsw17AuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZS7yOwAKCRCPgPtYfRL+ ThJEB/9+jgGO1Osx1rWXHL+Yx4I4Ef0vXz+VHQMVy9A2tCCjNre5tivU2+SxAlVa6kI4TZjRtCQ FyAOQnHfLBiNaj8mx5ozuYig8xHBmH//k/z4GzYYiU2HYzP6izmdCC848LHCRcHuqeMwOzLhcyy M28c1WL43/YowvzK/7lpDT9hgjF1n5Ar0s2fyB2dLLvzH8+VPo/933uyq0y+C3IKNKe+tvU8Oth OiDqUV82qBcsLJ+aFXsrweNqjNxZDBZeyL1zdUDYu1dB4YpYjf3ftUbNHhaedzernUoazFkw9m+ +DpbUhtUY7ntNY0dfx4SKZ3KdK3yIE63VeCBUdEqLJHgUjCa
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Pavel Machek <pavel@ucw.cz>, Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kbuild@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vladimir Zapolskiy <vz@mleia.com>, Alan Stern <stern@rowland.harvard.edu>, kernel@pengutronix.de, Paolo Abeni <pabeni@redhat.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, Gaosheng Cui <cuigaosheng1@huawei.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

module_platform_driver_probe() is an alternative to
module_platform_driver(). Comparing the two the former has the advantage
that the probe and remove callbacks can live in .init.text and
.exit.text respectively. The latter has the advantage that it's a bit
easier to use correctly and you can bind/unbind via sysfs and/or
hotplug.

There are considerations about deprecating
module_platform_driver_probe()[1] as very few drivers use it, still less
make actually use of the advantages and saving a few bytes isn't as
important any more as it was (say) 10 years ago.

Given that the drivers below drivers/usb/gadget making use of
module_platform_driver_probe() doesn't benefit from the advantages
at all (probe and remove are all defined in .text), convert these
drivers to module_platform_driver().

Best regards
Uwe

[1] https://lore.kernel.org/linux-kbuild/20231017132045.afswdgcv4axjf6jj@pengutronix.de

Uwe Kleine-König (6):
  usb: gadget: at91-udc: Convert to use module_platform_driver()
  usb: gadget: fsl-udc: Convert to use module_platform_driver()
  usb: gadget: fusb300-udc: Convert to use module_platform_driver()
  usb: gadget: lpc32xx-udc: Convert to use module_platform_driver()
  usb: gadget: m66592-udc: Convert to use module_platform_driver()
  usb: gadget: r8a66597-udc: Convert to use module_platform_driver()

 drivers/usb/gadget/udc/at91_udc.c     | 3 ++-
 drivers/usb/gadget/udc/fsl_udc_core.c | 3 ++-
 drivers/usb/gadget/udc/fusb300_udc.c  | 7 ++++---
 drivers/usb/gadget/udc/lpc32xx_udc.c  | 3 ++-
 drivers/usb/gadget/udc/m66592-udc.c   | 3 ++-
 drivers/usb/gadget/udc/r8a66597-udc.c | 3 ++-
 6 files changed, 14 insertions(+), 8 deletions(-)

base-commit: 4d5ab2376ec576af173e5eac3887ed0b51bd8566
-- 
2.42.0

