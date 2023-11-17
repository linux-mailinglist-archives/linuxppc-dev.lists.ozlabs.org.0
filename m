Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6325E7EEFA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 11:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWsqS2PPjz3vch
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 21:01:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWspy1Pgzz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 21:00:42 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vdd-0000CZ-8i; Fri, 17 Nov 2023 10:59:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vda-009eFY-MI; Fri, 17 Nov 2023 10:59:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vda-002zVo-C1; Fri, 17 Nov 2023 10:59:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Dawei Li <set_pte_at@outlook.com>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Zhao Qiang <qiang.zhao@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH net-next 00/10] net*: Convert to platform remove callback returning void
Date: Fri, 17 Nov 2023 10:59:23 +0100
Message-ID: <20231117095922.876489-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9oXuqsWt/RvURX9K94NXCtM0NJ0gIte8yeS/fqhGQB0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVzl7texqFwXoT5gAbvyECD9jkLIXHxLs+T/Jr /qMt/rFfeOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVc5ewAKCRCPgPtYfRL+ TvahB/wJQF9QJN/JIp3OWpqrOqErXY/3mGrH+LrcSAyWTQmW3IbON/tzsf0OudQ3GS4JGLYwrwf lr86btNOOf5otyzkyde9JO4eLJ8avvimGDtuJVCJeaYTcGT6IlHjm21zCMoNIxH3XlKMkrUmMYH 0oqnlR2AfeZP6cAxUjo5jJP1AG1OJ/Xt8losaCvn7bsz0CB5zYnZLJq+MNrGc9F0Bf/31+nYK54 8M2gDMXOJ3xh7IST9jk8chwWjoFy2mfa/rYWeB+ctDGzmvj2yQT+QW8WTFasq3UdajLrFen0s7I UHp9cIprBwWEtE2SBKNHHSiRAX7ph979/7RuQaY5V4oAWRFf
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
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series converts the platform drivers below drivers/net that are not
covered in the two other series converting drivers/net/ethernet and
drivers/net/wireless. I put them all in a single series even though they
are not maintained together. I thought that to be better than sending
them out individually, I hope you agree.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.
The TL;DR; is to make it harder for driver authors to leak resources
without noticing.

The first patch is a fix, but I don't think it's worth to add that to
stable, it was broken since v5.7-rc1 and nobody seems to have hit the
problem.

Best regards
Uwe

Uwe Kleine-König (10):
  net: ipa: Don't error out in .remove()
  net: ipa: Convert to platform remove callback returning void
  net: fjes: Convert to platform remove callback returning void
  net: pcs: rzn1-miic: Convert to platform remove callback returning
    void
  net: sfp: Convert to platform remove callback returning void
  net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
    void
  net: wan/ixp4xx_hss: Convert to platform remove callback returning
    void
  net: wwan: qcom_bam_dmux: Convert to platform remove callback
    returning void
  ieee802154: fakelb: Convert to platform remove callback returning void
  ieee802154: hwsim: Convert to platform remove callback returning void

 drivers/net/fjes/fjes_main.c             |  6 ++----
 drivers/net/ieee802154/fakelb.c          |  5 ++---
 drivers/net/ieee802154/mac802154_hwsim.c |  6 ++----
 drivers/net/ipa/ipa_main.c               | 20 +++++---------------
 drivers/net/pcs/pcs-rzn1-miic.c          |  6 ++----
 drivers/net/phy/sfp.c                    |  6 ++----
 drivers/net/wan/fsl_ucc_hdlc.c           |  6 ++----
 drivers/net/wan/ixp4xx_hss.c             |  5 ++---
 drivers/net/wwan/qcom_bam_dmux.c         |  6 ++----
 9 files changed, 21 insertions(+), 45 deletions(-)

base-commit: eff99d8edbed7918317331ebd1e365d8e955d65e
-- 
2.42.0

