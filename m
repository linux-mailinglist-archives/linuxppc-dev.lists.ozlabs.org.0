Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A022F6C0051
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 10:25:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfXXq462sz3fSW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 20:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfXWm2QWfz3cDp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 20:24:52 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdpHK-0003OR-Aa; Sun, 19 Mar 2023 10:24:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdpHE-005C7a-SW; Sun, 19 Mar 2023 10:24:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdpHE-0066Ox-9r; Sun, 19 Mar 2023 10:24:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ran Wang <ran.wang_1@nxp.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Li Jun <jun.li@nxp.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 00/11] usb: phy: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 10:24:17 +0100
Message-Id: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vjf+A2GR88/lPDssebZLH6EPmN42VJTU/BC39sA+rZ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtS78n0dRb5bSu2lBYcXVGDdi3EhA8J9JTZ05 DYpO9VScimJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUuwAKCRCPgPtYfRL+ Tjp/B/458uY5AHP78FNs71P3sO3y0rxssHK5JDTAiXDUsAnWHrt13WJdoV+BOlwDNDJnRVqYcXG 9/ylVOxBor/Iv2INJD0Fv7KDikX2bvEAq5HArDWTmHloJUvu9bemsvhK6boVrtMBnUmx1F2/Bn9 bVjedCCxCXVJXR3AqZMl+U2H9bjPN2/TNfQt9OiZxGhcsfY733bbjtGIYEFQqXcNuPniCMmMhRu pmWPGv0KREpMJHzZn327mPsdHSzdSBGaECLleBZTn5GYOR1LH1RS/wL8NGTUaaqyDIlmIv9KgfE zIgqS2tbQ5WWhTG4Qn1IwMg67RrVvqdlMecirubg5vW0+byl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linux-tegra@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series adapts the platform drivers below drivers/usb/phy to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers could be converted trivally as they all returned zero
unconditionally in their .remove() callback.

Best regards
Uwe


Uwe Kleine-König (11):
  usb: phy: ab8500: Convert to platform remove callback returning void
  usb: phy: am335x: Convert to platform remove callback returning void
  usb: phy: fsl: Convert to platform remove callback returning void
  usb: phy: generic: Convert to platform remove callback returning void
  usb: phy: gpio-vbus: Convert to platform remove callback returning
    void
  usb: phy: keystone: Convert to platform remove callback returning void
  usb: phy: mv: Convert to platform remove callback returning void
  usb: phy: mxs: Convert to platform remove callback returning void
  usb: phy: tahvo: Convert to platform remove callback returning void
  usb: phy: tegra: Convert to platform remove callback returning void
  usb: phy: twl6030: Convert to platform remove callback returning void

 drivers/usb/phy/phy-ab8500-usb.c    | 6 ++----
 drivers/usb/phy/phy-am335x.c        | 5 ++---
 drivers/usb/phy/phy-fsl-usb.c       | 6 ++----
 drivers/usb/phy/phy-generic.c       | 6 ++----
 drivers/usb/phy/phy-gpio-vbus-usb.c | 6 ++----
 drivers/usb/phy/phy-keystone.c      | 6 ++----
 drivers/usb/phy/phy-mv-usb.c        | 6 ++----
 drivers/usb/phy/phy-mxs-usb.c       | 6 ++----
 drivers/usb/phy/phy-tahvo.c         | 6 ++----
 drivers/usb/phy/phy-tegra-usb.c     | 6 ++----
 drivers/usb/phy/phy-twl6030-usb.c   | 6 ++----
 11 files changed, 22 insertions(+), 43 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

