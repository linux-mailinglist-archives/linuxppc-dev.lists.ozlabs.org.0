Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881596B7447
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 11:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZtRs2r28z3fSb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 21:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZtQS3pCQz3cF0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 21:37:36 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbfY7-0008Sx-Qo; Mon, 13 Mar 2023 11:37:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbfY0-003pKV-Hz; Mon, 13 Mar 2023 11:36:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbfXz-004W3U-Lb; Mon, 13 Mar 2023 11:36:55 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Madalin Bucur <madalin.bucur@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Wei Fang <wei.fang@nxp.com>,
	Wolfram Sang <wsa@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mark Brown <broonie@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH net-next 0/9] net: freescale: Convert to platform remove callback returning void
Date: Mon, 13 Mar 2023 11:36:44 +0100
Message-Id: <20230313103653.2753139-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zEpAFLkQY7859LsqSDJWo8ZNP9TlRFY5PH190cEWY4A=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDvyhwmwCq1zII8pwd14nInfWvi52xpRLIUiex kwAWAILM+iJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA78oQAKCRDB/BR4rcrs Cf6zB/0eoZBQgKLXSRBSgpHLu+MlmE6cHo/846kLcdkdzaROLzniQyY2NJoz78kgzBxtLN+NUEj nHP8TLO0mcrFKlmF1G1C71bR0HwcOOWA5guicQZ33DIjpyEj5Poef/XjET7SILh09CntWgDH3t3 a5p9LUfG23pLleOxpmMcUPIjCvrucMvpM9hkEAQqkdSddPrUkEf9CNRVnVZbyj3UgbamIkLfElK DoCs12GKHAHZxTXQRtAVAzDGFu1ca+zGN13WWGvgaty6OzgcCjxMILUdoy8cYI2myaXljAfRlA4 Qdr/lvBbqoaKctBm8pIrbwb/sK0JLelntECfDzvNEspJOtHM
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
Cc: netdev@vger.kernel.org, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this patch set converts the platform drivers below
drivers/net/ethernet/freescale to the .remove_new() callback. Compared to the
traditional .remove() this one returns void. This is a good thing because the
driver core (mostly) ignores the return value and still removes the device
binding. This is part of a bigger effort to convert all 2000+ platform
drivers to this new callback to eventually change .remove() itself to
return void.

The first two patches here are preparation, the following patches
actually convert the drivers.

Best regards
Uwe

Uwe Kleine-König (9):
  net: dpaa: Improve error reporting
  net: fec: Don't return early on error in .remove()
  net: dpaa: Convert to platform remove callback returning void
  net: fec: Convert to platform remove callback returning void
  net: fman: Convert to platform remove callback returning void
  net: fs_enet: Convert to platform remove callback returning void
  net: fsl_pq_mdio: Convert to platform remove callback returning void
  net: gianfar: Convert to platform remove callback returning void
  net: ucc_geth: Convert to platform remove callback returning void

 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c        |  8 ++++----
 drivers/net/ethernet/freescale/fec_main.c             | 11 ++++-------
 drivers/net/ethernet/freescale/fec_mpc52xx.c          |  6 ++----
 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c      |  6 ++----
 drivers/net/ethernet/freescale/fman/mac.c             |  5 ++---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c |  5 ++---
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c  |  6 ++----
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c      |  6 ++----
 drivers/net/ethernet/freescale/fsl_pq_mdio.c          |  6 ++----
 drivers/net/ethernet/freescale/gianfar.c              |  6 ++----
 drivers/net/ethernet/freescale/ucc_geth.c             |  6 ++----
 11 files changed, 26 insertions(+), 45 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1

