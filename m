Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15874CE19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 09:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzwRW0Qyhz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 17:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzwPv4JMTz3bpN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 17:20:19 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qIlBY-0008Dp-C1; Mon, 10 Jul 2023 09:19:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qIlBV-00DMe9-Ax; Mon, 10 Jul 2023 09:19:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qIlBU-003jlu-Km; Mon, 10 Jul 2023 09:19:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Madalin Bucur <madalin.bucur@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Wei Fang <wei.fang@nxp.com>,
	Simon Horman <simon.horman@corigine.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Michal Kubiak <michal.kubiak@intel.com>,
	Rob Herring <robh@kernel.org>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH net-next v3 0/8] net: freescale: Convert to platform remove callback returning void
Date: Mon, 10 Jul 2023 09:19:38 +0200
Message-Id: <20230710071946.3470249-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TkFJrQ3hly2E7ZLecW5hxiPTXLPviTcuFnxLd6aVHn0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkq7EEdv8rROspu6T+WuYeWU9WEhP/nVM3uBaYe RYHuYT2ZpWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKuxBAAKCRCPgPtYfRL+ ThtbB/9k+NYqB1wXLRyKEdH6cUwEKSwa0zvI7aKo8QfrxZoUfkWPDVMwq29jCFqAsOYgF/oYjd0 /KZrQ8NylM4XKfwLFf1Uo1+IPsvNZAqcAdYzbWAqjqdwfJllMyz6OH73oCkzwwRm0Kco6GwFU+9 Q2UUxv9GgWQE60hOkRuwT8NuWfhiWiuwRa6azi8SwcfMm/tI9wDqo9KdYdt37wd3uZCczAETU1r sPo8ut/YwRbf/rmF+M+xTDoqTNkoJeXycP0EtP9iERN+UjUiyk2nesow4AFEEG5X5ikJeoGWIXu d5IkfGGektutX6PxltOBS5Q2DBNg/IAOMuVbHu4mHwi7PJhu
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
Cc: Sean Anderson <sean.anderson@seco.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

v2 of this series was sent in June[1], code changes since then only affect
patch #1 where the dev_err invocation was adapted to emit the error code of
dpaa_fq_free(). Thanks for feedback by Maciej Fijalkowski and Russell King.
Other than that I added Reviewed-by tags for Simon Horman and Wei Fang and
rebased to v6.5-rc1.

There is only one dependency in this series: Patch #2 depends on patch
#1.

Best regards
Uwe

[1] https://lore.kernel.org/netdev/20230606162829.166226-1-u.kleine-koenig@pengutronix.de

Uwe Kleine-König (8):
  net: dpaa: Improve error reporting
  net: dpaa: Convert to platform remove callback returning void
  net: fec: Convert to platform remove callback returning void
  net: fman: Convert to platform remove callback returning void
  net: fs_enet: Convert to platform remove callback returning void
  net: fsl_pq_mdio: Convert to platform remove callback returning void
  net: gianfar: Convert to platform remove callback returning void
  net: ucc_geth: Convert to platform remove callback returning void

 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c        | 9 +++++----
 drivers/net/ethernet/freescale/fec_main.c             | 5 ++---
 drivers/net/ethernet/freescale/fec_mpc52xx.c          | 6 ++----
 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c      | 6 ++----
 drivers/net/ethernet/freescale/fman/mac.c             | 5 ++---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 5 ++---
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c  | 6 ++----
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c      | 6 ++----
 drivers/net/ethernet/freescale/fsl_pq_mdio.c          | 6 ++----
 drivers/net/ethernet/freescale/gianfar.c              | 6 ++----
 drivers/net/ethernet/freescale/ucc_geth.c             | 6 ++----
 11 files changed, 25 insertions(+), 41 deletions(-)

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

